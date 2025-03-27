section .text
    GLOBAL _start
    EXTERN toString

_start:
    mov eax, [n]
    mov ecx, [k]

    call printMultiples

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada

; recibe un numero n en EAX, k en ECX e imprime todos los multiplos de n menores o iguales que k
printMultiples:

    mov rbx, ans
    mov edx, eax ; guardo el valor de n

    .loop:
        cmp eax, ecx
        jg .done        
        push rdx
        mov edx, 0
        call toString
        
        push rax
        push rbx
        push rcx
        

        mov ecx, ans 	    ; Puntero a la cadena
        mov edx, 10	        ; Largo de la cadena 
        mov ebx, 1		    ; FileDescriptor (STDOUT)
        mov eax, 4		    ; ID del Syscall WRITE
        int 80h		        ; Ejecucion de la llamada

        mov ecx, new_line 	; Puntero a la cadena
        mov edx, 2	        ; Largo de la cadena 
        mov ebx, 1		    ; FileDescriptor (STDOUT)
        mov eax, 4		    ; ID del Syscall WRITE
        int 80h		        ; Ejecucion de la llamada

        pop rcx
        pop rbx
        pop rax
        pop rdx

        add eax, edx
        jmp .loop

    .done:
        ret


section .data
n dd 3
k dd 28
new_line db 10

section .bss

ans resb 10
