---
redirect_url: https://docs.microsoft.com/
title: Explorando el DOM- Objeto element. Atributos Class e ID
description: DOM- Objeto element. Atributos Class e ID
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Objeto element. Atributos Class e ID

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


En el ámbito de la cascada de estilos de un documento HTML, nos
encontramos con que existe la posibilidad de definirlos en la etiqueta
&lt;style&gt; en forma de clase –atributo *class*- o como pertenecientes
a un identificador de elemento *id*.

En concreto, en el presente artículo, nos ocuparemos de:

Las propiedades de estilos CSS.

Gestión de estilos mediante la clase de pertenencia.

Gestión de estilos mediante el identificador del elemento.

Asignación, consulta y eliminación de estilos de un elemento dado.

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

###Propiedades CSS


Las propiedades de las hojas de estilo en cascada –CSS, *Cascade Style
Sheets*- se denotan mediante una serie de palabras clave, un valor y una
unidad, en el caso más general, o bien con la palabra clave y una unidad
cualitativa y así sucesivamente.

Hemos de conocer, por tanto, la sintaxis particular de cada una de
ellas, en la Tabla 1 recogemos los nombres –palabras clave- de algunas
de las más utilizadas y en la dirección URL que sigue se puede consultar
todo lo referente a su sintaxis:

[**https://developer.mozilla.org/en-US/docs/Web/CSS/CSS\_Properties\_Reference**](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference)

**Propiedad CSS** |
  ------------------------------- |
  background |
  background-attachment|
  background-color |
  background-image |
  background-position |
  background-repeat |
  border |
  border-bottom |
  border-bottom-color |
  border-bottom-style |
  border-bottom-width |
  border-color |
  border-left |
  border-left-color |
  border-left-style |
  border-left-width |
  border-right |
  border-right-color |
  border-right-style |
  border-right-width |
  border-style |
  border-top |
  border-top-color |
  border-top-style |
  border-top-width |
  border-width |
  clear |
  clip |
  color |
  cursor |
  display |
  filter |
  font |
  font-family |
  font-size |
  font-variant |
  font-weight |
  height |
  left |
  letter-spacing |
  line-height |
  list-style |
  list-style-image |
  list-style-position |
  list-style-type |
  margin |
  margin-bottom |
  margin-left |
  margin-right |
  margin-top |
  overflow |
  padding |
  padding-bottom |
  padding-left |
  padding-right |
  padding-top |
  page-break-after |
  page-break-before |
  position |
  float |
  text-align |
  text-decoration |
  text-decoration: blink |
  text-decoration: line-through |
  text-decoration: none |
  text-decoration: overline |
  text-decoration: underline |
  text-indent |
  text-transform |
  top |
  vertical-align |
  visibility |
  width |
  z-index |

**Tabla 1**: Algunos valores de propiedades CSS utilizables en la
definición de estilos para los atributos *class* e *id*.

###Atributo class


La clase de pertenencia de un elemento –de una etiqueta concreta- puede
llevar asociado un conjunto de definiciones de estilos CSS; dado que una
clase de pertenencia no deja de ser un atributo del elemento que se
puede asignar, cambiar, recabar su valor o eliminar –como veremos-,
podremos aprovecharlo para modificar o asignar los estilos de los
elementos.

En nuestro caso vamos a fijar el alto, ancho, borde y color de fondo de
un área &lt;div&gt; de nuestro documento HTML. Utilizaremos botones de
comando para cambiar los estilos, en esta ocasión asignando o eliminando
la clase de pertenencia del elemento.

Los métodos que emplearemos son los que siguen:

  **Método**           **Descripción**
  -------------------- --------------------------------------------------------------------------------------------------------------
  *classList.add*      Asigna –o añade- una clase al elemento aludido.
  *classList*          Devuelve la colección de clases de pertenencia. Puede pertenecer desde cero a varias clases simultáneamente.
  *classList.remove*   Elimina una clase de pertenencia del elemento aludido.

Sus sintaxis son, respectivamente:

elemento.classList.add(‘clase’)

colección = elemento.classList

elemento.classList.remove(‘clase’)

Un ejemplo podemos verlo en el Listado 1:

Codificaremos tres funciones *JavaScript*, con las siguientes
funcionalidades:

**set**: fija los valores de los atributos referenciados en el apartado
de clase de estilos CSS*.*

**get**: obtiene la clase o colección de clases de pertenencia del
elemento aludido y lo muestra en la consola de texto del Explorador.

**remove**: elimina –pone a cero- los atributos referenciados en el
apartado de clase de estilos CSS*.* Eliminará todos los fijados en la
cascada de estilos CSS.

Tres botones de comando que llaman a las funciones antes comentadas.

Para consultar el valor del atributo de clase, al hacer clic sobre el
botón **get**, deberemos acceder a la **Herramientas F12** de *Internet
Explorer* y allí ver la consola de texto –pulsando la tecla **F12** y
seleccionado la opción de la barra de herramientas **Consola de
texto**-.

**Listado 1: Gestión de estilos mediante el atributo de clase –class-.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Set, Get and Remove CSS Properties - class
    Attribute&lt;/title&gt;

    &lt;style&gt;

    .cuadrado {

    background-color:yellow;

    border:4px solid black;

    height:300px;

    width:300px;

    }

    &lt;/style&gt;

    &lt;script&gt;

    //set

    function set() {

    var divStyle = document.getElementById('A');

    divStyle.classList.add('cuadrado');

    }

    //get

    function get() {

    var divStyle = document.getElementById('A');

    console.log(divStyle.classList);

    }

    //remove

    function remove() {

    var divStyle = document.getElementById('A');

    divStyle.classList.remove('cuadrado');

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="A"&gt;&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="set" onclick="set()" /&gt;

    &lt;input type="button" value="get" onclick="get()" /&gt;

    &lt;input type="button" value="remove" onclick="remove()" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Objeto-element_Atributos-Class-e-ID/image1.png)

###Atributo identificador (id)


Un identificador de un elemento –de una etiqueta concreta- puede llevar
asociado un conjunto de definiciones de estilos CSS; dado que un
identificador no deja de ser un atributo del elemento que se puede
asignar, cambiar, recabar su valor o eliminar –como cualquier otro
atributo-, podremos aprovecharlo para modificar o asignar los estilos de
los elementos.

En nuestro caso realizaremos la misma función que en el ejemplo
anterior, es decir, fijar el alto, ancho, borde y color de fondo de un
área &lt;div&gt; de nuestro documento HTML. También como antes,
utilizaremos botones de comando para cambiar los estilos, en esta
ocasión alterando el identificador del elemento.

En un artículo anterior habíamos tratado el tema de los atributos de los
elementos del DOM y su gestión:

[**Explorando el DOM: Objeto element. Atributos y su
gestión**](http://msdn.microsoft.com/es-es/library/dn766202.aspx)

En uno de sus apartados comentábamos los métodos disponibles al
respecto, que recogemos en la tabla que sigue:

  Método              |  Descripción
  ------------------- | -----------------------------------------------------------------------------------------------------------------------
  *setAttribute*      | Fija el valor de un determinado atributo, se pasa el nombre del atributo a fijar y su valor.
  *getAttribute*      | Devuelve un valor de un determinado atributo, o nulo –cadena vacía- de no existir
  *removeAttribute*   | Retira un determinado atributo. Es el modo recomendado de hacerlo y no fijando un valor nulo mediante *setAttribute*.

Sus sintaxis son, respectivamente:

elemento.setAttribute(atributo, valor)

valor = elemento.getAttribute(atributo)

elemento.removeAttribute(atributo)

En donde atributo es *‘id’* y el valor dado o devuelto es el valor del
atributo *id* que contenga las propiedades de estilo en el formato CSS,
véase la Tabla 1.

El código del ejemplo podemos verlo en el Listado 2:

Codificaremos tres funciones *JavaScript*, con las siguientes
funcionalidades:

**set**: fija los valores de los atributos referenciados en el apartado
de identificador de estilos CSS*.*

**get**: recupera el valor del atributo identificador actualmente
asignado al elemento, o *null*. Lo muestra en la consola de texto del
Explorador.

**remove**: elimina –pone a cero- los atributos referenciados en el
apartado de identificador de estilos CSS*.* Eliminará todos los fijados
en la cascada de estilos CSS.

Tres botones de comando que llaman a las funciones antes comentadas.

Para consultar el valor del atributo identificador, al hacer clic sobre
el botón **get**, deberemos acceder a la **Herramientas F12** de
*Internet Explorer* y allí ver la consola de texto –pulsando la tecla
**F12** y seleccionado la opción de la barra de herramientas **Consola
de texto**-.

**Listado 2: Gestión de estilos mediante el atributo identificador –id-.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Set, Get and Remove CSS Properties - id
    Attribute&lt;/title&gt;

    &lt;style&gt;

    \#cuadrado {

    background-color:yellow;

    border:4px solid black;

    height:300px;

    width:300px;

    }

    &lt;/style&gt;

    &lt;script&gt;

    //set

    function set() {

    var divStyle = document.querySelector('div');

    divStyle.setAttribute('id', 'cuadrado');

    }

    //get

    function get() {

    var divStyle = document.querySelector('div');

    console.log("id= " + divStyle.getAttribute('id'));

    }

    //remove

    function remove() {

    var divStyle = document.querySelector('div');

    divStyle.removeAttribute('id');

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="set" onclick="set()" /&gt;

    &lt;input type="button" value="get" onclick="get()" /&gt;

    &lt;input type="button" value="remove" onclick="remove()" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Objeto-element_Atributos-Class-e-ID/image2.png)

![] (./img/Objeto-element_Atributos-Class-e-ID/image3.png)

###Conclusiones


En el presente artículo hemos visto cómo gestionar estilos mediante los
atributos de clase y el identificador –atributo *id*- de un elemento
tipo etiqueta HTML. En ambos casos tratamos la inclusión, consulta del
tipo y eliminación de estilos, con las propiedades estándar CSS, de un
elemento dado.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




