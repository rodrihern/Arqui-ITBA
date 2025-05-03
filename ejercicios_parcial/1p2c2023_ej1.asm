; programa que lee la humedad ambiente cada 1 segundo
; usa una syscall para generar tiempo de espera
; ajustar el valor leido h_correcto = h_leido / 7
; avisar si el valor LEIDO coincide con algun elemento del arreglo
; para leer la humedad se tiene funa funcion implementada en c
; int get_humedad(int resoolucion, char * filename)
; siempre usar valor de resolucion 16
; filename: /sys/bus/iio/in_voltage0_raw
; se usa una syscall de id 162 sys_nanosleep
GLOBAL main
EXTERN printf
EXTERN get_humedad

RES equ 16
SYSCALL_NANOSLEEP equ 162

section .data
time_spec dd 1, 0
msg_belongs db "coincide", 10, 0
msg_not_belongs db "no coincide", 10, 0
filename db "/sys/bus/iio/in_voltage0_raw"
arreglo dd 10, 20, 30, 40, 50
cant_arreglo dd ($-arreglo)/4

section .text

main:
.read:
    push filename
    push 16
    call get_humedad
    add esp, 2*4
    mov ecx, 7  ; cargamos el numero para dividir
    xor edx, edx ; limpiamos edx
    div ecx     ; dejamos en eax, eax/7
    mov ebx, eax ;guardo en ebx para llamar a belongs
    call belongs
    cmp eax, 1
    je .print_belongs
    push msg_not_belongs
    jmp .print
.print_belongs:
    push msg_belongs
.print:
    call printf
    add esp, 4
    call sleep
    jmp .read 
    


sleep:
    pushad
    mov eax, SYSCALL_NANOSLEEP
    mov ebx, time_spec
    int 80h
    popad
    ret

; se fija si el elemento en ebx esta en el arreglo
belongs:
    push ebp
    mov ebp, esp
    xor ecx, ecx ;i
.loop:
    cmp ebx, [arreglo + ecx*4]
    je .true
    inc ecx
    cmp ecx, [cant_arreglo]
    jl .loop

    mov eax, 0
    leave
    ret
.true:
    mov eax, 1
    leave
    ret


; solo para probar
get_humedad:
    mov eax, 140
    ret