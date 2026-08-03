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



if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Compile all C tests into RISC binarys and generate program traces/expected output.')
    
    #parser.add_argument('-o', '--out_dir')                            # option that takes a value
    #parser.add_argument('-c', '--compile_only', action='store_true')                            # option that takes a value
    #parser.add_argument('-v', '--verbose', action='store_true')     # on/off flag
    args = parser.parse_args()

    # Check root is set
    ROOT = os.environ.get('ROOT')
    assert ROOT, "ERROR: ROOT varaiable must be set"

    # Setup search paths
    vivado_dir = "/home/cunningy/Desktop/Xilinx/Vivado/2023.2/bin/"
    rtl_dir = ROOT + "/cpu/design/rtl/"
    tb_dir = ROOT + "/cpu/dv/hdl/"
    scripts_dir = ROOT + "/cpu/dv/scripts/"
    top_module = "tb_top"
    worklib_name = "worklib"

    c_tests_dir = ROOT + "cpu/dv/c_tests/"
    risc_emulator_dir = ROOT + "cpu/dv/risc_emulator/"
    result = ""


    # 1) Compile + run all tests in c_tests directory
    tests = get_files(c_tests_dir, "^test_(\w+).c$")
    main_file = c_tests_dir + "/main.c"

    build_dir = f"{c_tests_dir}/build"
    if(os.path.exists(build_dir)):
        shutil.rmtree(build_dir)
    os.mkdir(build_dir)

    for cfile in tests:
        x = re.search("^test_(\w+).c$", cfile)
        testname = x.group(1)

        print(f"Compiling test {cfile}")


        # execute compile Command x86
        #result = subprocess.run(
        #    f"gcc {cfile} {main_file} -o build/{testname}/{testname}_x86.exe -D COMPILE_X86",
        #    shell=True, text=True
        #)
        #assert result.returncode == 0, f"ERROR: failed to compile test: {filename}"


        testoutdir = f"{build_dir}/{testname}"
        os.mkdir(testoutdir)
        commands = [
            f"gcc {cfile} {main_file} -o {testoutdir}/{testname}_x86.exe -D COMPILE_X86",
            f"clang --target=riscv32 -march=rv32i -mabi=ilp32d {mainfile} -S -o {testoutdir}/{testname}_main_risc.asm",
            f"clang --target=riscv32 -march=rv32i -mabi=ilp32d {cfile} -S -o {testoutdir}/{testname}_test_risc.asm",
            f"clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax {testoutdir}/{testname}_main_risc.asm -c -o {testoutdir}/{testname}_main_risc.obj",
            f"clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax {testoutdir}/{testname}_test_risc.asm -c -o {testoutdir}/{testname}_test_risc.obj",
            f"ld.lld {testoutdir}/{testname}_main_risc.obj {testoutdir}/{testname}_test_risc.obj -o {testoutdir}/{testname}_risc.elf -static --section-start=.text=1000 --section-start=.data=2000",
            f"llvm-objcopy-14 --output-target=ihex {testoutdir}/{testname}_risc.elf {testoutdir}/{testname}_risc.ihex --set-start=1000",
            f"llvm-objcopy-14 --output-target=binary {testoutdir}/{testname}_risc.elf {testoutdir}/{testname}_risc.bin --set-start=1000"
        ]

        for c in commands:
            result = subprocess.run(c,shell=True, text=True)
            # assert result.returncode == 0, f"ERROR: failed to compile test: {filename}"
            assert subprocess.run(c,shell=True, text=True).returncode == 0, f"ERROR: failed to compile test: {filename}"
        
        # Run x86 exe
        result = subprocess.run(f"{testoutdir}/{testname}_x86.exe",shell=True, text=True, capture_output=True)
        with open(f"{testoutdir}/{testname}/{testname}_x86.out", "w") as f:
            f.write(result.stdout)


    exit(1)



    #
    # Make output directory 
    #
    if(args.out_dir and os.path.exists(args.out_dir) and os.path.isdir(args.out_dir)): 
        os.chdir(args.out_dir)

    now = datetime.now()
    outdir = "Regout" + now.strftime("%Y_%b_%d_%H%M%S")
    os.mkdir(outdir)
    print(f"Making output directory: {outdir}"); 
    os.chdir(outdir)
    output_dir = os.getcwd()
    os.mkdir("build")
    os.chdir("build")

    result = subprocess.run(
            f"cp {tb_dir}/iccm.hex ./",
            shell=True,
            #capture_output=True,
            text=True
        )
    result = subprocess.run(
            f"cp {tb_dir}/rom.hex ./",
            shell=True,
            #capture_output=True,
            text=True
        )

    
    
    # Make compile command
    compile_command = f"{vivado_dir}/xvlog -work {worklib_name} --sv " 
    compile_command = compile_command + f" --log {output_dir}/build/compile.log "

    for f in get_files(rtl_dir, ".*\.v"):
        compile_command += f + " " 
    
    for f in get_files(tb_dir, ".*\.sv"):
        compile_command += f + " " 

    compile_command += f" --include {tb_dir} "

    # execute compile Command
    result = subprocess.run(
        compile_command,
        shell=True,
        #capture_output=True,
        text=True
    )
    print(result)
    print(f"Using xvlog to compile the design: {result}")
    assert result.returncode == 0, f"ERROR: xvlog compilation failed. Please check {output_dir}/build/compile.log"
    if(args.compile_only):
        print("Compile finished succesfully, exiting now.")
        exit(0)

    # Make xelab command
    elab_command = f"{vivado_dir}/xelab {worklib_name}.{top_module} -timescale '1ns/1ps' -debug typical" 
    elab_command = elab_command + f" --log {output_dir}/build/elaborate.log "
    # print(elab_command)
    # execute elab Command
    result = subprocess.run(
        elab_command,
        shell=True,
        #capture_output=True,
        text=True
    )
    print(result)
    assert result.returncode == 0, f"ERROR: velab elaboration failed. Please check {output_dir}/build/elaborate.log"



    # Make files to be able to open the waves easily
    with open(f"{output_dir}/build/open_waves.tcl", 'w') as f:
        s = f"open_wave_database {output_dir}/test1.wdb\n"
        f.write(s)

    with open(f"{output_dir}/build/open_waves.sh", 'w') as f:
        s = f"{vivado_dir}/xsim {worklib_name}.{top_module} --xsimdir {output_dir}/build -gui --t {output_dir}/build/open_waves.tcl\n"
        f.write(s)
    os.chmod(f"{output_dir}/build/open_waves.sh", 0o777)   # rwxrwxrwx

    # Run the sim.
    #os.mkdir(f"{output_dir}/test1")
    print(f"{output_dir}/test1")
    #os.chdir(f"{output_dir}/test1") -> This breaks it...
    # add --log <filename> for output log
    # add --t <filename.tcl> for tcl script
    sim_command = f"{vivado_dir}/xsim {worklib_name}.{top_module} --xsimdir {output_dir}/build --wdb {output_dir}/test1"
    sim_command = sim_command + f" --wdb {output_dir}/test1 "
    sim_command = sim_command + f" --log {output_dir}/build/simulate.log "
    sim_command = sim_command + f" --t {scripts_dir}/xsim_run.tcl "
    # Still need to log all waves, specify wave output file, run for some time --wdb {output_dir}/test1 
    print(sim_command)
    
    result = subprocess.run(
        sim_command,
        shell=True,
        #capture_output=True,
        text=True
    )