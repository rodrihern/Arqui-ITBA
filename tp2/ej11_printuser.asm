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
    cmp [ebx], dword "USER"
    je .done
    jmp .loop

.done:
    add ebx, 5
    call print
    call printNewLine

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada

section .data


section .bss