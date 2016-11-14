---
title: Explorando el DOM- Nodo Document
description: Nodo document en tanto la cabecera como el cuerpo del documento HTML
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Nodo Document

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


En el presente artículo nos ocuparemos de los aspectos generales del
nodo *document* que abarca tanto la cabecera como el cuerpo del
documento HTML.

Todo esto será abordado con ejemplos ilustrativos en cada caso, en
concreto, a modo de resumen, trataremos:

* Propiedades y métodos de _document_

* Extraer la información general

* El foco y el elemento activo

* Nodos hijo de _document_



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

###Sus propiedades y métodos


Al margen de la documentación correspondiente, también podemos extraer
todos los métodos y propiedades de *document* en tiempo de ejecución.
Así trabajan, por ejemplo, los sistemas de ayuda de los editores de
código con los diferentes elementos –tómese nota, como método de
aplicación general-.

En principio podríamos asociar los métodos y propiedades en tres grandes
grupos:

Los propios: son aquellos propios únicamente del elemento aludido. Los
podrán tener también por herencia los elementos hijo.

Los heredados: son los heredados del elemento aludido, según el árbol
jerárquico del DOM.

El total: el conjunto de los anteriores. Será lo que habitualmente más
nos interesa conocer.

En el Listado 1 hemos recopilado los modos de obtención y listado de los
métodos y propiedades de estos tres grandes grupos. Para ellos se
aplican las siguientes codificaciones generales:

Mediante *Object.keys(document)*, obtenemos la matriz con todos los
métodos y propiedades propias del elementos sobre el que se aplica
–*document* en nuestro caso-.

Mediante *(var p in document)*, obtendremos la lista de todos los
métodos y propiedades propios y heredados del elemento aludido
–*document* en nuestro caso-.

Mediante *if (!document.hasOwnPropertty(p))*, hacemos un filtrado de
aquellos que no son propios y los extraemos del listado, quedándonos
solamente con los heredados.

Obsérvese que todas estas listas se sacan por la consola y que la lista
de todos los elementos, propios y heredados, se saca también por
pantalla –siempre ordenado alfabéticamente-.

**Listado 1: Listado de propiedades y métodos propios y heredados de document.**

```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Document Properties and Methods&lt;/title&gt;

    &lt;script&gt;

    function mostrar() {

    // propiedades y métodos propios

    console.log("A) ");

    console.log(Object.keys(document).sort());

    // propiedades y métodos propios y heredados

    console.log("B) ");

    var documentPropertiesIncludeInherited = \[\];

    for (var p in document) {

    documentPropertiesIncludeInherited.push(p);

    }

    console.log(documentPropertiesIncludeInherited.sort());

    // propiedades y métodos heredados

    console.log("C) ");

    var documentPropertiesOnlyInherited = \[\];

    for (var p in document) {

    if (!document.hasOwnProperty(p)) {

    documentPropertiesOnlyInherited.push(p);

    }

    }

    console.log(documentPropertiesOnlyInherited.sort());

    // propiedades y métodos propios y heredados, salida por pantalla

    var text = '';

    for (i = 0; i &lt; documentPropertiesIncludeInherited.length; i++) {

    text = text + documentPropertiesIncludeInherited\[i\] + '&lt;br
    /&gt;';

    }

    document.getElementById("A").innerHTML = text;

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" value="Mostrar Porperpies and Methods"
    onclick="mostrar()" /&gt;

    &lt;hr /&gt;

    &lt;p id="A"&gt;&lt;/p&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-Document/image1.png)

Para visualizar la salida por la consola en Internet Explorer debe
pulsar la tecla **F12** y posteriormente seleccionar la pestaña
**Consola**.

![] (./img/Nodo-Document/image2.png)

###Extraer la información general


Hay un grupo de propiedades que nos dan acceso a información de carácter
general acerca del documento en sí. Son las recogidas en la tabla que
sigue:

  Propiedad        | Descripción
  ---------------- | -------------------------------------------------------------------
  *title*          | El contenido de la etiqueta &lt;title&gt;
  *URL*            | La dirección URL de la página Web
  *referrer*       | La dirección URL de la página Web desde la que se cargó la actual
  *lastModified*   | La fecha y hora de la última modificación de la página mostrada
  *compatMode*     | Indica si *BackCompat* o *CSS1Compat* –*StrictMode*-

Para todas ellas la sintaxis es del todo simple:

*document.propiedad*

Y devuelve la cadena de texto con la información correspondiente.

En el Listado 2 se muestra toda esta información en una alerta al ser
pulsado el notón de comando correspondiente.

**Listado 2: Extracción de información general de la página.**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLDocument Información general&lt;/title&gt;

    &lt;script&gt;

    function info() {

    var d = document;

    var msg = '';

    msg = ('title = ' + d.title + '\\r');

    msg = msg + ('url = ' + d.URL + '\\r');

    msg = msg + ('referrer = ' + d.referrer + '\\r');

    msg = msg + ('lastModified = ' + d.lastModified + '\\r');

    // Informará de si es BackCompat (Quirks Mode) o CSS1Compat
    (Strict Mode)

    msg = msg + ('compatibility mode = ' + d.compatMode + '\\r');

    alert(msg);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" onclick="info()" value="Información general"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-Document/image3.png)

###El foco y elemento activo


Para fijar y conocer que elemento tiene el foco de entrada en la lista
de nodos del documento, disponemos del método *focus()* y de la
propiedad *activeElement*, respectivamente.

Sus sintaxis son muy simples y se ven ilustradas como un complemento del
ejemplo anterior en el Listado 3.

Una vez cargado el documento, acúdase a visualizar la salida por la
consola y observará que el foco ha sido fijado en el elemento
&lt;input&gt;, tal como nos devuelve la propiedad *activeElement*.
Recuérdese que para visualizar la salida por la consola en Internet
Explorer debe pulsar la tecla **F12** y posteriormente seleccionar la
pestaña **Consola**.

**Listado 3: Cómo fijar el foco y cómo conocer el elemento activo.**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLDocument Información general&lt;/title&gt;

    &lt;script&gt;

    function info() {

    var d = document;

    var msg = '';

    msg = ('title = ' + d.title + '\\r');

    msg = msg + ('url = ' + d.URL + '\\r');

    msg = msg + ('referrer = ' + d.referrer + '\\r');

    msg = msg + ('lastModified = ' + d.lastModified + '\\r');

    // Informará de si es BackCompat (Quirks Mode) o CSS1Compat
    (Strict Mode)

    msg = msg + ('compatibility mode = ' + d.compatMode + '\\r');

    alert(msg);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" onclick="info()" value="Información general"
    /&gt;

    &lt;script&gt;

    document.querySelector('input').focus();

    console.log(document.activeElement);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-Document/image4.png)

###Nodos hijo de document


Para obtener los nodos hijo de un elemento, se dispone de la propiedad
*childNodes*, que contiene una matriz de objetos con las referencias de
todos los nodos hijos del nodo aludido, su sintaxis es:

*nodo.childNodes*

Para conocer el número de nodos hijo, se nos devolverá con:

*nodo.childNodes.length*

  Propiedad      | Descripción
  -------------- | -------------------------------------------------------------------
  *childNodes*   | Contiene una matriz con todos los nodos hijo del elemento aludido

En el caso de *document* sólo contendrá habitualmente dos nodos hijo:

El &lt;!doctype html&gt;

El &lt;html&gt;


Todo ello lo podremos conocer elucidando sus propiedades de nombre y
valor numérico:

  Propiedad    | Descripción
  ------------ | ---------------------------------------------------------
  *nodeName*   | Devuelve una cadena con el nombre de tipo de nodo
  *nodeType*   | Devuelve un valor numérico con el valor de tipo de nodo

En el Listado 4, se buscará y mostrará en consola y en la ventana del
explorador los nodos hijo de *document*, sucintamente lo que se realiza
es:

Una primera llamada a *document.childNodes.length* para conocer el
número de nodos hijos actuales. Se emite una alerta con el dato.

Mediante un bucle accedemos a cada uno de dichos nodos, nótese que
comienza a contarse en cero.

Se anota su tipo y su valor, mediante *nodeName* y *nodeValue*.

La propiedad *outerHTML* contiene el texto del contenido HTML del nodo
–si lo hubiera-, que se mostrará, juntamente con el tipo y valor en la
consola.

Todo ello, que ha sido almacenado en una variable de texto, finalmente
se expone en la ventana del explorador, asignándolo a la propiedad
*textContext* de un elemento &lt;pre&gt;.

**Listado 4: Modo de acceso a los nodos hijo de document mediante childNodes.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLDocument childNodes&lt;/title&gt;

    &lt;script&gt;

    function show\_CN() {

    var d = document;

    var l = d.childNodes.length;

    var text = '';

    alert(l);

    for (i = 0; i &lt; l; i++) {

    console.log(d.childNodes\[i\].nodeName + ' -&gt; ' +
    d.childNodes\[i\].nodeType + '\\r');

    console.log(d.childNodes\[i\].outerHTML);

    text = text + d.childNodes\[i\].outerHTML;

    }

    document.getElementById("A").textContent = text;

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;input type="button" onclick="show\_CN()" value="Mostrar
    childNodes" /&gt;

    &lt;hr /&gt;

    &lt;pre id="A" style="color: darkmagenta"&gt;&lt;/pre&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodo-Document/image5.png)

Recuérdese que para visualizar la salida por la consola en Internet
Explorer debe pulsar la tecla **F12** y posteriormente seleccionar la
pestaña **Consola**.

![] (./img/Nodo-Document/image6.png)

###Conclusiones


En el presente artículo hemos visto cómo elucidar y conocer los aspectos
generales del nodo *document*, de la información general del documento
HTML cargado y cómo acceder al listado de los nodos hijo. En un próximo
artículo trataremos con más detalle el acceso y extracción de
información de dichos nodos hijo.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2013**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




