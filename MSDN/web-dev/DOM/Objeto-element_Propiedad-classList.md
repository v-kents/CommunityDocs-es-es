---
title: Explorando el DOM- Objeto element. Propiedad classList
description: Objeto element con la propiedad classList y el atributo class
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Objeto element. Propiedad classList

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


En nuestros anteriores artículos:

* Explorando el DOM: Objeto element. Creación, propiedades y métodos:

[**http://msdn.microsoft.com/es-es/library/dn766203.aspx**](http://msdn.microsoft.com/es-es/library/dn766203.aspx)

* Explorando el DOM: Objeto element. Atributos y su gestión:

[**http://msdn.microsoft.com/es-es/library/dn766202.aspx**](http://msdn.microsoft.com/es-es/library/dn766202.aspx)

Habíamos tratado los aspectos más generales del objeto *element*, en el
presente nos detendremos en una de sus propiedades más interesantes, que
nos permitirá tratar con el atributo *class* y por tanto enlazarnos con
los estilos activos en un determinado elemento del documento, de manera
dinámica en tiempo de ejecución, si fuera el caso y mediante rutinas muy
simples en código *JavaScript*.

Esto será abordado con ejemplos ilustrativos, en concreto, en el
presente artículo, trataremos:

* Uso elemental de *classList* y *className*

* Los métodos de *classList*

* Manejo de ítems e índices

* Añadir y retirar valores de pertenencia a una clase de estilo

* Permutar el estado de pertenencia a un determinado estilo

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

###La propiedad classList


La propiedad *classList*, que es de sólo lectura, nos da información
acerca de la lista de clases de pertenencia de un determinado elemento
del DOM. Es decir, un atributo tipo *class*, con respecto a las clases
de estilos que son aplicables a dicho elemento, puede contener varias
referencias –puede, dicho de otra manera, pertenecer a varias clases de
estilos-. Esta propiedad dará cuenta de todas ellas en forma de una
lista ordenada, similar a una matriz lineal, que comienza a
referenciarse por el elemento cero, el primero.

Más adelante hablaremos de los diversos métodos disponibles para
acceder, modificar y permutar valores de las clases de pertenencia y
como complemento sugerimos fundamentalmente la siguiente dirección URL:

[**http://html5doctor.com/the-classlist-api/**](http://html5doctor.com/the-classlist-api/)

Para comenzar, veamos como ilustración el Listado 1, en el que hemos
programado:

Un elemento &lt;div&gt; con un estilo que contiene tres clases de
estilos.

Los estilos son definidos en el apartado &lt;style&gt; correspondiente
del área &lt;head&gt; del documento.

Al hacer clic sobre el texto que hay en el elemento &lt;div&gt; se hace
una llamada a una alerta que muestra el contenido de *classList* y eso
nos muestra la lista de clases de pertenencia –su nombre sin más en este
caso, más abajo veremos otras posibilidades.

**Listado 1: El método classList informa de las clases de pertenencia de un elemento del DOM &lt;!doctype html&gt;**

```

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTML Document&lt;/title&gt;

    &lt;style&gt;

    div.resaltado{

    font-weight:bold;

    font-size:4em;

    }

    div.rojo{

    color:red;

    }

    div.centrado{

    text-align:center;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="A" class="resaltado rojo centrado"
    onclick="alert(this.classList)"&gt;Texto ejemplo&lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Propiedad-classList/image1.png)

Vista en Internet Explorer de los estilos de pertenencia en el
Explorador del DOM y en la alerta ejecutada al hacer clic sobre el texto
ejemplo.

###Extracción del listado de clases


Si utilizamos la propiedad alternativa *className*, obtendremos la
información de las clases de pertenencia de un elemento HTML, pero en un
formato tipo cadena de caracteres, de más difícil manejo, ya que
tendríamos que extraer los elementos codificándolo manualmente –están
separados por espacios en blanco-.

Por su parte, si utilizamos *classList*, se nos devuelve una lista de
valores de las clases a las que pertenece el elemento. Cómo ya
informábamos previamente, el primer valor es el de índice cero, hasta el
correspondiente al de la longitud de la lista menos uno.

En el ejemplo del Listado 2, que sigue, ilustramos como extraer los
valores de las clases de pertenencia mediante *classList* y mediante
*className*. Obsérvense las diferencias, una lista en el primer caso,
una cadena de caracteres en el segundo.

**Listado 2: Listado de clases de pertenencia, mediante classList y className**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement classList Values&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="resaltado rojo centrado"&gt;&lt;/div&gt;

    &lt;script&gt;

    var elm = document.querySelector('div');

    console.log(elm.classList); // resaltado rojo centrado
    {0="resaltado", 1="rojo", 2="centrado", length=3}

    console.log(elm.className); // 'resaltado rojo centrado'

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Propiedad-classList/image2.png)

Vista en la Consola de salida de texto de Internet Explorer.

![] (./img/Propiedad-classList/image3.png)

Vista en la Consola de salida de texto de Google Chrome.

Fijémonos ahora en cómo extraer cada uno de los valores posibles de
clase del elemento. Dado que *classList* es una matriz de valores,
podemos acceder a cada uno en concreto, sin más que apuntar a su índice,
es decir:

*&lt;referencia del elemento&gt;.classList\[índice\]*;

También es posible y tal vez más recomendable utilizar el método:

*&lt;referencia del elemento&gt;.classList.item(índice);*

Véase el Listado 3, en el que se puede ver una ejemplificación de los
diversos métodos.

**Listado 3: Acceso a índices e ítems de clases de pertenencia de classList**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement classList Values&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="resaltado rojo centrado"&gt;&lt;/div&gt;

    &lt;script&gt;

    var elm = document.querySelector('div');

    console.log(elm.classList); // resaltado rojo centrado
    {0="resaltado", 1="rojo", 2="centrado", length=3}

    console.log(elm.classList.length);

    console.log(elm.classList\[0\]);

    console.log(elm.classList.item(1));

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

###Métodos de classList


Si bien la propiedad *classList*, como apuntábamos más arriba, es de
sólo lectura, disponemos de una serie de métodos implementados que nos
permiten acceder a su contenido, eliminar clases y añadir otras nuevas.

El soporte en los diversos exploradores es sólo completo en las últimas
versiones, las equivalentes a *Internet Explorer* 11 y posteriores
–Chrome 24, Firefox 24 y Opera 15-.

El API correspondiente y su discusión completa lo podemos encontrar, por
ejemplo, en la siguiente dirección URL:

[**http://html5doctor.com/the-classlist-api/**](http://html5doctor.com/the-classlist-api/)

**(<https://developer.mozilla.org/en-US/docs/Web/API/Element.classList>)**

En general, no serán útiles los siguientes métodos:

  Método       |Descripción
  ------------ |----------------------------------------------------------------------------
  *add*        |Añade una clase a la lista
  *remove*     |Retira –elimina- una clase de la lista
  *contains*   |Verifica si una clase está en la lista
  *toggle*     |Permuta la pertenencia a una clase en la lista –añade o retira-
  *item*       |Devuelve la clase que se encuentra en la posición especificada de la lista
  *toString*   |Convierte la lista en una cadena de caracteres
  *length*     |Devuelve la longitud de la lista –el número de clases que hay en ella-
  *value*      |Utilizado para añadir propiedades y métodos personalizados

###Añadir y retirar valores


En la tabla anterior se recogen los dos métodos que tenemos para
gestionar la adición y retirada de los valores de la clase de un
elemento HTML –los dos primeros de la lista- y un tercero para permutar
su estado, de lo que nos ocuparemos en el apartado que sigue.

Para todos ellos la sintaxis es la misma:

*&lt;referencia del elemento&gt;.classList.método(valor);*

Veremos cómo utilizar los métodos anteriormente descritos para añadir
nuevas clases de pertenencia y eliminarlas, de un elemento dado del DOM.

En nuestro ejemplo, contenido en el Listado 4, hemos programado
esencialmente lo que sigue:

En el cuerpo del texto –etiqueta &lt;body&gt;-, incluimos:

* Un párrafo con *id=”A”* que será el objeto de aplicación y retirada de clases de estilos.

* Una barra de separación, meramente decorativa.

* Un botón de comando que cambiará las clases de estilos de pertenencia del párrafo con *id=”A”*.

* Al pulsar el botón de comando se ejecutará el código contenido en la función *cambiar*, esto es:

* Tomaremos la referencia del elemento sobre el cual se modificarán las clases de pertenencia a estilos, mediante *getElementById*.

* Eliminamos su pertenencia al estilo *color1*, mediante *classList.remove(‘color1’)*.

* Establecemos su pertenencia al nuevo estilo *color2*, mediante *classList.add(‘color2’)*.

* Obsérvese que dado que ya no será necesario el botón de comando, se elimina mediante *removeChild*.

* Por lo demás, el código se completa con la definición de las clases de estilos pertinentes, incluyendo una opción *hover*.

**Listado 4: Adición y retirada de clases de pertenencia mediante los métodos add y remove**


```
        &lt;!doctype html&gt;

        &lt;html&gt;

        &lt;head lang="es-es"&gt;

        &lt;meta charset="utf-8" /&gt;

        &lt;title&gt;HTMLElement classList remove and add&lt;/title&gt;

        &lt;style&gt;

        p.color1 {

        color: red;

        font-size: 3em;

        }

        p.color1:hover{

        color: coral;

        }

        p.color2 {

        color: blue;

        font-size: 2em;

        }

        &lt;/style&gt;

        &lt;script&gt;

        function cambiar() {

        var elemento = document.getElementById('A');

        elemento.classList.remove('color1');

        elemento.classList.add('color2');

        console.log(elemento.className); // Expone el nombre de clase
        activa

        // Eliminamos el botón de comando, ¡¡ya lo hemos utilizado!!

        var elemento = document.getElementById('B');

        elemento.parentNode.removeChild(elemento);

        }

        &lt;/script&gt;

        &lt;/head&gt;

        &lt;body&gt;

        &lt;p id="A" class="color1"&gt;Párrafo en color&lt;/p&gt;

        &lt;hr style="height: 10px; background-color:red" /&gt;

        &lt;input id="B" type="button" value="Cambiar estilo"
        onclick="cambiar();" /&gt;

        &lt;/body&gt;

        &lt;/html&gt;

```

Una opción más drástica es la eliminación de todas las clases de
pertenencia de un elemento dado, para ello fijémonos en el Listado 4b,
en el que se muestra la modificación de la función *cambiar()*, que
ahora contiene:

*elemento.classList.remove(elemento.className);*

Siendo que *elemento.className* contiene la lista de todas las clases a
las cuales pertenece el elemento del DOM aludido.

**Listado 4b: Modificación de la función cambiar(), de manera que se eliminarán todas las pertenencias a clases, en vez de una en concreto.**


```
    &lt;script&gt;

    function cambiar() {

    var elemento = document.getElementById('A');

    // Hacemos que borre la clase actual, sea cual sea

    elemento.classList.remove(elemento.className);

    elemento.classList.add('color2');

    console.log(elemento.className); // Expone el nombre de clase activa

    // Eliminamos el botón de comando, ¡¡ya lo hemos utilizado!!

    var elemento = document.getElementById('B');

    elemento.parentNode.removeChild(elemento);

    }

    &lt;/script&gt;
```

**Permutar el estado de un valor**


Veamos ahora, como anticipábamos, el modo de empleo del método de
permutación de pertenencia a una clase dada.

En nuestro ejemplo, contenido en el Listado 5, hemos programado
esencialmente lo que sigue:

En el cuerpo del texto –etiqueta &lt;body&gt;-, incluimos:

* Un párrafo con *id=”A”* que será el objeto de aplicación y retirada de clases de estilos.

* Una barra de separación, meramente decorativa.

* Un botón de comando que permutará las clases de estilos de pertenencia del párrafo con *id=”A”*.

* Al pulsar el botón de comando se ejecutará el código contenido en la función *permutar*, esto es:

* Tomaremos la referencia del elemento sobre el cual se modificarán las clases de pertenencia a estilos, mediante *getElementById*.

* Permutará el estado de activo/desactivado de la clase *color1*, mediante *classList.toggle(‘color1’)*. Inicialmente *color1* es la clase activa.

Permutará el estado de activo/desactivado de la clase *color2*, mediante
*classList.toggle(‘color2’)*. Inicialmente *color2* no es la clase
activa.

Se lanza una alerta informativa con el contenido de las clases de
pertenencia en la Consola de texto del explorador; en nuestro caso sólo
debería ser una, que expondrá el nombre de la clase actualmente activa.

Por lo demás, el código se completa con la definición de las clases de
estilos pertinentes, incluyendo una opción *hover* –que se activa al
pasar sobre el elemento-.

**Listado 5: Modo de permutar el estado de pertenencia a clases, mediante el método toggle**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement classList toggle&lt;/title&gt;

    &lt;style&gt;

    p.color1 {

    color: red;

    font-size: 3em;

    }

    p.color1:hover{

    color: coral;

    }

    p.color2 {

    color: blue;

    font-size: 2em;

    }

    &lt;/style&gt;

    &lt;script&gt;

    function permutar() {

    var elemento = document.getElementById('A');

    elemento.classList.toggle('color1');

    elemento.classList.toggle('color2');

    console.log(elemento.className); // Expone el nombre de clase activa

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A" class="color1"&gt;Párrafo en color&lt;/p&gt;

    &lt;hr style="height: 10px; background-color:red" /&gt;

    &lt;input type="button" value="Permutar estilo"
    onclick="permutar();" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

###Conclusiones


En el presente artículo hemos visto cómo gestionar de manera ágil y
potente el atributo *class* de un elemento dado, con ello tendremos un
acceso eficiente a los estilos de pertenencia y todo ello al vuelo, en
tiempo de ejecución, mediante sencillas rutinas de código *JavaScript*.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




