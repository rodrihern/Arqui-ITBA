//arguments.c
#include <stdio.h>

int main(int argc, char *argv[]) {
    printf("Cantidad de argumentos %d \n", argc);
    for (int i = 0; i < argc; i++) {
        printf("%s", argv[i]);
    }
    return 0;
}