




default:
	clang --target=riscv32 -march=rv32i -mabi=ilp32d main.c -S
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax main.s -c -o main.o
	ld.lld main.o -o main.x
	llvm-objcopy-14 --output-target=binary main.x main.bin