import argparse
import sys
import re
import os
import subprocess
import re
from datetime import datetime
import shutil

def get_files(dir_path, expr):
    ans = []
    for f in os.listdir(dir_path):
        if os.path.isfile(os.path.join(dir_path, f)) and re.search(expr, f):
            ans.append(os.path.join(dir_path, f))
    return ans


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
    assert ROOT, "ERROR: ROOT varaiable must be set"


    # Setup search paths
    c_tests_dir = ROOT + "/cpu/dv/c_tests/"
    c_tests_src = c_tests_dir + "/src/"
    risc_emulator = ROOT + "/cpu/dv/risc_emulator/build/emulator"
    result = ""


    # 1) Compile + run all tests in c_tests directory
    tests = get_files(c_tests_src, "^test_(\w+).c$")
    main_file = c_tests_src + "/main.c"

    build_dir = f"{c_tests_dir}/build"
    if(os.path.exists(build_dir)):
        print(f"Deleting directory {build_dir}")
        shutil.rmtree(build_dir)
    os.mkdir(build_dir)


  
    pc_rtl_start_addr = 0x100
    program_done_addr = 0x200
    program_start_addr = 0x10_000
    data_start_addr = 0x30_000
    data_size_words = 20
    stack_start_addr = 0x60_000
    max_stack_size = 0x10_000

    print(f"Compiling all C tests:")
    print(f"    Using RTL PC Start address = {hex(pc_rtl_start_addr)}")
    print(f"    Using Program PC Start address (.text start) = {hex(program_start_addr)}")
    print(f"    Static data array location (.data start) = {hex(data_start_addr)}")
    print(f"    Static data array size (words) = {data_size_words}")
    print(f"    Stack start address = {hex(stack_start_addr)}")
    print(f"    Max usable stack size (bytes) = {max_stack_size}")


    for cfile in tests:

        x = re.search("^.*/(test_\w+).c$", cfile)
        testname = x.group(1)

        print(f"Compiling test {cfile}")


        testoutdir = f"{build_dir}/{testname}"
        os.mkdir(testoutdir)
        commands = [
            f"gcc {cfile} {main_file} -o {testoutdir}/{testname}_x86.exe -D COMPILE_X86 -D TEST_SIZE_W={data_size_words}",
            f"clang --target=riscv32 -march=rv32i -mabi=ilp32 {main_file} -S -o {testoutdir}/{testname}_main_risc.asm -D TEST_SIZE_W={data_size_words}",
            f"clang --target=riscv32 -march=rv32i -mabi=ilp32 {cfile} -S -o {testoutdir}/{testname}_test_risc.asm -D TEST_SIZE_W={data_size_words}",
            f"clang --target=riscv32 -march=rv32g -mabi=ilp32 -mno-relax {testoutdir}/{testname}_main_risc.asm -c -o {testoutdir}/{testname}_main_risc.obj",
            f"clang --target=riscv32 -march=rv32g -mabi=ilp32 -mno-relax {testoutdir}/{testname}_test_risc.asm -c -o {testoutdir}/{testname}_test_risc.obj",
            f"ld.lld {testoutdir}/{testname}_main_risc.obj {testoutdir}/{testname}_test_risc.obj -o {testoutdir}/{testname}_risc.elf -static --section-start=.text={hex(program_start_addr)} --section-start=.data={hex(data_start_addr)}",
            f"llvm-objcopy-14 --output-target=ihex {testoutdir}/{testname}_risc.elf {testoutdir}/{testname}_risc.ihex --set-start={hex(program_start_addr)}",
            f"llvm-objcopy-14 --output-target=binary {testoutdir}/{testname}_risc.elf {testoutdir}/{testname}_risc_text.bin --set-start={hex(program_start_addr)} --only-section=.text",
            f"llvm-objcopy-14 --output-target=binary {testoutdir}/{testname}_risc.elf {testoutdir}/{testname}_risc_data.bin --set-start={hex(program_start_addr)} --only-section=.data --only-section=.rodata"
        ]

        # compile all binaries
        for c in commands:
            if(args.verbose):
                print("Running: ", c)
            result = subprocess.run(c,shell=True, text=True)
            # assert result.returncode == 0, f"ERROR: failed to compile test: {filename}"
            assert subprocess.run(c,shell=True, text=True).returncode == 0, f"ERROR: failed to compile test: {testname}"
        
        # Run x86 exe
        if(args.verbose):
            print("Running: ", f"{testoutdir}/{testname}_x86.exe")
        result = subprocess.run(f"{testoutdir}/{testname}_x86.exe",shell=True, text=True, capture_output=True)
        with open(f"{testoutdir}/{testname}_x86.out", "w") as f:
            f.write(result.stdout)


        # Run with emulator
        emulator_cmd = f"{risc_emulator} {testoutdir}/{testname}_risc.ihex {hex(program_start_addr)} -o {testoutdir}/{testname}_emulator.out -s {data_start_addr} -n {data_size_words}"

        # Run emulator
        if(args.verbose):
            print("Running: ", emulator_cmd)
        result = subprocess.run(emulator_cmd, shell=True, capture_output=True)
        assert result.returncode == 0, f"ERROR: emulator crashed for test {testname}, {emulator_cmd}" 

        # Diff emulator vs x86
        diffcmd = f"diff {testoutdir}/{testname}_emulator.out {testoutdir}/{testname}_x86.out"
        result = subprocess.run(diffcmd, shell=True, text=True, capture_output=True)
        if(result.stdout != ""):
            print(f"ERROR: Emulator output does not match native x86 output for {cfile}")

        # Save .hex files for iccm/dccm
        result = subprocess.run(f'''hexdump -e '1/4 "%08x" "\n"' {testoutdir}/{testname}_risc_text.bin -v''', shell=True, capture_output=True, text=True)
        with open(f"{testoutdir}/{testname}_iccm.hex", "w") as f:
            f.write(result.stdout)

        result = subprocess.run(f'''hexdump -e '1/4 "%08x" "\n"' {testoutdir}/{testname}_risc_data.bin -v''', shell=True, capture_output=True, text=True)
        with open(f"{testoutdir}/{testname}_dccm.hex", "w") as f:
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
    with open(f"{build_dir}/rom.hex", "w") as f:
        f.write(rom_hex)



    exit(1)

