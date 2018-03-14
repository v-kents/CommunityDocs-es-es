---
redirect_url: https://docs.microsoft.com/
title: jQuery UI Tabs. Manual de uso básico
description: jQuery User Interface plug-ins que nos acercan a la programación de las
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#jQuery UI Tabs. Manual de uso básico

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  



El *jQuery User Interface* contiene una gran cantidad de componentes y
complementos –plug-ins- que nos acercan a la programación de las
interfaces de usuario –menús, diálogos, calendarios, paneles, …-.

El componente *Tabs* es el objeto de este artículo introductorio.

Posteriormente, continuaremos con su estudio en nuestro artículo:

jQuery UI Tabs. Manual de uso avanzado.

En resumen, hablaremos de:

Qué es y qué proporciona el *jQuery User Interface Tabs*

Los componentes esenciales para su implementación en una página Web

Carga de contenidos vía *Ajax*

Control de errores de la carga de contenidos vía *Ajax*

Mostrar contenidos complementarios: cabecera y pie de página y pie de
paneles.

###¿Qué es el jQuery User Interface Tabs?


Dentro del *jQuery User Interface* encontramos toda una serie de
elementos de programación de la interface de usuario preprogramados y
listos para ser integrados en nuestros proyectos HTML. Se trata de una
amplia biblioteca *JavaScript* que abarca desde efectos dinámicos, hasta
menús, calendarios, diálogos, etc.

El lugar de Internet de referencia y descarga del componente *Tabs*, que
es de lo que trataremos, es:

[**http://jqueryui.com/tabs/**](http://jqueryui.com/tabs/)

![] (./img/jQuery-UI-Tabs_Manual-de-uso-basico/image1.png)

Las capacidades que nos proporcionará las iremos desgranando en los
sucesivos epígrafes y artículo, a vuelapluma son:

Grupos de paneles con contenido HTML completo –con pestañas con
títulos-.

La posibilidad de carga de documentos externos en los paneles –vía
*Ajax*-.

La adaptación personal a estilos predefinidos o más personalizados.

Autocolapsables –replegables y desplegables- por la acción de un clic
sobre la pestaña.

Apertura mediante el pase del ratón sobre la pestaña.

Ordenables –movibles de posición por arrastre-.

Con las pestañas en orientación vertical.

Posibilidad de acompañamiento de efectos visuales en su despliegue y
recogida.

###Un primer grupo de paneles básico


Nuestro primer ejemplo no será muy ambicioso, se trata de ilustrar un
simple grupo de paneles con pestañas con títulos. El contenido de cada
panel se cargará y mostrará al hacerse clic sobre la pestaña
correspondiente.

El conjunto de paneles se codifica en formato HTML simple y se trata de
una lista no numerada en la que cada panel se especifica como un
elemento de la lista, que contiene el enlace al texto que incluirá y el
título de la pestaña del panel.

El identificador del elemento &lt;div id="identificador"&gt; en que se
encuentra se pasa a la función *tabs* de *jQuery UI*, que inicializará
el sistema, de la forma:

*\$(function () { \$("\#identificador").tabs(); });*

El código de nuestro ejemplo es el del Listado 1 y se comentará
seguidamente.

**Listado 1: Código ejemplo de un grupo de paneles básico.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Tabs - Ejemplo básico&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#tabs").tabs();

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body style="background-color: black"&gt;

    &lt;h1 style="color: white"&gt;jQuery UI Tabs - Ejemplo
    básico&lt;/h1&gt;

    &lt;div id="tabs"&gt;

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#tabs-1"&gt;Olores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#tabs-2"&gt;Colores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#tabs-3"&gt;Sabores&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;div id="tabs-1"&gt;

    &lt;h2 style="color: red"&gt;Olores básicos&lt;/h2&gt;

    &lt;ul&gt;

    &lt;li&gt;Fragancia floral&lt;/li&gt;

    &lt;li&gt;Leñoso o resinoso&lt;/li&gt;

    &lt;li&gt;Frutal (no cítrico)&lt;/li&gt;

    &lt;li&gt;Cítrico&lt;/li&gt;

    &lt;li&gt;Olor químico&lt;/li&gt;

    &lt;li&gt;Mentolado o refrescante&lt;/li&gt;

    &lt;li&gt;Dulce&lt;/li&gt;

    &lt;li&gt;Quemado o ahumado&lt;/li&gt;

    &lt;li&gt;Descompuesto&lt;/li&gt;

    &lt;li&gt;Rancio&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;div id="tabs-2"&gt;

    &lt;h2 style="color: red"&gt;Colores fundamentales&lt;/h2&gt;

    &lt;ul&gt;

    &lt;li&gt;Rojo&lt;/li&gt;

    &lt;li&gt;Anaranjado&lt;/li&gt;

    &lt;li&gt;Amarillo&lt;/li&gt;

    &lt;li&gt;Verde&lt;/li&gt;

    &lt;li&gt;Azul&lt;/li&gt;

    &lt;li&gt;Añil&lt;/li&gt;

    &lt;li&gt;Violeta&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;div id="tabs-3"&gt;

    &lt;h2 style="color: red"&gt;Teoría clásica de los tipos de
    sabores&lt;/h2&gt;

    &lt;p&gt;
```
La teoría clásica reconoce la existencia de sólo cuatro sabores: amargo, ácido, dulce, salado.

Al contrario de la creencia popular, cada uno de estos sabores no
tiene asociado una zona específica de la lengua como
sensor específico.

Las papilas gustativas de toda la superficie de la lengua son
sensibles y reconocen los cuatro sabores, si bien ciertos nervios tienden a responder mejor a uno u otro de
estos estímulos alimentarios y pueden incluso reconocer otros
sabores (el del fierro, el de la tierra). Los sensores de la lengua que
detectan los sabores básicos del salado y el amargo se llaman
canales iónicos.
    
```
    &lt;/p&gt;

    &lt;p&gt;Amargo&lt;/p&gt;

    &lt;p&gt;Ácido&lt;/p&gt;

    &lt;p&gt;Dulce&lt;/p&gt;

    &lt;p&gt;Salado&lt;/p&gt;

    &lt;/div&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Tabs_Manual-de-uso-basico/image2.png)

Si repasamos el código nos encontramos, por orden secuencial:

Al comienzo del documento, en la etiqueta &lt;head&gt;, insertaremos las
bibliotecas CSS y *jQuery* y los códigos correspondientes

La referencia a la hoja de estilos del *User Interface* de *jQuery*:
jquery-ui.css

Debe ser la primera de las bibliotecas *CSS* referenciadas

La referencia a la biblioteca *jQuery* general *jquery-x.x.x.js*

Debe ser la primera de las bibliotecas *JavaScript* referenciadas

La referencia a la biblioteca *User Interface* de *jQueryjquery-ui.js*

Una función de inicialización del grupo de *Tabs* –paneles con pestañas-
*\$("\#tabs").tabs();*

Que, como vemos, toma el elemento al que va asociado y la función sin
parámetros, sin más

En el cuerpo del documento, etiqueta &lt;body&gt; irá el resto de
elementos HTML, entre ellos la definición del grupo de paneles: *&lt;div
id="tabs"&gt;*

###Carga de contenido vía Ajax. Control de errores.


Se trata de cargar al vuelo el contenido de un documento HTML, al que se
hace referencia, como contenido de la pestaña.

Sólo se tratará de integrar una referencia al archivo de documento con
el contenido a mostrar en la pestaña en la etiqueta &lt;li&gt;
correspondiente –véase el Listado 2-.

La carga vía *Ajax* tiene la ventaja de la claridad, versatilidad y
facilidad de mantenimiento, pero puede suponer un gravamen para el
tráfico en la red notable; factores que han de ser cuidadosamente
balanceados.

**Datos**: 100 ms la carga del html principal y aproximadamente 50 ms la
carga de cada html de contenidos. Sin Ajax, la carga del html es de unos
125 ms y no hay cargas de contenidos adicionales. Datos tomados con el
**Panel resumen** del *Explorador de red de Internet Explorer* –véase la
figura adjunta-.

Nótese que adicionalmente hemos incluido un sencillo control de errores,
como se muestra en la breve porción de código adjunta:


```
    beforeLoad: function (event, ui) {

    ui.jqXHR.error(function () {

    ui.panel.html(

    "&lt;h3&gt;ERROR en la carga.&lt;/h3&gt;Contenido de la pestaña no
    encontrado.");

    });

    }
```
En ella:

Se captura el evento de carga, en concreto se ejecutan tareas antes de
una nueva apertura de pestaña. Esas tareas son la comprobación de si
todo irá bien.

Si aconteciese un error en la solicitud HTTP (jqXHR.error) se dispara la
captura de errores y se pasa a escribir en la pestaña la notificación
correspondiente de página no cargada –documento no encontrado o no
accesible en estos momentos-.

![] (./img/jQuery-UI-Tabs_Manual-de-uso-basico/image3.png)

**Panel resumen** del Explorador de red de Internet Explorer.

**Listado 2: Ejemplo de carga de contenidos vía Ajax**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Tabs - Contenido vía Ajax&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#tabs").tabs({

    beforeLoad: function (event, ui) {

    ui.jqXHR.error(function () {

    ui.panel.html(

    "&lt;h3&gt;ERROR en la carga.&lt;/h3&gt;Contenido de la pestaña no
    encontrado.");

    });

    }

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body style="background-color: black"&gt;

    &lt;h1 style="color: white"&gt;jQuery UI Tabs - Contenido vía
    Ajax&lt;/h1&gt;

    &lt;div id="tabs"&gt;

    &lt;ul&gt;

    &lt;li&gt;&lt;a
    href="textos/olores.html"&gt;Olores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/colores.html"&gt;Colores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/sabores.html"&gt;Sabores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/sinergias.html"&gt;Sinergias&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Tabs_Manual-de-uso-basico/image4.png)

Vista de la carga de contenidos vía *Ajax*.

![] (./img/jQuery-UI-Tabs_Manual-de-uso-basico/image5.png)

Vista del control de errores en ejecución.

**Listado 3: Archivo colores.html**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Colores&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="tabs-2"&gt;

    &lt;h2 style="color: red"&gt;Colores fundamentales&lt;/h2&gt;

    &lt;ul&gt;

    &lt;li&gt;Rojo&lt;/li&gt;

    &lt;li&gt;Anaranjado&lt;/li&gt;

    &lt;li&gt;Amarillo&lt;/li&gt;

    &lt;li&gt;Verde&lt;/li&gt;

    &lt;li&gt;Azul&lt;/li&gt;

    &lt;li&gt;Añil&lt;/li&gt;

    &lt;li&gt;Violeta&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

    Listado 4: Archivo olores.html

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Olores&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="tabs-1"&gt;

    &lt;h2 style="color: red"&gt;Olores básicos&lt;/h2&gt;

    &lt;ul&gt;

    &lt;li&gt;Fragancia floral&lt;/li&gt;

    &lt;li&gt;Leñoso o resinoso&lt;/li&gt;

    &lt;li&gt;Frutal (no cítrico)&lt;/li&gt;

    &lt;li&gt;Cítrico&lt;/li&gt;

    &lt;li&gt;Olor químico&lt;/li&gt;

    &lt;li&gt;Mentolado o refrescante&lt;/li&gt;

    &lt;li&gt;Dulce&lt;/li&gt;

    &lt;li&gt;Quemado o ahumado&lt;/li&gt;

    &lt;li&gt;Descompuesto&lt;/li&gt;

    &lt;li&gt;Rancio&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

**Listado 5: Archivo sabores.html**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Sabores&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="tabs-3"&gt;

    &lt;h2 style="color: red"&gt;Teoría clásica de los tipos de
    sabores&lt;/h2&gt;

    &lt;p&gt;

    La teoría clásica reconoce la existencia de sólo cuatro sabores:
    amargo, ácido, dulce, salado.

    Al contrario de la creencia popular, cada uno de estos sabores no
    tiene asociado una zona específica de la lengua como
    sensor específico.

    Las papilas gustativas de toda la superficie de la lengua son
    sensibles y reconocen los cuatro sabores,

    si bien ciertos nervios tienden a responder mejor a uno u otro de
    estos estímulos alimentarios y pueden incluso reconocer otros
    sabores

    (el del hierro, el de la tierra). Los sensores de la lengua que
    detectan los sabores básicos del salado y el amargo se llaman
    canales iónicos.

    &lt;/p&gt;

    &lt;p&gt;Amargo&lt;/p&gt;

    &lt;p&gt;Ácido&lt;/p&gt;

    &lt;p&gt;Dulce&lt;/p&gt;

    &lt;p&gt;Salado&lt;/p&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

###Mostrar contenidos complementarios


Además del contenido de los paneles con pestañas, podemos incluir textos
varios en el documento, a modo de ejemplo ilustramos algunos
seguidamente.

En el Listado 6 se supone que partimos del Listado 1 y por simplicidad,
no mostramos aquella parte del código repetido y que alargaría demasiado
nuestra exposición.

Nuestros nuevos textos son y se mostrarán en –véase la figura adjunta-:

Un título de cabecera puede ser escrito como una etiqueta &lt;h1&gt;
antes del grupo &lt;div&gt; que contiene la definición de los paneles
con pestañas –tabs-.

El correspondiente al nombre de autoría que aparecerá abajo del texto de
cada panel, deberá ser escrito inmediatamente antes de &lt;/div&gt;, que
marca el final de las definiciones de los contenidos de los paneles.

El correspondiente al título al final –a modo de pie de página-, debe ir
inmediatamente después de &lt;/div&gt;.

Todo lo que escribamos seguidamente, irá como texto presente debajo de
las pestañas y será visible en todo momento.

**Listado 6: Mostrar contenido externo y fijo en todos los paneles.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Tabs - Ejemplo básico&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#tabs").tabs();

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body style="background-color: black"&gt;

    &lt;h1 style="color: white"&gt;jQuery UI Tabs - Ejemplo
    básico&lt;/h1&gt;

    &lt;div id="tabs"&gt;

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#tabs-1"&gt;Olores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#tabs-2"&gt;Colores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#tabs-3"&gt;Sabores&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    ...

    ...

    ...

    &lt;p style="font-size: small"&gt;©Jaime Peña Tresancos,
    2014&lt;/p&gt;

    &lt;/div&gt;

    &lt;p style="color: yellow"&gt;jQuery UI Tabs - Manual de
    uso&lt;/p&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Tabs_Manual-de-uso-basico/image6.png)

Pestañas con título de cabecera de página, pie de panel y pie de página.

###Conclusiones


En el presente artículo hemos repasado muchas de las funcionalidades del
componente *jQuery User Interface Tabs*. Con ellas creemos se está en
condiciones de implementar un sistema de paneles, cargar su contenido de
diversas maneras, controlar errores y posicionar textos complementarios
dentro y fuera del panel, siempre con un mínimo de codificación.

Esperamos que todo lo expuesto les haya servido de ayuda. Hasta nuestro
próximo artículo, felices horas de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




