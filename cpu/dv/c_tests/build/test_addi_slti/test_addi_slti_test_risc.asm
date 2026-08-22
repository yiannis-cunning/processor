	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"test_addi_slti.c"
	.globl	test_main
	.p2align	2
	.type	test_main,@function
test_main:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
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
	addi	a0, a0, 123
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
	add	a0, a0, a1
	lw	a0, 0(a0)
	sw	a0, -28(s0)
	lw	a0, -28(s0)
	slti	a0, a0, 200
	lw	a1, -12(s0)
	lw	a2, -24(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_11
.LBB0_11:
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB0_9
.LBB0_12:
	li	a0, 0
	sw	a0, -32(s0)
	j	.LBB0_13
.LBB0_13:
	lw	a1, -32(s0)
	li	a0, 19
	blt	a0, a1, .LBB0_16
	j	.LBB0_14
.LBB0_14:
	lw	a0, -32(s0)
	sw	a0, -36(s0)
	lw	a1, -36(s0)
	slli	a0, a1, 5
	slli	a2, a1, 2
	add	a0, a0, a2
	add	a0, a0, a1
	lw	a1, -12(s0)
	lw	a2, -32(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_15
.LBB0_15:
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB0_13
.LBB0_16:
	li	a0, 0
	sw	a0, -40(s0)
	j	.LBB0_17
.LBB0_17:
	lw	a1, -40(s0)
	li	a0, 19
	blt	a0, a1, .LBB0_20
	j	.LBB0_18
.LBB0_18:
	lw	a0, -12(s0)
	lw	a1, -40(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	lw	a0, 0(a1)
	sltiu	a0, a0, 2000
	sw	a0, 0(a1)
	j	.LBB0_19
.LBB0_19:
	lw	a0, -40(s0)
	addi	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB0_17
.LBB0_20:
	li	a0, 0
	lw	ra, 44(sp)
	lw	s0, 40(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	test_main, .Lfunc_end0-test_main

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
