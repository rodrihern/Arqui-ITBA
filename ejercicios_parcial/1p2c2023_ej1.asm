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
FILENAME equ '/sys/bus/iio/in_voltage0_raw'
SYSCALL_NANOSLEEP equ 162
fmt equ ""

section .data
arreglo dd 10,20, 30, 40, 50
cant_arreglo dd ($-arreglo)/4

section .text

main:

.loop:

    mov eax, 1
    mov ebx, 0
    int 80h



