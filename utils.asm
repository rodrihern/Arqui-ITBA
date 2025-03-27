;===============================================================================
; Imprime todos los argumentos con los que se ejecuta el programa.
;===============================================================================


GLOBAL print
GLOBAL printNewLine
GLOBAL exit
GLOBAL numtostr

section .text

;===============================================================================
; print - imprimer una cadena en la salida estandar
;===============================================================================
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;===============================================================================
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1	; FileDescriptor (STDOUT)
	mov eax, 4	; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	

;===============================================================================
; imprime un \n en pantalla
;===============================================================================
printNewLine:
	pushad

	mov ecx, new_line 	    ; Puntero a la cadena
	mov edx, 1				; Largo de la cadena 
	mov ebx, 1		    	; FileDescriptor (STDOUT)
	mov eax, 4		    	; ID del Syscall WRITE
	int 80h		        	; Ejecucion de la llamada

	popad
	ret

	
;===============================================================================
; exit - termina el programa
;===============================================================================
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;===============================================================================
exit:
	mov eax, 1	; ID del Syscall EXIT
	int 80h	; Ejecucion de la llamada


;===============================================================================
; strlen - calcula la longitud de una cadena terminada con 0
;===============================================================================
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;===============================================================================
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret


;===============================================================================
; numtostr - imprime en pantalla un numero y lo deja el string en memoria
;===============================================================================
; Argumentos:
; 	direccion de memoria para guardar el string (ESP+8)
;	el numero entero de 32 bit convertir (ESP+4)
; Retorno:
;	los caracteres ASCII en el stack se devuelven  
;===============================================================================
numtostr:
	mov ebp,esp ; guardo el puntero del stack
	pushad	
	MOV ECX,10
	MOV EDX,0   ; Pongo en cero la parte mas significativa
	Mov EAX, dword[EBp +4]  ;Cargo el numero a convertir
	MOV EBX,dword[ebp +8]
	ADD EBX,9               ; me posiciono al final del string para empezar a colocar
	mov byte [ebx], 0       ; los caracteres ASCII de derecha a izquierda comenzando con cero
	dec ebx                 ; binario
.sigo:	
	DIV ECX
	OR Dl, 0x30  ; convierto el resto  menor a 10 a ASCII
	mov byte [ebx], Dl  
	DEC EBX      ; si el cociente es mayor a 0 sigo dividiendo
	cmp al,0
	jz .termino
	mov edx,0
	jmp .sigo
.termino:
	inc ebx
	call print
	POPAD
	mov esp,ebp	 
	ret


section .data
	new_line db 10


