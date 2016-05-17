<properties
	pageTitle="jQuery UI Tabs. Manual de uso avanzado"
	description="Este artículo está dedicado al componente Tabs"
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


#jQuery UI Tabs. Manual de uso avanzado

©Jaime Peña Tresancos, 2015

Twitter:

@jpt219

LinkedIn: <span id="webProfileURL"
class="anchor"></span>*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*

Este artículo está dedicado al componente *Tabs* y complementa nuestro
anterior trabajo:

jQuery UI Tabs. Manual de uso básico.

En resumen, hablaremos de:

Aplicación de estilos personalizados

Efectos visuales durante su presentación

Paneles colapsables por clic sobre la pestaña

Paneles que se abre al pasar el ratón sobre su pestaña

Paneles reordenables por arrastre de su pestaña

Orientación de los paneles en vertical

###¿Qué es el jQuery User Interface Tabs?


Dentro del *jQuery User Interface* encontramos toda una serie de
elementos de programación de la interface de usuario preprogramados y
listos para ser integrados en nuestros proyectos HTML. Se trata de una
amplia biblioteca *JavaScript* que abarca desde efectos dinámicos, hasta
menús, calendarios, diálogos, etc.

El lugar de Internet de referencia y descarga del componente *Tabs*, que
es de lo que trataremos, es:

[**http://jqueryui.com/tabs/**](http://jqueryui.com/tabs/)

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image1.png)

Las capacidades que nos proporcionará las iremos desgranando en los
sucesivos epígrafes y en nuestro anterior artículo citado, a vuelapluma
son:

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

**NOTA**: En el presente artículo utilizaremos el método de carga de
contenidos mediante *Ajax*, que hemos expuesto en nuestro anterior
artículo:

**jQuery UI Tabs. Manual de uso básico.**

###Paneles colapsables


Se trata de paneles autocolapsables –replegables y desplegables- por la
acción de un clic sobre la pestaña. El primer clic mostrará el contenido
del panel de la pestaña si no es ya visible, los sucesivos clics ocultan
y vuelven a mostrar el contenido –repliegan y despliegan el panel en
sí-.

El dotarlos de dicha posibilidad es tan sencillo como especificar en la
creación la propiedad *collapsible: true*, véase el Listado 1.

**Listado 1: Paneles autocolapsables –replegables y desplegables- por
    la acción de un clic sobre la pestaña.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Tabs - Colapsables&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#tabs").tabs(

    { collapsible: true }

    );

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body style="background-color: black"&gt;

    &lt;h1 style="color: white"&gt;jQuery UI Tabs -
    Colapsables&lt;/h1&gt;

    &lt;div id="tabs"&gt;

    &lt;ul&gt;

    &lt;li&gt;&lt;a
    href="textos/olores.html"&gt;Olores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/colores.html"&gt;Colores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/sabores.html"&gt;Sabores&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image2.png)

Panel colapsable desplegado

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image3.png)

Panel colapsable replegado

###Apertura ante evento mouseover


Se trata de la apertura del panel mediante el pase del ratón sobre la
pestaña. La programación de dicho comportamiento es del todo simple.

El evento *mouseover* se programa –se activa- aludiendo a él durante la
creación del sistema de paneles, como se muestra en el Listado 2.

**Listado 2: Apertura del panel mediante el pase del ratón sobre
    la pestaña.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Tabs - Apertura 'mouseover'&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#tabs").tabs(

    { event: "mouseover" }

    );

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body style="background-color: black"&gt;

    &lt;h1 style="color: white"&gt;jQuery UI Tabs - Apertura
    'mouseover'&lt;/h1&gt;

    &lt;div id="tabs"&gt;

    &lt;ul&gt;

    &lt;li&gt;&lt;a
    href="textos/olores.html"&gt;Olores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/colores.html"&gt;Colores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/sabores.html"&gt;Sabores&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image4.png)

Éste panel se ha abierto simplemente al situar el puntero del ratón
sobre la pestaña.

###Paneles reordenables por arrastre


Los paneles, de no programarse nada contrario, mantienen entre sí una
posición prefijada en su diseño. Ahora de lo que se trataría es de poder
moverlos de posición –arrastrándolos por la pestaña del título- y así
ser reordenados a gusto del usuario.

Para proporcionar al sistema de dicha posibilidad, hemos de implementar
en la creación el método *sortable()*, como se recoge en el Listado 3.
Se indica el eje X, dado que la orientación de arrastre es horizontal y
se deberá refrescar la presentación una vez finalizado dicho arrastre.

**Listado 3: Paneles horizontales reordenables por arrastre con el ratón**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Tabs - Ordenables&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    var tabs = \$("\#tabs").tabs();

    tabs.find(".ui-tabs-nav").sortable({

    axis: "x",

    stop: function () {

    tabs.tabs("refresh");

    }

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body style="background-color: black"&gt;

    &lt;h1 style="color: white"&gt;jQuery UI Tabs -
    Ordenables&lt;/h1&gt;

    &lt;div id="tabs"&gt;

    &lt;ul&gt;

    &lt;li&gt;&lt;a
    href="textos/olores.html"&gt;Olores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/colores.html"&gt;Colores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/sabores.html"&gt;Sabores&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image5.png)

Reordenación de paneles al hacer clic y arrastrar por la pestaña…

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image6.png)

Soltándolo en la posición final que deseamos ocupe.

###Aplicación de estilos


Los estilos globales disponibles en el *jQuery UI* son denominados temas
y se pueden probar y descargar de la dirección URL:

[**http://jqueryui.com/themeroller/**](http://jqueryui.com/themeroller/)

Hasta el presente hemos estado utilizando el denominado *Smoothness*,
como se aprecia en los códigos de los diferentes listados; otros
ejemplos se listan seguidamente, junto con las figuras pertinentes de
los cambios de aspecto de los paneles.

&lt;link rel="stylesheet"
href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image7.png)

&lt;link rel="stylesheet"
href="//code.jquery.com/ui/1.11.2/themes/cupertino/jquery-ui.css"&gt;

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image8.png)

&lt;link rel="stylesheet"
href="//code.jquery.com/ui/1.11.2/themes/sunny/jquery-ui.css"&gt;

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image9.png)

Por otra parte, también cabe inmiscuirnos en los entresijos de los
estilos de los temas y cambiar aspectos particulares, personalizando
temas globales. Así en el Listado 4 se ha modificado parcialmente el
tema *Sunny*, en concreto:

Familia de fuente: Arial

Estilo de la fuente: itálica

Tamaño de la fuente: 1em

Color del contenido: rojo

**Listado 4: Aplicación de un estilo personalizado.**

```
    &lt;style&gt;

    .ui-widget {

    font-family: 'Arial', Gadget, sans-serif;

    font-style: italic;

    font-size: 1em;

    }

    .ui-widget-content {

    color: red;

    }

    &lt;/style&gt;

```

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image10.png)

Tema *Sunny*, parcialmente modificado.

###Acciones en apertura y cierre


En primer lugar, se dispone de las opciones de efectos:

*show*: acciones visuales de animación a realizar durante la apertura
del panel

*hide*: acciones visuales de animación a realizar durante el cierre del
panel

Uno de los parámetros es la propiedad *effect*, tipo de efecto, y otro
*duration*, período de la transición en milisegundos.

Respecto a los posibles efectos, estos pueden ser *blind*, *explode*,
*bounce*, …, véase la referencia completa en la dirección URL:

[**http://api.jqueryui.com/category/effects/**](http://api.jqueryui.com/category/effects/)

Otra cuestión es definir en la creación del sistema de paneles cual será
el panel mostrado –por defecto es el primero, el de valor 0-, mediante
la opción *active = panel a mostrar*. Nótese que como apuntamos se
comienza a contar en cero hasta número de paneles definidos menos uno.

También podemos definir la altura de los paneles, mediante la opción
*heightStyle* que puede tomar tres valores:

*auto*: todos los paneles tendrán la altura del panel más alto.

*fill*: expanden su altura hasta la altura máxima disponible.

*content*: sólo ocupan lo preciso para su contenido. Es el valor por
defecto.

Por último mostramos la opción *beforeLoad*, que se ejecuta
inmediatamente antes de la apertura del sistema de paneles por primera
vez. Puede servir para captura de errores –véase el apartado referente a
ese aspecto en nuestro anterior artículo- o para emitir algún mensaje,
como haremos en el ejemplo que sigue.

En el Listado 5 hemos implementado todas estas cosas:

Marcaremos que se habrá en el panel segundo (*active = 1*)

Con un estilo de altura que abarque el máximo disponible (*heightStyle :
"fill"*)

Se hará la apertura de paneles con un efecto visual determinado (*show*)

Y antes de mostrarse los paneles se emitirá una alerta (*beforeLoad*)

**Listado 5: Apartado del &lt;script&gt; que modifica aspectos de apertura y presentación de los paneles.**


```
    &lt;script&gt;

    \$(function () {

    \$("\#tabs").tabs(

    {

    active: 1,

    heightStyle: "fill",

    show: { effect: "blind", duration: 800 },

    beforeLoad: alert("Allá vamos\\ra la pestaña 2")

    }

    );

    });

    &lt;/script&gt;
```

###Paneles con orientación vertical


Si bien de modo directo no hay una opción para mostrar los paneles
verticalmente, con algo de estilo se solventará la opción de disposición
vertical.

En el Listado 6 hemos recogido lo especificado en la documentación
oficial del *jQuery UI* y lo aplicamos directamente a nuestro ejemplo
base de carga de contenidos mediante *Ajax*. Todo lo que hemos tenido
que hacer se resume en:

Crear las clases de estilo en el apartado *&lt;style&gt;*
correspondiente, tal como sugiere la documentación, sin ningún cambio.

Agregar dichas clases en la creación de los paneles, mediante el método
*addClass*.

Retirar algunas clases específicas de la disposición horizontal,
mediante el método *removeClass*. En concreto retiramos la alineación
*top* y la sustituimos por la *left*.

**Listado 6: Sistema de paneles con orientación vertical.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery UI Tabs - Ejemplo básico vertical&lt;/title&gt;

    &lt;link rel="stylesheet"
    href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"&gt;

    &lt;script
    src="//code.jquery.com/jquery-1.10.2.js"&gt;&lt;/script&gt;

    &lt;script
    src="//code.jquery.com/ui/1.11.2/jquery-ui.js"&gt;&lt;/script&gt;

    &lt;script&gt;

    \$(function () {

    \$("\#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");

    \$("\#tabs
    li").removeClass("ui-corner-top").addClass("ui-corner-left");

    });

    &lt;/script&gt;

    &lt;style&gt;

    .ui-tabs-vertical {

    width: 55em;

    }

    .ui-tabs-vertical .ui-tabs-nav {

    padding: .2em .1em .2em .2em;

    float: left;

    width: 12em;

    }

    .ui-tabs-vertical .ui-tabs-nav li {

    clear: left;

    width: 100%;

    border-bottom-width: 1px !important;

    border-right-width: 0 !important;

    margin: 0 -1px .2em 0;

    }

    .ui-tabs-vertical .ui-tabs-nav li a {

    display: block;

    }

    .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {

    padding-bottom: 0;

    padding-right: .1em;

    border-right-width: 1px;

    }

    .ui-tabs-vertical .ui-tabs-panel {

    padding: 1em;

    float: right;

    width: 40em;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body style="background-color: black"&gt;

    &lt;h1 style="color: white"&gt;jQuery UI Tabs - Ejemplo básico
    vertical&lt;/h1&gt;

    &lt;div id="tabs"&gt;

    &lt;ul&gt;

    &lt;li&gt;&lt;a
    href="textos/olores.html"&gt;Olores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/colores.html"&gt;Colores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a
    href="textos/sabores.html"&gt;Sabores&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-Tabs_Manual-de-uso-avanzado/image11.png)

Sistema de paneles con orientación vertical.

###Conclusiones


En el presente artículo hemos repasado muchas de las funcionalidades más
avanzadas del componente *jQuery User Interface Tabs*. Vimos desde cómo
adaptar estilos preconfigurados y cómo modificarlos, hasta presentar los
paneles en vertical, pasando por paneles colapsables, reordenables, …

Esperamos que todo lo expuesto les haya servido de ayuda. Hasta nuestro
próximo artículo, felices horas de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
