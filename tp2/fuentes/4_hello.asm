section .text

GLOBAL _start
EXTERN print
EXTERN exit
EXTERN numtostr

_start:
	mov ebp, esp	; Preservo los datos del stack, para poder llamar
			; funciones o guardar info sin problemas

	mov ebx, cant_arg	; imprimo la primera parte de la primera linea
				; con la cantidad de argumentos
	call print
	
	mov eax, numstr	; hago push al stack de una variable de 10
				; caracteres para convertir a ASCII la cantidad
				; de arguentos

	push eax	; hago push al stack de la cantidad de argumentos para	
	mov eax, [ebp]	; llamar al funcion de conversion a ASCII

	push eax;
	
        mov dword [bebp] ,ebp	; guardo ebp
	call numtostr		; funcion de conversion de entero a ASCII
				; devuelve en el stack el puntero al string del
				; numero en ASCII
	mov ebp, dword [bebp]

	mov ebx, carr_ret      ; imprimo fin de linea
	call print

        mov eax, 1             ; preparo loop de acuerdo a la cantidad de
        mov edx, ebp		; argumentos recibidos
	add edx ,4
	
.ciclo  mov dword [beax],eax
	mov dword [bebx],ebx
	 
	mov ebx,start_argumento	;imprimo la primera parte de la linea
					; antes del numero de argumento
	call print
	
	mov eax, numstr	; preparo conversion a ASCII del nro de argumento
	push eax
	mov eax, [beax]; Numero de argumento 

	push eax;

        mov dword [bebp] ,ebp
	call numtostr		; funcion de conversion e imprimo el nro de arg.
	mov ebp, dword [bebp]	; imprimo la segunda parte luego del nro de arg.

        mov ebx,end_argumento
	call print
	
        mov ecx,edx             ; imprimo el argumento
	mov ebx, dword [ecx]
	call print

	mov ebx, carr_ret       ; imprimo fin de linea
	call print

	
	inc eax	; incremento el numeo de argumento sumando 4 al puntero
			; al stack 
	cmp eax,[ebp]	; y verifico la cantidad de argumentos
	jg   .salida
	add edx,4
	jmp .ciclo
	
.salida mov ebx, 0
	call exit


; Estos son strings fijos, no necesito que se puedan modificar.
; Esta seccion se llama "Read Only Data"
section .rodata

cant_arg    db "Cantidad de argumentos: ", 0
start_argumento   db "Argumento (",0
end_argumento     db ") =  ",0
carr_ret	db 10, 0


section  .bss

numstr  resb 10
beax    resb 4
bebx    resb 4
bebp    resb 4




