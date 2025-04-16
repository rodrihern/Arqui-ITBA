; hacer una funcion que recibe un string
; y pase a mayuscula la primer letra de cada palabra
; retorna la cantidad de palabras



section .data
    msg db "5ola manola bro     65jaja %locuramix", 10, 0
    len equ $-msg

    

section .text
    GLOBAL capitalize
    GLOBAL _start


_start:
    
    mov ecx, msg 	    ; Puntero a la cadena
	mov edx, len		; Largo de la cadena 
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h

    push msg
    call capitalize
    add esp, 4

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
    ; si sigue prendido el flag voy a to_uppper
    cmp edx, 0
    je .check_space
    inc eax
    call is_lower
    cmp edx, 0
    je .check_space
    call to_upper
    xor edx, edx
    jmp .next


    ; si esta apagado el flag chequeo si es espacio
    ; si es espacio avanzo hasta que no sea un espacio
    ; prendo el flag
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
    mov eax, [ecx]
    add eax, 'A'-'a'
    mov [ecx], eax
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