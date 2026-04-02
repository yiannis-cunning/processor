import argparse
import sys
import re
import os
import subprocess
import re
from datetime import datetime


def get_files(dir_path, expr):
    ans = []
    for f in os.listdir(dir_path):
        if os.path.isfile(os.path.join(dir_path, f)) and re.search(expr, f):
            ans.append(os.path.join(dir_path, f))
    return ans

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Convert text to html')
    
    parser.add_argument('ROOT')                                 # positional argument
    parser.add_argument('-o', '--out_dir')                            # option that takes a value
    #parser.add_argument('-v', '--verbose', action='store_true')     # on/off flag
    args = parser.parse_args()




    # Setup search paths
    vivado_dir = "/home/cunningy/Desktop/Xilinx/Vivado/2023.2/bin/"
    rtl_dir = args.ROOT + "/cpu/design/rtl/"
    tb_dir = args.ROOT + "/cpu/dv/hdl/"
    scripts_dir = args.ROOT + "/cpu/dv/scripts/"
    top_module = "tb_top"
    worklib_name = "worklib"
    result = ""

    # Make output directory 
    if(args.out_dir and os.path.exists(args.out_dir) and os.path.isdir(args.out_dir)): 
        os.chdir(args.out_dir)

    
    now = datetime.now()
    outdir = "Regout" + now.strftime("%Y_%m_%d_%H_%M%S")
    os.mkdir(outdir)
    print(f"Making output directory: {outdir}"); 
    os.chdir(outdir)
    output_dir = os.getcwd()
    os.mkdir("build")
    os.chdir("build")
    
    
    # Make compile command
    compile_command = f"{vivado_dir}/xvlog -work {worklib_name} --sv " 
    compile_command = compile_command + f" --log {output_dir}/build/compile.log "

    for f in get_files(rtl_dir, ".*\.v"):
        compile_command += f + " " 
    
    for f in get_files(tb_dir, ".*\.sv"):
        compile_command += f + " " 

    # print(compile_command)
    # execute compile Command
    result = subprocess.run(
        compile_command,
        shell=True,
        #capture_output=True,
        text=True
    )
    print(result)
    print(f"Using xvlog to compile the design: {result}")


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