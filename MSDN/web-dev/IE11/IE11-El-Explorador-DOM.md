---
redirect_url: https://docs.microsoft.com/
title: Internet Explorer 11- El Explorador DOM
description: Internet Explorer 11- El Explorador DOM
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Internet Explorer 11: El Explorador DOM

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  

Dentro de las herramientas de desarrollo –herramientas F12- de Internet
Explorer, el *Explorador DOM* –explorador del *Document Object Model*-,
nos permite ver, repasar cada elemento a la vista de su presentación en
la ventana del explorador, realizar cambios, añadir elementos, modificar
y editar nuevos estilos y demás de una manera extraordinariamente simple
e intuitiva.

Funciona en un doble sentido: tanto seleccionando elementos en el código
y viéndolos resaltados en la ventana del explorador, como a la inversa.

En el presente artículo nos centraremos en:

- El *Explorador DOM*. Ideas generales

- Modo de trabajo sencillo del *Panel de elementos*

- Modificaciones al vuelo del contenido del DOM

- Trabajo elemental con el *Panel de estilos*

- Modificaciones al vuelo de estilos

- Acceso al *Depurador*

###Acceso a las herramientas F12


Para acceder a las herramientas de desarrollo, desde la ventana de
*Internet Explorer*, pulsaremos la tecla de función **F12** y en la
parte inferior de la ventana se abrirá el panel correspondiente a dichas
herramientas.

En concreto, las herramientas disponibles son las que se recogen en la
tabla que sigue:

  Herramienta                         |Descripción                                                                                                          Teclas
  ----------------------------------- |-------------------------------------------------------------------------------------------------------------------- --------
  *Explorador DOM*                    |Para diagnosticar y corregir problemas de diseño referentes al DOM –*Document Object Model*-                         Ctrl+1
  *Consola de salida de texto*        |En ella se mostrará posibles mensajes de error y los correspondientes a los comandos *console.log* de *JavaScript*   Ctrl+2
  *Depurador*                         |Para inspeccionar la ejecución de código *JavaScript* en modo paso a paso y depuración avanzada                      Ctrl+3
  *Explorador de red*                 |Analiza el uso del tráfico de red de las páginas Web y del propio explorador                                         Ctrl+4
  *Capacidad de respuesta de la IU*   |Crea un perfil de respuesta de la interfaz de usuario de la página Web                                               Ctrl+5
  *Generador de perfiles*             |Crear un perfil de rendimiento del código *JavaScript*                                                               Ctrl+6
  *Memoria*                           |Diagnostica los problemas de uso de la memoria de las páginas Web                                                    Ctrl+7
  *Emulación*                         |Emulación del comportamiento en diferentes versiones y plataformas del explorador                                    Ctrl+8

###El explorador DOM


La referencia oficial completa de Microsoft, la puede encontrar en la
siguiente dirección URL:

[**http://msdn.microsoft.com/es-ES/library/ie/dn255008(v=vs.85)**](http://msdn.microsoft.com/es-ES/library/ie/dn255008(v=vs.85))

![] (./img/IE11-El-Explorador-DOM/image1.png)

Al desplegar el *Explorador DOM*, consúltese el apartado anterior, lo
primero que observamos es la existencia de dos partes o paneles, a la
izquierda y derecha, juntamente con una barra de herramientas a la
altura de su título.

Las operaciones básicas que podemos realizar en los paneles se resumen
en:

- En el *Panel de elementos* –a la izquierda-:

- Seleccionar un elemento

- Modificar un elemento

- Mover un elemento

- En el *Panel de estilos* –a la derecha-:

- Enumerar los estilos

- Modificar los estilos

- Seguimiento del origen de los estilos

- Estilos calculados ya en pixeles actuales y con la opción de mostrar
sólo los definidos por el usuario

- Eventos *JavaScript*

- Seguimiento de cambios realizados

En la barra de herramientas encima de los paneles, nos encontramos con
dos botones de especial interés:

- **Seleccionado de elemento**: si está seleccionado el botón, al hacer
clic sobre un elemento en el explorador de Internet, quedará mostrado y
seleccionado en el *Panel de elementos* del *Explorador DOM*.

- **Resaltado de elemento**: si está seleccionado el botón, al pasar por
encima del elemento en el *Panel de elementos* del *Explorador DOM*, se
resaltará en el explorador de Internet y viceversa.

###Una primera experiencia


Para nuestro trabajo, utilizaremos el documento HTML recogido en el
Listado 1, que abriremos en Internet Explorer 11 o posterior.

**Listado 1: Documento HTML utilizado en nuestros ejemplos.**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTML Document&lt;/title&gt;

    &lt;style&gt;

    div.resaltado{

    font-weight:bold;

    font-size:4em;

    }

    div.rojo{

    color:red;

    }

    div.centrado{

    text-align:center;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="A" class="resaltado rojo centrado"
    onmouseover="alert(this.classList)"&gt;Texto ejemplo&lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

Una vez abierto el documento en nuestro Internet Explorer 11 o
posterior, accederemos a la herramienta de desarrollo del *Explorador
DOM*, desplegando las herramientas de desarrollo con la tecla **F12** y
posteriormente haciendo clic sobre el botón correspondiente en la barra
vertical de la izquierda o con la combinación de teclas **Ctrl+1**, de
no mostrarse por defecto.

Son ahora visibles los dos paneles antes aludidos. El *Panel de
elementos* se encuentra a la izquierda y si hacemos clic o pasamos sobre
cualquiera de sus entradas, que haga referencia a un elemento visible en
la página del documento, se resaltará el contenido –siempre que este
seleccionado el botón **Resaltado de elemento**-. Véase más arriba.

Si seleccionamos el botón **Seleccionado de elemento**, como
comentábamos, resulta sencillo navegan en el documento en el explorador
de Internet y hacer clic sobre cualquier parta e que nos interese.
Inmediatamente será seleccionado el elemento correspondiente y mostrado
en primer plano en el *Panel de elementos* del *Explorador DOM*.

De igual forma que en los modernos editores de código, los elementos se
pueden contraer y desplegar, para facilitar el recorrido en el árbol del
DOM. Podremos ver todos sus atributos, propiedades y dependencias de una
manera totalmente editable, bien en su conjunto –modo de edición HTML-
bien como partes seleccionadas, como veremos en los apartados que
siguen.

![] (./img/IE11-El-Explorador-DOM/image2.png)

###Modificaciones al vuelo del contenido DOM


El *Panel de elementos* además de visualizar el contenido del DOM,
permite editarlo casi completamente –no, por ejemplo, los contenidos de
&lt;head&gt;, como estilos-, de manera que podremos realizar las pruebas
pertinentes de manera instantánea sobre el documento abierto, al vuelo,
reflejándose en lo expuesto en el explorador.

Probemos la siguiente experiencia de inserción de nuevos elementos:

- Sobre el documento del Listado 1, abierto en el explorador de
    Internet, despleguemos el *Explorador DOM*, como describimos más
    arriba y se aprecia en la figura mostrada anteriormente.

- Seleccionado el elemento &lt;div&gt;, hacemos clic sobre él con el
    botón derecho del ratón.

- Se despliega el menú emergente correspondiente que se muestra en la
    figura siguiente.


![] (./img/IE11-El-Explorador-DOM/image3.png)



- Allí seleccionamos la opción de menú **Editar como HTML**.

- Esto nos abrirá un área de edición en la que podremos escribir o
    modificar el texto HTML del documento.

- Añadiremos un epígrafe con el contenido:

        &lt;p&gt;Nuevo texto de pruebas&lt;/p&gt;

![] (./img/IE11-El-Explorador-DOM/image4.png)



- Hacemos clic fuera del área de edición HTML y veremos reflejado el
    epígrafe en el explorador de Internet, como se muestra en la figura
    que sigue.

![] (./img/IE11-El-Explorador-DOM/image5.png)

Para editar un elemento ya existente, podremos operar como hemos
descrito anteriormente o bien, haciendo doble clic sobre el dato a
alterar; por ejemplo, pruebe a hacer doble clic sobre las clases de
estilos del elemento *div* o sobre el propio atributo *class*. Y así
sucesivamente.

Para revertir los cambios, deberá operar manualmente al no disponerse de
funciones avanzadas de deshacer y rehacer, salvo la genérica **Ctrl+Z**
–para deshacer-.

###Trabajo con el Panel de estilos


Las pestañas disponibles y sus contenidos son:

- **Estilos**: Muestra los estilos aplicados al elemento seleccionado
actualmente en el panel de la izquierda –*Panel de elementos*-.
Obsérvense las casillas de verificación, a la izquierda, que permiten
deseleccionarlos –o reseleccionarlos posteriormente- y observar el
impacto que tienen en la apariencia del elemento en la ventana del
explorador de Internet.

- **Calculado**: Si la abrimos veremos cómo se muestran los valores de los
estilos calculados numéricamente, ya adaptados al dispositivo
actualmente utilizado. Por ejemplo las unidades de medida de fuentes se
mostrarán el pixeles reales de pantalla. Los colores en tripletes de
valores RGB, etc.

- **Distribución**: Se nos mostrará el área en pantalla que ocupa el
elemento, con sus dimensiones, bordes y demás.

- **Eventos**: Nos indica el código de eventos *JavaScript* que pueda
llevar asociado el elemento, en nuestro caso sería *onmouseover*.

- **Cambios**: Una pila de seguimiento de los posibles cambios que hayamos
introducido en nuestra exploración, desde la carga del documento
original, pudiendo deshacer las modificaciones introducidas en el
sistema de estilos del DOM.

![] (./img/IE11-El-Explorador-DOM/image6.png)

###Modificaciones al vuelo de estilos


Si ya veíamos que en el *Panel estilos* se nos mostraban todos aquellos
definidos para el documento mostrado en la ventana del explorador, nos
interesará mucho saber que es todo un editor de aquellos en el que
podremos modificar los estilos existentes y añadir nuevos o eliminar
estilos en general.

En la figura que sigue, se muestra como hemos:

- Deseleccionado el estilo *text-align: center*

- Deseleccionado el estilo *color: red*

- Insertado *text-decoration: underline*

Nótese que para adicionar, no tenemos más que posicionándonos tras el
valor detrás del cuál queramos que vaya, haciendo clic y escribiendo el
texto correspondiente.

![] (./img/IE11-El-Explorador-DOM/image7.png)

También podemos incluir nuevos estilos *inline* en el código HTML. Por
ejemplo en el paso 6 del apartado **Modificaciones al vuelo del
contenido DOM**, podríamos haber escrito:

    *&lt;p style="color: red;"&gt;Texto de pruebas&lt;/p&gt;*

O bien también cabe:

- Incluir *&lt;p&gt;Texto de pruebas&lt;/p&gt;*, de igual forma que lo
descrito anteriormente en el paso 6.

- Pulsar sobre la etiqueta &lt;p&gt; del elemento *&lt;p&gt;Texto de
pruebas&lt;/p&gt;* en el *Panel de elementos* con el botón derecho del
ratón

- Seleccionar la opción **Agregar atributo** Del menú emergente

- Escribir *style* y pulsar la tecla **Retorno**

- Seguidamente, hacer doble clic sobre las dobles comillas que siguen a
*style*.

- Aparecerá el área de edición para escribir el valor de los estilos
deseados, en nuestro caso *color:red*.

Una vez finalizado, hacer clic fuera del área de edición

![] (./img/IE11-El-Explorador-DOM/image8.png)

Para revertir los cambios en los estilos, váyase a la pestaña
**Cambios** del *Panel estilos* y en ella se mostrarán los cambios en
los estilos del elemento seleccionado, como comentábamos más arriba.
Bastará seleccionar en cada caso cuál de las opciones deseamos restaurar
y desaremos los cambios introducidos.

###Acceso al Depurador


Sigamos los sencillos pasos de:

-  Bien en la ventana del explorador, bien en el *Panel de elementos*,
    seleccionar una parte que tenga asociado algún código *JavaScript*.

-  Veremos que ese se mostrará en el panel de la derecha –el *Panel de
    elementos*, seleccionando la etiqueta **Eventos**-

-  Hagamos clic sobre el *evento* –código que deseemos examinar-.

-  Se cierra el *Explorador DOM* y se abrirá el *Depurador*
    mostrándonos una sesión abierta en el punto en que hayamos hecho
    clic en la ventana de **Eventos**.

Cómo se observa en las figuras adjuntas.

![] (./img/IE11-El-Explorador-DOM/image9.png)

![] (./img/IE11-El-Explorador-DOM/image10.png)


De igual manera podemos operar para seguir las definiciones de los
estilos, seleccionando en el paso 2 la etiqueta **Estilos**.

![] (./img/IE11-El-Explorador-DOM/image11.png)

###Conclusiones


En el presente artículo hemos visto las capacidades, desde las más
simples y obvias, como es la mera observación de contenidos, a las más
avanzadas, como lo son las modificaciones y acceso a la depuración, del
*Explorador DOM* de las herramientas de desarrollo de Internet Explorer.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




