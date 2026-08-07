	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"test_load_store.c"
	.globl	test_main
	.p2align	2
	.type	test_main,@function
test_main:
	addi	sp, sp, -96
	sw	ra, 92(sp)
	sw	s0, 88(sp)
	addi	s0, sp, 96
	sw	a0, -12(s0)
	li	a0, 0
	sw	a0, -16(s0)
	j	.LBB0_1
.LBB0_1:
	lw	a1, -16(s0)
	li	a0, 1023
	blt	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:
	lbu	a0, -16(s0)
	sw	a0, -20(s0)
	lw	a1, -20(s0)
	slli	a0, a1, 8
	or	a0, a1, a0
	slli	a2, a1, 16
	or	a0, a0, a2
	slli	a1, a1, 24
	or	a0, a0, a1
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	lui	a1, 785404
	addi	a1, a1, -64
	add	a0, a0, a1
	lw	a1, -12(s0)
	lw	a2, -16(s0)
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
	lw	a0, -12(s0)
	sw	a0, -28(s0)
	lw	a0, -12(s0)
	sw	a0, -32(s0)
	lw	a0, -12(s0)
	sw	a0, -36(s0)
	lw	a0, -12(s0)
	sw	a0, -40(s0)
	lui	a0, 1
	sw	a0, -44(s0)
	addi	a0, a0, -2048
	sw	a0, -48(s0)
	li	a0, 0
	sw	a0, -52(s0)
	j	.LBB0_5
.LBB0_5:
	lw	a0, -52(s0)
	lw	a1, -44(s0)
	bgeu	a0, a1, .LBB0_8
	j	.LBB0_6
.LBB0_6:
	lw	a0, -28(s0)
	lw	a1, -52(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	sb	a0, -53(s0)
	lb	a0, -53(s0)
	addi	a0, a0, 1
	lw	a1, -28(s0)
	lw	a2, -52(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB0_7
.LBB0_7:
	lw	a0, -52(s0)
	addi	a0, a0, 1
	sw	a0, -52(s0)
	j	.LBB0_5
.LBB0_8:
	li	a0, 0
	sw	a0, -60(s0)
	j	.LBB0_9
.LBB0_9:
	lw	a0, -60(s0)
	lw	a1, -44(s0)
	bgeu	a0, a1, .LBB0_12
	j	.LBB0_10
.LBB0_10:
	lw	a0, -32(s0)
	lw	a1, -60(s0)
	add	a0, a0, a1
	lb	a0, 0(a0)
	sb	a0, -61(s0)
	lb	a1, -61(s0)
	li	a0, 0
	sub	a0, a0, a1
	lw	a1, -32(s0)
	lw	a2, -60(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB0_11
.LBB0_11:
	lw	a0, -60(s0)
	addi	a0, a0, 1
	sw	a0, -60(s0)
	j	.LBB0_9
.LBB0_12:
	li	a0, 0
	sw	a0, -68(s0)
	j	.LBB0_13
.LBB0_13:
	lw	a0, -68(s0)
	lw	a1, -48(s0)
	bgeu	a0, a1, .LBB0_16
	j	.LBB0_14
.LBB0_14:
	lw	a0, -36(s0)
	lw	a1, -68(s0)
	slli	a1, a1, 1
	add	a0, a0, a1
	lh	a0, 0(a0)
	sh	a0, -70(s0)
	lh	a0, -70(s0)
	addi	a0, a0, 1
	lw	a1, -36(s0)
	lw	a2, -68(s0)
	slli	a2, a2, 1
	add	a1, a1, a2
	sh	a0, 0(a1)
	j	.LBB0_15
.LBB0_15:
	lw	a0, -68(s0)
	addi	a0, a0, 1
	sw	a0, -68(s0)
	j	.LBB0_13
.LBB0_16:
	li	a0, 0
	sw	a0, -76(s0)
	j	.LBB0_17
.LBB0_17:
	lw	a0, -76(s0)
	lw	a1, -48(s0)
	bgeu	a0, a1, .LBB0_20
	j	.LBB0_18
.LBB0_18:
	lw	a0, -40(s0)
	lw	a1, -76(s0)
	slli	a1, a1, 1
	add	a0, a0, a1
	lh	a0, 0(a0)
	sh	a0, -78(s0)
	lh	a1, -78(s0)
	li	a0, 0
	sub	a0, a0, a1
	lw	a1, -40(s0)
	lw	a2, -76(s0)
	slli	a2, a2, 1
	add	a1, a1, a2
	sh	a0, 0(a1)
	j	.LBB0_19
.LBB0_19:
	lw	a0, -76(s0)
	addi	a0, a0, 1
	sw	a0, -76(s0)
	j	.LBB0_17
.LBB0_20:
	li	a0, 0
	sw	a0, -84(s0)
	j	.LBB0_21
.LBB0_21:
	lw	a1, -84(s0)
	li	a0, 1023
	blt	a0, a1, .LBB0_24
	j	.LBB0_22
.LBB0_22:
	lw	a0, -12(s0)
	lw	a1, -84(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	lw	a0, 0(a1)
	lui	a2, 69905
	addi	a2, a2, 273
	add	a0, a0, a2
	sw	a0, 0(a1)
	j	.LBB0_23
.LBB0_23:
	lw	a0, -84(s0)
	addi	a0, a0, 1
	sw	a0, -84(s0)
	j	.LBB0_21
.LBB0_24:
	li	a0, 0
	lw	ra, 92(sp)
	lw	s0, 88(sp)
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	test_main, .Lfunc_end0-test_main

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
