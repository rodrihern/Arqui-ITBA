

GLOBAL _start
GLOBAL fib

EXTERN numtostr
EXTERN printNewLine

section .bss
    buff resb 10

section .text

; un maincito para probar
_start:
    mov eax, 7 ;fib(7) = 21
    push eax
    call fib
    add esp, 4

    push buff
    push eax
    call numtostr
    add esp, 2*4

    call printNewLine

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada
    
    



; recibe en el stack un parametro n
fib:
    push ebp
	mov ebp,esp
    and esp, -16
    push ebx

    ; en ebp+8 esta n
    mov ebx, [ebp+8]
    cmp ebx, 2
    jl .base_case
    
    dec ebx     ; n-1
    push ebx
    call fib
    pop ebx
    
    push eax    ; guardo en el stack fib(n-1)

    dec ebx     ; n-2
    push ebx
    call fib
    pop ebx

    pop edx     ; agarro el fib(n-1)

    add eax, edx    ; fib(n-2) + fib(n-1)
    jmp .leave

.base_case:
    mov eax, 1

.leave:
    pop ebx
    leave
    ret

    