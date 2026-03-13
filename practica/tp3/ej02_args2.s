.file	"ej02_args2.c"  // Nombre del archivo fuente original
	.intel_syntax noprefix  // Usar sintaxis Intel
	.text  // Inicio de la sección de código
	.section	.rodata  // Sección de datos de solo lectura
.LC0:
	.string	"Cantidad de argumentos %d \n"  // Cadena para imprimir la cantidad de argumentos
.LC1:
	.string	"%s"  // Cadena para imprimir cada argumento
	.text  // Regreso a la sección de código
	.globl	main  // Declarar la función main como global
	.type	main, @function  // Especificar que main es una función
main:
	lea	ecx, 4[esp]  // Cargar la dirección del primer argumento en ecx
	and	esp, -16  // Alinear la pila a 4 bits -16 es 0xFFFFFFF0
	push	DWORD PTR -4[ecx]  // Guardar el número de argumentos en la pila
	push	ebp  // Guardar el puntero base anterior
	mov	ebp, esp  // Establecer el nuevo puntero base
	push	esi  // Guardar el registro esi
	push	ebx  // Guardar el registro ebx
	push	ecx  // Guardar el registro ecx
	sub	esp, 28  // Reservar espacio en la pila
	call	__x86.get_pc_thunk.bx  // Obtener la dirección base de la tabla GOT
	add	ebx, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_  // Ajustar ebx a la tabla GOT
	mov	esi, ecx  // Guardar la dirección de los argumentos en esi
	sub	esp, 8  // Reservar espacio en la pila
	push	DWORD PTR [esi]  // Pasar el número de argumentos a printf
	lea	eax, .LC0@GOTOFF[ebx]  // Cargar la dirección de la cadena .LC0
	push	eax  // Pasar la dirección de la cadena a printf
	call	printf@PLT  // Llamar a printf
	add	esp, 16  // Limpiar la pila
	mov	DWORD PTR -28[ebp], 0  // Inicializar el índice de argumentos a 0
	jmp	.L2  // Saltar al inicio del bucle
.L3:
	mov	eax, DWORD PTR -28[ebp]  // Cargar el índice actual en eax
	lea	edx, 0[0+eax*4]  // Calcular el desplazamiento del argumento
	mov	eax, DWORD PTR 4[esi]  // Cargar la dirección base de los argumentos
	add	eax, edx  // Calcular la dirección del argumento actual
	mov	eax, DWORD PTR [eax]  // Cargar el argumento actual
	sub	esp, 8  // Reservar espacio en la pila
	push	eax  // Pasar el argumento actual a printf
	lea	eax, .LC1@GOTOFF[ebx]  // Cargar la dirección de la cadena .LC1
	push	eax  // Pasar la dirección de la cadena a printf
	call	printf@PLT  // Llamar a printf
	add	esp, 16  // Limpiar la pila
	add	DWORD PTR -28[ebp], 1  // Incrementar el índice de argumentos
.L2:
	mov	eax, DWORD PTR -28[ebp]  // Cargar el índice actual en eax
	cmp	eax, DWORD PTR [esi]  // Comparar el índice con el número de argumentos
	jl	.L3  // Si hay más argumentos, repetir el bucle
	mov	eax, 0  // Establecer el valor de retorno a 0
	lea	esp, -12[ebp]  // Restaurar el puntero de pila
	pop	ecx  // Restaurar el registro ecx
	pop	ebx  // Restaurar el registro ebx
	pop	esi  // Restaurar el registro esi
	pop	ebp  // Restaurar el puntero base
	lea	esp, -4[ecx]  // Restaurar el puntero de pila
	ret  // Retornar de la función
	.size	main, .-main  // Tamaño de la función main
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat  // Sección para obtener la dirección base
	.globl	__x86.get_pc_thunk.bx  // Declarar la función como global
	.hidden	__x86.get_pc_thunk.bx  // Ocultar la función de otros módulos
	.type	__x86.get_pc_thunk.bx, @function  // Especificar que es una función
__x86.get_pc_thunk.bx:
	mov	ebx, DWORD PTR [esp]  // Cargar la dirección base en ebx
	ret  // Retornar de la función
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"  // Identificación del compilador
	.section	.note.GNU-stack,"",@progbits  // Indicar que la pila no es ejecutable
