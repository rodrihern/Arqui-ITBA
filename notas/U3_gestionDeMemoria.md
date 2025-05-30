## GDT y LDT

La **GDT** (Global Descriptor Table) es una tabla utilizada por los procesadores x86 para definir las características de los diferentes segmentos de memoria globales del sistema, como su base, tamaño y privilegios de acceso. Es única para todo el sistema.

La **LDT** (Local Descriptor Table) es similar a la GDT, pero se utiliza para definir segmentos de memoria específicos para cada proceso o tarea. Cada proceso puede tener su propia LDT, permitiendo así diferentes espacios de memoria segmentada por proceso.

La GDT la mantenés y la LDT la vas cambiando.

la gdt agrega indireccion y permisos
tambien tiene un bit de presente, para ver si lo bajo a disco o no lo bajo a disco

las instrucciones de in y out junto con cli y sti, solo la pueden usar las aplicaciones qeu tienen el nivel mas alto de privilegios memoria virtual 

## Segmentacion

TODO: completar

## Paginacion

Divide al maña de memoria y a la memoria fisica en paginas de un tamaño fijo

Genera mapeo de paginas virtuales a paginas fisicas

Tiene esquema de permisos

Ventaja: si hay muchos programas que quieren lo mismo puedo cargar eso en memoria una sola vez en una pagina fisica y que cada proceso tiene una pagina virtual que apunta a esa misma pagina fisica

### De que tamaño tiene que ser 

si achico mucho la pagina, se agranda mucho el indice, osea que pagina le diste a cada proceso

para saber el tamaño de la pagina se elige la media de lo que ocupan los programas (intel dijo 4k cuando tenia la arquitectura de 32 bits) 

me quedan 2^20 paginas. ahora de 32 bits:
hay 20 bits que corresponden al numero de pagina, y los ultimos 12 corresponden al offset 
(las primeras 5 letras en hexa son la pagina y las ultimas 3 son el offset)

```
31          11         0
| nro de pag | offset | 
```


lo filetea en 3 para acceder a las tablas

1 tabla de directorio con 2^10 entradas con un puntero a una tabla de paginas

cada una de las 2^10 paginas tiene 2^10 entradas, donde cada una apunta a una pagina

por cada aplicacion tengo un directorio y sus tablas de pagina

el registro cr3 apunta al directorio

TODO: pedirle a azu / mariu la foto del pizarron

### Paging y swapping

...

## Memoria Cache

Esta adentro del procesador, no hay que salir a buscar nada con el Bus de direcciones

reducido (solo 15M mas o menos) pero full rapido

acelera como se ejecutan los ciclos (si hay algo que tiene que hacer muchas veces lo deja aca en la cache para no tener que ir a buscarlo todo el tiempo a la ram)

va en medio de todas las peticiones del procesador a la memoria, todo pasa por la cache




## Preguntas 

* que implica que tenga varios nucleos un procesador
* 