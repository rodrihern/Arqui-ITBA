; libasm.asm
GLOBAL sys_write
ALIGN 4

sys_write:
    push ebp
    mov ebp, esp
    push ebx ;preservar ebx
    mov eax, 0x4
    mov ebx, [ebp+8] ;fd
    mov ecx, [ebp+12] ;buffer
    mov edx, [ebp+16] ;length
    int 0x80
    pop ebx
    mov esp, ebp
    pop ebp
    ret