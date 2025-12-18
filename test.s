	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 0
	.syntax unified
	.globl	_main                           @ -- Begin function main
	.p2align	2
	.code	32                              @ @main
_main:
@ %bb.0:
	push	{r7, lr}
	mov	r7, sp
	sub	sp, sp, #8
	mov	r0, #97
	strb	r0, [r7, #-1]
	mov	r0, #8
	str	r0, [sp]
	ldr	r1, [sp]
	ldrsb	r2, [r7, #-1]
	ldr	r0, LCPI0_0
LPC0_0:
	add	r0, pc, r0
	bl	_printf
	mov	r0, #0
	mov	sp, r7
	pop	{r7, lr}
	bx	lr
	.p2align	2
@ %bb.1:
	.data_region
LCPI0_0:
	.long	L_.str-(LPC0_0+8)
	.end_data_region
                                        @ -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 @ @.str
	.asciz	"%d, %c"

.subsections_via_symbols
