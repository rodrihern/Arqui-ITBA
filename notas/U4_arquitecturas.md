# Arquitecturas

## Modelos de Arquitectura

### Von Neumann
- Un solo bus para instrucciones y datos.
- Simplicidad, pero puede haber cuellos de botella ("Von Neumann bottleneck").

### Harvard
- Buses separados para instrucciones y datos.
- Permite acceso simultáneo, mejora el rendimiento.
- Usado en microcontroladores y procesadores modernos (ej: ARM Cortex A9).

## Procesadores ARM

- ARM diseña procesadores, no los fabrica. Vende propiedad intelectual (IP).
- Muy buena relación instrucciones por segundo / watt (eficiencia energética).
- Usados en celulares, tablets, IoT, embebidos.
- SoC (System on a Chip): integra CPU, memorias, interfaces, etc. en un solo chip.
- Desventaja: no se puede actualizar componentes individuales (ej: RAM, GPU).
- No son retrocompatibles entre versiones (obsolescencia programada).
- Casi todas las instrucciones tardan lo mismo (RISC, 1 ciclo por instrucción), útil para sistemas de tiempo real.
- No tiene mapa de entrada/salida tradicional, usa direccionamiento de memoria (MMIO).

### ARM Cortex A9
- Arquitectura Harvard para caché (separada para instrucciones y datos).

## Procesadores x86
- Arquitectura CISC (instrucciones complejas, diferentes duraciones).
- Usados en PCs, servidores.
- Retrocompatibilidad histórica.
- Soporta segmentación, paginación, modos de protección.

## Pipeline

El **pipeline** permite ejecutar varias instrucciones en paralelo, dividiendo la ejecución en etapas. Ver también cómo el SO lo tiene en cuenta en [[t1_introduccion#Procesador|SO - Procesador]].

- **Fetch**: Buscar la instrucción en memoria.
- **Decode**: Decodificar la instrucción.
- **Execute**: Ejecutar la instrucción.

Ejemplo de pipeline de 3 etapas:
```
fetch -> decode -> execute
        fetch -> decode -> execute
                fetch -> decode -> execute
```

**Ventajas:**
- Aumenta el rendimiento (más instrucciones por ciclo).

**Problemas:**
- Si una instrucción necesita acceder a memoria, puede bloquear el fetch.
- Los saltos (jumps) pueden vaciar el pipeline (pipeline flush), perdiendo eficiencia.

## Instrucciones condicionales (ARM)
- Instrucciones como `ADDEQ`, `SUBNE` permiten ejecutar solo si se cumple una condición (los primeros 4 bits indican la condición).
- Si la condición no se cumple, la instrucción se descarta rápidamente (eficiencia).

## Multinúcleo (Multicore)
- Varios núcleos en un solo chip permiten ejecutar múltiples hilos/procesos en paralelo.
- Cada núcleo puede tener su propia caché L1 y compartir L2/L3.
- Mejora el rendimiento en aplicaciones paralelizables y sistemas multitarea.
- Ver implicancias para IPC en [[t3_ipc#Modelos de IPC|SO - IPC]] y para threads en [[t4_threads|SO - Threads]].

## Comparación ARM vs x86
| Característica         | ARM (RISC)         | x86 (CISC)         |
|-----------------------|--------------------|--------------------|
| Instrucciones         | Simples, fijas     | Complejas, variables|
| Consumo energético    | Bajo               | Alto               |
| Usos                  | Móviles, embebidos | PCs, servidores    |
| Retrocompatibilidad   | Baja               | Muy alta           |
| Pipeline              | Profundo, regular  | Variable           |

## Resumen
- **Von Neumann**: un bus para todo, simple pero lento.
- **Harvard**: buses separados, más rápido.
- **ARM**: eficiente, modular, SoC, RISC, usado en móviles.
- **x86**: potente, retrocompatible, CISC, usado en PCs.
- **Pipeline**: paralelismo interno, pero sensible a saltos y accesos a memoria.
- **Multicore**: varios núcleos, más rendimiento si el software lo aprovecha.