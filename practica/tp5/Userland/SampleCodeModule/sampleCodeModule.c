/* sampleCodeModule.c */
#include <stdio.h>
#include <string.h>

char * v = (char*)0xB8000 + 79 * 2;

extern void userProgram();

static int var1 = 0;
static int var2 = 0;

int main() {
   
    
    *v = 'X';
    *(v+1) = 0x74;

	userProgram();

    if (var1 == 0 && var2 == 0)
        return 0xDEADC0DE;

    return 0xDEADBEEF;
}