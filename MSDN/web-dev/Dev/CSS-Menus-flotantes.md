---
title: CSS. Menús flotantes
description: CSS. Menús flotantes
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#CSS. Menús flotantes

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  

Muchas son las propuestas para insertar menús en nuestras páginas Web,
típicamente se han utilizado desde simples esquemas con hipervínculos,
listas numeradas, rutinas en *JavaScript*, *applets* de *Java*,
*plug-ins* de *Abobe Flash*, … por citar algunas soluciones populares.

En el presente artículo presentamos una alternativa que consideramos
solvente y muy eficiente en varios aspectos, como su apariencia
totalmente personalizable y facilidad de programación, o como en el
escaso sobrecosto que puede suponer para el transito a través de
Internet, tanto en tamaño, como en código potencialmente peligroso. Lo
que entraría en el ámbito más general de la optimización de código HTML.

Nos basaremos en la aplicación de estilos a listas no ordenadas de
entradas con hipervínculos –que serán las opciones del menú resultante-,
convirtiendo dichas listas en verdaderos menús flotantes, con la toda la
apariencia y prestaciones de los habitualmente utilizados.

A modo de resumen, trataremos:

La aplicación de los estilos básicos para la conversión en un menú

Control de anchos, fuentes y cursores

Menús horizontales y verticales

Menús con efectos de bordeados, sombras, centrados y demás

 

###El punto de partida, una lista no ordenada, sin más

El punto de partida es una lista no ordenada, como por ejemplo la
mostrada en el Listado 1 y en la figura adjunta.

Las opciones de menú serán finalmente aquellas entradas de las listas
que contienen los hipervínculos asociados.

**Listado 1: Lista no ordenada que nos servirá de base para el
   menú flotante.**


```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;title&gt;Menús flotantes, sólo esquema&lt;/title&gt;

    &lt;meta http-equiv="content-type" content="text/html;
    charset=utf-8" /&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;

    &lt;ul&gt;

    &lt;li&gt;Dante

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#11"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#12"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#13"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Shakespeare

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#21"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#22"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#23"&gt;Obras teatrales&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;Varios

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#241"&gt;Obras menores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#242"&gt;Obras críticas&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;&lt;a href="\#25"&gt;Referencias&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Balzac

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#31"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#32"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#33"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Quevedo

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#31"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#32"&gt;Obra teatral&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#33"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/CSS-Menus-flotantes/image1.png)

###Pasar del esquema al menú flotante


Ahora nos toca de hacer algunas labores de aplicación de estilos, tal
como se muestra en el Listado 2, que darán como resultado lo mostrado en
la figura que sigue. La apariencia será ya la de un menú desplegable
horizontal. Será la base de una maqueta de menú flotante.

No muy atractivo por el momento, pero eso es otro cantar del que nos
ocuparemos más adelante.

**Listado 2: Aplicación de estilos mínimos necesarios para maquetar el
   menú flotante.**


```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;title&gt;Menús flotantes&lt;/title&gt;

    &lt;meta http-equiv="content-type" content="text/html;
    charset=utf-8" /&gt;

    &lt;style&gt;

    /\* Retirar el formato de boliches \*/

    \#menu, \#menu ul {

    list-style: none;

    }

    /\* Poner en horizontal \*/

    \#menu li {

    float: left;

    margin-right: 1em;

    }

    /\* Pero mantener los submenús en vertical \*/

    \#menu ul li {

    float: none;

    }

    /\* Ocultar los submenus \*/

    \#menu ul {

    display: none;

    }

    /\* Y hacerlos visibles al pasar por encima ... \*/

    \#menu li:hover ul {

    display: block;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div style="position: absolute; top: 20px; left: 0px; z-index:
    100"&gt;

    &lt;ul id="menu"&gt;

    &lt;li&gt;Dante

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#11"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#12"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#13"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Shakespeare

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#21"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#22"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#23"&gt;Obras teatrales&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;Varios

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#241"&gt;Obras menores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#242"&gt;Obras críticas&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;&lt;a href="\#25"&gt;Referencias&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Balzac

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#31"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#32"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#33"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Quevedo

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#31"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#32"&gt;Obra teatral&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#33"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/CSS-Menus-flotantes/image2.png)

Los puntos esenciales se observan en los comentarios del código y son un
conjunto de estilos aplicados a los elementos de la lista:

- Primero retiramos los boliches de la etiqueta *ul*

- En segundo lugar orientamos horizontalmente con el estilo:

        *float: left;*

- Aunque deberemos mantener verticales los elementos –nodos- hijos *ul
    li* con el estilo:

        *float: none;*

- Seguidamente ocultamos los submenús –elementos *li*- con el estilo:

        *display: none;*

- Y, finalmente, hacemos que se hagan visibles al pasar el puntero del
    ratón sobre las etiquetas del menú, con:

        *display: block;*


En el anterior menú nos encontramos con dos problemas importantes, al no
estar fijado un ancho, las entradas de cabecera se mueven para hacer
sitio a las opciones de menú cuando se despliegan –efecto acordeón-; a
la vez, las separaciones son irregulares y otro mal aspecto lo
proporcionan los subrayados de los hiperenlaces.

Tampoco es atractivo que el puntero del ratón tome el aspecto de un
cursor sobre textos al pasar sobre las cabeceras, en vez de una flecha,
mucho más apropiado. Aprovechamos también para dar formato a las fuentes
de texto.

###Fijación de anchos, formato de fuentes y cursor

En el Listado 3, por tanto, hemos mejorado un poco el aspecto de nuestro
menú desplegable, como puede verse en la figura que le sigue. Ha sido
nuevamente una labor de aplicación de estilos:

- Para empezar, aplicamos estilos de fuentes, color y sombreados; algo
   de apariencia más agradable:

        *font: 1em Verdana, Geneva, Tahoma, sans-serif;*

        *text-shadow: 1px 1px \#808080;*

        *color: \#F00;*

- Pasamos a resolver el problema del ancho variable con el estilo
    aplicado al elemento *li*:

        *width: 8em;*

- El efecto de subrayado del hiperenlace se resuelve quitándole todo
    tipo de decoración al elemento *a*:

        *text-decoration: none;*

- Por último, la apariencia del cursor la fijamos con:

        *cursor: default;*



**Listado 3: Aplicación de estilos adicionales para determinar anchos,
    cursor y formato de fuentes.**


```
    &lt;style&gt;

    /\* Retirar el formato de boliches \*/

    \#menu, \#menu ul {

    list-style: none;

    /\* Le damos un poco de estilo ;-) \*/

    font: 1em Verdana, Geneva, Tahoma, sans-serif;

    text-shadow: 1px 1px \#808080;

    color: \#F00;

    }

    /\* Quítamos el subrayado al hiperenlace \*/

    \#menu a {

    text-decoration: none;

    }

    /\* Poner en horizontal \*/

    \#menu li {

    float: left;

    margin-right: 1em;

    /\* Fijar un ancho \*/

    width: 8em;

    /\* Fijar el puntero estándar tipo flecha \*/

    cursor: default;

    }

    /\* Pero mantener los submenús en vertical \*/

    \#menu ul li {

    float: none;

    }

    /\* Ocultar losw submenus \*/

    \#menu ul {

    display: none;

    }

    /\* Y hacerlos visibles al pasar por encima ... \*/

    \#menu li:hover ul {

    display: block;

    }

    &lt;/style&gt;

```

![] (./img/CSS-Menus-flotantes/image3.png)

###Convertir el menú en uno vertical


Muy sencillo es convertir el menú en uno vertical, bastará con retirar
–o simplemente comentar- el estilo:

*float: left;*

del nodo *li*, al comienzo de la definición de los estilos –etiqueta
&lt;styile&gt;…&lt;/&lt;style&gt;- o del archivo CSS. Véase el Listado 4
y su efecto en la figura adjunta.

**Listado 4: Modificación para convertir el menú flotante horizontal
    en uno vertical.**


```
    /\* Poner en horizontal/vertical \*/

    \#menu li {

    /\* Para pasar a vertical, comentamos ... \*/

    /\* float: left; \*/

    margin-right: 1em;

    /\* Fijar un ancho \*/

    width: 8em;

    /\* Fijar el puntero estándar \*/

    cursor: default;

    }

```

![] (./img/CSS-Menus-flotantes/image4.png)

###Efectos complementarios de fondos y demás


En lo que sigue aprovechamos para separar los estilos de la definición
del menú –en un archivo CSS- de la propia definición de este –en el
archivo HTML-.

Las mejoras introducidas en el nuevo menú podríamos definirlas como
cosméticas pero importantes para muchas aplicaciones; lo más destacable
es:

- En el nodo *li* hemos:

- Dotado de bordes a las etiquetas

- Centrado el texto de las etiquetas

- En los nodos *link*, *visited*, *hover* y *active* de la etiqueta
    *a* les hemos fijado colores y fondos particulares, para crear
    efectos variados según sus estados

- En el nodo *ul li* también hemos creado un bordeado y fondo
    particular –diferenciado deaquel del nodo *li* anterior-


En el Listado 5 se recoge la hoja de estilos –archivo CSS- que se
necesitaría para crear cualquier menú y que deberemos incluir en el
documento HTML, por ejemplo en el recogido en el Listado 6.

Hemos procurado que sea una hoja de estilos suficientemente
autoexplicativa, como para que se pueda seguir paso a paso su contenido.
A su vez, debería poder utilizarse como una especie de *plug-in* en
nuestros desarrollos.

**Listado 5: Archivo de hoja de estilos CSS de nuestro menú
    flotante final.**


```
    \#menu, \#menu ul {

    font: 1em Verdana, Geneva, Tahoma, sans-serif;

    list-style: none;

    }

    \#menu li {

    /\* Para menú horizontal: \*/

    float: left;

    /\* ---------------------\*/

    width: 10em;

    background-color: \#C2C6CC;

    color: \#0E1722;

    text-align: center;

    border: 0 none transparent;

    border-top: .25em solid \#FFFFFF;

    border-bottom: .25em solid \#FFFFFF;

    margin-right: 1em;

    cursor: default;

    }

    \#menu a {

    display: block;

    text-decoration: none;

    }

    \#menu a:link {

    color: \#B80000;

    }

    \#menu a:visited {

    color: \#222222;

    }

    \#menu a:hover {

    background-color: \#B80000;

    color: \#C6C6FF;

    }

    \#menu a:active {

    background-color: \#222222;

    color: \#C6C6FF;

    }

    \* html \#menu a {

    width: 100%;

    }

    \#menu ul {

    display: none;

    padding: 0;

    }

    \#menu ul li {

    border: 0 none transparent;

    border-top: .25em solid \#FFFFFF;

    border-bottom: .25em solid \#FFFFFF;

    border-left: 100px solid \#FFFFFF;

    background-color: \#C6C6FF;

    margin-bottom: -2px;

    margin-top: 2px;

    padding-left: 0px;

    }

    \#menu li:hover ul {

    display: block;

    }

```

**Listado 6: Archivo HTML de nuestra página ejemplo con el menú
    flotante final.**


```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;title&gt;Menús flotantes&lt;/title&gt;

    &lt;meta http-equiv="content-type" content="text/html;
    charset=utf-8" /&gt;

    &lt;link rel="stylesheet" type="text/css"
    href="menus-horizontal.css" /&gt;

    &lt;style&gt;

    p.poesia {

    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

    font-style: italic;

    font-variant: normal;

    font-weight: bold;

    font-size: medium;

    color: darkblue;

    line-height: 110%;

    }

    p.center {

    text-align: center;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div style="position: absolute; top: 20px; left: 0px; z-index:
    100"&gt;

    &lt;ul id="menu"&gt;

    &lt;li&gt;Dante

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#11"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#12"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#13"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Shakespeare

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#21"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#22"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#23"&gt;Obras teatrales&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;Varios

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#241"&gt;Obras menores&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#242"&gt;Obras críticas&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;&lt;a href="\#25"&gt;Referencias&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Balzac

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#31"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#32"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#33"&gt;Narrativa&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;li&gt;Quevedo

    &lt;ul&gt;

    &lt;li&gt;&lt;a href="\#31"&gt;Biografía&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#32"&gt;Obra teatral&lt;/a&gt;&lt;/li&gt;

    &lt;li&gt;&lt;a href="\#33"&gt;Obra poética&lt;/a&gt;&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;div style="position: relative; top: 30px; left: 250px; margin:
    60px"&gt;

    &lt;h2&gt;Saludo a Beatriz &lt;span style="font-size: smaller"&gt;de
    Dante Alighieri&lt;br /&gt;

    &lt;span style="font-size: smaller"&gt;(Traducción de Clemente
    Althaus)&lt;/span&gt;&lt;/span&gt;&lt;/h2&gt;

    &lt;p class="poesia"&gt;

    Tan honesta parece y tan hermosa&lt;br /&gt;

    mi casta Beatriz cuando saluda,&lt;br /&gt;

    que la lengua temblando queda muda&lt;br /&gt;

    y la vista mirarla apenas osa.&lt;br /&gt;

    &lt;br /&gt;

    Ella se va benigna y humillosa&lt;br /&gt;

    y oyéndose loar, rostro no muda&lt;br /&gt;

    y quien la mira enajenado duda&lt;br /&gt;

    si es visión o mujer maravillosa.&lt;br /&gt;

    &lt;br /&gt;

    Muéstrase tan amable a quien la mira&lt;br /&gt;

    que al alma infunde una dulzura nueva&lt;br /&gt;

    que solo aquél que la sintió la sabe.&lt;br /&gt;

    &lt;/p&gt;

    &lt;/div&gt;

    &lt;p class="center"&gt;

    &lt;a href="http://jigsaw.w3.org/css-validator/check/referer"&gt;

    &lt;img style="border: 0; width: 88px; height: 31px"

    src="http://jigsaw.w3.org/css-validator/images/vcss"

    alt="¡CSS Válido!" /&gt;

    &lt;/a&gt;

    &lt;a href="http://www.w3.org/html/logo/"&gt;

    &lt;img
    src="http://www.w3.org/html/logo/badge/html5-badge-h-css3-semantics.png"

    width="165" height="64" alt="HTML5 Powered with CSS3 / Styling, and
    Semantics"

    title="HTML5 Powered with CSS3 / Styling, and Semantics"&gt;

    &lt;/a&gt;

    &lt;span style="font-size: xx-small"&gt;&copy;Jaime Peña Tresancos,
    2012&lt;/span&gt;

    &lt;/p&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/CSS-Menus-flotantes/image5.png)

![] (./img/CSS-Menus-flotantes/image6.png)

###Conclusiones


Hemos visto como partiendo de una lista no ordenada, la conversión en un
menú flotante es una labor de aplicación de estilos –o al menos no tiene
porqué ser más que eso-, con todas las ventajas que supone de
optimización de código en cuanto a calidad, peso y seguridad.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2013**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




