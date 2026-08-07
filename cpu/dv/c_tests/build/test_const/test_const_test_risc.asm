	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"test_const.c"
	.globl	test_main
	.p2align	2
	.type	test_main,@function
test_main:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	lui	a0, 74565
	sw	a0, -16(s0)
	lui	a0, 703710
	sw	a0, -20(s0)
	li	a0, 0
	sw	a0, -24(s0)
	j	.LBB0_1
.LBB0_1:
	lw	a1, -24(s0)
	li	a0, 1023
	blt	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:
	lw	a0, -16(s0)
	lw	a2, -24(s0)
	xor	a0, a0, a2
	lw	a1, -12(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_3
.LBB0_3:
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB0_1
.LBB0_4:
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB0_5
.LBB0_5:
	lw	a1, -28(s0)
	li	a0, 1023
	blt	a0, a1, .LBB0_8
	j	.LBB0_6
.LBB0_6:
	lw	a0, -12(s0)
	lw	a1, -28(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	lw	a0, 0(a1)
	lw	a2, -20(s0)
	add	a0, a0, a2
	sw	a0, 0(a1)
	j	.LBB0_7
.LBB0_7:
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB0_5
.LBB0_8:
	li	a0, 0
	sw	a0, -32(s0)
	j	.LBB0_9
.LBB0_9:
	lw	a1, -32(s0)
	li	a0, 1023
	blt	a0, a1, .LBB0_12
	j	.LBB0_10
.LBB0_10:
	lw	a0, -12(s0)
	lw	a2, -32(s0)
	slli	a1, a2, 2
	add	a1, a0, a1
	lw	a0, 0(a1)
	andi	a2, a2, 3
	lui	a3, %hi(g_offsets)
	addi	a3, a3, %lo(g_offsets)
	slli	a2, a2, 2
	add	a2, a2, a3
	lw	a2, 0(a2)
	xor	a0, a0, a2
	sw	a0, 0(a1)
	j	.LBB0_11
.LBB0_11:
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB0_9
.LBB0_12:
	li	a0, 0
	lw	ra, 28(sp)
	lw	s0, 24(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	test_main, .Lfunc_end0-test_main

	.type	g_offsets,@object
	.section	.rodata,"a",@progbits
	.p2align	2
g_offsets:
	.word	0
	.word	255
	.word	65280
	.word	16711680
	.size	g_offsets, 16

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym g_offsets
