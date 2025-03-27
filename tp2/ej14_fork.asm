section .text

GLOBAL _start
EXTERN printNewLine

_start:
    mov eax, 2  ; ID para llamar al fork
    xor ebx, ebx
    int 80h
    cmp eax, 0
    je .child
    
.parent:
    mov ecx, parent_msg
    mov edx, parent_len
    jmp .finish

.child:
    mov ecx, child_msg
    mov edx, child_len

.finish:
    mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
    int 80h
    call printNewLine

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada


section .data
    parent_msg db "Luke I am your father", 0
    parent_len equ $-parent_msg

    child_msg db "I am Luke", 0
    child_len equ $-child_msg

section .bss