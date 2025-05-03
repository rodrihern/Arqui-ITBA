#include <stdio.h>

void print_matrix(char pantalla[6][80]) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 80; j++) {
            printf("%c ", pantalla[i][j]);
        }
        puts("\n");
    }
}