section .text

GLOBAL _start

_start:
    mov eax, 0       ; el i del iterador

loop:
    mov bh, [msg + eax]
    cmp bh, 'a'     ; si es menor que la a salteo
    jl next
    cmp bh, 'z'     ; si es mayor a z la salteo
    jg next
    ; ahora si vamos a pasarla a mayuscula
    sub bh, 'a'
    add bh, 'A'
    mov [msg + eax], bh

next:
    add eax, 1
    cmp eax, len
    jl loop

done:
    mov ecx, msg 	; Puntero a la cadena
	mov edx, len	; Largo de la cadena 
	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h		; Ejecucion de la llamada

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		; Ejecucion de la llamada



section .data

msg db "h4ppy c0d1ng", 10
len equ $-msg

section .bss

placeholder resb 10