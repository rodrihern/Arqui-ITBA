include ../Makefile.inc

MODULE=0000-sampleCodeModule.bin
SOURCES=$(wildcard *.c)
SOURCES_ASM=$(wildcard asm/*.asm)
OBJECTS=$(SOURCES:.c=.o)
OBJECTS_ASM=$(SOURCES_ASM:.asm=.o)

all: $(MODULE)

$(MODULE): $(OBJECTS) $(OBJECTS_ASM)
	$(LD) $(LDFLAGS) -T sampleCodeModule.ld -o ../$(MODULE) $(OBJECTS) $(OBJECTS_ASM)
%.o: %.c
	$(GCC) $(GCCFLAGS) -c $< -o $@
%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm -rf asm/*.o *.o

.PHONY: all clean print