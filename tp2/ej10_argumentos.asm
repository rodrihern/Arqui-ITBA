section .text

GLOBAL _start
EXTERN numtostr
EXTERN printNewLine
EXTERN print
EXTERN exit


_start:

    mov eax, [esp] ; cantidad de argumentos
    mov ebx, argmsg
    call print
    mov ebx, buffer
    push ebx
    push eax
    call numtostr
    call printNewLine
    pop ebx
    pop ebx

    xor ecx, ecx ; el iterador
    mov edx, 4   ; el offset
    mov ebx, buffer
    .loop:
        cmp ecx, eax
        je .done

        push ebx
        push dword [esp + edx]    ; imprimo el argumento
        call print                  ;TODO: LEER COMO LLAMAR ESTO
        call printNewLine
        pop ebx
        pop ebx

        inc ecx
        add ebx, 4          ; aumento el contador y corro el offset
        jmp .loop



    .done:
        call exit



    






    call exit

section .data
    argmsg db "Cantidad de argumentos: ", 0

section .bss
    buffer resb 10