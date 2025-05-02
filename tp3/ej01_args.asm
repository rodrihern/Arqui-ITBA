;main.asm
GLOBAL main
EXTERN printf

section .rodata
    fmt db "Cantidad de argumentos: %d", 10, 0
    argfmt db "%s", 10, 0

section .text

main:
    push ebp            ;Armado de stack frame
    mov ebp, esp
    
    

    push dword [ebp+8]
    push fmt
    call printf
    add esp, 2*4

    ; ahora quiero printear todos los argumentos
    mov ebx, [ebp+8]    ; argc
    xor ecx, ecx         ; i
    mov edx, [ebp+12]   ;argv
    .loop:
        cmp ebx, 0
        je .done

        pushad
        push dword[edx+ecx]
        push argfmt
        call printf
        add esp, 4*2
        popad

        add ecx, 4
        dec ebx
        jmp .loop


    
    .done:

    mov eax, 0
    mov esp, ebp        ;Desarmado de stack frame
    pop ebp             ;
    ret