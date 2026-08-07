	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"test_call.c"
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
	li	a0, 1023
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
	li	a0, 1023
	blt	a0, a1, .LBB0_8
	j	.LBB0_6
.LBB0_6:
	lw	a0, -12(s0)
	lw	a1, -20(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	li	a1, 3
	call	add_const
	lw	a1, -12(s0)
	lw	a2, -20(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_7
.LBB0_7:
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	j	.LBB0_5
.LBB0_8:
	lui	a0, %hi(.L__const.test_main.ops)
	lw	a1, %lo(.L__const.test_main.ops)(a0)
	sw	a1, -28(s0)
	addi	a0, a0, %lo(.L__const.test_main.ops)
	lw	a0, 4(a0)
	sw	a0, -24(s0)
	li	a0, 0
	sw	a0, -32(s0)
	j	.LBB0_9
.LBB0_9:
	lw	a1, -32(s0)
	li	a0, 1023
	blt	a0, a1, .LBB0_12
	j	.LBB0_10
.LBB0_10:
	lw	a0, -32(s0)
	andi	a0, a0, 1
	slli	a1, a0, 2
	addi	a0, s0, -28
	add	a0, a0, a1
	lw	a0, 0(a0)
	sw	a0, -36(s0)
	lw	a2, -36(s0)
	lw	a0, -12(s0)
	lw	a1, -32(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	li	a1, 5
	jalr	a2
	lw	a1, -12(s0)
	lw	a2, -32(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_11
.LBB0_11:
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB0_9
.LBB0_12:
	li	a0, 0
	lw	ra, 44(sp)
	lw	s0, 40(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	test_main, .Lfunc_end0-test_main

	.p2align	2
	.type	add_const,@function
add_const:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	add	a0, a0, a1
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	add_const, .Lfunc_end1-add_const

	.p2align	2
	.type	sub_const,@function
sub_const:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	sub	a0, a0, a1
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end2:
	.size	sub_const, .Lfunc_end2-sub_const

	.type	.L__const.test_main.ops,@object
	.section	.rodata,"a",@progbits
	.p2align	2
.L__const.test_main.ops:
	.word	add_const
	.word	sub_const
	.size	.L__const.test_main.ops, 8

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym add_const
	.addrsig_sym sub_const
