<properties
	pageTitle="Explorando el DOM: Tipos de nodos y sus atributos generales"
	description="DOM: Tipos de nodos y sus atributos"
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



#Explorando el DOM: Tipos de nodos y sus atributos generales

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  

class="anchor"></span>*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*

Un buen conocimiento de la organización de los documentos HTML es una de
las bases esenciales para la programación activa mediante *JavaScript*.
Toda la estructura pende de un árbol jerarquizado de los denominados
*nodos*, aspecto que abordaremos seguidamente.

Las bases de referencia vienen dadas por el denominado DOM –*Document
Object Model*-. Inicialmente el DOM ha sido definido como una API
–*Application Programming Interface*- para la gestión de documentos XML
en general -*eXtensible Markup Language*, lenguaje de marcas extensible-
y posteriormente implementada para documentos HTML en particular.

Para una descripción introductoria del DOM puede acudir a:

<http://es.wikipedia.org/wiki/Document_Object_Model>

La documentación oficial y más recomendable sobre el DOM se encuentra en
el foro del W3C –*World Wide Web Consortium*- en diversos niveles de
conformidad, por ejemplo:

<http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html>

<http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html>

En concreto, en el presente artículo, trataremos:

* Los tipos de nodos definidos en el DOM por el W3C

* Cómo explorar los nodos y objetos de un nodo

* Los atributos y métodos generales de un nodo

* La exploración de las características de un nodo en base a sus atributos



###Los tipos de nodos


Los nodos derivan del objeto base *Node*, en la tabla adjunta se recogen
las constantes asociadas a los diferentes tipos de nodos, tal como están
definidos por el W3C.

Todos los nodos están organizados en forma de árbol jerárquico en un
documento HTML, para hacerse una idea, la jerarquía de los tipos del DOM
se puede observar en:

<http://www.gnu.org/software/classpathx/jaxp/apidoc/org/w3c/dom/tree.html>

Esos tipos de nodos se identifican mediante constantes, que se recogen
en la tabla que sigue:


  Constante (Tipo de nodo)          | Significado (hipervínculo al foro W3C)                                                                                  |Valor
  --------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |-------
  *ELEMENT\_NODE*                   | El nodo es del tipo [*Element*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-745549614)                  |1
  *ATTRIBUTE\_NODE*                 | El nodo es del tipo [*Attr*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-637646024)                     |2
  *TEXT\_NODE*                      | El nodo es del tipo [*Text*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1312295772)                    |3
  *CDATA\_SECTION\_NODE*            | El nodo es del tipo [*CDATASection*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-667469212)             |4
  *ENTITY\_REFERENCE\_NODE*         | El nodo es del tipo [*EntityReference*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-11C98490)           |5
  *ENTITY\_NODE*                    | El nodo es del tipo [*Entity*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-527DCFF2)                    |6
  *PROCESSING\_INSTRUCTION\_NODE*   | El nodo es del tipo [*ProcessingInstruction*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1004215813)   |7
  *COMMENT\_NODE*                   | El nodo es del tipo [*Comment*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-1728279322)                 |8
  *DOCUMENT\_NODE*                  | El nodo es del tipo [*Document*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#i-Document)                   |9
  *DOCUMENT\_TYPE\_NODE*            | El nodo es del tipo [*DocumentType*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-412266927)             |10
  *DOCUMENT\_FRAGMENT\_NODE*        | El nodo es del tipo [*DocumentFragment*](http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html#ID-B63ED1A3)          |11

***Fuente: W3C***

###Aplicación de exploración de objetos


En nuestro ejemplo implementamos una aplicación que mostrará, en su
forma más elaborada, en la ventana del explorador de Internet, todas las
propiedades de un nodo determinado, que pasamos como referencia.

Si observa el Listado 1, ahí reside el núcleo de la estrategia de
elucidar las propiedades de un elemento del nodo. En esta ocasión del
elemento base *Node*. Se irán mostrando en ventanas de alerta, una a
una.

**Listado 1: Aplicación de extracción de los elementos del objeto Node.**


```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;DOM Node Object Types&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;script&gt;

    for (var key in Node) {

    alert(key + ' = ' + Node\[key\]);

    };

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

Este código puede ser útil cuando el listado es breve -12 elementos en
nuestro caso- pero inviable para listados grandes. Por ello, volvamos la
vista al Listado 2, en el que empleamos algún método de toma de
referencia del nodo y otros que creemos que son suficientemente
explícitos y no nos pararemos a explicarlos en estos momentos –no son
objeto de lo que pretendemos en estos momentos-:

Inicialmente partimos de un documento HTML que tiene dos elementos: un
texto que informa qué se va a listar y un botón de comando –botón *Ver*-
que disparará la función de listado de propiedades.

El botón de comando hará que se ejecuten las acciones siguientes:

Comenzamos creando un elemento HTML &lt;div&gt;, en el que alojaremos el
listado de propiedades.

-   Ahora vamos a crear un bucle, como en el Listado 1, que recorrerá y recogerá todas las propiedades del elemento, en este caso el objeto *Node*.

-   Para cada objeto, creamos un texto con el nombre del elemento que añadimos al elemento &lt;div&gt;.

-   También creamos un elemento HTML &lt;br&gt; que añadimos seguidamente, para separar por líneas cada entrada.

-   Finalizado el recorrido de propiedades, se abandonará el bucle.

-   Por último se destruye el botón *Ver*.


**Listado 2: Aplicación de extracción y listado en la ventana de los elementos del objeto Node.**

```

    L&lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;DOM Node Object Types&lt;/title&gt;

    &lt;script&gt;

    function ejecutar() {

    // Preparamos un espacio para mostrar sus propiedades:

    var elementNode = document.createElement('div');

    document.getElementById('A').appendChild(elementNode);

    // Recorremos todos los tipos de objetos del nodo y los mostramos en
    pantalla

    for (var key in Node) {

    var textNode = document.createTextNode(key + ' = ' + Node\[key\]);

    document.getElementById('A').querySelector('div').appendChild(textNode);

    var brElement = document.createElement('br');

    document.getElementById('A').querySelector('div').appendChild(brElement);

    };

    // Ahora eliminamos el botón de 'Ver'

    var element = document.getElementById('B');

    element.parentNode.removeChild(element);

    /\* El código de arriba listará ...

    ELEMENT\_NODE = 1

    ATTRIBUTE\_NODE = 2

    TEXT\_NODE = 3

    CDATA\_SECTION\_NODE = 4

    ENTITY\_REFERENCE\_NODE = 5

    ENTITY\_NODE = 6

    PROCESSING\_INSTRUCTION\_NODE = 7

    COMMENT\_NODE = 8

    DOCUMENT\_NODE = 9

    DOCUMENT\_TYPE\_NODE = 10

    DOCUMENT\_FRAGMENT\_NODE = 11

    NOTATION\_NODE = 12

    DOCUMENT\_POSITION\_DISCONNECTED = 1

    DOCUMENT\_POSITION\_PRECEDING = 2

    DOCUMENT\_POSITION\_FOLLOWING = 4

    DOCUMENT\_POSITION\_CONTAINS = 8

    DOCUMENT\_POSITION\_CONTAINED\_BY = 16

    DOCUMENT\_POSITION\_IMPLEMENTATION\_SPECIFIC = 32 \*/

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A"&gt;Node Object Types ... &lt;/p&gt;

    &lt;input id="B" type="button" value="Ver" onclick="ejecutar()"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Tipos-de-nodos-y-atributos/image1.png)

No es ésta la ocasión en que nos pararemos a explicar el funcionamiento
de los métodos empleados para poner y retirar elementos del DOM, como
los utilizados *appendChild* y *removeChild*, que serán, como otros
muchos, objeto de artículos posteriores.

Notará que se listan más valores que los contenidos en la tabla de tipos
de nodos que dábamos al comienzo, ya que se listan todas las propiedades
y esas lo son de *Node*. Para conocer al detalle el elemento *Node*
consúltese:

<http://www.gnu.org/software/classpathx/jaxp/apidoc/org/w3c/dom/Node.html>

Pruebe a, por ejemplo, cambiar *Node* por *document* y observará toda la
lista del árbol de nodos, métodos y atributos de que dispone.

###Atributos y métodos generales de un nodo


Los atributos generales de un nodo se recogen en la tabla siguiente y de
ellos podemos extraer información fundamental acerca de su tipo, nodo
padre, documento al que pertenece, nodos hijos y mucho más.

  Atributo            | Descripción
  ------------------- | ----------------------------------------------------------------------------------------------------------------------------
  *nodeName*          | Valor de la propiedad *nodeName* del elemento, por ejemplo el tipo de etiqueta HTML –véase la tabla que sigue-
  *nodeValue*         | Valor de la propiedad *nodeValue* del elemento, por ejemplo si es una etiqueta HTML será *null* –véase la tabla que sigue-
  *nodeType*          | Constante numérica que identifica el tipo de nodo –véase la tabla adjunta al comienzo del artículo-
  *parentNode*        | Referencia al objeto padre en el árbol nodal
  *childNodes*        | Referencia a una colección que contiene todos los nodos hijo
  *firstChild*        | Referencia al primer nodo hijo
  *LastChild*         | Referencia al último nodo hijo
  *previousSibling*   | Referencia al nodo hermano previo
  *nextSibling*       | Referencia al nodo hermano siguiente
  *attributes*        | Referencia al objeto que contiene los atributos –véase la tabla que sigue-
  *ownerDocument*     | Referencia al objeto documento propietario

***Fuente: W3C***

Los posibles valores contenidos en los atributos anteriores, dependerán
del tipo de nodo aludido, esto se recoge en la tabla que sigue:

  Tipo                    | nodeName                | nodeValue                         | attributes
  ----------------------- | ---------------------------| -------------------------------------|--------------                                                                
  Element                 |tagName                     |null                                  |NamedNodeMap
  Attr                    |name of attribute           |value of attribute                    |null
  Text                    |\#text                      |content of the text node              |null
  CDATASection            |\#cdata-section             |content of the CDATA Section          |null
  EntityReference         |name of entity referenced   |null                                  |null
  Entity                  |entity name                 |null                                  |null
  ProcessingInstruction   |target                      |entire content excluding the target   |null
  Comment                 |\#comment                   |content of the comment                |null
  Document                |\#document                  |null                                  |null
  DocumentType            |document type name          |null                                  |null
  DocumentFragment        |\#document-fragment         |null                                  |null
  Notation                |notation name               |null                                  |null

***Fuente: W3C***

En cuanto a los métodos disponibles nos permiten realizan diversas
operaciones sobre un determinado nodo y son:

  Método            |Descripción
  ----------------- |--------------------------------------------------
  *insertBefore*    |Inserta un nodo hijo antes del referenciado
  *replaceChild*    |Reemplaza el nodo hijo referenciado
  *removeChild*     |Elimina el nodo hijo referenciado
  *appendChild*     |Añade un nodo al final de la lista de nodos hijo
  *hasChildNodes*   |Permite determinar si un nodo tiene hijos
  *cloneNode*       |Devuelve un duplicado del nodo

**Fuente: W3C**

La aplicación recogida en el Listado 3 utilizaremos algunos de los
atributos anteriores para obtener información básica acerca de un nodo.
Emplearemos, tanto aquí como en el Listado 3b, algún método que, como ya
referimos, no es cuestión comentar ahora, aunque creemos que es
suficientemente autoexplicatico.

El código realiza las siguientes funciones sobre una etiqueta HTML, a
nuestra elección, debe haber una única etiqueta de ese tipo en el cuerpo
del documento para que podamos ejecutarlo de manera eficiente:

Se toma la referencia de la etiqueta HTML, con el método *querySelector*

Obsérvese que en nuestro ejemplo hemos propuesto como estudio una
etiqueta &lt;A&gt; con un parámetro y texto, simplemente

Con la referencia del nodo de la etiqueta a estudiar elucidamos varias
de sus propiedades mediante sus atributos, en concreto:

1.  Tipo: Nos da el tipo de nodo, la constante valor correspondiente

2.  Nombre: El valor de *nodeName* que hemos recogido en la tabla correspondiente, dado que se trata de una etiqueta HTML será el valor de ésta -&lt;A&gt;-

3.  Valor: El valor de *nodeValue* que hemos recogido en la tabla correspondiente, para una etiqueta HTML será *null*

4.  Atributos: La referencia del objeto que apunta a sus atributos –*NamedNodeMap*-

5.  Documento propietario: La referencia del objeto documento propietario –*Document*, no confundir con *document*-

6.  Nodo padre: La referencia del nodo inmediatamente superior en el árbol de nodos, en éste caso *HTMLBodyElement*, ya que pende directamente de la etiqueta &lt;BODY&gt;



**Listado 3: Información general del tipo, nombre, valor y atributos de un nodo**

```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;DOM Node Object Type&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;a href="\#"&gt;Saludos&lt;/a&gt; &lt;!-- Elemento que vamos a
    estudiar --&gt;

    &lt;script&gt;

    // Tomamos la referencia del objeto del nodo

    var nodeAnchor = document.querySelector('a');

    // Mostramos algunos datos

    alert('Tipo: ' + nodeAnchor.nodeType);

    alert('Nombre: ' + nodeAnchor.nodeName);

    alert('Valor: ' + nodeAnchor.nodeValue);

    alert('Atributos: ' + nodeAnchor.attributes);

    alert('Documento propietario: ' + nodeAnchor.ownerDocument);

    alert('Nodo padre: ' + nodeAnchor.parentNode);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

En el Listado 3b, lo único cambiado es que mediante un bucle expandimos
los atributos del nodo y los exponemos en una alerta de *JavaScript*. De
manera igual podríamos expandir los atributos de los restantes objetos
obtenidos y también exponerlos en la ventana de forma similar a como lo
hemos realizado en el Listado 2.

**Listado 3b: Información general del tipo, nombre, valor y atributos de un nodo**


```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;DOM Node Object Type&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;a href="\#"&gt;Saludos&lt;/a&gt; &lt;!-- Elemento que vamos a
    estudiar --&gt;

    &lt;script&gt;

    // Tomamos la referencia del objeto del nodo

    var nodeAnchor = document.querySelector('a');

    // Mostramos algunos datos

    alert('Tipo: ' + nodeAnchor.nodeType);

    alert('Nombre: ' + nodeAnchor.nodeName);

    alert('Valor: ' + nodeAnchor.nodeValue);

    var attrs = \[\];

    for (var key in nodeAnchor.attributes) {

    attrs.push(key);

    }

    alert('Atributos: ' + attrs.sort());

    alert('Documento propietario: ' + nodeAnchor.ownerDocument);

    alert('Nodo padre: ' + nodeAnchor.parentNode);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Tipos-de-nodos-y-atributos/image2.png)

Conclusiones
------------

En el presente artículo hemos visto lo más profundo del estudio del DOM,
los tipos de nodos, sus atributos, métodos generales –simplemente su
descripción por el momento- y el modo de acceder a conocer sus
características y propiedades generales.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2012**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
