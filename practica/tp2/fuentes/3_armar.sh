nasm -f elf 3_hello.asm
nasm -f elf 2_libasm.asm

ld -m elf_i386 3_hello.o 2_libasm.o -o 3_hello

objdump -f 3_hello

