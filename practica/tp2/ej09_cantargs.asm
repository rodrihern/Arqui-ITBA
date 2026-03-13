section .text

GLOBAL _start
EXTERN num2string

_start:

    mov eax, [esp]
    mov ebx, ans
    mov edx, 0
    call num2string

    mov ecx, ans 	        ; Puntero a la cadena
	mov edx, 10		        ; Largo de la cadena 
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h		        	; Ejecucion de la llamada

    mov ecx, new_line 	    ; Puntero a la cadena
	mov edx, 1		        ; Largo de la cadena 
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h		        	; Ejecucion de la llamada


    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada

section .data
new_line db 10

section .bss
ans resb 10