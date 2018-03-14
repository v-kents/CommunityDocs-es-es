---
redirect_url: https://docs.microsoft.com/
title: Explorando el DOM- Objeto element. Objeto y atributo Style (Inline Styles)
description: Propiedades de estilos atributo style, inline styles
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Objeto element. Objeto y atributo Style (Inline Styles)

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  



Las propiedades de estilos pueden ser fijadas en el atributo *style*,
dentro de las etiquetas HTML de un elemento dado –los denominados
*inline styles*-. Dinámicamente podremos cambiar su valor, por varios
métodos que suponen el acceso mediante *JavaScript*.

En concreto, en el presente artículo, nos ocuparemos de:

* Propiedades CSS en *JavaScript*.

* El objeto *style* de *JavaScript*.

* Fijar, obtener y eliminar propiedades individuales.

* La propiedad *cssText*.

* Fijar las propiedades de estilo de forma genérica.

Para una aproximación preliminar al tratamiento y conocimiento del
esquema y tipos de nodos, consúltese el artículo **Explorando el DOM:
Tipos de nodos y sus atributos generales**:

**http://msdn.microsoft.com/es-es/library/dn367218.aspx**

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

###Propiedades CSS en JavaScript. El objeto style


El objeto *style* de *JavaScript*, nos da acceso a la globalidad de las
propiedades del atributo *style* de CSS –no se confundan ambos términos
que, eso sí, refieren y dan acceso a las mismas propiedades-.

Para utilizar las propiedades *JavaScript* hemos de usar los métodos que
se enumeran en el apartado que sigue –del todo simples, por otra parte-.

Del foro MDN –*Mozilla Developer Network*-, hemos extraído un listado de
propiedades utilizables en *style* de *JavaScript.* Véase la Tabla 1,
obsérvese que se muestran las equivalencias con las propiedades CSS:

**https://developer.mozilla.org/en-US/docs/Web/CSS/CSS\_Properties\_Reference**

  **Propiedad CSS**               |**Propiedad JavaScript**
  ------------------------------- |---------------------------
  background                      |background
  background-attachment           |backgroundAttachment
  background-color                |backgroundColor
  background-image                |backgroundImage
  background-position             |backgroundPosition
  background-repeat               |backgroundRepeat
  border                          |border
  border-bottom                   |borderBottom
  border-bottom-color             |borderBottomColor
  border-bottom-style             |borderBottomStyle
  border-bottom-width             |borderBottomWidth
  border-color                    |borderColor
  border-left                     |borderLeft
  border-left-color               |borderLeftColor
  border-left-style               |borderLeftStyle
  border-left-width               |borderLeftWidth
  border-right                    |borderRight
  border-right-color              |borderRightColor
  border-right-style              |borderRightStyle
  border-right-width              |borderRightWidth
  border-style                    |borderStyle
  border-top                      |borderTop
  border-top-color                |borderTopColor
  border-top-style                |borderTopStyle
  border-top-width                |borderTopWidth
  border-width                    |borderWidth
  clear                           |clear
  clip                            |clip
  color                           |color
  cursor                          |cursor
  display                         |display
  filter                          |filter
  font                            |font
  font-family                     |fontFamily
  font-size                       |fontSize
  font-variant                    |fontVariant
  font-weight                     |fontWeight
  height                          |height
  left                            |left
  letter-spacing                  |letterSpacing
  line-height                     |lineHeight
  list-style                      |listStyle
  list-style-image                |listStyleImage
  list-style-position             |listStylePosition
  list-style-type                 |listStyleType
  margin                          |margin
  margin-bottom                   |marginBottom
  margin-left                     |marginLeft
  margin-right                    |marginRight
  margin-top                      |marginTop
  overflow                        |overflow
  padding                         |padding
  padding-bottom                  |paddingBottom
  padding-left                    |paddingLeft
  padding-right                   |paddingRight
  padding-top                     |paddingTop
  page-break-after                |pageBreakAfter
  page-break-before               |pageBreakBefore
  position                        |position
  float                           |styleFloat
  text-align                      |textAlign
  text-decoration                 |textDecoration
  text-decoration: blink          |textDecorationBlink
  text-decoration: line-through   |textDecorationLineThrough
  text-decoration: none           |textDecorationNone
  text-decoration: overline       |textDecorationOverline
  text-decoration: underline      |textDecorationUnderline
  text-indent                     |textIndent
  text-transform                  |textTransform
  top                             |top
  vertical-align                  |verticalAlign
  visibility                      |visibility
  width                           |width
  z-index                         |zIndex

**Tabla 1**: Propiedades de estilos CSS y sus equivalentes de
*JavaScript*, utilizables en el objeto *style*.

###Fijar, obtener y eliminar propiedades individuales


Basándonos en lo anteriormente comentado, se trata de asignar valores a
las propiedades, o bien obtener su valor consultando la propiedad,
según:

  **Método**                           |**Descripción**
  ------------------------------------ |--------------------------------------------------------
  *elemento.style.propiedad = valor*   |Asignará el valor dado a la propiedad de estilo
  *valor = elemento.style.propiedad*   |Obtendremos el valor de la propiedad de estilo
  *elemento.style.propiedad=’’*        |Eliminaremos cualquier valor de la propiedad de estilo

Comencemos con lo ilustrado en el Listado 1:

* Codificaremos tres funciones *JavaScript*, con las siguientes
funcionalidades:

* **set**: fija los valores de cada uno de los atributos referenciados en
el objeto *style*, uno de cada vez.

* **get**: devuelve el valor de los atributos referenciados en el objeto
*style*, uno de cada vez. Sólo devolverá los fijados mediante el objeto
*style*, no los restantes que hayan sido fijados en la cascada de
estilos CSS.

* **remove**: elimina –pone a cero- los atributos referenciados en el
objeto *style*, uno de cada vez. Sólo eliminará los fijados mediante el
objeto *style*, no los restantes que hayan sido fijados en la cascada de
estilos CSS.

* Tres botones de comando que llaman a las funciones antes comentadas.

* Para consultar el valor de las propiedades, al hacer clic sobre el botón
**get**, deberemos acceder a la **Herramientas F12** de *Internet
Explorer* y allí ver la consola de texto –pulsando la tecla **F12** y
seleccionado la opción de la barra de herramientas **Consola de
texto**-.

**Listado 1: Fijación, obtención y eliminación de estilos mediante el objeto style de JavaScript.**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Set, Get and Remove CSS Individual
    Properties&lt;/title&gt;

    &lt;script&gt;

    //set

    function set() {

    var divStyle = document.getElementById('A').style;

    divStyle.backgroundColor = 'yellow';

    divStyle.border = '4px solid black';

    divStyle.width = '300px';

    divStyle.height = '300px';

    }

    //get

    function get() {

    var divStyle = document.getElementById('A').style;

    console.log("backgroundColor: " + divStyle.backgroundColor);

    console.log("border: " + divStyle.border);

    console.log("width: " + divStyle.width);

    console.log("height: " + divStyle.height);

    }

    //remove

    function remove() {

    var divStyle = document.getElementById('A').style;

    divStyle.backgroundColor = '';

    divStyle.border = '';

    divStyle.width = '';

    divStyle.height = '';

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

![] (./img/Objeto-y-atributo-Style/image1.png)

###La propiedad cssText


Esta propiedad del objeto *style*, también de tipo cadena de caracteres,
nos permite fijar varias propiedades de estilo a la vez, lo mismo que
haríamos en el atributo homónimo –para codificación *inline CSS*- de una
etiqueta HTML.

Segú lo usemos podemos fijar, obtener y eliminar estilos, de acuerdo con
la sintaxis:

  **Método**                          |**Descripción**
  ----------------------------------- |-------------------------------------------------
  *elemento.style.cssText = cadena*   |Añadirá el contenido dado al estilo
  *cadena = elemento.style.cssText*   |Obtendremos el valor del estilo asignado
  *elemento.style.cssText = ’’*       |Eliminaremos cualquier valor de estilo asignado

Muy importante es tener en cuenta que en la cadena se ha de pasar una
lista de propiedades CSS válidas, no de propiedades *JavaScript*, como
en el caso anterior –véase la tabla de equivalencias mostrada, Tabla 1-

Un ejemplo podemos verlo en el Listado 2:

* Codificaremos tres funciones *JavaScript*, con las siguientes
funcionalidades:

* **set**: fija los valores de los atributos referenciados en la cadena
*cssText* del objeto *style*.

* **get**: devuelve el valor de los atributos referenciados en la cadena
*cssText* del objeto *style*. Sólo devolverá los fijados mediante el
objeto *style*, no los restantes que hayan sido fijados en la cascada de
estilos CSS.

* **remove**: elimina –pone a cero- los atributos referenciados en la
cadena *cssText* del objeto *style*. Sólo eliminará los fijados mediante
el objeto *style*, no los restantes que hayan sido fijados en la cascada
de estilos CSS.

* Tres botones de comando que llaman a las funciones antes comentadas.

* Para consultar el valor de las propiedades, al hacer clic sobre el botón
**get**, deberemos acceder a la **Herramientas F12** de *Internet
Explorer* y allí ver la consola de texto –pulsando la tecla **F12** y
seleccionado la opción de la barra de herramientas **Consola de
texto**-.

**Listado 2: Fijación de estilos mediante la cadena cssText del objeto style.**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Set, Get and Remove CSS Properties -
    cssText&lt;/title&gt;

    &lt;script&gt;

    //set

    function set() {

    var divStyle = document.getElementById('A').style;

    divStyle.cssText = 'background-color:yellow;border:4px solid
    black;height:300px;width:300px;';

    }

    //get

    function get() {

    var divStyle = document.getElementById('A').style;

    console.log("style= " + divStyle.cssText);

    }

    //remove

    function remove() {

    var divStyle = document.getElementById('A').style;

    divStyle.cssText = '';

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

![] (./img/Objeto-y-atributo-Style/image2.png)

**NOTA:** Las propiedades del objeto *style* sólo modifican y devuelven
el valor de aquellos estilos que hayan sido fijados con dicho objeto, no
los restantes de la cascada de valores de las hojas de estilo CSS. Para
ello hemos de acudir a, por ejemplo, ajustar sus propiedades como
citamos seguidamente.

###Fijar las propiedades de estilo de forma genérica


Por otra parte, siempre podremos acudir a los métodos de fijación de
valores de atributos de elementos HTML.

Así, el atributo *style* de una etiqueta HTML puede contener una cadena
de caracteres con las propiedades de estilo, como hemos comentado más
arriba. Adicionando o incluyendo valores en el atributo, recabando su
valor o eliminando el atributo, llegaremos a poder controlar
dinámicamente aspectos del CSS mediante *JavaScript*.

En un artículo anterior habíamos tratado el tema de los atributos de los
elementos del DOM y su gestión:

**Explorando el DOM: Objeto element. Atributos y su gestión**

En uno de sus apartados comentábamos los métodos disponibles al
respecto, que recogemos en la tabla que sigue:

  Método              |Descripción
  ------------------- |-----------------------------------------------------------------------------------------------------------------------
  *setAttribute*      |Fija el valor de un determinado atributo, se pasa el nombre del atributo a fijar y su valor.
  *getAttribute*      |Devuelve un valor de un determinado atributo, o nulo –cadena vacía- de no existir
  *removeAttribute*   |Retira un determinado atributo. Es el modo recomendado de hacerlo y no fijando un valor nulo mediante *setAttribute*.

Sus sintaxis son, respectivamente:

* elemento.setAttribute(atributo, valor)

* valor = elemento.getAttribute(atributo)

* elemento.removeAttribute(atributo)

* En donde el valor dado o devuelto es una cadena que contenga las
propiedades de estilo en el formato CSS, véase la Tabla 1.

Un ejemplo podemos verlo en el Listado 3:

* Codificaremos tres funciones *JavaScript*, con las siguientes
funcionalidades:

* **set**: fija los valores de los atributos referenciados en la cadena de
propiedades de estilos CSS*.*

* **get**: devuelve el valor de los atributos referenciados en la cadena
de propiedades de estilos CSS*.* Devolverá todos los estilos fijados en
la cascada de estilos CSS.

* **remove**: elimina –pone a cero- los atributos referenciados en la
cadena de propiedades de estilos CSS*.* Eliminará todos los fijados en
la cascada de estilos CSS.

* Tres botones de comando que llaman a las funciones antes comentadas.

* Para consultar el valor de las propiedades, al hacer clic sobre el botón
**get**, deberemos acceder a la **Herramientas F12** de *Internet
Explorer* y allí ver la consola de texto –pulsando la tecla **F12** y
seleccionado la opción de la barra de herramientas **Consola de**
**texto**-.

**Listado 3: Estilos mediante el atributo style de los elementos–etiquetas- HTML.**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Set, Get and Remove CSS Properties -
    setAttribute&lt;/title&gt;

    &lt;script&gt;

    //set

    function set() {

    var divStyle = document.getElementById('A');

    divStyle.setAttribute('style', 'background-color:yellow;border:4px
    solid black;height:300px;width:300px;');

    }

    //get

    function get() {

    var divStyle = document.getElementById('A');

    console.log("style= " + divStyle.getAttribute('style'));

    }

    //remove

    function remove() {

    var divStyle = document.getElementById('A');

    divStyle.removeAttribute('style');

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

![] (./img/Objeto-y-atributo-Style/image3.png)

###Conclusiones


En el presente artículo hemos visto cómo gestionar los *inline styles*,
de los atributos *style* de las etiquetas HTML, mediante rutinas simples
en *JavaScript*, bien usando el objeto homónimo *style*, bien actuando
directamente con los métodos generales de gestión de los valores de los
atributos.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




