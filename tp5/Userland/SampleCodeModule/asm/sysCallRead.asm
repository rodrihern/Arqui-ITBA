GLOBAL userProgram

section .text
userProgram:
    push rbp
    mov rbp, rsp

    mov rax, 4       ; syscall number (4 = write)
    mov rbx, 1       ; file descriptor (1 = stdout)
    mov rcx, buff1   ; buffer
    mov rdx, len1    ; length
    int 80h          ; syscall interrupt

    mov rax, 4       ; syscall number (4 = write)
    mov rbx, 2       ; file descriptor (2 = stderr)
    mov rcx, buff2   ; buffer
    mov rdx, len2    ; length
    int 80h          ; syscall interrupt

    mov rsp, rbp
    pop rbp
    ret

section .data
buff1 db "STDOUT"
len1 equ $-buff1
buff2 db "STDERR"
len2 equ $-buff2