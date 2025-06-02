# Arquitecturas

## Procesadores ARM

La empresa ARM hace el diseño, pero no los fabrica

gana plata por la propiedad intelectual

tiene muy buena relacion (instrucciones por segundo / watt)

crean software que simula el procesador, usan lenguajes para simular hardware como VERILOG

onda apple le compra el diseño a arm y se lo manda a fabricar a los chinos

los procesadores de los celulares son arm

a diferencia de intel vos le pedis un procesador exclusivo para lo que vos queres
(los hace a medida)

intel los hace para computadoras nomas

tambien mechan la tecnologia SoC (system on a chip)

te viene procesador, memorias, osciladores, conversonres, interfaces, todo en el mismo chip

no hay que armar en frankenstein de comprar mother, ram y toda la bola

desventaja, al estar todo junto no se puede actualizar la ram, cambiar la placa de video, etc. Tengo que cambiar el chip

El procesador puede ponerse en modo ahorro de energia

Las versionees de arm no son retrocompatibles, la teca es esa, rompen compatibilidad hacia atras
obsolecencia programada bro

Casi todas las instrucciones tardan lo mismo (1 ciclo de procesador)

Se usa para programacion temporal, para poder saber cuanto va a tardar los programas

Hace que las instrucciones mas rapidas tarden un poco mas

No tiene mapa de entrada y salida, tiene un mapa de 4G

### ARM Cortex A9

Tiene arquitectura harvard para las memorias cache (una de instrucciones y una de datos)

## Pipeline

Todos los procesadores tienen pipeline

Pipeline de 3 niveles:

fetch -> decode -> execute

Se pueden paralelizar y hacer 

fetch -> decode -> execute
        fetch -> decode -> execute
                fetch -> decode -> execute

### Fetch

Busco la instruccion a la ram

### Decode

La decodifico a ver que corno me traje, a ver si es una instruccion

### Execute

ejecuto la instruccion


### Problema

A veces no es tan perfectito porque por ahi para ejecutar una instruccion tengo que ir a memoria entonces no puedo en ese momento hacer un fetch porque tengo el bus de address usado 

Tiene un enemigo que es el jump, porque al final me traje una instruccion que despues la salte.

Un jump provoca que se vacie el pipeline

### Instrucciones condicionales

Hicieron instrucciones como Addeq o Subne (compiar codigo)

en los primeros 4 bits traen la condicion, si la condicion no se cumple no sigue decodificando 

### Extensiones de ARM