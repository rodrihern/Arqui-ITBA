# Hardware

## Buses


Puede acceder a las direcciones que le permita el bus de direcciones. Por ejemplo:
* Si tiene un bus de 16 bits -> puede ver $2^{16}=64k \text{ direcciones}$



### Definiciones:
* **A**: Cantidad de cables del bus de direcciones.
* **D**: Cantidad de cables del bus de datos.

La cantidad de memoria accesible es:

```math
2^A \times \frac{D}{8} \, \text{Bytes} \quad (\text{en teoría})
```

Cada cable del bus de direcciones es $A_0, A_1, ... , A_n$

Cada cable del bus de direcciones es $D_0, D_1, ... , D_m$

## Direcciones de memoria

- Todas las direcciones de **Intel** son de 1 Byte.
- En teoría, no tiene por qué ser así, podrían ser de $\frac{D}{8}$

## Memoria

- **RAM** y **ROM** pierden información con el tiempo.
- **Transferencia**: Tiempo que tarda en mandar/recibir un dato el microprocesador.
- **Latencia**: Tiempo que tarda en leer/escribir la memoria.

### Comparación entre RAM y ROM

| Característica       | RAM                              | ROM                              |
|----------------------|----------------------------------|----------------------------------|
| **Definición**       | Memoria de acceso aleatorio.    | Memoria de solo lectura.        |
| **Volatilidad**      | Volátil (pierde datos al apagar)| No volátil (retiene datos).     |
| **Escritura**        | Lectura y escritura.            | Solo lectura (en general).      |
| **Velocidad**        | Más rápida.                     | Más lenta.                      |
| **Uso típico**       | Almacenamiento temporal.        | Almacenamiento permanente.      |


NO lleva corchete la instruccion IN y OUT

IN y OUT son las unicas dos instrucciones de IO/M

## Interrupciones

La rompen toda

el teclado esta en 60h

el pic esta en la 20h y 21h

en la 21h esta el imr que es la mascara de interrupciones, para que bootee tiene que estar todo en 1 pues se activa en 0 las interrupciones.

El teclado esta en IRQ1, la mascara tiene IRQ7 en el BMS y IRQ0 en el menos significativo

para avisar que termine (EOI) hay que mandar 20h al 20h

## Preguntas 

como hace discord para poder mutearte si estas en focus en otra app