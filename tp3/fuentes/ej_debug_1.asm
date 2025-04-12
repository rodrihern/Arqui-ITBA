; ej_debug_1.asm
;===============================================================================

GLOBAL main
EXTERN printf

section .rodata
fmtA db "argc: %d",10,  0
fmtB db "argv[%d] = %s", 10, 0

section .text
main:
    push    ebp
    mov     ebp,esp
; armado de stack frame
    push    dword[ebp+8]        ; valor del %d
    push    fmtA
    call    printf
    add     esp,2*4

    mov     ecx, dword[ebp+8] ; cantidad de argumentos
    mov     ebx,0   ; argv[ebx]
    mov     esi,[ebp+12]    ; argv  estamos pasando el arreglo
    cld     ; autoincremento de ESI
.loop:
    lodsd   ; eax = [ESI] y  ESI = ESI + 4


    push    ecx  ; backup

    push    eax  ; *argv

    push    fmtB ; formato
    push    ebx
    call    printf
    add     esp,4*3 ; borramos los datos usados de la pila

    pop     ecx ; recuperamos el valor de ecx

    inc     ebx
    loop    .loop

    mov     esp,ebp
    pop     ebp  ; desarmado de stack frame

    mov     eax,0 ; valor de retorno de main
    ret
