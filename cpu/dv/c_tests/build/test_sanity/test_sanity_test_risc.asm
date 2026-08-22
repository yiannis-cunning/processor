	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"test_sanity.c"
	.globl	test_main
	.p2align	2
	.type	test_main,@function
test_main:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
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
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	li	a0, 7
	sw	a0, 0(a1)
	j	.LBB0_3
.LBB0_3:
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB0_1
.LBB0_4:
	li	a0, 0
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	test_main, .Lfunc_end0-test_main

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
