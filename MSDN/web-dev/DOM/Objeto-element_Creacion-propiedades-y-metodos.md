---
title: Explorando el DOM- Objeto element. Creación, propiedades y métodos
description: Objeto object element con sus propiedades y métodos
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Objeto element. Creación, propiedades y métodos

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


Cada elemento de un documento HTML tiene su propia entidad y se trata de
un objeto –*object element*- con sus propiedades y métodos
característicos.

Esto será abordado con ejemplos ilustrativos en cada caso; en concreto,
en el presente artículo, trataremos:

* Los constructores y la creación de elementos.

* Los nombres de etiqueta –*tagName*- de los elementos.

Propiedades y métodos de los elementos:

* Los propios

* Heredados

* Su globalidad



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

###Los constructores y la creación de elementos


Para conocer la estructura interna de los constructores de los diversos
elementos del documento HTML y para crearlos dinámicamente una vez
expuesto en un explorador de Internet, disponemos de dos métodos, que
recogemos seguidamente y comentaremos más abajo:

  Método            |Descripción
  ----------------- |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *constructor*     |Nos devuelve el objeto constructor del elemento correspondiente, que tiene el formato sintáctico *HTML&lt;nombre del elemento&gt;Element*, como por ejemplo *HTMLAnchorElement*.
  *createElement*   |Nos proporciona un nuevo nodo con un tipo de elemento HTML que se le da como parámetro a la hora de su creación –*tagName* o nombre de etiqueta-.

Respecto a *constructor*, nos devolverá objetos, como indicábamos.
Dichos objetos son de uso interno y no se suelen emplear directamente,
por lo que este método tiene para nosotros un interés informativo, sin
más.

La sintaxis de llamada es tan sencilla como, por ejemplo:

*console.log(document.querySelector('p').constructor);*

Lo que nos mostraría en la *Consola de texto* el nombre del constructor
del elemento &lt;p&gt; existente en el archivo HTML. Véase por ejemplo
el Listado 2 de más abajo.

Recuérdese que para acceder a la Consola de texto del explorador, hemos de pulsar la tecla F12 y allí seleccionar la pestaña de Consola


![] (./img/Objeto-element_Creacion-propiedades-y-metodos/image1.png)

Para la creación de un nuevo elemento, utilizaremos el método
*createElement*, cuya sintaxis podría ser algo similar a:

* *var nuevoElemento = document.createElement(&lt;elemento&gt;);*

Ahora tendríamos que adjuntar el elemento nuevo al documento HTML, en el
lugar deseado, como por ejemplo:

* *document.body.appendChild(nuevoElemento);*

Para un listado completo de elementos –*tagName* correspondiente,
nombres de etiquetas- y sus diversas agrupaciones, puede acudirse a la
siguiente dirección URL:

[**http://www.whatwg.org/specs/web-apps/current-work/multipage/section-index.html**](http://www.whatwg.org/specs/web-apps/current-work/multipage/section-index.html)

En el Listado 1, hemos programado:

* Un cuerpo de documento &lt;body&gt; inicialmente vacío.

En él está contenido un código *JavaScript*, que realiza las siguientes
secuencias de comandos:

* Crear un nodo del tipo &lt;div&gt;

* Lo añade como elemento hijo directamente al nodo &lt;body&gt;

* Se comprueba que &lt;div&gt; ahora es un elemento del DOM y se saca el resultado de la comprobación por la consola

* Finalmente, se incluye un código de texto HTML en el interior del &lt;div&gt; recién creado.

Como consecuencia de todo ello, nosotros al abrir el documento, ya
deberíamos ver el texto en la ventana del explorador y el resultado
de la comprobación en la *Consola de textos* y en el *Explorador DOM*.


**Listado 1: Creación de un nuevo elemento, mediante createElement**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement createElement&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;script&gt;

    var elementNode = document.createElement('div'); // Llamada al
    constructor

    document.body.appendChild(elementNode);

    console.log(document.querySelector('div')); // Verificamos que se
    encuentra en el DOM

    document.querySelector('div').innerHTML =
    '&lt;h1&gt;Saludos&lt;/h1&gt;';

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Objeto-element_Creacion-propiedades-y-metodos/image2.png)

###Obtener el tagName de un elemento


Para la obtención del nombre de la etiqueta HTML de un elemento
–*tagName*-, disponemos de una propiedad específica de dicho elemento y
de otra específica del nodo de dicho elemento, que se recogen en la
tabla que sigue:

  **Propiedad**   |**Descripción**
  --------------- |--------------------------------------------------------------------------------------------------------------------------------------
  *tagName*       |Devuelve el nombre de la etiqueta del elemento aludido.
  *nodeName*      |Se comporta de igual manera, al devolver el nombre del nodo. Se pueden usar indistintamente, pruébese en el ejemplo de más adelante.

Como ejemplo de aplicación, usaremos la propiedad específica de recabar
el nombre de la etiqueta HTML del elemento.

En el código del Listado 2 programamos y ejecutamos las siguientes
acciones:

* Creamos un cuerpo de documento con un titular –id="A"- y un hipervínculo
–id="B"-

* A su vez, programamos un botón de comando, que al ser pulsado llamará a
la función *mostrar()*.

* Dicha función lo que hace es localizar el elemento de id="B", el
hipervínculo, y recabar su *tagName*.

* Finalmente se mostrará el valor en la *Consola de texto* del explorador
y como una alerta –mensaje de alerta-.

**Listado 2: Determinación del nombre de un elemento –tagName- del DOM**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement tagName&lt;/title&gt;

    &lt;script&gt;

    function mostrar() {

    var texto = 'tagName = ';

    // Localiza el elemento del DOM y detecta el nombre de tagName

    texto = texto + document.getElementById("B").tagName;

    console.log(texto);

    alert(texto);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A"&gt;Párrafo&lt;/p&gt;

    &lt;a href="\#" id="B"&gt;Referencia&lt;/a&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="Mostrar" onclick="mostrar();" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Objeto-element_Creacion-propiedades-y-metodos/image3.png)

###Propiedades y métodos, su listado


Todo elemento del DOM dispone de una colección de propiedades y métodos,
normalmente heredados de sus nodos padres.

En el Listado 3 ilustramos el modo de extraer las propiedades y métodos
de una etiqueta &lt;a&gt; que pende directamente del cuerpo del
documento -&lt;body&gt;-. Obsérvese que el modo de extraer las
propiedades y métodos propios, totales y sólo heredados es genérico
–método de aplicación general-.

**Listado 3: Determinación de las propiedades y métodos propios, generales y heredados**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement Properties&Methods&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;a href="\#"&gt;Referencia -href-&lt;/a&gt;

    &lt;script&gt;

    var anchor = document.querySelector('a');

    // Propiedades propias (sólo)

    console.log(Object.keys(anchor).sort());

    // Propiedades propias y heredadas

    var documentPropertiesIncludeInherited = \[\];

    for (var p in document) {

    documentPropertiesIncludeInherited.push(p);

    }

    console.log(documentPropertiesIncludeInherited.sort());

    // Propiedades heredadas (sólo)

    var documentPropertiesOnlyInherited = \[\];

    for (var p in document) {

    if (!document.hasOwnProperty(p)) {

    documentPropertiesOnlyInherited.push(p);

    }

    }

    console.log(documentPropertiesOnlyInherited.sort());

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Objeto-element_Creacion-propiedades-y-metodos/image4.png)

Una lista completa de propiedades y métodos la podemos encontrar en la
siguiente dirección URL:

[**https://developer.mozilla.org/en-US/docs/Web/API/element**](https://developer.mozilla.org/en-US/docs/Web/API/element)

###Conclusiones


En el presente artículo hemos visto lo más general del estudio de los
elementos –*object element*- de un documento HTML. Así, tratamos su
creación al vuelo y el conocimiento de la lista de todas las propiedades
y métodos de ellos.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




