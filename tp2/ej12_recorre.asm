; quiero que printee en pantalla todo el stack hasta que de seg fault
section .text

GLOBAL _start
EXTERN print
EXTERN printNewLine

_start:

    xor ecx, ecx
.loop:
    add ecx, 4
    mov ebx, [esp + ecx]
    cmp ebx, 0
    je .loop
    call print
    call printNewLine
    jmp .loop
    


    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada

section .data


section .bss