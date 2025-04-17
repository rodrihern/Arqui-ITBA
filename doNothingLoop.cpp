#include <iostream>

// 1. ¿Qué hace esta función?
// 2. ¿Qué problema de rendimiento podría tener?
void doNothingLoop() {
    long long i = 0;
    while (i < 1000000000) {
        i++;
    }
}
// 1. Respuesta: La función ejecuta un bucle mil millones de veces, incrementando la variable 'i' en cada iteración. No realiza ninguna operación útil más allá de contar.
// 2. Respuesta: El problema de rendimiento es que consume una cantidad significativa de tiempo de CPU ejecutando un bucle muy largo sin hacer nada productivo. Si se ejecuta en un hilo principal o crítico, puede bloquear la aplicación, haciéndola no responsiva durante la ejecución del bucle. Es una operación computacionalmente intensiva y bloqueante.

int main() {
    std::cout << "Iniciando bucle..." << std::endl;
    doNothingLoop();
    std::cout << "Bucle terminado." << std::endl;
    return 0;
}
