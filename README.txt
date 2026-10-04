

source setenvs.sh 

Compile test binaries:
   python $ROOT/cpu/dv/scripts/compile_c_tests.py 

Running a test:
    setenv ROOT `pwd`
    pyhton $ROOT/dv/scripts/compile_design.py -o <output_dir>

