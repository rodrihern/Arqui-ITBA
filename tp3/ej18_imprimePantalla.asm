; Se le pide que escriba una función en assembler de Intel. Usted debe realizar una rutina
; que será llamada desde C y tiene el siguiente formato:
; int imprime_pantalla(char *encabezado, int tam_enc, char *pie, int
; tam_pie)
; Esta rutina debe imprimir dos cadenas de caracteres en una pantalla de 480 caracteres
; monocromáticos (80 columnas y 6 filas) que se encuentra mapeada a partir de la dirección
; de memoria A0000000h. Cada posición de memoria representa un carácter de la pantalla.
; La rutina imprime una cadena llamada encabezado en la primera fila de la pantalla y
; otra cadena llamada pie en la última fila de la pantalla. Además recibe el tamaño de cada
; cadena a imprimir, el cual es un número que puede ir de 1 a 80 como máximo. Si la rutina
; recibe un valor fuera de ese rango retorna el valor 1. Si la rutina se ejecuta sin problemas
; retorna el valor cero.
; Como caso de uso y para contestar lo pedido en el ejercicio usted probará con la
; cadena encabezado “Este es el título” con 17 como tamaño de cadena, y la cadena pie “Fin
; de mensaje” con 14 de tamaño.
; Se pide en este orden que:
; 1. Dibuje el estado de la pila al iniciar la rutina con cada una de las direcciones de memoria
; y contenidos de la pila, utilizando el caso de uso propuesto.
; 2. Realice la rutina en assembler, pero solo implemente la parte que imprime la cadena
; pie. No escriba la parte de código que imprime el encabezado.
section .rodata
SCREEN equ 0xA0000000
COL_LEN equ 80

section .text
    GLOBAL imprime_pantalla

imprime_pantalla:
    push ebp
    mov ebp, esp
    push ebx            ; Preservar ebx según convención de C

    ; Verificar tamaño del pie (debe estar entre 1 y 80)
    mov ecx, [ebp+20]   ; largo del pie
    cmp ecx, 1
    jl .error           ; Si es menor que 1, error
    cmp ecx, COL_LEN
    jg .error           ; Si es mayor que 80, error

    ; Implementación de impresión del pie
    mov edx, [ebp+16]   ; Puntero al pie 
    mov eax, SCREEN+5*COL_LEN  ; Última fila 

.loop:
    mov bl, [edx]       ; Cargar un carácter del pie en bl (parte baja de ebx)
    mov [eax], bl       ; Escribirlo en la memoria de video
    inc edx             ; Avanzar al siguiente carácter del pie
    inc eax             ; Avanzar a la siguiente posición de pantalla
    
    dec ecx
    jnz .loop           ; Continuar hasta ecx=0

    mov eax, 0          ; Todo salió bien, retornar 0
    jmp .end

.error:
    mov eax, 1          ; Error, retornar 1

.end:
    pop ebx             ; Restaurar ebx
    leave               ; Restaurar ebp y esp
    ret