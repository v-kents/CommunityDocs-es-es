---
title: Internet Explorer 11- El Depurador
description: Internet Explorer 11- El Depurador
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Internet Explorer 11: El Depurador


©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


Dentro de las herramientas de desarrollo –herramientas F12- de Internet
Explorer, el *Depurador*, nos permite hacer un seguimiento de todo el
código de la página Web, secuencia a secuencia, estableciendo, en su
caso, puntos de interrupción y condicionantes de ejecución.

En el presente artículo nos centraremos en:

- El depurador integrado. Su área de trabajo.

- Los diversos paneles y barras de herramientas.

- Una primera experiencia y ejecuciones paso a paso.

- Opciones de depuración *Just my code*.

- Opciones de paso a paso.

- Puntos de interrupción.

###Acceso a las herramientas F12


Para acceder a las herramientas de desarrollo, desde la ventana de
*Internet Explorer*, pulsaremos la tecla de función **F12** y en la
parte inferior de la ventana se abrirá el panel correspondiente a dichas
herramientas.

En concreto, las herramientas disponibles son las que se recogen en la
tabla que sigue:

  **Herramienta**                     |**Descripción**                                                                                                      **Teclas**
  ----------------------------------- |-------------------------------------------------------------------------------------------------------------------- ------------
  *Explorador DOM*                    |Para diagnosticar y corregir problemas de diseño referentes al DOM –*Document Object Model*-                         **Ctrl+1**
  *Consola de salida de texto*        |En ella se mostrará posibles mensajes de error y los correspondientes a los comandos *console.log* de *JavaScript*   **Ctrl+2**
  *Depurador*                         |Para inspeccionar la ejecución de código *JavaScript* en modo paso a paso y depuración avanzada                      **Ctrl+3**
  *Explorador de red*                 |Analiza el uso del tráfico de red de las páginas Web y del propio explorador                                         **Ctrl+4**
  *Capacidad de respuesta de la IU*   |Crea un perfil de respuesta de la interfaz de usuario de la página Web                                               **Ctrl+5**
  *Generador de perfiles*             |Crear un perfil de rendimiento del código *JavaScript*                                                               **Ctrl+6**
  *Memoria*                           |Diagnostica los problemas de uso de la memoria de las páginas Web                                                    **Ctrl+7**
  *Emulación*                         |Emulación del comportamiento en diferentes versiones y plataformas del explorador                                    **Ctrl+8**

###El Depurador integrado


La referencia oficial completa de Microsoft, la puede encontrar en la
siguiente dirección URL:

[**http://msdn.microsoft.com/es-ES/library/ie/dn255007(v=vs.85)**](http://msdn.microsoft.com/es-ES/library/ie/dn255007(v=vs.85))

![] (./img/IE11-El-Depurador/image1.png)

Cómo podemos apreciar, la pantalla del explorador nos muestra el área
correspondiente al *Depurador* en la parte inferior, constando de los
siguientes paneles:

*Panel de scripts*: A la izquierda, se trata de un editor multiventana
–con pestañas- que muestra el código de los archivos HTML y *JavaScript*
del documento que actualmente se muestra en la ventana del explorador. A
su izquierda se marcan los posibles puntos de interrupción y las
coincidencias de búsquedas.

*Panel de Inspecciones*: Parte superior derecha. En un punto de
interrupción, marca de los valores de las variables locales en ese lugar
y momento y marca los valores de las variables que se le haya mandado
seguir –inspeccionar-; durante la depuración en general, va mostrando
los valores de las diferentes variables.

*Panel de la Pila de llamadas y Puntos de interrupción*: Parte inferior
derecha.

1.  *Pila de llamadas*: Muestra la secuencia de llamadas a funciones que
    han llevado a la posición del código actual.

2.  *Puntos de interrupción*: Muestra el listado de los puntos de
    interrupción que han sido marcados, juntamente con la opción de
    activarlos/desactivarlos, modificarlos y eliminarlos.



La barra de herramientas con los botones de comando para el control de
la depuración se puede observar inmediatamente encima de los paneles y
se recoge seguidamente:

![] (./img/IE11-El-Depurador/image2.png)

El significado y funcionalidad de cada uno de dichos botones es:

- **Continuar**: Ejecuta el código que resta hasta el final.

- **Interrumpir**: Detiene la ejecución del código actualmente en
ejecución.

- **Paso a paso por instrucciones**: Ejecuta una instrucción de cada vez y
si es una función, una instrucción de la función.

- **Paso a paso por procedimientos**: Ejecuta un procedimiento de cada vez
y si es una función, un procedimiento de la función.

- **Paso a paso para salir**: Ejecuta el código para salir de la función
actual y volver a la función que la ha llamado.

- **Interrumpir en nuevo trabajador**: Se realizará una interrupción en la
creación de un nuevo *Web Worker*.

- **Cambiar comportamiento de excepciones**: Se puede fijar el
comportamiento para:

1.  No interrumpir nunca en las excepciones

2.  Interrumpir en las excepciones no atendidas

3.  Interrumpir en todas las excepciones

4.  **Activar/desactivar impresión con sangría**: Si se trata de un
    código comprimido o minimizado, le aplica un formato adecuado para
    que sea fácilmente legible.

    **Activar/desactivar ajuste de línea**: Ajusta el ancho de línea a
    la ventana de edición del *Panel de scripts*.

    **Depurar todo el código**: Alterna entre depurar todo el código y
    depurar sólo mi código –véase más adelante **Depuración *Just my
    code***-.

    **Alternar mapas de origen**: A partir de Windows 8.1 Update es
    posible utilizar los archivos de mapas de origen de las
    correspondientes bibliotecas compiladas o minificadas de
    *JavaScript*, para así facilitar el acceso a la depuración del
    archivo origen.

###Una primera experiencia


Para nuestro trabajo, utilizaremos el documento HTML recogido en el
Listado 1, que abriremos en Internet Explorer 11 o posterior.

**Listado 1: Documento HTML utilizado en nuestros primeros ejemplos.**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Selecting Node&lt;/title&gt;

    &lt;style&gt;

    li.azul{

    color:blue;

    }

    li.rojo{

    color:red;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="A"&gt;

    &lt;ul&gt;

    &lt;li class="azul"&gt;Alfonso&lt;/li&gt;

    &lt;li class="azul"&gt;Carlos&lt;/li&gt;

    &lt;li class="azul"&gt;Fernando&lt;/li&gt;

    &lt;li class="azul"&gt;Joaquín&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;div id="B"&gt;

    &lt;ul&gt;

    &lt;li class="rojo"&gt;Antonio&lt;/li&gt;

    &lt;li class="rojo"&gt;Daniel&lt;/li&gt;

    &lt;li class="rojo"&gt;Julio&lt;/li&gt;

    &lt;li class="rojo"&gt;Manuel&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;script&gt;

    console.log("Equipo A (viste de azul) ...");

    var divA = document.getElementById("A");

    for (i = 0; i &lt; divA.getElementsByClassName('azul').length; i++)

    console.log(divA.getElementsByClassName('azul')\[i\].textContent);

    console.log("Equipo B (viste de rojo) ...");

    var divB = document.getElementById("B");

    for (i = 0; i &lt; divB.getElementsByClassName('rojo').length; i++)

    console.log(divB.getElementsByClassName('rojo')\[i\].textContent);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

Una vez abierto el documento en nuestro Internet Explorer 11 o
posterior, accederemos a la herramienta de desarrollo del *Depurador*,
desplegando las herramientas de desarrollo con la tecla **F12** y
posteriormente haciendo clic sobre el botón correspondiente en la barra
vertical de la izquierda o con la combinación de teclas **Ctrl+3**, de
no mostrarse por defecto.

Por el momento, sin más haremos clic sobre el botón **Interrumpir**,
seguidamente recargamos la página haciendo clic sobre **Actualizar** o
pulsando la tecla **F5** –en la barra de herramientas del explorador- y
posteriormente sobre el botón **Continuar**; una vez finalizada la carga
de todo el archivo, vamos a la *Consola de texto* y veremos los
resultados de salida del código *JavaScript* –los correspondientes a
*console.log*-.

![] (./img/IE11-El-Depurador/image3.png)

![] (./img/IE11-El-Depurador/image4.png)


Para ir paso a paso:

- En el *Depurador* hacemos clic sobre el botón **Interrumpir**.

- Seguidamente recargamos la página haciendo clic sobre **Actualizar** o
pulsando la tecla **F5** –en la barra de herramientas del explorador, a
la derecha del área de direcciones.

- Veremos que se activan numerosos botones de la barra del *Depurador*.
Pase el puntero del ratón sobre cada uno de ellos y observe su
funcionalidad.

- Vaya haciendo clic sucesivamente sobre el botón **Paso a paso por
instrucciones**, o pulsar la tecla **F11**. Observe como se avanza en el
código en el *Panel de scripts*.

- De cada ver que haga clic, si lo desea, puede comprobar si hay cambios
en la *Consola de texto* –lógicamente, los debería haber si hay mensajes
de advertencia o error, o bien si se ejecutaron órdenes *console.log*-.

Una vez finalizada la ejecución de todo el código, se deshabilitará el
botón de ir paso a paso –por cualquiera de los tres métodos-.

![] (./img/IE11-El-Depurador/image5.png)

###Depuración Just my code


En muchas ocasiones –tal vez la mayor parte de ellas- nos habrá
interesado depurar sólo aquella parte de código que hayamos escrito
personalmente y tal vez alguna que otra biblioteca complementaria, sin
adentrarnos en el sin duda didáctico, pero poco importante para nuestro
trabajo, mundo de las bibliotecas de terceros y supuestamente bien
codificadas.

Afortunadamente, para aquellos usuarios de Windows 8.1 Update y
posteriores, disponemos de la opción de marcado de código y referencias
de bibliotecas como de terceros y excluirlas de la depuración, dejando
únicamente aquello que consideremos *nuestro* código. A eso se le
denomina la función de depuración *Just my code*.

Su modo de trabajo es como sigue:

- Se trata de indicar que un script es *código de biblioteca* a excluir de
la depuración.

- Una posibilidad es desplegar la lista de archivos, haciendo clic en el
icono de la carpeta de apertura a la izquierda de los nombres de las
fichas en el *Panel de scripts*. En la lista, a la derecha se nos
muestra la posibilidad de marcar cada archivo como *código de
biblioteca*. Véase la figura adjunta.

- Otra posibilidad es, ya sobre un archivo abierto, en la cabecera de la
pestaña en el *Panel de scripts*, hacer clic con el botón derecho del
ratón y en el menú emergente seleccionar **Código de biblioteca**. Véase
la figura adjunta.

![] (./img/IE11-El-Depurador/image6.png)

![] (./img/IE11-El-Depurador/image7.png)



###Opciones paso a paso y puntos de interrupción


Si bien ya habíamos comentado ejecutar paso a paso el código
*JavaScript* en el modo **Paso a paso por instrucciones**, caben otras
posibilidades de ejecución del código por etapas. Puede que en el caso
de bucles nos interese saltar el código repetitivo, o puede que sepamos
que una función no nos causará problemas, en tales casos dispondremos
además de **Paso a paso para salir** y **Paso a paso por
procedimientos**, como apuntamos más arriba.

Probemos por ejemplo lo que sigue, tras abrir el *Depurador*:

- Hagamos clic sobre el botón **Interrumpir**, en la barra de herramientas
del *Depurador*.

- Vayamos a la ventana de *Consola de texto* de las herramientas de
Internet Explorer y borremos todo su contenido.

- Volvamos al *Depurador*.

- Recarguemos la página en el explorador, haciendo clic en el botón
**Actualizar**, a la derecha de la barra de direcciones.

- Veremos que se activan numerosos botones de la barra del *Depurador*.
Pase el puntero del ratón sobre cada uno de ellos y observe su
funcionalidad.

- Vaya haciendo clic sucesivamente sobre el botón **Paso a paso por
procedimientos**, o pulsando **F10**. Observe como se avanza en el
código en el *Panel de scripts*.

- De cada ver que haga clic, si lo desea, puede comprobar si hay cambios
en la *Consola de texto* –lógicamente, los debería haber si hay mensajes
de advertencia o error, o bien si se ejecutaron órdenes *console.log*-.

Una vez finalizada la ejecución de todo el código, se deshabilitará el
botón de ir paso a paso –por cualquiera de los tres métodos-.

![] (./img/IE11-El-Depurador/image8.png)

![] (./img/IE11-El-Depurador/image9.png)

Respecto a los puntos de interrupción, como comentábamos, disponemos de
un área específica de gestión, el *Panel de la Pila de llamadas y Puntos
de interrupción*, en ella se nos muestra la lista de puntos de
interrupción actualmente definidos que pueden estar habilitados o
deshabilitados –definidos, pero sin efecto-.

Para fijar un punto de interrupción, a la vista del código en el *Panel
de scripts*:

- Una vez posicionados en la línea correspondiente, haremos clic con el
botón derecho del ratón y en el menú emergente seleccionaremos
**Insertar punto de interrupción**

- Haciendo clic sobre el área gris a la izquierda de la línea
correspondiente se permutará entre poner y quitar un punto de
interrupción en la línea de código correspondiente.

- De cualquiera de las maneras quedará marcado un círculo rojo y aparecerá
la referencia en el área de paneles de *Puntos de interrupción*.

Una vez fijado, si hacemos clic sobre un punto de interrupción, en el
*Panel de scripts*, con el botón derecho del ratón, se nos desplegará un
menú contextual:

Podremos editarlo de la forma:

- Quitar punto de interrupción de forma definitiva.

- Deshabilitar punto de interrupción de forma temporal, quedará
    marcado pero no se parará la ejecución.

- Podremos establecer una **Condición** para su ejecución, como por
    ejemplo cierto valor de una variable.

![] (./img/IE11-El-Depurador/image10.png)

**NOTA**: A partir de Windows 8.1 Update, los puntos de interrupción se
mantienen entre sesiones. Es decir, cuando se cierra el explorador y se
vuelve a abrir los puntos de interrupción permanecerán activos.

Cuando hayamos terminado la depuración, si deseamos eliminarlos todos de
una sola vez, la forma más fácil es hacer clic sobre el icono **Eliminar
todos** en el panel *Puntos de interrupción*.

###Conclusiones


En el presente artículo hemos visto las diversas opciones de trabajo con
el depurador avanzado de Internet Explorer 11, que incluye algunas tan
atractivas como la depuración *Just my code*.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




