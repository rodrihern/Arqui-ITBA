;===============================================================================
; HelloWorld en assembler.
;===============================================================================
; El siguiente código hace uso del syscall WRITE y del syscall EXIT.
; Para ver otras syscalls, se puede entrar a la página:
; http://web.archive.org/web/20160213015253/http://docs.cs.up.ac.za/programming/
; asm/derick_tut/syscalls.html
;===============================================================================


section .text

GLOBAL _start

_start:
	mov ecx, cadena 	; Puntero a la cadena
	mov edx, longitud	; Largo de la cadena 
	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h		; Ejecucion de la llamada

	mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		; Ejecucion de la llamada


section .data

cadena db "Hola Mundo!!", 10	; "Hola Mundo!!\n"
longitud equ $-cadena


section .bss

placeholder resb 10


