---
title: Sistemas Operativos – Manejador de procesos – Los Procesos
description: Sistemas Operativos – Manejador de procesos – Los Procesos
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Sistemas Operativos – Manejador de procesos – Los Procesos

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io

En el post de [Manejador de Procesos –
Fundamentos](http://juank.io/sistemas-operativos-manejador-procesos-fundamentos/)
identificamos la manera en que trabaja una CPU y diferenciamos los
sistemas monotarea y los sistemas multitarea donde pudimos ver como hace
el sistema para ejecutar varios procesos a la vez. Así mismo revisamos
el tema de lo que es el estado de ejecución de un proceso en un entorno
multitarea.

###El Proceso


Un proceso esta básicamente compuesto por un conjunto de instrucciones,
pero hasta allí nada lo diferencia de lo que es un programa guardado en
disco, el proceso se define por estar en ejecución – o al menos
esperando para ejecución- sino esta en ejecución no hay proceso.

Un proceso en ejecución entonces tiene, además de sus instrucciones,
características propias que lo describen y que definen su estado
mientras este se ejecuta, estas características son:

- El estado del proceso: el valor de cada uno de los registros del
procesador y las las banderas establecidas

- El conjunto de instrucciones

- La pila (es decir el Stack)

- Memoria de trabajo &gt; Espacio de memoria reservado en el heap (es
decir el montón de memoria) y sus contenidos

Las describiremos con mayor detalle.

###El Estado Del Proceso


En cada ciclo de reloj existe un estado diferente de cada proceso.\
Un ciclo de reloj está comprendido desde que se envía una instrucción
**-del conjunto de instrucciones del procesador-** hasta que se obtiene
una respuesta.

Una forma fácil de ver que es el estado de un proceso es imaginar un
proceso en ejecución como una película, compuesta por muchos cuadros
independientes, si tomamos uno de los cuadros tenemos una fotografía de
un único instante en el tiempo de ejecución, esa fotografía es el estado
del proceso.

En ese estado podemos identificar que datos tenia el procesador en cada
uno de sus registros en ese momento, así como las banderas que se
encontraban activadas.

Esto permite, por ejemplo y como lo vimos en el post anterior, suspender
un proceso de repente y volverlo a activar posteriormente justo donde se
encontraba.

Simplemente tomando su estado y en otro momento restableciéndolo el
proceso podrá seguir con la ejecución justo donde estaba.

###El Conjunto de Instrucciones


El proceso en memoria tiene un conjunto de instrucciones asociado, esto
es lo que podriamos llamar el programa en ejecución que a primera vista
podria entenderse como una secuencia de instrucciones aunque realmente
pueden ser varias secuencias incluso pasando información entre ellas.

###La Pila – El Stack


A bajo nivel la mayoría del trabajo no se hace accediendo directamente a
los objetos sino a los registros y a una útil herramienta llamada
**stack**, como su nombre lo indica el stack es una pila (una lista
apilada) donde los elementos se colocan uno sobre otro y solo es
accesible de manera inmediata el elemento que esta en la cima de la
pila.

Allí es donde los objetos se almacenan de manera temporal previa a su
utilización.

La porción de memoria donde se localiza el stack (**stack segment**)
esta alineada con la porción de memoria donde están las instrucciones de
un programa (**code segment**)

Su funcionamiento es muy sencillo y consta de dos instrucciones
principales: **POP** y **PUSH**.

POP quita un elemento de la cima de la pila y lo coloca en uno de los
registros:

![] (./img/Manejador-de-procesos-Procesos/image2.png)

PUSH coloca un elemento de uno de los registros en la cima de la pila:

![] (./img/Manejador-de-procesos-Procesos/image3png)

Un stack solo pertenece a un único proceso, el stack se crea en el
momento que el programa se carga en memoria, es decir el programa
guardado en disco no tiene stack, pero cuando el programa se vuelve un
proceso el OS le crea un stack.

A quien desee una explicación más detallada al respecto nuevamente le
recomiendo que estudie el [Tutorial de
Assembler](http://www.emu8086.com/assembly_language_tutorial_assembler_reference/asm_tutorial_01.html).

###Memoria de Trabajo


De manera habitual los tipos valor (como enteros, caracteres sencillos,
flotantes etc. y algunas estructuras más complejas) son guardados en el
stack, mientras que los tipos referencia son guardados en la memoria de
trabajo.

Cuando en programación se usa un objeto por referencia realmente sucede
que en el stack se guarda una dirección que apunta a la memoria de
trabajo (puntero), exactamente a donde se encuentra el objeto
referenciado.

![] (./img/Manejador-de-procesos-Procesos/image4.png)

De esta forma un objeto puede tener referenciadas varias porciones de
memoria como parte de su memoria de trabajo, y es el sistema operativo
quien lleva un inventario de que páginas de memoria han sido asignadas a
un proceso determinado, y a la vez lleva un inventario de que porciones
de esa página se están usando desde los objetos del proceso.

Con la información que hemos revisado hasta el momento ya podemos
meternos en temas u poco más complejos, pero no se preocupen que
mantendré el estilo que he usado hasta ahora, veremos solo la
información necesaria para entender de qué se trata el asunto y
dejaremos los tecnicismos para los libros o para otras web dedicadas al
tema.

###Otros artículos de esta serie


- [Sistemas Operativos - Manejador de procesos -
Fundamentos](http://juank.io/sistemas-operativos-manejador-procesos-fundamentos/)

- [Sistemas Operativos - Manejador de procesos - Los
Procesos](http://juank.io/sistemas-operativos-manejador-procesos-proceso/)

- [Sistemas Operativos - Manejador de procesos - Los
Threads](http://juank.io/sistemas-operativos-manejador-procesos-threads/)




