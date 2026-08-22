	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"test_logic_imm.c"
	.globl	test_main
	.p2align	2
	.type	test_main,@function
test_main:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	li	a0, 0
	sw	a0, -16(s0)
	j	.LBB0_1
.LBB0_1:
	lw	a1, -16(s0)
	li	a0, 19
	blt	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:
	lw	a2, -16(s0)
	addi	a0, a2, -511
	lw	a1, -12(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_3
.LBB0_3:
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB0_1
.LBB0_4:
	li	a0, 0
	sw	a0, -20(s0)
	j	.LBB0_5
.LBB0_5:
	lw	a1, -20(s0)
	li	a0, 19
	blt	a0, a1, .LBB0_8
	j	.LBB0_6
.LBB0_6:
	lw	a0, -12(s0)
	lw	a1, -20(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	lw	a0, 0(a1)
	xori	a0, a0, 1365
	sw	a0, 0(a1)
	j	.LBB0_7
.LBB0_7:
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB0_5
.LBB0_8:
	li	a0, 0
	sw	a0, -24(s0)
	j	.LBB0_9
.LBB0_9:
	lw	a1, -24(s0)
	li	a0, 19
	blt	a0, a1, .LBB0_12
	j	.LBB0_10
.LBB0_10:
	lw	a0, -12(s0)
	lw	a1, -24(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	lw	a0, 0(a1)
	ori	a0, a0, 240
	sw	a0, 0(a1)
	j	.LBB0_11
.LBB0_11:
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB0_9
.LBB0_12:
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB0_13
.LBB0_13:
	lw	a1, -28(s0)
	li	a0, 19
	blt	a0, a1, .LBB0_16
	j	.LBB0_14
.LBB0_14:
	lw	a0, -12(s0)
	lw	a1, -28(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	lw	a0, 0(a1)
	andi	a0, a0, 2047
	sw	a0, 0(a1)
	j	.LBB0_15
.LBB0_15:
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB0_13
.LBB0_16:
	li	a0, 0
	lw	ra, 28(sp)
	lw	s0, 24(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	test_main, .Lfunc_end0-test_main

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
