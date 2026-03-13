	.file	"ej06_inicializacion.c"
	.intel_syntax noprefix
	.text
	.globl	arr5
	.bss
	.align 32
	.type	arr5, @object
	.size	arr5, 40
arr5:
	.zero	40
	.globl	arr6
	.align 32
	.type	arr6, @object
	.size	arr6, 40
arr6:
	.zero	40
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	push	edi
	and	esp, -16
	sub	esp, 224
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR 220[esp], eax
	xor	eax, eax
	lea	edx, 8[esp]
	mov	eax, 0
	mov	ecx, 10
	mov	edi, edx
	rep stosd
	mov	DWORD PTR 208[esp], 1634496360
	mov	DWORD PTR 212[esp], 1851878688
	mov	DWORD PTR 216[esp], 6384751
	mov	DWORD PTR 88[esp], 1
	lea	edx, 128[esp]
	mov	eax, 0
	mov	ecx, 20
	mov	edi, edx
	rep stosd
	mov	DWORD PTR 168[esp], 1
	mov	DWORD PTR 172[esp], 2
	mov	eax, 0
	mov	edx, DWORD PTR 220[esp]
	sub	edx, DWORD PTR gs:20
	je	.L3
	call	__stack_chk_fail_local
.L3:
	mov	edi, DWORD PTR -4[ebp]
	leave
	ret
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
