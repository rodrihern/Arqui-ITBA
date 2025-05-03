; hay que hacer una funcion int 
; int imprime_pantalla(char * encabezado, int tam_enc, char * pie, int tam_pie)
; se tiene una pantalla de 6x80 que se le pueden escribir caracteres
; hay que implementar la parte de la funcion que valide el tamanio del pie y que imprima el pie

GLOBAL main
GLOBAL imprime_pantalla
EXTERN print_matrix

section .data
encabezado db "Este es el titulo"
tam_enc equ $-encabezado
pie db "Fin de mensaje"
tam_pie equ $-pie

tam_fil equ 6
tam_col equ 80

section .bss
pantalla resb tam_fil * tam_col

section .text

main:
    push ebp 
    mov ebp, esp

    push tam_pie
    push pie
    push tam_enc
    push encabezado
    call imprime_pantalla
    add esp, 4*4

    push pantalla
    call print_matrix
    add esp, 4

    leave
    ret

imprime_pantalla:
    push ebp
    mov ebp, esp

    mov edx, [ebp+16] ; pie
    mov ecx, [ebp+20] ; tam_pie
    ; validamos 1 <= tam_pie <= 80
    cmp ecx, tam_col
    jg .invalid
    cmp ecx, 1
    jge .valid
.invalid:
    mov eax, 1
    leave
    ret

.valid:
    push ebx ;backup
    xor eax, eax ;i

.loop:
    cmp eax, ecx
    jge .done 
    mov ebx, [edx+eax] ; caracter
    mov [pantalla+(tam_fil-1)*tam_col + eax], ebx
    inc eax
    jmp .loop

.done:
    pop ebx
    xor eax, eax
    leave
    ret