---
redirect_url: https://docs.microsoft.com/
title: Vídeo WebVTT. Una introducción a los subtítulos
description: Vídeo WebVTT. Una introducción a los subtítulos
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Vídeo WebVTT. Una introducción a los subtítulos


Por ©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696) 


Hasta el momento la única solución para la subtitulación de vídeo en la
Web era la inserción de éstos en el propio canal de vídeo o bien
utilizar *plug-ins* externos para mostrar el vídeo y los subtítulos.

HTML5 nos proporciona la capacidad de ejecutar vídeo sin la necesidad de
dichos *plug-in* externos y también ahora está en fase de desarrollo
avanzado la etiqueta &lt;track&gt; para la inclusión de pistas de texto
–y mucho más-, para la subtitulación, a ello dedicamos el presente
artículo.

A modo de resumen, trataremos:

- La etiqueta &lt;track&gt; de HTML5

- El formato de archivo VTT

- Gestión de subtítulos en múltiples idiomas

- Temporalización de subtítulos

- Subtítulos anidados

- Subtitulado *inline*

###Vídeo en HTML5 de partida

Para seguir este artículo suponemos de que se conoce lo esencial de la
inserción de vídeos mediante HTML5; de cualquier manera, si no fuese
así, podrá encontrarse la referencia oficial por parte del W3C, *World
Wide Web Consortium*, en la dirección URL:

**http://www.w3.org/wiki/HTML/Elements/video**

Partiremos de un código mínimo como el mostrado en el Listado 1, que sin
más nos muestra un vídeo en formato MP4, con todo el conjunto de
controles de reproducción y visualización –volumen, pausa, …-.

Listado 1: Código de inserción de un vídeo en HTML5, incluyendo el
conjunto de controles de reproducción y visualización

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Vídeo HTML 5&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;h2&gt;Vídeo HTML 5&lt;/h2&gt;

    &lt;video controls&gt;

    &lt;source src="blackhole.mp4" type="video/mp4"&gt;

    &lt;/video&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

![] (./img/Video-WebVTT/image1.png)

###El WebVTT API

El formato *WebVTT* de *Web Video Text Tracks Format*, se encuentra aún
en fase borrador –*Working Draft*- por parte del W3C y tiene por misión
la inclusión de pistas de texto en los vídeos de páginas Web; muy
similar al formato SRT utilizado para los subtítulos de películas en
archivos de vídeo tipo DivX y otros.

**NOTA**: Todo lo aquí expuesto es conforme con el borrador de 15 de abril de
2013.

Todo lo referente al estado actual de la especificación del formato
*WebVTT* puede consultarse en la siguiente dirección URL, perteneciente
al *W3C*:

**http://dev.w3.org/html5/webvtt/**

![] (./img/Video-WebVTT/image2.png)

La inserción de pistas de texto se basa en la inclusión de la etiqueta
&lt;track&gt; de la forma:

```

    1.  &lt;video&gt;

    &lt;source …&gt;

    &lt;track …&gt;

    &lt;/video&gt;
```

Los atributos de la etiqueta &lt;track&gt; son:

  Atributo    |Descripción
  ----------- |---------------------------------------------------------------------------------------------------------------------------------------------------
  *src*       |Es el atributo HTML que apunta al archivo VTT que contiene los subtítulos u otros.
  *default*   |Si alguna pista de texto lo contiene, esa será la pista mostrada por defecto.
  *label*     |El título que identificará la pista de texto, por ejemplo en el menú de selección de subtítulos.
  *kind*      |Identifica el tipo de archivo VTT de que se trata:              
              |*captions*: Títulos o leyendas, pueden contener además de textos, efectos de sonido y audio              
              |*chapters*: Capítulos, indica que el recurso contenido en *src* contiene información para navegación en el vídeo              
              |*descriptions*: Descripciones, indica que el contenido en *src* contiene texto que será mostrado cuando no esté disponible el componente de vídeo             
              |*metadata*: Metadatos de diferente tipo, contenidos en *src*            
              |*subtitles*: Subtítulos de texto
  *scrlang*   |Se trata del código del lenguaje del texto de los subtítulos.
              |Sólo se requiere si el archivo es de tipo *subtitles*.
  
En el Listado 2 se muestra un ejemplo sencillo de utilización, para la
inclusión de subtítulos de un vídeo MP4, en el Listado 3 se muestra
–antes lo comentaremos- el correspondiente archivo de subtítulos.

**Listado 2: Uso de la etiqueta &lt;track&gt; para la inclusión de
    subtítulos en HTML5**

```

&lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Vídeo WebVTT&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;h2&gt;Vídeo WebVTT&lt;/h2&gt;

    &lt;video controls&gt;

    &lt;source src="blackhole.mp4" type="video/mp4"&gt;

    &lt;track label="Subtítulos en español" kind="subtitles"
    srclang="es"

    src="subtitles-es.vtt" default&gt;

    &lt;/video&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

El formato del archivo de pista de texto –subtítulos en formato VTT-,
debe cumplir las siguientes condiciones:

- El texto debe ser codificado como UTF-8

- U-na cabecera con el texto *WEBVTT*

- Seguida de una línea en blanco

- Un indicador de la pista –una especie de etiqueta-. Es opcional y será
ignorado

Seguida de la referencia de tiempo inicial y final en el formato:
 

    \[hh:\]mm:ss.sss --&gt; \[hh:\]mm:ss.sss

Inmediatamente después vendría la línea con el texto
 

Resumiendo, un archivo sencillo sería de la forma:

```
    WEBVTT

    &lt;espacio en blanco&gt;

    \[Indicador o etiqueta\]

    \[hh:\]mm:ss.sss --&gt; \[hh:\]mm:ss.sss
    
    Texto del subtítulo
 
```


**Listado 3**: El correspondiente archivo de subtítulos VTT
–*subtitles-es.vtt-*


```
    WEBVTT

    Cue-1

    00:00:10.000 --&gt; 00:00:25.000
```

Una estrella lejana es devorada por un agujero negro...

![] (./img/Video-WebVTT/image3.png)

###Múltiples subtítulos


La inclusión de múltiples subtítulos es muy simple. Se trata de insertar
repetidas etiquetas &lt;track&gt; con las referencias correspondientes.

En el Listado 4 se recoge un ejemplo de múltiples subtítulos, en
español, inglés, francés y alemán, en el que se ha definido el primero
como predeterminado. Para mostrar cualquiera de los otros, hemos de
desplegar el menú de subtítulos del reproductor y seleccionarlo, como se
puede observar en las figuras adjuntas.

**Listado 4: Ejemplo de documento HTML5 con múltiples subtítulos
    WebVTT**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Vídeo WebVTT&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;h2&gt;Vídeo WebVTT&lt;/h2&gt;

    &lt;video controls&gt;

    &lt;source src="blackhole.mp4" type="video/mp4"&gt;

    &lt;track label="Subtítulos en español" kind="subtitles"
    srclang="es"

    src="subtitles-es.vtt" default&gt;

    &lt;track label="English subtitles" kind="subtitles" srclang="en"

    src="subtitles-en.vtt"&gt;

    &lt;track label="Français sous-titres" kind="subtitles" srclang="fr"

    src="subtitles-fr.vtt"&gt;

    &lt;track label="Deutsch Untertitel" kind="subtitles" srclang="de"

    src="subtitles-de.vtt"&gt;

    &lt;/video&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Video-WebVTT/image4.png)

![] (./img/Video-WebVTT/image5.png)

###Subtitulado multisección


Entendemos por ello el que será el modo habitual de subtitulado, crear diferentes secciones temporales, encada una de las cuales se mostrará un subtitulado diferente. Por ejemplo, notorio sería el caso de un diálogo o de un relato de un suceso temporal.

Habíamos visto en el apartado anterior el modo más simple de crear un
archivo de subtítulos, ahora se trata de extenderlo de manera que cada
sección temporal vaya separada de la anterior por una línea en blanco y
contenga:

Un indicador de la pista –una especie de etiqueta-. Es opcional y será
ignorado

Seguida de la referencia de tiempo inicial y final en el formato:

    \[hh:\]mm:ss.sss --&gt; \[hh:\]mm:ss.sss

Inmediatamente después vendría la línea con el texto

Y así sucesivamente, siempre con la línea en blanco por el medio.

```
    WEBVTT

    &lt;espacio en blanco&gt;

    \[Indicador o etiqueta\]

    \[hh:\]mm:ss.sss --&gt; \[hh:\]mm:ss.sss

    Texto del subtítulo

    &lt;espacio en blanco&gt;

    \[Indicador o etiqueta\]

    \[hh:\]mm:ss.sss --&gt; \[hh:\]mm:ss.sss

    Texto del subtítulo
```


Como se observa en el Listado 5, hemos incluido tres secciones
temporales, que se mostrarán entre los segundos 0 al 8, 8 al 15 y 15 al
25, sucesivamente.

**Listado 5**: Un archivo de subtítulos con múltiples secciones
temporales

>C\#

```

    1.  WEBVTT

    Cue-1

    00:00:00.000 --&gt; 00:00:08.000

    Una estrella lejana se acerca ...

    Cue-2

    00:00:08.000 --&gt; 00:00:15.000

    a un gran agujero negro ...

    Cue-3

    00:00:15.000 --&gt; 00:00:25.000

    y es totalmente devorada ...

```

![] (./img/Video-WebVTT/image6.png)

![] (./img/Video-WebVTT/image7.png)

![] (./img/Video-WebVTT/image8.png)

###Subtitulado anidado


También podremos hacer que los subtítulos se solapen temporalmente, que
estén anidados, de manera que cuando otro aparezca, el anterior aun
permanezca en pantalla.

Se trata simplemente de solapar los tiempos. Si nos fijamos en el
Listado 6, el primer subtítulo se extiende desde cero a 25 segundos y
los otros dos subtítulos aparecerán, el primero, desde el segundo 8 al
15 y desaparecerá y el segundo de 15 al 25, como se observa también en
las figuras adjuntas.

**Listado 6**: Subtitulado múltiple y anidado

```

    WEBVTT

    Cue-1

    00:00:00.000 --&gt; 00:00:25.000

    Una estrella lejana se acerca ...

    Cue-2

    00:00:08.000 --&gt; 00:00:15.000

    a un gran agujero negro ...

    Cue-3

    00:00:15.000 --&gt; 00:00:25.000

    y es totalmente devorada ...

```

![] (./img/Video-WebVTT/image8.png)

![] (./img/Video-WebVTT/image9.png)

![] (./img/Video-WebVTT/image10.png)

###Temporalización inline


La temporalización *inline* es una opción avanzada que, por el momento,
no está plenamente soportada por ningún navegador, pero que tratamos
ahora por su interés intrínseco.

Se trata de definir etiquetas temporales, con el formato
&lt;\[hh:\]mm:ss.sss&gt;, intercaladas con el texto, de manera que vayan
apareciendo sucesivamente como nuevas líneas de subtítulo a lo largo del
tiempo.

Por ejemplo, en el Listado 7 ocurriría:

- En el segundo 1 se mostraría el texto: *Una estrella lejana se
    acerca…*

- En el segundo 8 se mostraría, en una segunda línea, el texto: *a un
    gran agujero negro…*

- En el segundo 15 desaparecería éste texto y sería reemplazado por:
    *y es totalmente devorada…*

- Este contenido se mantendría hasta el final de la reproducción, ya
    que se indica que los subtítulos abarcan hasta el segundo 25, que es
    el global del video


El Listado 8 es similar al Listado 7, pero presentando el subtítulo el
multilínea, obsérvese que se trata de retornos de carro y no hay líneas
en blanco entre las diversas líneas de un mismo subtítulo –muy
importante-

**Listado 7**: Archivo de subtítulos *inline*
```

    WEBVTT

    Cue-1

    00:00:00.000 --&gt; 00:00:25.000

    &lt;00:00:01.000&gt;Una estrella lejana se acerca
    ...&lt;00:00:08.000&gt; a un gran agujero negro
    ...&lt;00:00:15.000&gt; y es totalmente devorada ...
```

**Listado 8**: Modo alternativo al Listado 7, en multilínea

```

    WEBVTT

    Cue-1

    00:00:00.000 --&gt; 00:00:25.000

    &lt;00:00:01.000&gt;Una estrella lejana se acerca ...

    &lt;00:00:08.000&gt; a un gran agujero negro ...

    &lt;00:00:15.000&gt; y es totalmente devorada ...
```

**NOTA**: La opción de presentar en multilínea los subtítulos es de
aplicación general, no sólo de los *inline* y puede ser muy útil y
cómoda para textos largos, por eso es especialmente aplicable aquí.

###Validaciones de archivos VTT


Para garantizar que nuestros archivos VTT son coherentes con las normas
estándar, es conveniente disponer de algún método de comprobación,
afortunadamente ya se dispone de métodos automatizados –validadores-.

El validador recomendado por la fundación Mozilla es el *Live WebVTT
Validator*, que se encuentra en la dirección URL:

**http://quuz.org/webvtt/**

Funciona de una forma bastante simple y manual, pero cumple su labor de
forma muy rápida y eficiente. Bastará copiar el contenido de nuestro
documento en el área correspondiente y ya se nos dará casi
instantáneamente el resultado de la validación, en la parte inferior de
la ventana.

![] (./img/Video-WebVTT/image11.png)

###Conclusiones


Hemos visto como a través de las etiquetas &lt;video&gt; y &lt;track&gt;
resulta muy simple la inclusión de vídeo subtitulado a demanda en
nuestras páginas Web. Teniendo la posibilidad de incluir múltiples
pistas de texto en diferentes idiomas, que pueden ser seleccionadas por
el usuario en tiempo de ejecución.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2013**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




