#include <stdlib.h>
#include <math.h>

int operar(char *n1, char *n2, char *operador) {
    int i1 = atoi(n1);
    int i2 = atoi(n2);

    switch (operador[0]) {
        case '+': return (i1+i2);
        case '*': return (i1*i2);
        case '/': return (i1/i2);
        case '^': return pow(i1, i2);
        default: return -1; // no deberia pasar
    }
}