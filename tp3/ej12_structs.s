	.file	"ej12_structs.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, 4[esp]
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 36
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	mov	DWORD PTR -28[ebp], 3
	mov	DWORD PTR -24[ebp], 6
	lea	eax, -20[ebp]
	sub	esp, 4
	; fijate que le pasa los dos campos y un puntero
	; al stack donde va a dejar la respuesta
	push	DWORD PTR -24[ebp]
	push	DWORD PTR -28[ebp]
	push	eax
	call	move
	add	esp, 12
	mov	eax, 0
	mov	edx, DWORD PTR -12[ebp]
	sub	edx, DWORD PTR gs:20
	je	.L3
	call	__stack_chk_fail_local
.L3:
	mov	ecx, DWORD PTR -4[ebp]
	leave
	lea	esp, -4[ecx]
	ret
	.size	main, .-main
	.globl	move
	.type	move, @function
move:
	push	ebp
	mov	ebp, esp
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 12[ebp]
	add	eax, 1
	mov	DWORD PTR 12[ebp], eax
	mov	eax, DWORD PTR 16[ebp]
	add	eax, 1
	mov	DWORD PTR 16[ebp], eax
	; carga la respuesta en la zona de memoria que recibio
	; devuelve en eax el puntero a donde esta la estructura
	mov	ecx, DWORD PTR 8[ebp]
	mov	eax, DWORD PTR 12[ebp]
	mov	edx, DWORD PTR 16[ebp]
	mov	DWORD PTR [ecx], eax
	mov	DWORD PTR 4[ecx], edx
	mov	eax, DWORD PTR 8[ebp]
	pop	ebp
	ret	4
	.size	move, .-move
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
