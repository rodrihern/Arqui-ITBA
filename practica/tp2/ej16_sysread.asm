section .text

GLOBAL _start
EXTERN numtostr

_start:
    mov eax, 3      ; numero de syscall para read
    mov ebx, 0      ; descriptor del archivo (stdin)
    mov ecx, buffer 
    mov edx, maxlen
    int 80h
    
    mov ecx, 0      ; i del iterador

.loop:
    mov bh, [buffer + ecx]
    cmp bh, 'a'     ; si es menor que la a salteo
    jl .next
    cmp bh, 'z'     ; si es mayor a z la salteo
    jg .next
    
    
    add bh, 'A'-'a'     ; ahora si vamos a pasarla a mayuscula
    mov [buffer + ecx], bh

.next:
    inc ecx
    cmp ecx, maxlen
    jl .loop

.done:
	mov eax, 4		    ; ID del Syscall WRITE
	mov ebx, 1		    ; FileDescriptor (STDOUT)
    mov ecx, buffer 	; Puntero a la cadena
	mov edx, maxlen	    ; Largo de la cadena 
	int 80h		        ; Ejecucion de la llamada

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada



section .data
    maxlen equ 128

section .bss
    buffer resb maxlen
    aux resb 10