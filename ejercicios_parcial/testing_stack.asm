GLOBAL main
EXTERN printf

section .rodata
msg_ebp db "ebp: %x", 10, 0
msg_ret db "ret: %x", 10, 0

section .text

main:
    push ebp
    mov ebp, esp
    
    push ebp 
    push msg_ebp
    call printf
    add esp, 2*4

    call print_ret

    leave 
    ret

print_ret:
    push ebp
    mov ebp, esp

    push dword[ebp]
    push msg_ebp
    call printf
    add esp, 2*4

    movzx eax, byte [ebp+4] ; Zero-extend the byte into eax
    push eax
    push msg_ret
    call printf
    add esp, 6

    leave
    ret