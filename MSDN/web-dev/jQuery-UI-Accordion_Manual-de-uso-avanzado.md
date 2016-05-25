<properties
	pageTitle="jQuery UI Accordion. Manual de uso avanzado"
	description="rtículo está dedicado al componente Accordion"
	services="web-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="web-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>



#jQuery UI Accordion. Manual de uso avanzado

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


Este artículo está dedicado al componente *Accordion* y agrega
información a la dada en nuestro anterior trabajo:

[**jQuery UI Accordion. Manual de uso
básico.**](https://msdn.microsoft.com/es-es/library/mt574231.aspx)

En el presente hablaremos de:

Qué es y qué proporciona el jQuery User Interface Accordion

Los componentes esenciales para su implementación en una página Web

Habilitaciones y deshabilitaciones del componente.

Modelo colapsable, lo que permite mostrar sólo sus títulos, si contenido
desplegado.

Modelo de altura no automática, de tal forma que se ajuste al contenido.

###¿Qué es el jQuery User Interface Accordion?


En concreto, el componente *Accordion* se trata de un conjunto de
paneles colapsables, que contienen información que se despliega de forma
similar a como lo hacen los acordeones. Véanse los ejemplos propuestos y
las figuras adjuntas. Adviértase que el despliegue es en vertical, no en
horizontal como en los acordeones musicales.

El lugar de Internet de referencia y descarga del componente
*Accordion*, que es de lo que trataremos, es:

[**http://jqueryui.com/accordion/**](http://jqueryui.com/accordion/)

![] (./img/jQuery-UI-Accordion_Manual-de-uso-avanzado/image1.png)

Las capacidades que nos proporcionará las iremos desgranando en el
anterior y sucesivos artículos, a vuelapluma son:

Grupos de paneles desplegables con contenido HTML completo –con pestañas
con títulos-.

La adaptación a estilos predefinidos o más personalizados. Uso de temas.

Colapsables verticalmente –replegables y desplegables- por la acción de
un clic sobre la pestaña.

Habilitaciones y deshabilitaciones.

Diversos tipos de alturas automáticas o no.

Apertura mediante el pase del ratón sobre la pestaña.

Ordenables –movibles de posición por arrastre-.

###Habilitaciones y deshabilitaciones


Aquí trataremos dos posibilidades relacionadas con éste aspecto. La
primera se refiere a la presentación inicial como deshabilitado –o
habilitado si no se dice nada al respecto, es la opción por defecto-. La
segunda es la posibilidad de deshabilitar y habilitar el sistema de
acordeón al vuelo, una vez ya mostrada la página. Seguidamente veremos
cómo y lo ilustraremos con un ejemplo completo.

Si partimos con la opción *disabled*, puesta a *true*, hará que
inicialmente el sistema de presentación en acordeón sea mostrado, pero
sin poder cambiarse de pestañas –deshabilitado-.

Por otra parte, para cambiar al vuelo, disponemos además de dos métodos:

  Método      | Funcionalidad
  ----------- | ---------------------------------------------------------------------------------------------
  *disable*   | Deshabilitará el sistema de presentación en acordeón. Será atenuado en *Internet Explorer*.
  *enable*    | Restablecerá el sistema de presentación en acordeón.
  

El código del Listado 6, referente a las acciones de habilitación y
deshabilitación, consta esencialmente de lo que sigue:

Obsérvese que hemos dispuesto la opción *disabled* con un valor *true*
en la función de inicialización. Eso hará que al crearse la página el
acordeón estará desplegado, pero deshabilitado. Se mostrará la primera
pestaña con el panel desplegado, pero no podrá cambiarse.

Creamos también dos botones de comando que respectivamente habilitarán y
deshabilitarán el sistema de acordeón, mediante los métodos antes
comentados.

Nótense las respectivas funciones de respuesta *onclick*, programadas
inmediatamente debajo de la función de inicialización del componente
acordeón – en formato *jQuery*-.

**Listado 6: Opciones y métodos de habilitación y deshabilitación del componente acordeón**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Accordion - Disabled, enable &
    disable&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#accordion").accordion({

    disabled: true

    });

    });

    \$(function () {

    \$("\#habilitar").on('click', function () {

    \$('\#accordion').accordion('enable')

    })

    \$("\#deshabilitar").on('click', function () {

    \$('\#accordion').accordion('disable')

    })

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="accordion"&gt;

    &lt;h3&gt;Olores&lt;/h3&gt;

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

    &lt;h3&gt;Colores&lt;/h3&gt;

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

    &lt;h3&gt;Sabores&lt;/h3&gt;

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

    &lt;input type="button" id="habilitar" value="Habilitar" /&gt;

    &lt;input type="button" id="deshabilitar" value="Deshabilitar" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Accordion_Manual-de-uso-avanzado/image2.png)

Acordeón habilitado.

![] (./img/jQuery-UI-Accordion_Manual-de-uso-avanzado/image3.png)

Acordeón deshabilitado.

###Modelo colapsable


Nuevamente encontraremos dos posibilidades, una primera es la capacidad
de definir como colapsable o no –opción por defecto- el grupo de paneles
de acordeón durante su creación. La segunda es activar o desactivar
dicha opción al vuelo, una vez creada la página en el explorador.

Por colapsable entendemos que sólo se muestren las cabeceras de títulos,
sin ninguno desplegado, es decir, sin ser mostrado el contenido de
ningún panel hasta que se haga clic sobre su título para desplegarlo –y
correspondientemente para replegarlo de nuevo, colapsarlo-.

Por defecto, los acordeones se muestran siempre con un título
desplegado, el primero, los colapsables pueden tener todos los títulos
sin desplegar. Véanse las figuras adjuntas.

Veamos ahora las posibilidades disponibles en nuestro ejemplo del
Listado 7.

Con la opción *collapsible* puesta a *true* en la función de creación,
se hará que inicialmente el sistema en acordeón sea mostrado como
colapsable. Podremos colapsar todos los paneles y mostrar solamente los
títulos.

Creamos también dos botones de comando que respectivamente harán no
colapsable o nuevamente colapsable el sistema de acordeón.

Nótense las respectivas funciones de respuesta *onclick*, programadas
inmediatamente debajo de la función de inicialización del componente
acordeón – en formato *jQuery*-.

**Listado 7: Modo de habilitación y deshabilitación de un acordeón colapsable**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Accordion - Collapsible&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#accordion").accordion({

    collapsible: true

    });

    });

    \$(function () {

    \$("\#nocolapsable").on('click', function () {

    \$('\#accordion').accordion('option', 'collapsible', false)

    })

    \$("\#colapsable").on('click', function () {

    \$('\#accordion').accordion('option', 'collapsible', true)

    })

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="accordion"&gt;

    &lt;h3&gt;Olores&lt;/h3&gt;

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

    &lt;h3&gt;Colores&lt;/h3&gt;

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

    &lt;h3&gt;Sabores&lt;/h3&gt;

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

    &lt;input type="button" id="nocolapsable" value="No colapsable"
    /&gt;

    &lt;input type="button" id="colapsable" value="Colapsable" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Accordion_Manual-de-uso-avanzado/image4.png)

Inicialmente y en cualquier momento, podremos activar el modo
colapsable.

![] (./img/jQuery-UI-Accordion_Manual-de-uso-avanzado/image5.png)

Apariencia de un acordeón con todos los paneles colapsados.

###Modelo con altura no automática


Si optamos por el modo de presentación de altura no automática, hemos de
indicarlo explícitamente, dado que no es la opción por defecto.

La altura no automática ajustará el alto del panel al contenido o, en su
caso al total de la ventana del explorador si es que sus dimensiones son
mayores. En el caso de la altura automática, todos los paneles tendrán
la misma altura, la de aquel de mayor dimensión. Obsérvense las dos
figuras que se muestran seguidamente.

![] (./img/jQuery-UI-Accordion_Manual-de-uso-avanzado/image6.png)

Modo presentación de altura automática.

![] (./img/jQuery-UI-Accordion_Manual-de-uso-avanzado/image7.png)

Modo de presentación con altura no automática; la altura se ajustará al
contenido.

En el Listado 8 se muestra cómo fijar un modo de altura que se ajuste al
contenido –altura no automática- en el momento de la creación del
sistema de paneles en acordeón.

**Listado 8: Ajuste de altura al contenido, modo de altura no automática**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Accordion - No auto height&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#accordion").accordion({

    heightStyle: "content"

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="accordion"&gt;

    &lt;h3&gt;Olores&lt;/h3&gt;

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

    &lt;h3&gt;Colores&lt;/h3&gt;

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

    &lt;h3&gt;Sabores&lt;/h3&gt;

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

###Conclusiones


En el presente artículo hemos repasado funcionalidades avanzadas del
componente *jQuery User Interface Tabs*. Con ellas estaremos en
condiciones de implementar un sistema de paneles con habilitaciones y
deshabilitaciones, colapsable y altura ajustable –es decir, no
automática-.

Esperamos que todo lo expuesto les haya servido de ayuda. Hasta nuestro
próximo artículo, felices horas de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
