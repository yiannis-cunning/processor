	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"main.c"
	.globl	_start
	.p2align	2
	.type	_start,@function
_start:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	li	a0, 0
	sw	a0, -12(s0)
	j	.LBB0_1
.LBB0_1:
	lw	a1, -12(s0)
	li	a0, 9
	blt	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:
	lw	a0, -12(s0)
	lui	a1, %hi(g_inp_data)
	addi	a1, a1, %lo(g_inp_data)
	slli	a0, a0, 2
	add	a1, a0, a1
	li	a0, 7
	sw	a0, 0(a1)
	j	.LBB0_3
.LBB0_3:
	lw	a0, -12(s0)
	addi	a0, a0, 1
	sw	a0, -12(s0)
	j	.LBB0_1
.LBB0_4:
	lui	a0, 18
	sw	a0, -16(s0)
	li	a0, 0
	sw	a0, -20(s0)
	sw	a0, -24(s0)
	sw	a0, -28(s0)
	j	.LBB0_5
.LBB0_5:
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	srli	a0, a0, 4
	andi	a0, a0, 3
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	not	a1, a0
	andi	a1, a1, 3
	slli	a1, a1, 2
	add	a0, a0, a1
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	lw	a1, -16(s0)
	sw	a0, 0(a1)
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB0_5
.Lfunc_end0:
	.size	_start, .Lfunc_end0-_start

	.type	g_inp_data,@object
	.data
	.p2align	2
g_inp_data:
	.word	4096
	.word	8192
	.zero	32
	.size	g_inp_data, 40

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym g_inp_data
