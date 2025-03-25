section .text
    global toString

toString:
    ; El número a convertir está en EDX:EAX
    ; La dirección del buffer está en RBX

    push rax
    push rcx
    push r8

    mov rcx, 0  	    ; contador para longitud
    mov r8, 10          ; constante 10
    .loop:
        mov rdx, 0
        div r8          
        push rdx        
        inc rcx
        mov rdx, 0
        cmp rax, 0
        jg .loop

    mov rax, 0          ; indice
    .loop2:
        pop rdx
        add dl, '0'
        mov byte [rbx + rax], dl
        inc rax
        cmp rax, rcx
        jl .loop2

    mov byte [rbx + rax], 0

    pop r8
    pop rcx
    pop rax


    ret

section .bss
    ans resb 10


