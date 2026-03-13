nasm -f elf 2_hello.asm
nasm -f elf 2_libasm.asm

ld -m elf_i386 2_hello.o 2_libasm.o -o 2_hello

objdump -f 2_hello

