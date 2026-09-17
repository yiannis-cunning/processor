


def: main.c
	clang --target=riscv32 -march=rv32i -mabi=ilp32 main.c -S -o main.asm
	clang --target=riscv32 -march=rv32g -mabi=ilp32 -mno-relax main.asm -c -o main.obj
	ld.lld main.obj -o main.elf -static --section-start=.text=0x2000 --section-start=.data=0x9000
	llvm-objcopy-14 --output-target=binary main.elf main_text.bin --set-start=0x1000 --only-section=.text
	llvm-objcopy-14 --output-target=binary main.elf main_data.bin --set-start=0x1000 --only-section=.data --only-section=.rodata
