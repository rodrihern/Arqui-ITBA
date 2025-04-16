; hacer una funcion que recibe un string
; y pase a mayuscula la primer letra de cada palabra
; retorna la cantidad de palabras



section .data
    msg db "hola manola como estas", 10, 0
    len equ $-msg

section .bss
    buffer resb 10

section .text
    GLOBAL capitalize
    GLOBAL _start
    EXTERN numtostr
    EXTERN printNewLine


_start:
    
    mov ecx, msg 	    ; Puntero a la cadena
	mov edx, len		; Largo de la cadena 
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h

    push msg
    call capitalize
    add esp, 4

    push buffer
    push eax
    call numtostr
    add esp, 2*4


    mov ecx, msg 	    ; Puntero a la cadena
	mov edx, len		; Largo de la cadena 
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h




    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h	





capitalize:
    push ebp
    mov ebp, esp

    xor eax, eax ; acumulador de cantidad de palabras
    mov ecx, [ebp+8] ; puntero al string
    mov edx, 1  ; flag de si tengo que capitalizar

.loop:
    ; chequeo si esta el flag encendido
    ; me fijo si es lower
    ; si sigue prendido el flag llamo a to_uppper
    cmp edx, 0
    je .check_space
    inc eax
    call is_lower
    cmp edx, 0
    je .check_space
    call to_upper
    xor edx, edx
    jmp .next


.check_space:
    cmp byte[ecx], ' '
    je .space_detected
    jmp .next

.space_detected:
    mov edx, 1
    inc ecx
    cmp byte[ecx], ' '
    jne .next_no_inc
    jmp .space_detected


    ; si no es espacio sigo
.next:
    inc ecx
.next_no_inc:
    cmp byte[ecx], 0
    je .leave
    jmp .loop
    


.leave:
    mov esp, ebp 
    pop ebp
    ret


to_upper:
    push eax
    mov al, [ecx]
    add al, 'A'-'a'
    mov [ecx], al
    pop eax
    ret



is_lower:
    cmp byte[ecx], 'a'
    jl .not_lower
    cmp byte[ecx], 'z'
    jg .not_lower

    mov edx, 1
    ret

.not_lower:
    xor edx, edx
    ret