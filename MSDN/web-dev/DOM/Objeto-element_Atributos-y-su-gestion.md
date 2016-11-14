---
title: Explorando el DOM- Objeto element. Atributos y su gestión
description: DOM atributos de los elementos
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Objeto element. Atributos y su gestión

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  

En nuestro anterior artículo:

###Explorando el DOM: Objeto element. Creación, propiedades y métodos


Habíamos hablado de la creación de elementos y de sus propiedades y
métodos generales.

Ahora nos toca comentar lo relativo a los atributos de los elementos.
Recuérdese que se entiende por atributo todo dato adicional, normalmente
un identificador con un valor, que acompaña a la etiqueta del elemento,
como por ejemplo su *id*, *title*, *value*, *style*, …

Esto será abordado con ejemplos ilustrativos en cada caso; en concreto,
en el presente artículo, trataremos:

* Atributos de un elemento y sus valores.

* Gestión de los atributos

* Obtener su valor.

* Fijar un atributo y/o su valor.

* Eliminar un atributo.

* Verificación de la existencia de un determinado atributo.

Para una aproximación preliminar al tratamiento y conocimiento del
esquema y tipos de nodos, consúltese el artículo **Explorando el DOM:
Tipos de nodos y sus atributos generales**

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

###Atributos y sus valores de un elemento


La propiedad *attributes* contiene la colección completa de los
atributos de un elemento. Se accede a cada uno de ellos de forma similar
a como se accedería a una matriz de datos, comenzando a contar en cero
hasta su longitud menos uno.

Para conocer el número de atributos de un elemento y el nombre y valor
de cada uno de ellos, disponemos de las siguientes propiedades:

* *length*: nos devuelve la longitud de elementos de la propiedad
*attributes*; es decir, el número de atributos definidos.

* *nodeName*: nombre de uno de los atributos.

* *nodeValue*: valor de dicho atributo.

Sus sintaxis serán:

* &lt;referencia del elemento&gt;.atributes.length

* &lt;referencia del elemento&gt;.atributes\[i\].nodeName

* &lt;referencia del elemento&gt;.atributes\[i\].nodeValue

En el Listado 1 que sigue, ejemplificaremos todo esto de la siguiente
manera y con los subsiguientes pasos fundamentales:

* Un botón de comando disparará la llamada a una función que extraerá y
mostrará los atributos de un elemento –función *mostrar()*-.

La función *mostrar()* ejecuta las acciones:

* Toma los atributos del elemento seleccionado, en nuestro caso del elemento &lt;A&gt; único que hay en el cuerpo del documento.

* Ejecuta un bucle con todo el contenido de atributos adquiridos, desde cero a *length-1*.

* En cada bucle recaba el nombre del atributo y su valor, los muestra en la *Consola de texto* del explorador y los almacena en una cadena de texto.

* Finalizado el bucle, la cadena de textos es mostrada como código HTML, mediante el método *innerHTML*, en un nodo &lt;P&gt; inferior, habilitado a tal efecto.



**Listado 1: Utilidad para mostrar, en pantalla y en la Consola de
texto, los atributos y sus valores de un elemento**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement Atributes&Values&lt;/title&gt;

    &lt;script&gt;

    function mostrar() {

    var atts = document.querySelector('a').attributes;

    var text = "";

    for (var i = 0; i &lt; atts.length; i++) {

    console.log(atts\[i\].nodeName + '=' + atts\[i\].nodeValue);

    text = text + (atts\[i\].nodeName + '=' + atts\[i\].nodeValue) +
    '&lt;br/&gt;';

    }

    document.getElementById("A").innerHTML = text;

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p&gt;&lt;a href='\#' title="title" data-valor="valor"
    class="yes" style="margin: 0"&gt;Referencia
    -href-&lt;/a&gt;&lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="Mostrar" onclick="mostrar();" /&gt;

    &lt;p id="A"&gt;&lt;/p&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Objeto-element_Atributos-y-su-gestion/image1.png)



Se puede observar en el Explorador DOM la presencia de los atributos y sus valores


![] (./img/Objeto-element_Atributos-y-su-gestion/image2.png)

###Gestión de los atributos de un elemento


Aquí veremos cómo gestionar dinámicamente los atributos de un elemento,
fijando o retirando atributos o bien cambiándoles el valor en tiempo de
ejecución.

Disponemos para estas tareas de tres métodos, que recogemos en la tabla
que sigue:

  **Método**          |**Descripción**
  ------------------- |-----------------------------------------------------------------------------------------------------------------------
  *getAttribute*      |Devuelve un valor de un determinado atributo, o nulo –cadena vacía- de no existir.
  *setAttribute*      |Fija el valor de un determinado atributo, se pasa el nombre del atributo a fijar y su valor.
  *removeAttribute*   |Retira un determinado atributo. Es el modo recomendado de hacerlo y no fijando un valor nulo mediante *setAttribute*.

Sus sintaxis son:

* &lt;referencia del elemento&gt;.getAttribute(&lt;atributo&gt;)

* &lt;referencia del elemento&gt;.setAttribute(&lt;atributo&gt;,
&lt;valor&gt;)

* &lt;referencia del elemento&gt;.removeAttribute(&lt;atributo&gt;)

Como ejemplo más simple de aplicación, fijémonos en el Listado 2. En él
observaremos como, a la pulsación del correspondiente botón de comando,
se localiza el elemento del DOM sobre el que se quiere fijar un nuevo
atributo y posteriormente se lleva a cabo dicha acción mediante
*setAttribute*.

Nótese como se pasan de parámetros el identificador del atributo
–*style*- y su valor –*color:red*-, lo que hace que al vuelo el texto
del elemento se convierta en uno de color rojo.

**Listado 2: Modo de fijar un nuevo atributo mediante setAttribute**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement setAttribute&lt;/title&gt;

    &lt;script&gt;

    function fijar() {

    // Localiza el elemento del DOM y fija el atributo

    var attr = document.getElementById("A");

    attr.setAttribute('style', 'color:red;')

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A"&gt;Párrafo de muestra&lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="setAttribute" onclick="fijar();"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

Se puede observar en el Explorador DOM la presencia del atributo
recién creado


![] (./img/Objeto-element_Atributos-y-su-gestion/image3.png)

###Verificación de la existencia de un atributo específico


Para la verificación de la existencia de un atributo específico en un
elemento del DOM, disponemos de un método que toma como parámetro el
atributo y devuelve *true* si está definido en el elemento sobre el cual
se aplica:

  **Método**       |**Descripción**
  ---------------- |---------------------------------------------------------------------
  *hasAttribute*   |Devolverá *true* si el elemento tiene definido el atributo aludido.

Su sintaxis es:

* &lt;referencia del elemento&gt;.hasAttribute(&lt;atributo&gt;)

Nuestro ejemplo es un poco más ambicioso y abarca todas las opciones de
fijar, retirar y comprobar la existencia de un atributo dado. Es una
continuación, mejorada, del expuesto en el Listado 2 –véase más arriba-:

Hemos programado tres botones de comando:

* **setAttribute** –Fijar un atributo-

* **removeAttribute** –Quitar un atributo-

* **hasAttribute** –Comprobar atributo-

Cada uno de ellos llama a una función correspondiente a la acción
–método- cuyo nombre describe. Inicialmente el elemento sobre el
cual se aplican los métodos no dispone de atributo alguno.

El atributo que se fija y retira es un estilo de texto de color
rojo, sin más. Y lo que se pregunta es la existencia de un atributo
de estilo.

La respuesta de la existencia se mostrará en un mensaje de alerta.



**Listado 3: Ejemplo de uso de hasAttribute, en conjunción con
setAttribute y removeAttribute**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;HTMLElement setAttribute&lt;/title&gt;

    &lt;script&gt;

    function fijar() {

    // Localiza el elemento del DOM y fija el atributo

    var attr = document.getElementById("A");

    attr.setAttribute('style', 'color:red;');

    }

    function quitar() {

    // Localiza el elemento del DOM y quita el atributo

    var attr = document.getElementById("A");

    attr.removeAttribute('style');

    }

    function comprobar() {

    // Localiza el elemento del DOM y comprueba el atributo

    var attr = document.getElementById("A");

    alert(attr.hasAttribute('style'));

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A"&gt;Párrafo de muestra&lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="setAttribute" onclick="fijar();"
    /&gt;

    &lt;input type="button" value="removeAttribute" onclick="quitar();"
    /&gt;

    &lt;input type="button" value="hasAttribute" onclick="comprobar();"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Objeto-element_Atributos-y-su-gestion/image4.png)

###Conclusiones


En el presente artículo hemos visto cómo conocer los atributos de un
elemento y sus valores actuales, así como editarlos, cambiarles el valor
y/o añadir nuevos o eliminarlos.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




