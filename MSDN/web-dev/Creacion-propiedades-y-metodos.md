<properties
	pageTitle="Explorando el DOM: Nodos de texto. Creación, propiedades y métodos"
	description="Creación de nodos de texto en DOM"
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




#Explorando el DOM: Nodos de texto. Creación, propiedades y métodos

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


Cada nodo de texto tiene su propia entidad y se trata de un objeto
–*object text*- con sus propiedades y métodos característicos.

Esto será abordado con ejemplos ilustrativos para cada caso; en
concreto, en el presente artículo, trataremos:

La creación de nodos de texto.

La asociación de dichos nodos de texto con elementos del documento HTML,
es decir, con las etiquetas –*tagName*- de los elementos que sean
susceptibles de contener nodos de texto.

Propiedades y métodos de los nodos de texto:

* Los propios

* Heredados

* Su globalidad



Para una aproximación preliminar al tratamiento y conocimiento del
esquema y tipos de nodos, consúltese el artículo **Explorando el DOM:
Tipos de nodos y sus atributos generales**:

**http://msdn.microsoft.com/es-es/library/dn367218.aspx**

Dado que los nodos de texto habitualmente estarán asociados –como nodos
hijo- a elementos del documento HTML, será interesante repasar lo
comentado en el artículo **Explorando el DOM: Objeto element. Creación,
propiedades y métodos**:

**https://msdn.microsoft.com/es-es/library/dn766203.aspx**

###Referencias del DOM


Las bases de referencia vienen dadas por el denominado DOM –*Document
Object Model*-. Inicialmente el DOM ha sido definido como una API
–*Application Programming Interface*- para la gestión de documentos XML
en general -*eXtensible Markup Language*, lenguaje de marcas extensible-
y posteriormente implementada para documentos HTML en particular.

Para una descripción introductoria del DOM puede acudir a:

**http://es.wikipedia.org/wiki/Document\_Object\_Model**

La documentación oficial y más recomendable sobre el DOM se encuentra en
el foro del W3C –*World Wide Web Consortium*- en diversos niveles de
conformidad, por ejemplo:

**http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html**

**http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html**

###La creación de nodos de texto


Para crearlos dinámicamente –al vuelo- disponemos del método que
recogemos seguidamente y comentaremos más abajo:

  **Método**         |**Descripción**
  ------------------ |-----------------------------------------------------------------------------------------------------------------
  *createTextNode*   |Nos proporciona un nuevo nodo de texto, que posteriormente puede ser asociado a un elemento del documento HTML.

Por tanto, para la creación de un nuevo nodo de texto, utilizaremos el
método *createTextNode*, cuya sintaxis podría ser algo similar a:

* *var nuevoTexto = document.createTextNode(´texto´);*

* Ahora tendríamos que adjuntar el nodo de texto nuevo al documento HTML,
en el lugar deseado –en el elemento deseado-, como por ejemplo de la
forma:

* *document.querySelector(&lt;identificador&gt;).appendChild(nuevoTexto);*

En el Listado 1, hemos programado:

* Un cuerpo de documento &lt;body&gt; inicialmente con un elemento
&lt;div&gt; vacío.

* Un botón de comando que llamará a una función *JavaScript*, que
insertará el nodo texto asociado en el elemento &lt;div&gt;.

La función *JavaScript*, que realiza las siguientes secuencias de
comandos:

Crear un nodo de texto con el mensaje que mostraremos posteriormente.

* Se añade el nodo de texto como elemento hijo directamente al nodo
&lt;div&gt;

* Se comprueba que el nodo de texto ahora es un elemento del DOM y se saca
el resultado de la comprobación por la consola



Como consecuencia de todo ello nosotros, a demanda, al hacer clic sobre
el botón de comando, ya deberíamos ver el texto en la ventana del
explorador y el resultado de la comprobación en la *Consola de textos*.

**Listado 1: Creación de un nuevo nodo de texto, mediante createTextNode.**


```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - createTextNode, ejemplo 1&lt;/title&gt;

    &lt;script&gt;

    function mostrar() {

    var textNode = document.createTextNode('Nuevo nodo de texto');

    document.querySelector('\#t1').appendChild(textNode);

    console.log(document.querySelector('\#t1').innerText);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="t1"&gt;&lt;/div&gt;

    &lt;input type="button" onclick="mostrar()" value="Mostrar" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Creacion-propiedades-y-metodos/image1.png)

![] (./img/Creacion-propiedades-y-metodos/image2.png)

###Inyección de un par de nodo de texto y elemento nuevos

Tomando como base el ejemplo anterior, inyectaremos un nodo de elemento
–en este caso una etiqueta &lt;h3&gt;- que en su interior tiene asociado
un nuevo nodo de texto; ambos son creados al vuelo, una vez ya expuesto
el documento HTML original en el explorador.

En el Listado 2, hemos programado:

* Un cuerpo de documento &lt;body&gt; inicialmente con un elemento
&lt;div&gt; vacío.

* Un botón de comando que llamará a una función *JavaScript* que insertará
un nodo de tipo &lt;h3&gt; con un nodo de texto asociado en el elemento
&lt;div&gt;.

La función *JavaScript*, que realiza las siguientes secuencias de
comandos:

* Crear un nodo de texto con el mensaje que mostraremos posteriormente.

* Crear un nodo del tipo &lt;h3&gt;

* Se incluye un nodo de texto en el interior del &lt;h3&gt; recién creado.

* Se añade el nodo &lt;h3&gt; como elemento hijo directamente al nodo
&lt;div&gt;

* Se comprueba que &lt;h3&gt; ahora es un elemento del DOM y se saca el
resultado de la comprobación por la consola


Como consecuencia de todo ello nosotros, a demanda, al hacer clic sobre
el botón de comando, ya deberíamos ver el texto en la ventana del
explorador y el resultado de la comprobación en la *Consola de textos*.

**Listado 2: Creación de un par de nodos de texto y elemento asociados e insertarlos en un nodo elemento ya existente**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - createTextNode, ejemplo 2&lt;/title&gt;

    &lt;script&gt;

    function mostrar() {

    var textNode = document.createTextNode('Nuevo nodo de texto');

    var elementNode = document.createElement('h3');

    elementNode.appendChild(textNode);

    document.querySelector('\#t1').appendChild(elementNode);

    console.log(document.querySelector('\#t1').innerText);

    console.log(document.querySelector('\#t1').innerHTML);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="t1"&gt;&lt;/div&gt;

    &lt;input type="button" onclick="mostrar()" value="Mostrar" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Creacion-propiedades-y-metodos/image3.png)

###El retorno de carro y el espacio en blanco


Tanto uno como otro crean por sí solos nodos de texto (son del tipo
*object text*), como podremos comprobar en los ejemplos que siguen.

En el Listado 3, nos encontramos con:

* Un párrafo &lt;p&gt; vacío identificado como t1.

* Un segundo párrafo &lt;p&gt; vacío identificado como t2.

* Entre ambos un espacio en blanco que consta, exclusivamente de un
retorno de carro.

El código *JavaScript* que sigue –mediante salidas por consola-:

* Identifica el nodo asociado como hijo al primer párrafo (será *null*).

* Identifica el nodo asociado como primer hermano del primer párrafo (será
*text*). Se trata del retorno de carro.

* Nos identifica el primer carácter de dicho texto (un valor ASCII 10).

* Identifica el nodo asociado como hijo al segundo párrafo (será *null*).

**Listado 3: Ejemplo de nodo de texto que consta de sólo un retorno de carro.**


```
        &lt;!doctype html&gt;

        &lt;html&gt;

        &lt;head lang="es-es"&gt;

        &lt;meta charset="utf-8" /&gt;

        &lt;title&gt;Text Node - Carriage Return&lt;/title&gt;

        &lt;/head&gt;

        &lt;body&gt;

        &lt;p id="t1"&gt;&lt;/p&gt;

        &lt;p id="t2"&gt;&lt;/p&gt;

        &lt;script&gt;

        var text = document.querySelector('\#t1').firstChild;

        console.log(text);

        var text = document.querySelector('\#t1').nextSibling;

        console.log(text);

        console.log('Código ASCII: ', text.textContent.charCodeAt(0));

        var text = document.querySelector('\#t2').firstChild;

        console.log(text);

        &lt;/script&gt;

        &lt;/body&gt;

        &lt;/html&gt;

```

![] (./img/Creacion-propiedades-y-metodos/image4.png)

En el Listado 4, nos encontramos con:

* Un párrafo &lt;p&gt; vacío identificado como t1.

* Un segundo párrafo &lt;p&gt;, con un espacio en blanco como nodo de
texto asociado, identificado como t2.

El código *JavaScript* que sigue –mediante salidas por consola-:

* Identifica el nodo asociado como hijo al primer párrafo (será *null*).

* Identifica el nodo asociado como hijo del segundo párrafo (será *text*).
Se trata del espacio en blanco.

* Nos identifica el primer carácter de dicho texto (un valor ASCII 32).

**Listado 4: Ejemplo de nodo de texto que consta de sólo un
        espacio en blanco.**

```

        &lt;!doctype html&gt;

        &lt;html&gt;

        &lt;head lang="es-es"&gt;

        &lt;meta charset="utf-8" /&gt;

        &lt;title&gt;Text Node - White Space&lt;/title&gt;

        &lt;/head&gt;

        &lt;body&gt;

        &lt;p id="t1"&gt;&lt;/p&gt;

        &lt;p id="t2"&gt; &lt;/p&gt;

        &lt;script&gt;

        var text = document.querySelector('\#t1').firstChild;

        console.log(text);

        var text = document.querySelector('\#t2').firstChild;

        console.log(text);

        console.log('Código ASCII: ', text.textContent.charCodeAt(0));

        &lt;/script&gt;

        &lt;/body&gt;

        &lt;/html&gt;

```

![] (./img/Creacion-propiedades-y-metodos/image5.png)

###Propiedades y métodos, su listado


Todo elemento del DOM dispone de una colección de propiedades y métodos,
normalmente heredados de sus nodos padres.

En el Listado 5 ilustramos el modo de extraer las propiedades y métodos
de nodo de texto que se encuentra asociado –en el interior de- una
etiqueta &lt;p&gt; que pende directamente del cuerpo del documento
-&lt;body&gt;-. Obsérvese que el modo de extraer las propiedades y
métodos propios, totales y sólo heredados es genérico –método de
aplicación general-.

**Listado 5: Determinación de las propiedades y métodos propios, generales y heredados.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - Properties and Methods&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p&gt;Nodo de texto simple&lt;/p&gt;

    &lt;script&gt;

    var text = document.querySelector('p').firstChild;

    // Propiedades propias (sólo)

    console.log(Object.keys(text).sort());

    // Propiedades propias y heredadas

    var textPropertiesIncludeInherited = \[\];

    for (var p in text) {

    textPropertiesIncludeInherited.push(p);

    }

    console.log(textPropertiesIncludeInherited.sort());

    // Propiedades heredadas (sólo)

    var textPropertiesOnlyInherited = \[\];

    for (var p in text) {

    if (!text.hasOwnProperty(p)) {

    textPropertiesOnlyInherited.push(p);

    }

    }

    console.log(textPropertiesOnlyInherited.sort());

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Creacion-propiedades-y-metodos/image6.png)

Una lista completa de propiedades y métodos la podemos encontrar en la
siguiente dirección URL, en la que nos enlazará con las diversas
implementaciones del DOM:

**https://developer.mozilla.org/en-US/docs/Web/API/text**

###Conclusiones


En el presente artículo hemos visto lo más general del estudio de los
nodos de texto –*object text*- de un documento HTML. Así, tratamos su
creación al vuelo y el conocimiento de la lista de todas las propiedades
y métodos de ellos.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
