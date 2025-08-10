# Gestión de Memoria

## GDT y LDT

La **GDT** (Global Descriptor Table) es una tabla utilizada por los procesadores x86 para definir las características de los diferentes segmentos de memoria globales del sistema, como su base, tamaño y privilegios de acceso. Es única para todo el sistema y permite la protección y separación de memoria entre el sistema operativo y los procesos.

La **LDT** (Local Descriptor Table) es similar a la GDT, pero se utiliza para definir segmentos de memoria específicos para cada proceso o tarea. Cada proceso puede tener su propia LDT, permitiendo así diferentes espacios de memoria segmentada por proceso. La GDT se mantiene fija y la LDT se cambia según el proceso activo.

- La GDT agrega indirección y permisos.
- Tiene un bit de presente, para indicar si el segmento está en memoria o debe ser traído desde disco (soporte para swapping).
- Instrucciones privilegiadas (como `in`, `out`, `cli`, `sti`) solo pueden ser usadas en el nivel más alto de privilegio (kernel).

## Segmentación

La **segmentación** es una técnica de gestión de memoria donde la memoria se divide en segmentos de tamaño variable según la lógica del programa (código, datos, stack, etc.). Cada segmento tiene una base y un límite, y el acceso se controla mediante descriptores en la GDT/LDT.

**Ventajas:**
- Permite protección y compartición de memoria.
- Facilita la organización lógica del programa.

**Desventajas:**
- Fragmentación externa: los huecos libres pueden no ser contiguos.
- Mayor complejidad en la gestión.

## Paginación

La **paginación** divide la memoria física y virtual en bloques de tamaño fijo llamados páginas (típicamente 4KB). El sistema operativo mantiene una tabla de páginas para cada proceso, que mapea páginas virtuales a marcos de páginas físicas.

**Ventajas:**
- Elimina la fragmentación externa.
- Permite compartir páginas entre procesos (por ejemplo, código de librerías).
- Facilita la implementación de memoria virtual.

**Tamaño de página:**
- Si la página es muy pequeña, la tabla de páginas es muy grande.
- Si es muy grande, hay desperdicio de memoria (fragmentación interna).
- En x86 de 32 bits, típicamente 4KB (20 bits para número de página, 12 bits para offset).

```
31          11         0
| nro de pag | offset | 
```

- Se usan varias tablas: directorio de páginas (2^10 entradas), cada una apunta a una tabla de páginas (2^10 entradas), cada entrada apunta a una página física.
- El registro `cr3` apunta al directorio de páginas del proceso activo.

## Swapping y Memoria Virtual

La **memoria virtual** permite que los procesos crean que tienen acceso a toda la memoria, aunque físicamente no sea así. El sistema operativo mueve páginas entre la RAM y el disco según sea necesario (swapping), usando el bit de presente en las tablas de páginas.

- Si una página no está presente, se produce un **page fault** y el sistema la trae desde disco.
- Permite ejecutar programas más grandes que la memoria física disponible.

## Memoria Caché

La **memoria caché** está dentro del procesador y almacena datos e instrucciones usados recientemente para acelerar el acceso. Es mucho más rápida que la RAM, pero de menor capacidad (decenas de MB).

- Todas las peticiones del procesador a la memoria pasan primero por la caché.
- Si el dato está en caché (**hit**), se accede rápido; si no (**miss**), se busca en RAM.
- Existen varios niveles: L1 (más rápida y pequeña), L2, L3 (más grandes y lentas).

## Multinúcleo (Multicore)

Tener varios núcleos en un procesador permite ejecutar varios hilos o procesos en paralelo, mejorando el rendimiento en tareas concurrentes y multitarea. Cada núcleo puede tener su propia caché L1 y compartir cachés L2/L3.

**Ventajas:**
- Mayor rendimiento en aplicaciones paralelizables.
- Mejor respuesta en sistemas multitarea.

**Desafíos:**
- Sincronización y coherencia de caché entre núcleos.
- No todas las aplicaciones aprovechan múltiples núcleos.

## Preguntas frecuentes

- ¿Qué implica que tenga varios núcleos un procesador? (ver sección Multinúcleo)
- ¿Cómo se elige el tamaño de página? (balance entre tamaño de tabla y fragmentación interna)
- ¿Qué diferencia hay entre segmentación y paginación? (segmentación: bloques lógicos de tamaño variable; paginación: bloques físicos de tamaño fijo)