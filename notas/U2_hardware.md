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

Esto se llama _**Mapa de memoria**_

Cada cable del bus de direcciones es $A_0, A_1, ... , A_n$

Cada cable del bus de datos es $D_0, D_1, ... , D_m$

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

- Todas las direcciones de **Intel** son de 1 Byte.
- En teoría, no tiene por qué ser así, podrían ser de $\frac{D}{8}$

## Instrucciones de Entrada/Salida

- NO lleva corchete la instrucción IN y OUT.
- IN y OUT son las únicas dos instrucciones de IO/M.

## Interrupciones

- El teclado está en 60h.
- El PIC está en la 20h y 21h.
- En la 21h está el IMR, que es la máscara de interrupciones. Para que bootee tiene que estar todo en 1, pues se activa en 0 las interrupciones.
- El teclado está en IRQ1, la máscara tiene IRQ7 en el bit más significativo (BMS) y IRQ0 en el menos significativo.
- Para avisar que terminó (EOI), hay que mandar 20h al 20h.

## Notas técnicas

- $$ Dir_{max} - Dir_{min} = Memo-1 $$
  Donde Memo-1 sería la dirección máxima si empezara en 0x0000.
- Si tengo una memoria de $2^n$ serían n bits en 1.

## Preguntas

- ¿Cómo hace Discord para poder mutearte si estás en focus en otra app?
- ¿No puede ser que mande una $A_i$ tanto al decodificador como a una memoria/periférico?
- ¿Hace falta los puentecitos en los dibujos o con no hacerle puntito gordo alcanza?
