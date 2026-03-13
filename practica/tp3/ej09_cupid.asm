GLOBAL _start
EXTERN printNewLine

section .text

_start:
    ; Execute CPUID with EAX = 0 to get vendor string
    xor eax, eax        ; Clear EAX (set to 0)
    cpuid               ; Call CPUID instruction
    
    ; After CPUID, EBX, EDX, ECX contain the vendor string
    ; Store the registers in our buffer to form the complete string
    mov [vendor_id], ebx     ; First 4 bytes
    mov [vendor_id+4], edx   ; Next 4 bytes
    mov [vendor_id+8], ecx   ; Last 4 bytes
    mov byte [vendor_id+12], 0  ; Null terminator
    
    ; Print "CPU Manufacturer: " text
    mov eax, 4          ; syscall number for write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, prefix     ; pointer to message
    mov edx, prefix_len ; message length
    int 80h
    
    ; Print the vendor string
    mov eax, 4          ; syscall number for write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, vendor_id  ; pointer to vendor string
    mov edx, 12         ; length of vendor string
    int 80h
    
    call printNewLine
    
    ; Exit
    mov eax, 1          ; syscall number for exit
    xor ebx, ebx        ; exit code 0
    int 80h

section .data
    prefix db "CPU Manufacturer: "
    prefix_len equ $ - prefix
    newline db 10       ; Newline character (ASCII 10)

section .bss
    vendor_id resb 16   ; Buffer to store the vendor ID string (12 bytes + null)