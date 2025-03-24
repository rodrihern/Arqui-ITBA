section .text

GLOBAL _start

_start:
	mov ecx, cadena 	; Puntero a la cadena
	mov edx, longitud	; Largo de la cadena 
	call print

	mov ecx, cadena_2
	mov edx, cadena_2_len
	call print

	mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		; Ejecucion de la llamada


;===============================================================================
;Funcion print
;Recibe en ECX, la cadena a imprimir y en EDX el largo de la misma.
;===============================================================================
print:
	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h		; Ejecucion de la llamada
	ret			; retorno de la funcion


section .data

cadena db "Hola Mundo!!", 10	; "Hola Mundo!!\n"
longitud equ $-cadena
cadena_2 db "Arquitectura de Computadoras", 10
cadena_2_len equ $-cadena_2


section .bss

placeholder resb 128




