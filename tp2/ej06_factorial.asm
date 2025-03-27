section .text

GLOBAL _start
EXTERN toString

_start:
    mov rbx, [n]
    call factorial

    mov ecx, new_line 	    ; Puntero a la cadena
    mov edx, 1	; Largo de la cadena 
    mov ebx, 1		    ; FileDescriptor (STDOUT)
    mov eax, 4		    ; ID del Syscall WRITE
    int 80h		        ; Ejecucion de la llamada

    mov eax, 1		; ID del Syscall EXIT
	mov ebx, 0		; Valor de Retorno
	int 80h		    ; Ejecucion de la llamada




; recibe un numero en rbx e imprime su factorial
factorial:
    push rax
    push rbx
    push rcx
    push rdx
        
    ; eax es el acumulador
    mov edx, 0
    mov rax, 1
    mov rcx, 2


    ; quiero hacer un for incrementando el valor de rdx hasta rax e ir multiplicando en rcx
    .loop:
        cmp rcx, rbx
        jg .done
        mul ecx
        inc ecx
        jmp .loop
        

    .done:
        mov rbx, ans
        call toString

        mov ecx, ans 	    ; Puntero a la cadena
        mov edx, 10	        ; Largo de la cadena 
        mov ebx, 1		    ; FileDescriptor (STDOUT)
        mov eax, 4		    ; ID del Syscall WRITE
        int 80h		        ; Ejecucion de la llamada

        pop rdx
        pop rcx
        pop rbx
        pop rax
    
    ret

section .data
    n dq 6
    new_line db 10

section .bss
    ans resb 10


