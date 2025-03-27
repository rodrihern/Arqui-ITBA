section .text
    global num2string

num2string:
    ; El número a convertir está en EAX
    ; La dirección del buffer está en EBX

    pushad

    mov ecx, 0  	    ; contador para longitud
                        ; constante 10
    .loop:
        xor edx, edx
        push ecx

        mov ecx, 10
        div ecx
        pop ecx

        inc ecx
        cmp eax, 0
        jg .loop

    mov eax, 0          ; indice
    .loop2:
        add dl, '0'
        mov byte [ebx + eax], dl
        inc eax
        cmp eax, ecx
        jl .loop2

    mov byte [ebx + eax], 0

    popad

    ret


section .bss
    ans resb 10


