

main:
	echo "Build flow has moved to cpu/dv/scripts/compile_c_tests.py"


def:
	rm -rf build
	mkdir build
	
	# Compile + run for x86
	mkdir build/test1
	gcc test1.c main.c -o build/test1/test1_x86.exe -D COMPILE_X86
	./build/test1/test1_x86.exe > build/test1/test1_x86.out

	# Compile for RISC-V
	# C   ----> ASM
	clang --target=riscv32 -march=rv32i -mabi=ilp32d main.c -S -o build/test1/test1_main_risc.asm
	clang --target=riscv32 -march=rv32i -mabi=ilp32d test1.c -S -o build/test1/test1_test_risc.asm


	# ASM ----> OBJ
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax build/test1/test1_main_risc.asm -c -o build/test1/test1_main_risc.obj
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax build/test1/test1_test_risc.asm -c -o build/test1/test1_test_risc.obj
	# OBJ ----> ELF
	ld.lld build/test1/test1_main_risc.obj build/test1/test1_test_risc.obj -o build/test1/test1_risc.elf -static --section-start=.text=1000 --section-start=.data=2000
	# ELF ----> BIN/IHEX
	llvm-objcopy-14 --output-target=ihex build/test1/test1_risc.elf build/test1/test1_risc.ihex --set-start=1000
	llvm-objcopy-14 --output-target=binary build/test1/test1_risc.elf build/test1/test1_risc.bin --set-start=1000

