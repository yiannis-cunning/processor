




default:
	clang --target=riscv32 -march=rv32i -mabi=ilp32d main.c -S
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax main.s -c -o main.o
	ld.lld main.o -o main.elf -static --section-start=.text=1000 --section-start=.data=2000
	llvm-objcopy-14 --output-target=ihex main.elf main.bin --set-start=1000

	# Repeat (1) times
	# Take (4) bytes at a time
	# Print as a 8 byte hexadecimal number
	# Print newline. 
	hexdump -v -e '1/4 "%08x" "\n"' main.bin > iccm.hex

iccm_dccm:
	
