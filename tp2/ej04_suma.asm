section .text
    global _start
    extern toString

_start:
    mov rax, 0        ; número de parámetro
    mov rdx, 100

    .loop:
        add rax, rdx
        dec rdx
        cmp rdx, 0
        jg .loop


    mov rdx, 0
    mov rbx, res        ; Dirección del buffer donde se almacenará el string
    call toString       ; Llamar a la función toString
    mov byte [rbx + rax + 1], 10

    mov eax, 4          ; sys_write
    mov ebx, 1          ; descriptor del archivo (stdout)
    mov ecx, res        ; Dirección del buffer con el string
    mov edx, 10         ; Longitud del string (ajustar según el tamaño esperado)
    int 0x80            ; Llamada al kernel para escribir

    mov eax, 1
    mov ebx, 0
    int 0x80

section .bss
    res resb 10