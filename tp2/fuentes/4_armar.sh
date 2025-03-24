nasm -f elf 4_hello.asm
nasm -f elf 4_libasm.asm

ld -m elf_i386 4_hello.o 4_libasm.o -o 4_hello

objdump -f 4_hello

