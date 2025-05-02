/*
1. cual es la altura maxima que alcanza el stack (cantidad de stack frames de doNothingLoop)
cuando se invoca con i = 3 ? 
(no es necesario que resuelvan el seguimiento, simplemente analicen el funcionamiento
de la funcion y deduzcan sin realizarlo)

2. muestre que ocurre con el stack con i = 2
*/ 


int doNothingLoop(int i) {
    int j;
    for (j = 0; j < i; j++) {
        doNothingLoop(j);
    }
    return j;
}

/*
Respuesta 1:
La altura máxima del stack (cantidad de stack frames de doNothingLoop) cuando se invoca con i = 3 es 4.
La secuencia de llamadas que lleva a la máxima profundidad es:
doNothingLoop(3) -> doNothingLoop(2) -> doNothingLoop(1) -> doNothingLoop(0)

Explicación:
- doNothingLoop(3) llama a doNothingLoop(0), doNothingLoop(1), doNothingLoop(2).
- La llamada a doNothingLoop(2) llama a doNothingLoop(0), doNothingLoop(1).
- La llamada a doNothingLoop(1) dentro de doNothingLoop(2) llama a doNothingLoop(0).
- En este punto, la pila de llamadas de doNothingLoop es:
  doNothingLoop(3)
  doNothingLoop(2)
  doNothingLoop(1)
  doNothingLoop(0)
  Esto representa 4 stack frames activos de doNothingLoop.

Respuesta 2:
Seguimiento del stack con i = 2:
(Asumiendo que la llamada inicial proviene de una función como main)

1. main llama a doNothingLoop(2)
   Stack: [main, doNothingLoop(2)]  (Profundidad de doNothingLoop: 1)
2. doNothingLoop(2) entra al bucle (j=0) y llama a doNothingLoop(0)
   Stack: [main, doNothingLoop(2), doNothingLoop(0)] (Profundidad de doNothingLoop: 2)
3. doNothingLoop(0) (su bucle no se ejecuta) retorna 0.
   Stack: [main, doNothingLoop(2)]
4. doNothingLoop(2) continúa el bucle (j=1) y llama a doNothingLoop(1)
   Stack: [main, doNothingLoop(2), doNothingLoop(1)] (Profundidad de doNothingLoop: 2)
5. doNothingLoop(1) entra al bucle (j=0) y llama a doNothingLoop(0)
   Stack: [main, doNothingLoop(2), doNothingLoop(1), doNothingLoop(0)] (Profundidad de doNothingLoop: 3)
6. doNothingLoop(0) (su bucle no se ejecuta) retorna 0.
   Stack: [main, doNothingLoop(2), doNothingLoop(1)]
7. doNothingLoop(1) termina su bucle y retorna 1.
   Stack: [main, doNothingLoop(2)]
8. doNothingLoop(2) termina su bucle y retorna 2.
   Stack: [main]

La altura máxima del stack (cantidad de frames de doNothingLoop) alcanzada con i = 2 es 3.
*/