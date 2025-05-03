; hay que implementar una calculadora por linea de comando
; validacion simple del operador (que el primer caracter sea el operador)
; si no esta bien el operador avisa con un mensaje

GLOBAL main
EXTERN printf
EXTERN operar

section .data
error_msg db "Error: operador <%c> no reconocido", 10, 0
res_msg db "Resultado = %d", 10, 0
argc_msg db "La cantidad de argumentos fue %d y debe ser 4", 10, 0

section .text

main:
    push ebp
    mov ebp, esp
    ; validamos que argc = 4
    mov ecx, [ebp+8]
    cmp ecx, 4
    je .valid_argc
    push ecx
    push argc_msg
    call printf
    add esp, 2*4
    mov eax, 1
    jmp .done
.valid_argc:
    ; validamos que sea un operador
    mov ecx, [ebp+12] ; argv
    mov eax, [ecx+2*4] ; argv[2]
    mov al, [eax] ; operador
    cmp al, '+'
    je .valid_operator
    cmp al, '/'
    je .valid_operator
    cmp al, '*'
    je .valid_operator
    cmp al, '^'
    je .valid_operator
    ; si estoy aca es porque no es valido el operador
    movzx eax, al ; zero-extend al into eax
    push eax
    push error_msg
    call printf
    add esp, 2*4
    mov eax, 1 ; que main retorne 1
    jmp .done

.valid_operator:
    push dword[ecx+2*4] ; argv[2]: operador
    push dword[ecx+3*4] ; argv[3]: n2
    push dword[ecx+4]   ; argv[1]: n1
    call operar 
    add esp, 3*4
    
    push eax ; resultado 
    push res_msg
    call printf
    add esp, 2*4
    xor eax, eax ; que main retorne 0
    
.done:
    leave 
    ret