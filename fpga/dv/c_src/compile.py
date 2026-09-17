
import argparse
import sys
import re
import os
import subprocess
import re
from datetime import datetime
import shutil

def risc_load_addr(int32_addr, reg):
    # LUI
    addr_msb = int32_addr >> 12
    lui_cmd = (addr_msb << 12 ) + (reg << 7) + (0b0110111)
    addr_lsb = int32_addr & 0xFFF
    add_cmd = (addr_lsb << 20) + (reg << 15) + (reg << 7) + (0b0010011)

    ans = f"{lui_cmd:08x}\n"
    ans += f"{add_cmd:08x}\n"
    return ans


if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Compile all C tests into RISC binarys and generate program traces/expected output.')
    parser.add_argument('-v', '--verbose', action='store_true')
    args = parser.parse_args()

    # Check root is set
    ROOT = os.environ.get('ROOT')
    assert ROOT, "ERROR: ROOT variable must be set"

    c_tests_dir     = ROOT + "/fpga/dv/c_src/"
    main_c_file     = ROOT + "/fpga/dv/c_src/main.c"
    main_name       = "main"
    os.chdir(c_tests_dir)

    build_dir = "./build"
    if(os.path.exists(build_dir)):
        print(f"Deleting directory {build_dir}")
        shutil.rmtree(build_dir)
    os.mkdir(build_dir)


    pc_rtl_start_addr   = 0x100
    program_done_addr   = 0x120
    program_start_addr  = 0x1000
    data_start_addr     = 0x9000
    data_size_words     = 10
    stack_start_addr    = 0x11_000
    max_stack_size      = 0x10_000

    print(f"Compiling FW")
    print(f"    Using RTL PC Start address = {hex(pc_rtl_start_addr)}")
    print(f"    Using Program PC Start address (.text start) = {hex(program_start_addr)}")
    print(f"    Static data array location (.data start) = {hex(data_start_addr)}")
    print(f"    Static data array size (words) = {data_size_words}")
    print(f"    Stack start address = {hex(stack_start_addr)}")
    print(f"    Max usable stack size (bytes) = {max_stack_size}")


    commands = [
        f"clang --target=riscv32 -march=rv32i -mabi=ilp32 {main_c_file} -S -o {build_dir}/{main_name}.asm -D TEST_SIZE_W={data_size_words}",
        f"clang --target=riscv32 -march=rv32g -mabi=ilp32 -mno-relax {build_dir}/{main_name}.asm -c -o {build_dir}/{main_name}.obj",
        f"ld.lld {build_dir}/{main_name}.obj -o {build_dir}/{main_name}.elf -static --section-start=.text={hex(program_start_addr)} --section-start=.data={hex(data_start_addr)}",
        f"llvm-objcopy-14 --output-target=binary {build_dir}/{main_name}.elf {build_dir}/{main_name}_text.bin --set-start={hex(program_start_addr)} --only-section=.text",
        f"llvm-objcopy-14 --output-target=binary {build_dir}/{main_name}.elf {build_dir}/{main_name}_data.bin --set-start={hex(program_start_addr)} --only-section=.data --only-section=.rodata"
    ]

    # compile all binaries
    for c in commands:
        if(args.verbose):
            print("Running: ", c)
        result = subprocess.run(c,shell=True, text=True)
        # assert result.returncode == 0, f"ERROR: failed to compile test: {filename}"
        assert subprocess.run(c,shell=True, text=True).returncode == 0, f"ERROR: failed to compile test: {testname}"
    

    # Save .hex files for iccm/dccm


    result = subprocess.run(f'''hexdump -e '1/4 "%08x" "\n"' {build_dir}/{main_name}_data.bin -v''', shell=True, capture_output=True, text=True)
    with open(f"{build_dir}/{main_name}_dccm.hex", "w") as f:
        f.write(result.stdout)


    # Make ROM entry point.
    rom_hex = f"\n"
    rom_hex += f"@{hex((pc_rtl_start_addr>>2))[2:]}  \n" # @ <adddr>, addr hex value without 0x prefix
    rom_hex += risc_load_addr(stack_start_addr, 0x2) # Set stack address
    rom_hex += risc_load_addr(program_start_addr, 0x1) # Set call address
    rom_hex += "000080e7\n" # Call/JALR - JALR ra, ra, 0
    rom_hex += "00000013\n"
    rom_hex += "00000013\n"
    rom_hex += "00000013\n"
    rom_hex += "00000013\n"
    rom_hex += "fe000ae3\n" # BEQ R0, R0, -12 -> Loops forever

    iccm_hex = subprocess.run(f'''hexdump -e '1/4 "%08x" "\n"' {build_dir}/{main_name}_text.bin -v''', shell=True, capture_output=True, text=True).stdout

    text_start_word = program_start_addr >> 2
    iccm_hex = rom_hex + "\n " + f"@{hex((text_start_word))[2:]}  \n" + iccm_hex
    with open(f"{build_dir}/{main_name}_iccm.hex", "w") as f:
        f.write(iccm_hex)