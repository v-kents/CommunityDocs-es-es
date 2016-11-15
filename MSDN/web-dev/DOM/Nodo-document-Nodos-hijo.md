---
title: Explorando el DOM- Nodo document. Nodos hijo
description: Explorando el DOM- Nodo document. Nodos hijo
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Nodo document. Nodos hijo


©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


En nuestro anterior artículo **Explorando el DOM: Nodo Document**:

[**http://msdn.microsoft.com/es-es/library/dn467895.aspx**](http://msdn.microsoft.com/es-es/library/dn467895.aspx)

Habíamos tratado todos los aspectos generales del nodo *document*,
incluido el conocimiento de los nodos hijo. En el presente nos
ocuparemos del acceso a dichos nodos y de cómo extraer toda la
información en ellos contenida.

Esto será abordado con ejemplos ilustrativos en cada caso, en concreto,
en el presente artículo, trataremos:

- En nodo hijo *html*.

- El nodo hijo *head*.

- El nodo hijo *body*.

- La extracción de información relevante y la detección de etiquetas en el
nodo *head*.

- La extracción de información relevante y la detección de etiquetas en el
nodo *body*.
 

Para una aproximación preliminar al tratamiento y conocimiento del
esquema y tipos de nodos, consúltese el artículo **Explorando el DOM:
Tipos de nodos y sus atributos generales**:

[**http://msdn.microsoft.com/es-es/library/dn367218.aspx**](http://msdn.microsoft.com/es-es/library/dn367218.aspx)

###Referencias del DOM


Las bases de referencia vienen dadas por el denominado DOM –*Document
Object Model*-. Inicialmente el DOM ha sido definido como una API
–*Application Programming Interface*- para la gestión de documentos XML
en general -*eXtensible Markup Language*, lenguaje de marcas extensible-
y posteriormente implementada para documentos HTML en particular.

Para una descripción introductoria del DOM puede acudir a:

[**http://es.wikipedia.org/wiki/Document\_Object\_Model**](http://es.wikipedia.org/wiki/Document_Object_Model)

La documentación oficial y más recomendable sobre el DOM se encuentra en
el foro del W3C –*World Wide Web Consortium*- en diversos niveles de
conformidad, por ejemplo:

[**http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html**](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html)

[**http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html**](http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html)

###El nodo hijo html –documentElement-


Para acceder al nodo hijo &lt;html&gt; disponemos de una propiedad
específica que directamente nos devuelve el objeto correspondiente. Su
sintaxis es:

*document.documentElement*

  Propiedad           |Descripción
  ------------------- |-----------------------------------------------------------
  *documentElement*   |Devuelve el objeto que contiene el nodo hijo &lt;html&gt;

En el Listado 1, ejemplificamos su uso, mostrando todo el contenido del
nodo &lt;html&gt; en una alerta, en la consola y en la ventana del
propio documento.

**Listado 1: Análisis del contenido del nodo html**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLDocument documentElement&lt;/title&gt;

    &lt;script&gt;

    function show\_DE() {

    var d = document;

    alert(d.documentElement.outerHTML);

    console.log(d.documentElement.outerHTML);

    document.getElementById("A").textContent =
    d.documentElement.outerHTML;

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" onclick="show\_DE()" value="Mostrar
    documentElement" /&gt;

    &lt;hr /&gt;

    &lt;pre id="A"&gt;&lt;/pre&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-document-Nodos-hijo/image1.png)

Recuérdese que para visualizar la salida por la consola en Internet
Explorer debe pulsar la tecla **F12** y posteriormente seleccionar la
pestaña **Consola**.

![] (./img/Nodo-document-Nodos-hijo/image2.png)

###El nodo hijo head


Para acceder al nodo hijo &lt;head&gt; también disponemos de una
propiedad específica, que directamente nos devuelve el objeto
correspondiente. Su sintaxis es:

*document.head*

  Propiedad   |Descripción
  ----------- |-----------------------------------------------------------
  *head*      |Devuelve el objeto que contiene el nodo hijo &lt;head&gt;

En el Listado 2 hemos programado un botón de comando que al ser pulsado:

Accedemos al contenido de *document.head*.

Mostramos su contenido mediante la propiedad *outerHTML*:


- En una alerta de *JavaScript*

- En la consola

- Como texto en la ventana del explorador

**Listado 2: Análisis del contenido del nodo head**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLDocument Head outerHTML&lt;/title&gt;

    &lt;script&gt;

    function show\_head() {

    var d = document;

    alert(d.head.outerHTML);

    console.log(d.head.outerHTML);

    document.getElementById("A").textContent = d.head.outerHTML;

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" onclick="show\_head()" value="Mostrar
    &lt;head&gt;" /&gt;

    &lt;hr /&gt;

    &lt;pre id="A"&gt;&lt;/pre&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-document-Nodos-hijo/image3.png)

###Búsqueda de etiquetas en head


Dentro de &lt;head&gt;…&lt;/head&gt; nos podremos encontrar contenidos
como estilos o *scripts*, veremos cómo poder acceder a sus contenidos.

En el ejemplo del Listado 3 hemos programado un botón de comando que al
ser pulsado:

Se detectan y exponen todos los nodos hijos de &lt;head&gt; en la
consola.

Se exponen, también en la consola, todos los contenidos de los nodos
hijo.

Se comprueba si la propiedad *nodeName* de alguno(s) de los nodos hijo
es *SCRIPT*, lo que implicaría que nos encontramos ante una entrada de
código *JavaScript*.

Si es así, se mostrará en la ventana del documento su contenido.

Acto seguido, buscaremos dentro de dicho código las veces que se
encuentra una palabra clave, en concreto *childNodes*, y lo mostramos en
una alerta.


**Listado 3: Búsqueda de etiquetas SCRIPT dentro del nodo head**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLDocument Head childNodes SCRIPT&lt;/title&gt;

    &lt;script&gt;

    function show\_CN() {

    var d = document;

    var l = d.head.childNodes.length;

    alert('Nº de nodos = ' + l);

    for (i = 0; i &lt; l; i++) {

    console.log(d.head.childNodes\[i\].nodeName + ' -&gt; ' +
    d.head.childNodes\[i\].nodeType + '\\r');

    console.log(d.head.childNodes\[i\].outerHTML);

    // Si hay un &lt;script&gt;, lo mostraremos en pantalla

    if (d.head.childNodes\[i\].nodeName == "SCRIPT") {

    document.getElementById("A").textContent =
    d.head.childNodes\[i\].textContent;

    // Buscamos las veces que se encuentra childNodes

    if (d.head.childNodes\[i\].textContent.indexOf("childNodes"))

    alert("ENCONTRADO childNodes = " +
    d.head.childNodes\[i\].textContent.match(/childNodes/g).length + '
    veces');

    }

    }

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" onclick="show\_CN()" value="Mostrar head
    &lt;script&gt; childNodes" /&gt;

    &lt;hr /&gt;

    &lt;pre id="A"&gt;&lt;/pre&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-document-Nodos-hijo/image5.png)

###El nodo hijo body


Para acceder al nodo hijo &lt;body&gt;, nuevamente disponemos de una
propiedad específica que directamente nos devuelve el objeto
correspondiente. Su sintaxis es:

*document.body*

  Propiedad   |Descripción
  ----------- |-----------------------------------------------------------
  *body*      |Devuelve el objeto que contiene el nodo hijo &lt;body&gt;

En el Listado 4 hemos programado un botón de comando que al ser pulsado:

Accedemos al contenido de *document.body*.

Mostramos su contenido mediante la propiedad *outerHTML*:


- En una alerta de *JavaScript*

- En la consola

- Como texto en la ventana del explorador

**Listado 4: Análisis del contenido del nodo body**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLDocument Body outerHTML&lt;/title&gt;

    &lt;script&gt;

    function show\_body() {

    var d = document;

    alert(d.body.outerHTML);

    console.log(d.body.outerHTML);

    document.getElementById("A").textContent = d.body.outerHTML;

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" onclick="show\_body()" value="Mostrar
    &lt;body&gt;" /&gt;

    &lt;hr /&gt;

    &lt;pre id="A"&gt;&lt;/pre&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-document-Nodos-hijo/image5.png)

###Búsqueda de etiquetas en body


La etiqueta &lt;body&gt; contiene el cuerpo del documento y en su
interior nos encontraremos todas las etiquetas HTML que lo componen,
además de posibles porciones de código *JavaScript*. Podemos realizar
una búsqueda de ellas de forma similar a como lo hemos hecho en la
etiqueta &lt;head&gt;.

En el ejemplo del Listado 5 hemos programado un botón de comando que al
ser pulsado:

Se detectan y exponen todos los nodos hijos de &lt;body&gt; en la
consola.

Se exponen, también en la consola, todos los contenidos de los nodos
hijo.

Se exponen, adicionalmente todos los datos anteriores en la ventana del
explorador –al final del código del bucle-.

Se comprueba si la propiedad *nodeName* de alguno(s) de los nodos hijo
es *INPUT*.

Si es así, se mostrará en la ventana del documento su contenido.



**Listado 5: Búsqueda de etiquetas INPUT dentro del nodo body**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLDocument Body childNodes&lt;/title&gt;

    &lt;script&gt;

    function show\_CN() {

    var d = document;

    var l = d.body.childNodes.length;

    var s = '';

    alert(l);

    for (i = 0; i &lt; l; i++) {

    s = s + d.body.childNodes\[i\].nodeName + ' -&gt; ' +
    d.body.childNodes\[i\].nodeType + '\\r';

    console.log(s);

    console.log(d.body.childNodes\[i\].outerHTML);

    s = s + d.body.childNodes\[i\].textContent + '\\r';

    if (d.body.childNodes\[i\].nodeName == "INPUT")

    document.getElementById("B").textContent =
    d.body.childNodes\[i\].outerHTML;

    }

    document.getElementById("A").textContent = s;

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" onclick="show\_CN()" value="Mostrar body
    childNodes" /&gt;

    &lt;hr /&gt;

    &lt;pre id="A"&gt;&lt;/pre&gt;

    &lt;hr /&gt;

    &lt;pre id="B"&gt;&lt;/pre&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-document-Nodos-hijo/image6.png)

![] (./img/Nodo-document-Nodos-hijo/image7.png)

Recuérdese que para visualizar la salida por la consola en Internet
Explorer debe pulsar la tecla **F12** y posteriormente seleccionar la
pestaña **Consola**.

![] (./img/Nodo-document-Nodos-hijo/image8.png)

###Conclusiones


En el presente artículo hemos visto cómo acceder y ver los contenidos de
los nodos hijo de *document*, pudiendo, en su caso, extraer información
relevante de etiquetas existentes tanto en *head, como en body*.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2013**

**Twitter: @jpt219**

LinkedIn:
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




