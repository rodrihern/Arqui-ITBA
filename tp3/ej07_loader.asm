GLOBAL _start
EXTERN main
section .text

_start:

    mov eax, esp
    mov ebx, eax
    add ebx, 4
    push ebx ; direccion al primer argumento (argv)
    push dword [eax]    ; cantidad de argumentos (argc)
    call main
    add esp, 2*4 ; restauro el esp

	mov ebx, eax		; Valor de Retorno de main
    mov eax, 1		    ; ID del Syscall EXIT
	int 80h		        ; Ejecucion de la llamada

section .data


section .bss