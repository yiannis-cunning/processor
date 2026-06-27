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
	li	a0, 1
	sw	a0, -16(s0)
	li	a0, 9
	sw	a0, -20(s0)
	j	.LBB0_1
.LBB0_1:
	lw	a1, -20(s0)
	li	a0, 12
	blt	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:
	lw	a1, -16(s0)
	lw	a0, -12(s0)
	add	a0, a0, a1
	sw	a0, -12(s0)
	lw	a1, -16(s0)
	slli	a0, a1, 1
	xor	a0, a0, a1
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	andi	a1, a1, 31
	lui	a2, %hi(arr)
	addi	a2, a2, %lo(arr)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB0_3
.LBB0_3:
	lw	a0, -20(s0)
	addi	a0, a0, 4
	sw	a0, -20(s0)
	j	.LBB0_1
.LBB0_4:
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	add	a0, a0, a1
	lw	ra, 28(sp)
	lw	s0, 24(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	_start, .Lfunc_end0-_start

	.type	arr,@object
	.data
arr:
	.asciz	"Hello World from inside a arr\000"
	.size	arr, 31

	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym arr
