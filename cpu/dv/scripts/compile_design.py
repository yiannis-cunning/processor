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

    parser = argparse.ArgumentParser(description='Convert text to html')
    
    parser.add_argument('-o', '--out_dir')                              # option that takes a value
    parser.add_argument('-c', '--compile_only', action='store_true')    # option that takes a value
    parser.add_argument('-t', '--tests', required=False)                 # Which tests to run
    parser.add_argument('-w',  '--waves', action='store_true')                               
    #parser.add_argument('-v', '--verbose', action='store_true')        # on/off flag
    args = parser.parse_args()

    # Check root is set
    ROOT = os.environ.get('ROOT')
    assert ROOT, "ERROR: ROOT varaiable must be set"
    VIVADO_PATH = os.environ.get('VIVADO_PATH')
    assert VIVADO_PATH, "ERROR: VIVADO_PATH varaiable must be set"


    # Setup search paths
    vivado_dir      = VIVADO_PATH + "/bin/"
    rtl_dir         = ROOT + "/cpu/design/rtl/"
    tb_dir          = ROOT + "/cpu/dv/hdl/"
    scripts_dir     = ROOT + "/cpu/dv/scripts/"
    c_tests_dir     = ROOT + "/cpu/dv/c_tests/"


    tests           = "addi_slti 1 branch call compare const load_store logic_imm logic_reg sanity shift_imm shift_reg".split(" ")
    if(args.tests != None):
        tests       = args.tests.split(" ")
    top_module      = "tb_top"
    worklib_name    = "worklib"


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
    if os.name == "nt":
        output_dir = os.getcwd().replace("\\", "/")
    else:
        output_dir = os.getcwd()
    os.mkdir("build")
    os.chdir("build")

    
    #
    # Make + run compile command
    #
    compile_command = f"{vivado_dir}/xvlog -work {worklib_name} --sv " 
    compile_command = compile_command + f" --log {output_dir}/build/compile.log "

    for f in get_files(tb_dir + "/seq/", r".*\.sv"):
        compile_command += f + " " 

    for f in get_files(rtl_dir, r".*\.v"):
        compile_command += f + " " 
    
    for f in get_files(tb_dir, r".*\.sv"):
        compile_command += f + " " 

    compile_command += f" --include {tb_dir} "

    # execute compile Command
    result = subprocess.run(
        compile_command,
        shell=True,
        #capture_output=True,
        check=True,
        text=True
    )
    print(result)
    print(f"Using xvlog to compile the design: {result}")
    assert result.returncode == 0, f"ERROR: xvlog compilation failed. Please check {output_dir}/build/compile.log"
    if(args.compile_only):
        print("Compile finished succesfully, exiting now.")
        exit(0)

    # Make xelab command
    elab_command = f"{vivado_dir}/xelab {worklib_name}.{top_module} -timescale \"1ns/1ps\" -debug typical" 
    elab_command = elab_command + f" --log {output_dir}/build/elaborate.log "
    # print(elab_command)
    # execute elab Command
    result = subprocess.run(
        elab_command,
        shell=True,
        #capture_output=True,
        check=True,
        text=True
    )
    print(result)
    assert result.returncode == 0, f"ERROR: velab elaboration failed. Please check {output_dir}/build/elaborate.log"


    #
    # Run tests
    #
    
    # Requirements for running a siulation:
    # xsim <libname> 
    # xsim.dir needs to be in current directory, which is where xsim will look for lib files.
    # dccm.hex, iccm.hex, rom.hex are needed in current directory.
    # if waves want to be saved:
    #   --wdb <wave location> 
    #   --t <tcl file> ++ add log wave command.

    i = 1
    for testname in tests:
        testname = f"test_{testname}"
        os.mkdir(f"{output_dir}/test{i}")
        os.chdir(f"{output_dir}/test{i}")

        if os.name == "nt": # os.symlink only works in windows developer mode...
            subprocess.run(f"cmd /c mklink /J \"{output_dir}//test{i}//xsim.dir\" \"{output_dir}//build//xsim.dir\" ", shell=True, text=True, check=True, capture_output=True)
            print(output_dir)
        else:
            os.symlink(f"{output_dir}/build/xsim.dir", f"{output_dir}/test{i}/xsim.dir")

        shutil.copy(f"{c_tests_dir}/build/rom.hex", ".")
        shutil.copy(f"{c_tests_dir}/build/{testname}/{testname}_iccm.hex", "./iccm.hex")
        shutil.copy(f"{c_tests_dir}/build/{testname}/{testname}_dccm.hex", "./dccm.hex")
        #shutil.copy(f"{c_tests_dir}/build/{testname}/{testname}_x86.out", "./exp.out")
        x86_out = open(f"{c_tests_dir}/build/{testname}/{testname}_x86.out").read()
        open("exp.out", "w").write(x86_out.replace("-", "\n") + "\n")

        if os.name == "nt": # os.symlink only works in windows developer mode...
            subprocess.run(f"cmd /c mklink /J \".//test_src\" \"{c_tests_dir}//build//{testname}//\" ", shell=True, text=True, check=True, capture_output=True)
        else:
            os.symlink(f"{c_tests_dir}/build/{testname}/", f"./test_src")

        sim_command = f"{vivado_dir}/xsim {worklib_name}.{top_module}"
        sim_command += f" --log ./simulate.log "

        sim_command_waves = sim_command
        sim_command_waves += f" --wdb ./test{i}.wdb"
        sim_command_waves += f" --t {scripts_dir}/xsim_run.tcl "
        open(f"{output_dir}/test{i}/open_waves.tcl", 'w').write(f"open_wave_database {output_dir}/test{i}/test{i}.wdb\n")
        open(f"{output_dir}/test{i}/open_waves.sh", 'w').write(f"{vivado_dir}/xsim {worklib_name}.{top_module} -gui --t {output_dir}/test{i}/open_waves.tcl\n")
        os.chmod(f"{output_dir}/test{i}/open_waves.sh", 0o777)   # rwxrwxrwx
        sim_command += " --runall "
        open("sim_cmd", "w").write(sim_command)
        os.chmod("sim_cmd", 0o777)
        open("sim_cmd_waves", "w").write(sim_command_waves)
        os.chmod("sim_cmd_waves", 0o777)


        print(f"Running test{i}: ({testname}) ", sim_command)
        if(args.waves):
            sim_command = sim_command_waves

        result = subprocess.run(sim_command,
            shell=True, check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            #capture_output=True,
            text=True
        )

        # Check on the result:
        result = "passed"

        # Check vivado sim errors
        if(open("simulate.log").read().find("\nError: ") != -1):
            result = "failed"

        if( subprocess.run(f"diff ./dccm_done.hex ./exp.out", shell=True, text=True, capture_output=True).stdout != ""):
            result = "failed"

        open("result.txt", "w").write(result + "\n")
        print(f"Test {i}: {result}")
        i += 1