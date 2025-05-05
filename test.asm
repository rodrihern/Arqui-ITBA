GLOBAL main
EXTERN printf

section .data
buffer db "%x", 10, 0
word db "hola"

section .text

main:
	lea eax, buffer
	push eax
	push buffer
	call printf
	add esp, 2*4

	lea eax, [buffer]
	push eax
	push buffer
	call printf
	add esp, 2*4

	mov eax, buffer
	push eax
	push buffer
	call printf
	add esp, 2*4

	push dword [word]
	push buffer
	call printf
	add esp, 2*4

	mov eax, 0
	ret