---
title: Web API II – Creando un CRUD, trabajando con verbos HTTP
description: Implementar fácilmente un CRUD
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#jQuery UI Accordion. Manual de uso básico

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


El *jQuery User Interface* contiene una gran cantidad de componentes y
complementos –plug-ins- que nos acercan a la programación de las
interfaces de usuario –menús, diálogos, calendarios, paneles, …-.

El componente *Accordion* es el objeto de este artículo introductorio.

Posteriormente, continuaremos con su estudio en nuestro artículo:

jQuery UI Accordion. Manual de uso avanzado.

En resumen, hablaremos de:

Qué es y qué proporciona el jQuery User Interface Accordion.

Los componentes esenciales para su implementación en una página Web.

Una implementación estándar de un acordeón, con contenido enriquecido.

La modificación de su apariencia, con la aplicación de estilos diversos
mediante temas de jQuery User Interface.

###¿Qué es el jQuery User Interface Accordion?


En concreto, el componente *Accordion* consta de un conjunto de paneles
colapsables, que contienen información que se despliega de forma similar
a como lo hacen los acordeones. Véanse los ejemplos propuestos y las
figuras adjuntas. Adviértase que el despliegue es en vertical, no en
horizontal como en los acordeones musicales.

El lugar de Internet de referencia y descarga del componente
*Accordion*, que es de lo que trataremos, es:

[**http://jqueryui.com/accordion/**](http://jqueryui.com/accordion/)


![] (./img/jQuery-UI-Accordion-Manual-de-uso-básico/image1.png)

Las capacidades que nos proporcionará las iremos desgranando en los
sucesivos artículos, a vuelapluma son:

- Grupos de paneles desplegables con contenido HTML completo –con pestañas
con títulos-.

- La adaptación a estilos predefinidos o más personalizados. Uso de temas.

- Colapsables verticalmente –replegables y desplegables- por la acción de
un clic sobre la pestaña.

- Habilitaciones y deshabilitaciones.

- Diversos tipos de alturas automáticas o no.

- Apertura mediante el pase del ratón sobre la pestaña.

- Ordenables –movibles de posición por arrastre-.

###Un primer grupo de paneles básico


Nuestro primer ejemplo no será muy ambicioso, se trata de ilustrar un
simple grupo de paneles de acordeón con pestañas con títulos. El
contenido de cada panel se mostrará al hacerse clic sobre la pestaña
correspondiente.

El conjunto de paneles se codifica de forma muy simple en el propio
documento HTML en que se concreta el acordeón. Se define por parejas de
apartados del documento HTML; el primero contiene el título, el segundo
el texto o contenido en general del panel y así sucesivamente. Véase el
Listado 1.

El identificador del elemento &lt;div id="identificador"&gt; en que se
encuentra todo este conjunto de parejas se pasa a la función *accordion*
de *jQuery UI*, que inicializará el sistema, de la forma:

*\$(function () { \$("\#identificador").accordion(); });*

El código de nuestro ejemplo es el del Listado 1 y se comentará
seguidamente.

**Listado 1: Código ejemplo de un grupo de paneles básico**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Accordion - Default
    funcionality&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#accordion").accordion();

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="accordion"&gt;

    &lt;p&gt;Pestaña 1&lt;/p&gt;

    &lt;p&gt;Contenido de texto 1.&lt;/p&gt;

    &lt;p&gt;Pestaña 2&lt;/p&gt;

    &lt;p&gt;Contenido de texto 2.&lt;/p&gt;

    &lt;p&gt;Pestaña 3&lt;/p&gt;

    &lt;p&gt;Contenido de texto 3.&lt;/p&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```


![] (./img/jQuery-UI-Accordion-Manual-de-uso-básico/image1.png)

Si repasamos el código nos encontramos, por orden secuencial:

- Al comienzo del documento, en la etiqueta &lt;head&gt;, insertaremos las
bibliotecas CSS y *jQuery* y los códigos correspondientes.

- La referencia a la hoja de estilos del *User Interface* de *jQuery*
***jquery-ui.css***

- Debe ser la primera de las bibliotecas *CSS* referenciadas en el
documento.

- La referencia a la biblioteca ***jQuery* general *jquery-x.x.x.js***

- Debe ser la primera de las bibliotecas *JavaScript* referenciadas en el
documento.

- La referencia a la biblioteca *User Interface* de *jQuery*
***jquery-ui.js***

- Una función de inicialización del grupo de *Accordion* –paneles con
pestañas-. ***\$("\#accordion").accordion();***

Que, como vemos, toma el elemento al que va asociado y la función sin
parámetros, sin más.

En el cuerpo del documento, etiqueta &lt;body&gt; irá el resto de
elementos HTML, entre ellos la definición del grupo de paneles:
***&lt;div id="accordion"&gt;***

###Un ejemplo más completo y funcional


En el Listado 2 ilustramos un ejemplo más completo y funcional.

Observará que todo lo referente a las bibliotecas y llamada a función de
creación es lo mismo que en el Listado 1; pero es algo más sofisticada
la definición de los paneles, utilizando etiquetas &lt;p&gt; y
&lt;div&gt;, alternativamente, para los títulos y contenidos –mucho más
complejos-.

Es muy habitual que se utilicen etiquetas &lt;h2&gt; o &lt;h3&gt; para
acotar la definición de los títulos y así se muestren de una forma
destacada en el caso que no funcione correctamente el componente
*Accordion*. Así hemos hecho en el Listado 6, a modo de ejemplo
alternativo.

**Listado 2: Código ejemplo de un grupo de paneles algo más complejos**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Accordion - Default
    funcionality&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#accordion").accordion();

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="accordion"&gt;

    &lt;p&gt;Olores&lt;/p&gt;

    &lt;div&gt;

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

    &lt;p&gt;Colores&lt;/p&gt;

    &lt;div&gt;

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

    &lt;p&gt;Sabores&lt;/p&gt;

    &lt;div&gt;

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

    (el del fierro, el de la tierra). Los sensores de la lengua que
    detectan los sabores básicos del salado y el amargo se llaman
    canales iónicos.

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


![] (./img/jQuery-UI-Accordion-Manual-de-uso-básico/image2.png)

###Aplicación de estilos. Temas


Como en todos los componentes del *jQuery User Interface*, podremos
personalizar la apariencia con la aplicación de temas. De hecho ya lo
hemos estado haciendo hasta el presente al utilizar la hoja de estilos
con el tema *Smoothness*.

En los listados que siguen se proponen otros estilos diferentes de
temas; obsérvese que simplemente se tratará de cambiar el archivo de
hoja de estilos que deseemos utilizar, por lo demás el código restante
no varía.

Los posibles temas disponibles se pueden consultar en la dirección URL:

[**http://jqueryui.com/themeroller/**](http://jqueryui.com/themeroller/)

**Listado 3: Cabecera del documento, conteniendo la referencia del
    tema Cupertino.**

```

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Accordion - Default
    funcionality&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/cupertino/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#accordion").accordion();

    });

    &lt;/script&gt;

    &lt;/head&gt;

```


![] (./img/jQuery-UI-Accordion-Manual-de-uso-básico/image3.png)

Apariencia utilizando el tema *Cupertino*.

**Listado 4: Cabecera del documento, conteniendo la referencia del
    tema Sunny.**

```

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Accordion - Default
    funcionality&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/sunny/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#accordion").accordion();

    });

    &lt;/script&gt;

    &lt;/head&gt;

```


![] (./img/jQuery-UI-Accordion-Manual-de-uso-básico/image4.png)

Apariencia utilizando el tema *Sunny*.

**Listado 5: Cabecera del documento, conteniendo la referencia del
    tema Vader.**

```

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Accordion - Default
    funcionality&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/vader/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#accordion").accordion();

    });

    &lt;/script&gt;

    &lt;/head&gt;

```


![] (./img/jQuery-UI-Accordion-Manual-de-uso-básico/imag5.png)

Apariencia utilizando el tema *Vader*.

###Conclusiones


En el presente artículo hemos repasado algunas de las funcionalidades
del componente *jQuery User Interface Accordion*. Con ellas creemos se
está en condiciones de implementar un sistema de paneles y cargar su
contenido, con un mínimo de codificación. También hemos visto cómo
aplicar diferentes temas, para así adaptar su apariencia a nuestras
preferencias.

Esperamos que todo lo expuesto les haya servido de ayuda. Hasta nuestro
próximo artículo, felices horas de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




