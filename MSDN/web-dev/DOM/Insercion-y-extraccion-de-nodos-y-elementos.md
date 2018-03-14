---
redirect_url: https://docs.microsoft.com/
title: Explorando el DOM- Inserción y extracción de nodos y elementos
description: DOM Insertar elementos y nodos de texto en tiempo de ejecución
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Inserción y extracción de nodos y elementos

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  



Sobre un documento HTML abierto, nos puede  insertar elementos
y nodos de texto en tiempo de ejecución mediante técnicas de gestión del
DOM, que serían las de más bajo nivel posible. Así mismo, esas mismas
técnicas nos pueden dar información detallada –extraer el contenido en
forma de cadena de texto- de ciertos componentes nodales y así verificar
su estructura actual para el examen o la toma de decisiones durante la
ejecución de los documentos.

Todo esto será abordado con ejemplos ilustrativos en cada caso, en
concreto, en el presente artículo, trataremos:

* Creación de elementos y nodos de texto

* Uso de cadenas de texto para crear nodos

* Obtener el valor de elementos y nodos de texto



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

###Creación de elementos y nodos de texto


Para la creación de elementos del DOM –normalmente etiquetas HTML- y
nodos de texto, disponemos de dos métodos particulares. Normalmente
serán dos procesos que irán parejos, con una secuencia de orden precisa,
primero crear el nodo del elemento y posteriormente añadir el nodo al
documento y en el segundo crear y asociar el nodo de texto al nodo del
elemento recién añadido –o bien este último paso lo habríamos hecho con
anterioridad a la asociación-. En el ejemplo lo ilustraremos paso a
paso.

Los métodos disponibles para ello se recogen en la siguiente tabla.

  **Método**         | **Descripción**
  ------------------ | --------------------------------------------------------------------------------------------------------------------------
  *createElement*    |Creará un elemento HTML –una etiqueta es un elemento-. Toma como único parámetro la cadena de texto identificadora del elemento HTML, por ejemplo *div*.
  *createTextNode*   |Creará un nodo de tipo texto. Toma como único parámetro una cadena de texto con el contenido de la cadena de texto del nodo, por ejemplo *Hola mundo*.
  ---------------------------------------------------------------------------------------------------------------------------------------------

En el Listado 1 recogemos un ejemplo de uso de estos dos métodos:

* Se codifica un botón de comando que llama a la función *créate()*.

* Primero creamos el elemento, mediante *createElement*

* Seguidamente creamos el nodo de texto, mediante *createTextNode*

* Añadimos el nodo de texto al elemento

* Añadimos el nodo al documento, asociándolo a alguno de los nodos de
aquel, en nuestro caso directamente al cuerpo del documento, como un
elemento hijo



**Listado 1: Uso de createElement y createTextNode, para creación de elementos y nodos de texto**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;createElement&lt;/title&gt;

    &lt;script&gt;

    function create() {

    // createElement

    var elementNode = document.createElement('p');

    // createTextNode

    var textNode = document.createTextNode('Saludos');

    // Véase el ejemplo DOM-appendChild más adelante:

    elementNode.appendChild(textNode);

    document.body.appendChild(elementNode);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p&gt;Para todos ... &lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="create()" value="createElement"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Insercion-y-extraccion-de-nodos-y-elementos/image1.png)

Si en el ejemplo, en Internet Explorer, pulsamos F12, acudiremos a las
*Herramientas de desarrollo* y veremos todo el árbol del DOM, véase la
figura adjunta.

![] (./img/Insercion-y-extraccion-de-nodos-y-elementos/image2.png)

Estado inicial del DOM, antes de pulsar el botón de comando

![] (./img/Insercion-y-extraccion-de-nodos-y-elementos/image3.png)

Si en el ejemplo después de pulsado el botón para ejecutar estas
acciones, en Internet Explorer, pulsamos F12, acudiremos a las
*Herramientas de desarrollo* y veremos todo el árbol del DOM, con los
nodos hijos creados conforme a lo que diseñamos, véase la figura
adjunta.

![] (./img/Insercion-y-extraccion-de-nodos-y-elementos/image4.png)

Estado del DOM después de insertado el elemento y el nodo de texto

###Uso de cadenas de texto para crear nodos de texto

Vamos ahora a abordar métodos de más alto nivel que permiten crear,
simultáneamente las etiquetas y los textos en un único paso.

En la tabla que sigue se recogen dichos métodos, el más comúnmente
utilizado es *innerHTML*, que creará nodos hijos dentro del nodo al que
se aplica. Cómo los otros tres primeros, a la vez devuelve también la
cadena del código HTML del elemento sobre el cual se aplica, algo que
comentaremos e ilustraremos más adelante.

   Método                 | Descripción
  ---------------------- | ------------------------------------------------------------------------------------------------------------------------------
  *innerHTML*            | Fija o devuelve la cadena con el código HTML del contenido del elemento asociado.
  *outerHTML*            |Fija o devuelve la cadena con el código HTML del elemento asociado, incluidos sus descendientes.
  *textContent*          |Fija o devuelve la cadena con el contenido de texto del elemento asociado.
  *insertAdjacentHTML*   |Inserta el código HTML especificado en la posición indicada respecto al nodo asociado, según los parámetros de localización: *beforebegin*: Delante del elemento aludido. *afterbegin*: Justo dentro del elemento, antes del primer hijo. *beforeend*: Justo dentro del elemento, después del último hijo. *afterend*: Detrás del elemento aludido
  -----------------------------------------------------------------------------------------------------------------------------------------------------

En el Listado 2 hemos implementado un ejemplo de uso del método
*outerHTML*:

Tomamos como referencia del nodo padre el cuerpo del documento –etiqueta
&lt;body&gt;-.

Declaramos mediante *outer/HTML* un nodo nuevo con todas sus
características de elementos HTML.


**Listado 2: Inserción de elementos mediante outerHTML**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;outerHTML&lt;/title&gt;

    &lt;script&gt;

    function show() {

    var nodeOuter = document.querySelector('body');

    nodeOuter.outerHTML = ('&lt;p id="elm"&gt;Saludos &lt;i&gt;a
    todos&lt;/i&gt;&lt;/p&gt;');

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="show()" value="outerHTML" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

Si en el ejemplo después de pulsado el botón para ejecutar estas
acciones, en Internet Explorer, pulsamos F12, acudiremos a las
*Herramientas de desarrollo* y veremos todo el árbol del DOM, con los
nodos hijos creados conforme a lo que diseñamos, véase la figura
adjunta.

![] (./img/Insercion-y-extraccion-de-nodos-y-elementos/image5.png)

El DOM después de ejecutadas las acciones

El método *insertAdjacentHTML* va en cierto modo un paso más allá, dado
que nos permite una delimitación del posicionamiento del elemento a ser
insertado. Por el contrario, no devuelve ningún valor útil de referencia
para el DOM.

Un uso de todas esas capacidades de posicionamiento las exponemos en el
código del Listado 3, en el que:

Partimos de un texto inicial –“insertar”- en nuestra ventana del
explorador con un ID “elm”.

Sobre él insertamos elementos HTML adyacentes en diversas posiciones
relativas mediante las constantes de posicionamiento antes comentadas.

Obsérvese que se pasan los códigos HTML como cadenas de texto, tal cual
se escribirían en un documento y quedan como nodos hijos.

**Listado 3: Inserción de elementos mediante insertAdjacentHTML**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;insertAdjacentHTML&lt;/title&gt;

    &lt;script&gt;

    function insert() {

    var elm = document.getElementById('elm');

    elm.insertAdjacentHTML('beforebegin', '&lt;h2&gt;¿Cómo
    &lt;/h2&gt;');

    elm.insertAdjacentHTML('afterbegin', '&lt;h3&gt;podemos
    &lt;/h3&gt;');

    elm.insertAdjacentHTML('beforeend', '&lt;i&gt; código &lt;/i&gt;');

    elm.insertAdjacentHTML('afterend', '&lt;h1&gt; HTML?&lt;/h1&gt;');

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;i id="elm"&gt;insertar&lt;/i&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="insert()"
    value="insertAdjacentHTML" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

Si en el ejemplo después de pulsado el botón para ejecutar estas
acciones, en Internet Explorer, pulsamos F12, acudiremos a las
*Herramientas de desarrollo* y veremos todo el árbol del DOM, con los
nodos hijos creados conforme a lo que diseñamos, véanse las figuras
adjuntas.

![] (./img/Insercion-y-extraccion-de-nodos-y-elementos/image6.png)

El DOM antes de ejecutar las acciones

![] (./img/Insercion-y-extraccion-de-nodos-y-elementos/image7.png)

El DOM después de ejecutadas las acciones

###Cómo extraer –obtener el valor- de elementos y nodos de texto

En ocasiones desearemos conocer las características de un nodo, sus
etiquetas y textos –elementos-, para esa finalidad se emplearán los
mismos métodos antes comentados:

* innerHTML

* outerHTML

* textContent


Que aplicados sobre el nodo a elucidar, nos devuelven una cadena de
caracteres con su contenido, similar a lo que le habríamos pasado a la
hora de crearlos.

Eso puede apreciarse en los mensajes emitidos por el código del Listado
4:

* Consta de una sentencia en el cuerpo del documento y tres botones de
comando.

* Al pulsar los botones de comando se mostrará en un mensaje,
respectivamente:

* El contenido hijo HTML dentro del nodo al que se ha aplicado

* El contenido completo del nodo al que se ha aplicado

* El texto del nodo al que se ha aplicado



**Listado 4: Extracción –obtención de los valores- de elementos mediante innerHTML, outerHTML y textContent**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;innerHTML, outerHTML y textContent&lt;/title&gt;

    &lt;script&gt;

    function show1() {

    var elm = document.getElementById('elm');

    alert(elm.innerHTML);

    }

    function show2() {

    var elm = document.getElementById('elm');

    alert(elm.outerHTML);

    }

    function show3() {

    var elm = document.getElementById('elm');

    alert(elm.textContent);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="elm"&gt;Saludos &lt;i&gt;a todos&lt;/i&gt;&lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="show1()" value="innerHTML" /&gt;

    &lt;input type="button" onclick="show2()" value="outerHTML" /&gt;

    &lt;input type="button" onclick="show3()" value="textContent" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Insercion-y-extraccion-de-nodos-y-elementos/image8.png)

###Conclusiones


En el presente artículo hemos visto como modificar la estructura de un
documento añadiendo elementos nodales de diferentes formas y en los
lugares elegidos a demanda y cómo obtener información del contenido de
un determinado nodo. Un paso más allá será ver cómo editar elementos del
DOM y como copiarlos y pegarlos –clonarlos-, que abordaremos en nuestro
siguiente artículo.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2013**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




