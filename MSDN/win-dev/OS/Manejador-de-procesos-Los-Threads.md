<properties
	pageTitle="Sistemas Operativos – Manejador de procesos – Los Threads"
	description="Sistemas Operativos – Manejador de procesos – Los Threads"
	services="win-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="win-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>
    
    
#Sistemas Operativos – Manejador de procesos – Los Threads


![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io



Hola, esta es la tercera parte de la serie de Sistemas operativos.

En el post de [Manejador de Procesos –
Fundamentos](http://juank.io/sistemas-operativos-manejador-procesos-fundamentos/)
identificamos la manera en que trabaja una CPU y diferenciamos los
sistemas monotarea y los sistemas multitarea donde pudimos ver como hace
el sistema para ejecutar varios procesos a la vez. Así mismo revisamos
el tema de lo que es el estado de ejecución de un proceso en un entorno
multitarea.

En el post de [Sistemas Operativos – Manejador de procesos – Los
Procesos](http://juank.io/sistemas-operativos-manejador-procesos-proceso/)
abordamos los conceptos de proceso, contexto, memoria de trabajo, stack
y con conjunto de instrucciones.

Ahora revisaremos un tema muy importante, hasta ahora todo ha girado
entorno a lo que es un proceso de manera cruda, pero las cosas están a
punto de cambiar gracias a los **Threads**.

###Qué es un Thread y su Uso


Un **Thread** es un mecanismo que permite a una aplicación realizar
varias tareas a la vez de manera concurrente.

Se les parece al concepto de sistema operativo multitatrea?

Si, es parecido, es la misma filosofia que utiliza el OS para ejecutar
varios procesos a la vez, pero enfocada ejecutar sub procesos de un
mismo proceso, lo cual es un poco diferente ya que por definición los
procesos no comparten el espacio de memoria entre si, mientras que los
Threads (o hilos como los quieras llamar) si.

![] (./img/Manejador-de-procesos-Los-Threads/image1.png)

Los Threads son una ampliación del concepto de multitarea, si bien
multitarea se refiere a la capacidad de un sistema para ejecutar varios
procesos a la vez, en un comienzo esto hacia referencia a que más de una
aplicación se estuviera ejecutando de manera concurrente, sin embargo
pronto se hizo notoria la necesidad de que una misma aplicación hiciera
varias cosas a la vez. **Allí nacieron los Threads.**

En un sistema multitarea podemos tener los procesos **A**, **B** y **C**
ejecutándose simultáneamente, pero ¿qué pasaba si el proceso A debía
mostrar una interfaz gráfica y de paso estar escribiendo un archivo a la
vez? no era posible.

El proceso debía terminar de escribir en disco antes de volver a
trabajar en su interfaz gráfica lo cual no era precisamente algo
deseable. Así que surgió la idea de permitir que un proceso pueda tener
una o mas tareas ejecutándose a la vez o al menos que así lo percibiera
el usuario, de tal forma que cada vez que a un proceso le correspondiera
un **Quantum** de ejecución el sistema alterne entre ejecutar una de sus
tareas u otra.

Esto conlleva a la necesidad de reestructurar el concepto de proceso, ya
que un proceso **no es la unidad mínima de ejecución** puesto que ahora
el proceso es un conjunto de tareas (en adelante hilos o threads).

Un proceso que en apariencia no utiliza threads realmente se esta
ejecutando en un único thread.

###Consideraciones de los Procesos y los Thread


De acuerdo a lo que acabamos de ver debemos tener en cuenta un par de
cosas.

La memoria de trabajo del proceso (de lo cual hablábamos en la parte2)
sigue siendo asignada por proceso, los thread dentro del proceso
comparten todos la misma región de memoria, el mismo espacio de
direcciones.

El sistema operativo asigna Quantums de ejecución a cada thread creado,
y en efecto ya no calendariza procesos sino cada uno de los hilos en
ejecución en el sistema.

Cada hilo tiene su propio contexto (estado de ejecución), así que cada
vez que que se suspende un hilo para permitir la ejecución de otro, su
contexto es guardado y restablecido nuevamente solo cuando es su turno
de ejecución.

Al ser la unidad mínima de ejecución **cada thread tiene su propio
stack**

El proceso si bien ya no es la unidad de ejecución sigue siendo parte
fundamental en el funcionamiento del sistema ya que el proceso hace
parte de la asignación de prioridad de ejecución, es al que se le asigna
memoria y de hecho es al que se le asignan los recursos, así como
privilegios y otros datos importantes.

El hilo es solo quien se ejecuta (sin demeritar en absoluto algo tan
importante como esto).

###Usar thread no implica necesariamente ejecución en paralelo


#### Qué sucede si estamos utilizando varios threads en una aplicación que se ejecuta en una maquina con una sola CPU?

Si bien la impresión del usuario es que se están ejecutando varias cosas
al tiempo ya esta claro que esto no es así pues en la CPU solo se puede
ejecutar una cosa a la vez, lo que esta pasando realmente es que los
thread están alternando tiempo de ejecución de una manera tan rápida que
el usuario percibe que se están ejecutando al tiempo.

Pero por otro lado...

#### Qué sucede si la maquina tiene más de una CPU?

En este caso las cosas pueden cambiar, si nuestra aplicación tiene dos
hilos y nuestra maquina tiene dos CPU (o core) en efecto cada thread se
podría ejecutar en una CPU diferente, en este caso si se puede habar de
ejecución en paralelo, aunque no necesariamente pues puede darse el caso
en que, debido a la necesidad del sistema de calendarizar threads de
otros procesos, ambos thread se ejecuten en la misma CPU en un momento
dado, en ese momento no habría paralelismo.

#### Pero hay otro escenario

Que pasa si mi maquina tiene 2 CPU pero mi aplicación esta utilizando
más de 2 thread?

Lo que sucederá es que solo dos de esos thread se estarán ejecutando en
paralelo en un momento dado (aunque ya vimos que esto no es
necesariamente lo que sucede), y el sistema operativo alternara la
ejecución de dichos thread de tal forma que todos tengan Quantums
asignados, pero solo podrá haber máximo 2 en paralelo.

#### ¿Es cierto que usar threads hará que mi aplicación se ejecute más rápido?

De acuerdo a lo que vimos en la sección anterior podemos concluir
rotundamente que: **DEPENDE**.

Como ya vimos si tu maquina tiene solo 1 CPU realmente hará tu
aplicación mas lenta, pero con la ventaja de poder efectuar varias
tareas a la vez (en apariencia), pero si tienes tantas o más CPU como
threads en ejecución el rendimiento si que mejorara, es decir si tienes
2 thread y 2 CPU seguramente que si estarás haciendo dos cosas a la vez
y no una cosa cada vez.

El efecto contrario se evidencia toda vez que trates de ejecutar más
threads que las CPU que tienes, es decir si vas a ejecutar 20 threads y
solo tienes 2 CPU en vez de ganar rendimiento realmente lo que harás
será castigarlo puesto que esos thread estarán **compitiendo** por el
tiempo de CPU, lo cual se traduce en múltiples y frecuentes cambios de
contexto que harán perder el preciado tiempo de CPU en la lógica
necesaria par cambiar de un thread a otro.

En estos escenarios es conveniente administrar la ejecución de los
thread para que solo se ejecuten tantos thread como CPUS existan, y solo
entren en ejecución threads nuevos cuando haya CPUS disponibles. Esto es
muy engorroso de hacer pero ya hay librerias que ayudan a esto como es
el caso de TPL y sus derivados a nivel de lenguaje async/await.

Otra cosa importante de notar es que la creación y la administración de
threads es costosa desde el punto de vista del uso de CPU así que si una
aplicación que se ejecuta en una maquina con más de una CPU, requiere
ejecutar una tarea cortada en partes paralelas probablemente sea mucho
mas rápido ejecutarla normalmente que abrirla en threads, mientras que
en una tareas suficientemente grande el tiempo invertido en crear y
administrar los threads puede ser proporcionalmente insignificante.

###Diferencias entre Threads del kernel y Threads de Usuario (Fibras / Fibers).


Si, hay diferentes tipos de thread, dependiendo de la estructura del
sistema operativo esto puede variar.

Pero en términos generales existen los tipos de thread que he mencionado
inicialmente.Veremos como funciona en Windows.

###Los thread de Kernel


Todo sistema operativo tiene un kernel, el kernel encargado de todo lo
que en esencia es el sistema operativo ofrece muchas funcionalidades,
una de ellas crear threads ya que son su unidad minina de ejecución y
funcionan muy bien tal como lo hemos visto.

En Windows cada vez que se crea un thread se crea un objeto del kernel
que tiene toda la información necesaria respecto a que proceso, cual
código ejecutable del thread, etc. están asignados a dicho thread. Este
objeto thread existe en el espacio de direcciones asignadas al kernel.

Recordemos que cada proceso solo puede acceder a los objetos o áreas de
memoria dentro de su propio espacio de direcciones, entonces Cómo hace
un proceso para acceder a un objeto thread que esta en otro espacio de
direcciones ( el del kernel )? bueno el kernel como tal se encarga de
eso asignándole al proceso un manejador al thread, el kernel mantiene
una tabla de que identificadores de recursos tiene asignado el proceso,
así que cuando un proceso quiere acceder a algún objeto del kernel, en
este caso threads, utiliza funciones de la API de Windows que con el
identificador del objeto hacen llamados al kernel los cuales son quienes
en ultima instancia manipulan al objeto en su propio espacio de
direcciones del kernel.

Entonces, cada vez que en nuestro proceso utilizamos un thread y
queremos modificar su comportamiento o verificar su información
estadística lo que sucede tras bambalinas es que se hacen llamados al
kernel. El kernel proporciona acceso a funcionalidades que puedes
modificar o supervisar el funcionamiento del thread.

El kernel se encarga de manera automática de calendarizar la ejecución
de cada uno de los thread en ejecución. Si un thread de un proceso
invoca a un dispositivo de I/O como por ejemplo la impresora, el thread
queda suspendido hasta que la impresora le conteste pero otros thread
del mismo proceso seguirán ejecutándose.

###Los thread de usuario


Básicamente son los mismos thread de kernel con la diferencia en que
estos no son administrados por el kernel del sistema operativo, es decir
el sistema operativo no sabe que existen. Son administrados por los
programas de usuario.

Un ejemplo de estos son los thread creados en .Net Framework o en java,
todos estos thread son creados, calendarizados y administrados por el
runtime de cada uno de ellos, el sistema operativo en esencia no sabe
nada de ellos. Cada thread del kernel puede tener tener dentro de si uno
o mas thread de usuario. El sistema operativo solo calendariza threads
de kernel.

Entonces, cada vez que en nuestro proceso utilizamos un user thread y
queremos modificar su comportamiento o verificar su información
estadística lo que sucede tras bambalinas es que se hacen llamados a
funciones dentro del propio espacio de direcciones del proceso y este se
encarga de hacer el trabajo necesario. En adelante me referiré a los
thread de usuario como fiber.

El propio programa se encarga de manera automática de calendarizar la
ejecución de cada uno de los fiber en ejecución.

Si un **fiber** de un proceso invoca a un dispositivo de I/O como por
ejemplo la impresora, el fiber queda suspendido hasta que la impresora
le conteste pero los otros fiber del mismo proceso también se bloquearan
y no seguirán ejecutándose, porque? recordemos que el sistema operativo
no conoce dichos threads así que si uno se bloquea para el sistema
operativo es como si todo el proceso estuviese bloqueado así que este
tipo de thread son totalmente bloqueantes del proceso cuando están a la
espera de respuesta de un dispositivo.

Para solucionar esto, Windows ofrece mecanismos que permiten asociar un
fiber a un thread de kernel nuevo independiente, de tal forma que si por
ejemplo el java virtual machine detecta que uno de sus thread (que son
en realidad fibers) queda bloqueado en espera de un dispositivo, la
maquina de java para no bloquear los otros thread del proceso crea un
nuevo thread de sistema operativo y lo asocia con ese fiber para que el
thread principal (donde corren los demas fiber) no quede bloqueado.

###Diferencias


Dado lo que he explicado anteriormente podemos contemplar los siguientes
aspectos:

Los thread de usuario (fibers) son mucho más eficientes en escenarios
con varios thread que los thread del kernel. Principalmente por dos
razones:

1.  Los thread de usuario no requieren ser conmutados en modo kernel
    sino en modo usuario lo cual permite hacer la conmutación entre
    threads de manera más rápida al no tener que alternar de contexto.

2.  No son calendarizados de manera preferente, sino que de manera
    ‘manual’ deben ser suspendidos o reactivados, lo que da la opción de
    hacer una calendarización mucho más adecuada de acuerdo al juego de
    threads que se estén ejecutando.


Los thread de usuario tienen la desventaja de que no tienen mayor
soporte del sistema operativo lo que conlleva a que hay que hacer mucho
trabajo de manera manual, por ejemplo efectuar la calendarización.

Los thread de usuario bloquean a todos los thread del proceso cuando
estos están bloqueados a espera de una llamada al kernel o a un
dispositivo de IO, lo cual hace que se pierda la funcionalidad de
procesamiento paralelo.

Algunos sistemas operativos como es el caso de Windows, proveen
funcionalidades para convertir fiber a kernel thread y viceversa, lo
cual facilita dar solución a estos escenarios de bloqueo.

En términos generales es mucho más recomendable trabajar con Kernel
Threads que con Fibers, dada su mayor complejidad los fibers pueden
traer más problemas de lo que solucionan. Sin embargo hay escenarios
donde la implementación de fibers es muy recomendable y de hecho casi un
deber como es en los siguientes casos:

1.  migrar una aplicación de Linux/Unix a Windows

2.  crear un runtime de ejecución de programas como es el caso del CLR o
    del java virtual machine.

3.  crear una aplicación profundamente compleja e intensiva a nivel de
    manejo de threads

¡Eso es todo!

###Otros artículos de esta serie


- [Sistemas Operativos - Manejador de procesos -
Fundamentos](http://juank.io/sistemas-operativos-manejador-procesos-fundamentos/)

- [Sistemas Operativos - Manejador de procesos - Los
Procesos](http://juank.io/sistemas-operativos-manejador-procesos-proceso/)

- [Sistemas Operativos - Manejador de procesos - Los
Threads](http://juank.io/sistemas-operativos-manejador-procesos-threads/)
