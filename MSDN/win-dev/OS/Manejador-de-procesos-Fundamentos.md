---
title: Web API II – Creando un CRUD, trabajando con verbos HTTP
description: Implementar fácilmente un CRUD
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: win-dev
ms.custom: CommunityDocs
---







#Sistemas Operativos - Manejador de procesos - Fundamentos

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io
  
Esta es una serie de artículos introductorios acerca de lo que es el
manejador de procesos de un sistema operativo, la idea es tener un
concepto muy general de lo que hace esta parte de todo sistema
operativo, sin embargo es un tema muy extenso y que puede llegar a ser
bastante complejo, por lo cual cabe aclarar que por el momento solo
trataremos los conceptos de manera muy superficial.

El manejador de procesos (también llamado planificador, scheduler,
calendarizador etc.) es la parte fundamental de todo sistema operativo,
de hecho se puede decir que para crear un sistema operativo básico basta
con crear cuatro componentes fundamentales:

- Planificador de procesos

- Administrador de memoria

- Manejador de E/S (como mínimo con controladores para video, teclado y
disco)

- Sistema de archivos

El manejador de procesos es el encargado, de permitir le ejecución de
los diferentes procesos en una o varias CPU. A simple vista esta tarea
es sencilla, pero esta lejos de serlo.

El procesador es un dispositivo que ejecuta un conjunto de instrucciones
y devuelve un resultado, así que desde el punto de vista del procesador
el concepto de proceso no existe más allá de ejecutar una instrucción en
cada ciclo de procesamiento; es el sistema operativo quien determina que
es un proceso en si: **un conjunto de instrucciones agrupadas con un(os)
objetivo(s) especifico(s)**.

Cuando estamos utilizando un sistema operativo como *Windows* siempre
tenemos la percepción de que hay múltiples programas ejecutándose al
mismo tiempo, podemos ver varias ventanas abiertas mientras escuchamos
música, navegamos por internet y diligenciamos una hoja de cálculo de
excel, pero esto no es más que una *ilusión*.

Para simplificar un poco el trabajo examinaremos la situación cuando
solo hay presente un procesador de un único núcleo.

###Funcionamiento básico de una CPU


La CPU, solo puede ejecutar una instrucción a la vez, pero ¿cómo es
esto?

Digamos que queremos sumar los valores 2+3 utilizando la CPU, la CPU
tiene una especie de ‘ranuras’ llamadas **registros** algunas de estas
ranuras reciben los nombres de **Ax**, **Bx**, **Cx** (hay varias más) y
son utilizados por la CPU como fuente de entrada y salida de
información.

Lo que se hace entonces para la suma es colocar los valores a sumar en
los registros, esto es un mini ejemplo en lenguaje ensamblador:



- mov AX, 2 ;poner el número 2 en el registro AX

    add AX, 3 ;sumar al contenido de AX el valor 3, la respuesta queda
    en AX

*Los comentarios en asm se inician con* ;

Veamos estos dos pasos en el siguiente gráfico (lo he expandido a 4
pasos para mayor claridad)

![] (./img/Manejador-de-procesos-Fundamentos/image2.png)

Cualquier instrucción ejecutada por la CPU funciona de manera similar,
utilizando los registros como ranuras de intercambio de datos.

###¿Qué pasa cuando es más de una instrucción?


El procesador posee otro registro que es un apuntador que le permite
saber en que instrucción del programa se encuentra de tal manera que
cada vez que ejecuta una instrucción el mueve al apuntador a la
siguiente instrucción a ser ejecutada.

###¿Cómo se ejecutan varios procesos?


De acuerdo al tema tratado anteriormente pudimos ver que una CPU solo
puede ejecutar una instrucción a la vez, y como es de suponerse dicha
instrucción pertenece a un proceso determinado.

Hay varias maneras de llevar a cabo la ejecución de procesos.

###Sistemas Operativos Monotarea


La **CPU** por si sola no puede iniciar la ejecución de otro proceso, es
el sistema operativo es quien le dice a la CPU cuando comenzar a
ejecutar un conjunto de instrucciones determinado, sin embargo la CPU
ejecutaría todas las instrucciones de un proceso hasta finalizar y solo
en ese momento continuaría la ejecución del sistema operativo (otro
proceso).

Luego el *OS* (sistema operativo) seleccionaría el siguiente proceso a
ejecutar suspendiéndose a si mismo hasta que el proceso finalice,
despues nuevamente volvería a seleccionar un nuevo proceso y así
sucesivamente hasta que no hubiesen procesos por ejecutar.

###¿Cómo es que se vuelve a ejecutar el sistema operativo cuando acaba de terminar un proceso?


El truco es sencillo, devolvámonos a algunos sistemas mono tarea tipo
*DOS* en sus primeras versiones, si hacíamos un programa en C este al
final del *main* siempre tenia la instrucción *return*, pues bien el
compilador al compilar código convertía esa expresión return en
instrucciones de maquina que hacían que la siguiente instrucción a
ejecutar fuera…

Una instrucción del sistema operativo, la cual está en otra porción de
memoría, así que básicamente todo programa hecho finaliza con una
instrucción para devolver el control al sistema operativo.

Este tipo de comportamiento es el habitual en sistemas operativos
**mono-proceso**, es decir que solo pueden ejecutar un proceso a la vez
de tal forma que todos los procesos deben esperar su turno en una larga
fila de procesos pendientes: esto también es conocido como:
planificación por lotes (batch).

![] (./img/Manejador-de-procesos-Fundamentos/image3.png)

Si **Windows** funcionara de esta manera no podríamos hacer nada con el
pues no podríamos tener sino un programa a la vez y esto excluye de
manera inevitable los propios servicios que el sistema operativo corre
en segundo plano, incluso si mandaras un trabajo de impresión no podrías
hacer absolutamente nada más hasta que el trabajo de impresión finalice.

Esto esta muy lejos de ser el comportamiento que estamos habituados a
ver, es decir un sistema con decenas de procesos ejecutándose 'al
tiempo', entonces ¿cómo funciona esto? bueno todo se resuelve con un
truco que realiza el sistema operativo.

###Sistemas Operativos Multitarea


Como su nombre lo indica 'multitarea' se refiere a que puede realizar
varias tareas a la vez, al menos eso es lo que parece.

Lo que sucede es que el sistema operativo esta hecho para no permitir a
un programa ejecutarse sino por una fracción de tiempo **muy pequeña**,
de tal forma que en un solo segundo muchos programas han tenido tiempo
de procesamiento, es decir muchos programas se han ejecutado en lapsos
diminutos de tiempo.

El concepto es sencillo, implementarlo suele ser más complicado pues hay
muchos más aspectos involucrados, estudiaremos algunos.

###1 Interrupción de la Ejecución de un Proceso


Al ejecutarse un proceso en un sistema multitarea, este tiene la
oportunidad de realizar un conjunto indeterminado de instrucciones, lo
que alcance a hacer en un tiempo limitado, una vez ese tiempo se ha
cumplido el sistema operativo debe decidir que proceso debe continuar su
ejecución, esto lo hace teniendo en cuenta una lista de procesos y unas
listas por prioridades de procesos, donde algunos procesos tienen más
tiempo de ejecución que otros y tienen una prioridad mayor que les
permite 'avanzar más rápido en la fila'. Usualmente estos procesos con
prioridades más altas hacen parte del propio sistema o son los
servicios.

El sistema operativo sabe que se ha cumplido el tiempo de ejecución de
un proceso cuando recibe una señal de interrupción por parte del
procesador, esta señal se activa solo cada determinado tiempo (este
lapso de tiempo es llamado **Quantum**), básicamente existe un
microprograma que en ese momento le permite al procesador suspender la
ejecución y enviar el control (es decir ejecutar) al sistema operativo
para que lleve a cabo la planificación necesaria.

Esta rutina (microprograma) se ejecuta como parte de la lógica propia
del procesador, el OS tiena la facultad de cambiar algunas cosas como
por ejemplo el tiempo entre una y otra interrupción.

Sin embargo hay otros mecanismos que pueden generar interrupciones como
por ejemplo:

- Una Señal enviada desde un dispositivo de hardware

- Un proceso puede optar por suspenderse a si mismo

Hay muchas situaciones donde las dos condiciones anteriores pueden
ocurrir, este es un ejemplo típico:

- El proceso **P1** se encuentra en ejecución

- En un momento determinado espera respuesta desde un dispositivo de
**E/S** (por ejemplo una tarjeta de red)

- P1 no sabe en que momento se recibirá dicha respuesta

- P1 se encuentra en espera y suspende su propia ejecución (haciendo
llamado al OS)

Ahora el sistema operativo coloca al proceso **P2** en ejecución

- P2 comienza a ejecutarse durante su Quantum

- P2 termina su tiempo de ejecución

- Siguen en ejecución otros procesos P3…Pn.

Pero pongámoslo más interesante.

- En un momento determinado el proceso **P5** se encontraba en ejecución

- El dispositivo de red (hardware independiente) envió la respuesta que
estaba esperando **P1**

Esta respuesta viaja por el hardware generando una nueva interrupción en
el procesador

- El procesador devuelve el control otra vez al sistema operativo
suspendiendo inmediatamente el proceso en ejecución

- El sistema operativo, una de sus rutinas, revisa los buffer de los
dispositivos de entrada

Encuentra la respuesta que según sus datos esperaba P1

- El OS Activa inmediatamente P1 para que este continúe con su ejecución
por un nuevo Quantum de tiempo

Tenemos entonces tres maneras que permiten que un proceso suspenda su
ejecución para que otros se ejecuten:

- Interrupción por el reloj del procesador (Quantum de tiempo)

- Interrupción por dispositivos de E/S

- Auto suspensión del proceso o finalización del proceso.

###2 Estado de la Ejecución de un Proceso


Ya hemos visto como es que el sistema operativo alterna entre varios
procesos para dar la impresión de que esta haciendo varias cosas a la
vez, pero puede que alguno de ustedes ya le haya surgido la pregunta

¿Cómo sabe el sistema en que iba mi proceso justo antes de suspenderlo?

Veamos el caso anterior (el de 2 +3) en un entorno multitarea:

![] (./img/Manejador-de-procesos-Fundamentos/image4.png)

En la gráfica vemos al proceso **P1** justo terminando de finalizar su
primera instrucción, así que como respuesta a esta instrucción el
procesador dejó el valor 2 en el registro AX, luego vienen los demás
procesos cada uno utilizando los registros según sus necesidades como se
ve en la gráfica:

![] (./img/Manejador-de-procesos-Fundamentos/image5.png)

Hasta que por alguna razón le vuelve a tocar el turno de ejecución al
proceso P1 y *ooops*!!!

Cuando P1 estaba ejecutandose estaba esperando que en AX **estuviera el
valor 2** para que así su suma sea 2+3, pero ahora ya el proceso P1 no
tendría en los registros los mismos valores que tenia justo antes de
suspenderse.

Por otro lado el sistema operativo también necesita saber en que
instrucción estaba la ejecución de P1 para continuar justo donde estaba
antes de suspender su ejecución, y algunos otros datos más, entonces
como hace para que todo pueda continuar normal?

Como lo dije anteriormente cuando un proceso se suspende básicamente se
devuelve la ejecución al sistema operativo, allí el sistema lleva a
acabo la planificación de procesos y otras tareas, pero ¿qué hace
realmente?

El sistema lo primero que hace es **guardar el estado** del proceso en
algún sitio, el estado del proceso es una estructura en memoria que
guarda:

- Los valores de *TODOS* los registros

- Los valores de las banderas del procesador *(las banderas son un
registro utilizado por el procesador para indicar situaciones como
división por cero, overflow, signo negativo etc.)*

Esto incluye el registro **IP** (Instrucción Pointer) que contiene un
apuntador que indica al procesador en que instrucción de código va la
ejecución, y los registros Ax, Bx, Cx, etc.

Una vez ese dato queda guardado el sistema:

- Verifica cual es el siguiente proceso que debe tener un Quantum de
ejecución, digamos el proceso P2

- Lee el *estado* del proceso P2 y comienza a dejar las cosas en su lugar,
es decir lee los valores que deberían tener cada uno de los registros,
las banderas, etc. y establece esos valores en el procesador

Una vez todos los valores están establecidos los últimos valores que
establece el sistema otros registros y el registro IP

Inicia la ejecución de P2 hasta que sea interrumpido y se continúe con
la labor de planificación una y otra vez.

Si desean más información acerca de los registros los invito a consultar
este [Tutorial de
Assembler](http://www.emu8086.com/assembly_language_tutorial_assembler_reference/asm_tutorial_01.html).

Esto es todo por el momento, los más conocedores me perdonaran por todas
las cosas que he podido pasar por alto pero recuerden que esto es solo
un post introductorio y no pretendo detallar las cosas más allá de los
conocimientos generales, de igual forma cualquier duda o corrección que
tengan es bienvenida.

###Otros artículos de esta serie


- [Sistemas Operativos - Manejador de procesos -
Fundamentos](http://juank.io/sistemas-operativos-manejador-procesos-fundamentos/)

- [Sistemas Operativos - Manejador de procesos - Los
Procesos](http://juank.io/sistemas-operativos-manejador-procesos-proceso/)

- [Sistemas Operativos - Manejador de procesos - Los
Threads](http://juank.io/sistemas-operativos-manejador-procesos-threads/)


