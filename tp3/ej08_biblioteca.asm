GLOBAL exit
GLOBAL write
GLOBAL read
GLOBAL open
GLOBAL close

section .text

ALIGN 4

exit:
    mov eax, 1
    mov ebx, [esp+4]
    int 80h


read:
    push ebp
    mov ebp, esp
    and esp, -16    ; corrected 'ans' to 'and'

    push ebx    ; preservar ebx
    mov eax, 3
    mov ebx, [ebp+8]    ; file descriptor (corrected offset)
    mov ecx, [ebp+12]   ; char * buffer (corrected offset)
    mov edx, [ebp+16]   ; size_t count (corrected offset)
    int 80h

    pop ebx
    mov esp, ebp
    pop ebp
    ret

write:
    push ebp
    mov ebp, esp
    and esp, -16   

    push ebx            ;preservar ebx
    mov eax, 4          ; corrected syscall number from 3 to 4 for write
    mov ebx, [ebp+8]    ;fd
    mov ecx, [ebp+12]   ;buffer
    mov edx, [ebp+16]   ;length
    int 0x80

    pop ebx     ; restaurar ebx
    mov esp, ebp
    pop ebp
    ret

open:
    push ebp
    mov ebp, esp
    and esp, -16

    push ebx
    mov eax, 5     
    mov ebx, [ebp+8]    ; const char *pathname (corrected offset)
    mov ecx, [ebp+12]    ; int flags (corrected offset)
    int 80h

    pop ebx
    mov esp, ebp
    pop ebp
    ret

close:
    push ebp      ; fixed duplicate label 'open:'
    mov ebp, esp
    and esp, -16
    push ebx

    mov eax, 6     ; corrected missing comma
    mov ebx, [ebp+8]    ; unsigned int filedescriptor (corrected offset)
    int 80h

    pop ebx
    mov esp, ebp
    pop ebp
    ret



