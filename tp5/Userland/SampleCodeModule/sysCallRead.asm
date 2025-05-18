GLOBAL userProgram

section .text

section .data
buff1 db "STDOUT"
len1 equ $-buff1
buff2 db "STDERR"
len2 equ $-buff2

userProgram:
    push rbp
    mov rbp, rsp

    mov rax, 4
    mov rbx, 1
    mov rcx, buff1
    mov rdx, len1
    int 80h

    mov rax, 4
    mov rbx, 2
    mov rcx, buff2
    mov rdx, len2
    int 80h

    mov rsp, rbp
    pop rbp
    ret

section .data
buff1 db "STDOUT", 0

buff2 db "STDERR", 0