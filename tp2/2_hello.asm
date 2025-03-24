;===============================================================================
; Cuando se arman bibliotecas de funciones, y los archivos objeto tienen
; simbolos definidos en otros binarios es necesario indicar que son simbolos
; externos. Y donde se declaran, que son visibles, o globales.
;===============================================================================


section .text

; La etiqueta _start: es el punto de entrada al programa, por lo tanto tiene que
; ser global
GLOBAL _start

; Estoy declarando que print y exit están definidas en otro archivo.
EXTERN print
EXTERN exit

_start:	
	mov ebx, cadena	; Puntero a la cadena 
	call print
	
	mov ebx, 0
	call exit


section .data
; Recordar en C, que los Strings son NULL TERMINATED (el byte 0), esto me
; permite armar una convencion para no tener que estar calculando el tamano cada
; vez mediante equ's. Recordar nuevamente: es mi responsabilidad entender los
; datos como corresponde. Assembler no conoce de tipo de datos.

cadena db "Sacandole Jugo a Assembler", 10, 0


section .bss

placeholder resb 128

