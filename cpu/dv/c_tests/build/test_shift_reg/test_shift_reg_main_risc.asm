	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"main.c"
	.globl	_start
	.p2align	2
	.type	_start,@function
_start:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	lui	a0, %hi(g_inp_data)
	addi	a0, a0, %lo(g_inp_data)
	call	test_main
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	_start, .Lfunc_end0-_start

	.type	g_inp_data,@object
	.data
	.p2align	2
g_inp_data:
	.word	4096
	.word	8192
	.zero	4088
	.size	g_inp_data, 4096

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym test_main
	.addrsig_sym g_inp_data
