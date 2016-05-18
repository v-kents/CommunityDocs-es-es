<properties
	pageTitle="#Explorando el DOM: Nodos de texto. Obtención y manipulación"
	description="DOM: Nodos de texto. Obtención y manipulación"
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


#Explorando el DOM: Nodos de texto. Obtención y manipulación

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  

class="anchor"></span>***es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*
**

Cómo habíamos abordado en un artículo anterior –véase más adelante- cada
nodo de texto tiene su propia entidad y se trata de un objeto –*object
text*- con sus propiedades y métodos característicos.

En este trabajo hablaremos de las labores de edición de contenidos de
los nodos de texto, en su vertiente más tradicional.

Esto será abordado con ejemplos ilustrativos para cada caso; en concreto
trataremos:

Obtención del valor/contenido de un nodo de texto.

Adición e inserción de cadenas de caracteres al nodo de texto.

Substitución y borrado de cadenas del nodo texto.

Extracción de subcadenas del nodo de texto.

En nuestro anterior artículo, cuya referencia se cita seguidamente,
habíamos tratado los aspectos más fundamentales de los nodos de texto;
sugerimos se dé un repaso a su contenido antes de abordar el del
presente:

[**Explorando el DOM: Nodos de texto. Creación, propiedades y
métodos**](https://msdn.microsoft.com/es-es/library/mt143193.aspx)

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

###Obtención del valor del nodo de texto


Obtener el valor del nodo de texto equivale a obtener el contenido
textual de dicho nodo; será una cadena de caracteres, nula si no
contiene texto alguno el nodo correspondiente.

Por otra parte las propiedades *length* correspondientes, nos darán la
longitud del texto en caracteres.

Es muy importante tener presente que en todo lo que sigue en el presente
artículo, el acceso a cualquier carácter concreto se ha de realizar con
la premisa que se comienzan a numerar por cero –el primero- hasta su
tamaño menos uno –el último-.

Recuérdese también de lo ya visto en anteriores artículos que los
espacios en blanco y el retorno de carro cuentan como tales caracteres.

La siguiente tabla nos muestra dos propiedades a las que podemos acudir
para obtener el valor del nodo de texto:

  **Propiedad**   | **Descripción**
  --------------- | -----------------------------------------------------------------------------
  *data*          | Propiedad que nos devolverá el contenido textual del nodo de texto aludido.
  *nodeValue*     | Ídem que lo anterior.

En el Listado 1 hemos programado lo que sigue:

Un elemento &lt;div&gt; con nodos de texto que abarcan un texto simple y
un elemento &lt;strong&gt; con un nodo de texto hijo.

Un botón de comando que, al ser pulsado, llama a la función *data()*.

Dicha función realiza las siguientes tareas de salida por la consola de
texto del explorador –método *console.log*-:

1.  Extraemos, mediante *data*, el valor del primer nodo de texto del elemento &lt;div&gt;.

2.  Extraemos, mediante *data.length*, el valor del tamaño del primer nodo de texto del elemento &lt;div&gt;.

3.  Extraemos, mediante *data*, el valor del segundo nodo de texto del elemento &lt;div&gt;. Obsérvese que se trata del nodo hijo del segundo nodo del elemento &lt;div&gt;.

4.  Extraemos, mediante *data.length*, el valor del tamaño del primer nodo de texto del elemento &lt;div&gt;. Obsérvese que se trata del nodo hijo del segundo nodo del elemento &lt;div&gt;.

**Listado 1**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - data&lt;/title&gt;

    &lt;script&gt;

    function data() {

    console.log(document.querySelector('div').firstChild.data);

    console.log(document.querySelector('div').firstChild.data.length);

    console.log(document.querySelector('div').firstChild.nextSibling.firstChild.data);

    console.log(document.querySelector('div').firstChild.nextSibling.firstChild.data.length);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;Hola, &lt;strong&gt;compañero de
    fatigas&lt;/strong&gt;&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="data" onclick="data()" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image1.png)

En el Listado 2 hemos programado lo que sigue, que no es más que un
símil del Listado 1, pero utilizando *nodeValue*:

Un elemento &lt;div&gt; con nodos de texto que abarcan un texto simple y
un elemento &lt;strong&gt; con un nodo de texto hijo.

Un botón de comando que, al ser pulsado, llama a la función *valor()*.

Dicha función realiza las siguientes tareas de salida por la consola de
texto del explorador –método *console.log*-:

1.  Extraemos, mediante *nodeValue*, el valor del primer nodo de texto del elemento &lt;div&gt;.

2.  Extraemos, mediante *nodeValue.length*, el valor del tamaño del primer nodo de texto del elemento &lt;div&gt;.

3.  Extraemos, mediante *nodeValue*, el valor del segundo nodo de texto del elemento &lt;div&gt;. Obsérvese que se trata del nodo hijo del segundo nodo del elemento &lt;div&gt;.

4.  Extraemos, mediante *nodeValue.length*, el valor del tamaño del primer nodo de texto del elemento &lt;div&gt;. Obsérvese que se trata del nodo hijo del segundo nodo del elemento &lt;div&gt;.


**Listado 2**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - nodeValue&lt;/title&gt;

    &lt;script&gt;

    function valor() {

    console.log(document.querySelector('div').firstChild.nodeValue);

    console.log(document.querySelector('div').firstChild.nodeValue.length);

    console.log(document.querySelector('div').firstChild.nextSibling.firstChild.nodeValue);

    console.log(document.querySelector('div').firstChild.nextSibling.firstChild.nodeValue.length);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;Hola, &lt;strong&gt;compañero de
    fatigas&lt;/strong&gt;&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="nodeValue" onclick="valor()" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image2.png)

###Añadir e insertar texto


Abordaremos en este apartado dos de las acciones de edición más
habituales, añadir caracteres al final –añadirlos- y en medio
–insertarlos- del contenido del nodo de texto de referencia.

Los dos métodos a emplear son lo que se recogen en la tabla siguiente:

  **Método**     | **Descripción**
  -------------- | --------------------------------------------------------------------------------------------------------------
  *appendData*   | Añade una serie de caracteres, cuya secuencia se pasa, a partir de la última posición del nodo de texto.
  *insertData*   | Inserta una serie de caracteres, cuya secuencia se pasa, a partir de la posición indicada del nodo de texto.

En el Listado 3 hemos programado una adición de texto, de la manera que
sigue:

Un elemento &lt;div&gt; con un nodo de texto.

Un botón de comando que, al ser pulsado, llama a la función
*appendData()*.

Dicha función realiza las siguientes tareas, entre ellas la salida por
la consola de texto del explorador –método *console.log*-:

1.  Añade al nodo de texto un texto adicional –la adición, como cabría suponer, se produce al final del texto original del nodo-.

2.  Extraemos, mediante *data*, el valor del nuevo nodo de texto del elemento &lt;div&gt;.

3.  Extraemos, mediante *data.length*, el valor del tamaño del nuevo nodo de texto del elemento &lt;div&gt;.



**Listado 3: Adición de texto a un nodo, mediante el método appendData.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - appendData&lt;/title&gt;

    &lt;script&gt;

    function appendData() {

    document.querySelector('div').firstChild.appendData(', compañero de
    fatigas');

    console.log(document.querySelector('div').firstChild.data);

    console.log(document.querySelector('div').firstChild.data.length);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;Hola&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="appendData" onclick="appendData()"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image3.png)

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image4.png)

En el Listado 4 hemos programado la inserción de texto en medio de un
nodo, de la forma que sigue:

Un elemento &lt;div&gt; con un nodo de texto.

Un botón de comando que, al ser pulsado, llama a la función
*insertData()*.

Dicha función realiza las siguientes tareas, entre ellas la salida por
la consola de texto del explorador –método *console.log*-:

1.  Inserta en el nodo de texto un texto adicional. La inserción se produce en la posición 6 del texto inicial del nodo; recuérdese que se comienza a contar en cero.

2.  Extraemos, mediante *data*, el valor del nuevo nodo de texto del elemento &lt;div&gt;.

3.  Extraemos, mediante *data.length*, el valor del tamaño del nuevo nodo de texto del elemento &lt;div&gt;.



**Listado 4: Inserción de texto en medio de un nodo mediante insertData.**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - insertData&lt;/title&gt;

    &lt;script&gt;

    function insertData() {

    document.querySelector('div').firstChild.insertData(6, 'compañero de
    ');

    console.log(document.querySelector('div').firstChild.data);

    console.log(document.querySelector('div').firstChild.data.length);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;Hola, fatigas&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="insertData" onclick="insertData()"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image5.png)

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image6.png)

###Borrar y reemplazar texto


Ambas forman otra pareja común de acciones de edición y se pueden llevar
a cabo mediante métodos predefinidos para los nodos de texto. Obsérvense
en la tabla siguiente y en los ejemplos que vienen a continuación:

  **Método**      | **Descripción**
  --------------- | -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *deleteData*    | Elimina una serie de caracteres, cuyo número se indica, a partir de la posición indicada del nodo de texto.
  *replaceData*   | Se reemplaza una serie de caracteres, cuyo número se indica, a partir de la posición indicada del nodo de texto, con una secuencia que se pasa como tercer argumento.

En el Listado 5 hemos programado el borrado parcial de texto de un nodo,
de la forma que sigue:

Un elemento &lt;div&gt; con un nodo de texto.

Un botón de comando que, al ser pulsado, llama a la función
*deleteData()*.

Dicha función realiza las siguientes tareas, entre ellas la salida por
la consola de texto del explorador –método *console.log*-:

1.  Elimina caracteres del nodo de texto. Eliminaremos desde la posición 4 –recuérdese que se comienza a contar desde cero- un total de 22 caracteres.

2.  Extraemos, mediante *data*, el valor del nuevo nodo de texto del elemento &lt;div&gt;.

3.  Extraemos, mediante *data.length*, el valor del tamaño del nuevo nodo de texto del elemento &lt;div&gt;.



**Listado 5: Uso del método deleteData para el borrado de caracteres de un nodo de texto.**

~~~
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - deleteData&lt;/title&gt;

    &lt;script&gt;

    function deleteData() {

    document.querySelector('div').firstChild.deleteData(4, 22);

    console.log(document.querySelector('div').firstChild.data);

    console.log(document.querySelector('div').firstChild.data.length);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;Hola, compañero de fatigas&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="deleteData" onclick="deleteData()"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

~~~

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image7.png)

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image8.png)


En el Listado 6 hemos programado el reemplazo de texto en un nodo, del
modo que sigue:

Un elemento &lt;div&gt; con un nodo de texto.

Un botón de comando que, al ser pulsado, llama a la función
*replaceData()*.

Dicha función realiza las siguientes tareas, entre ellas la salida por
la consola de texto del explorador –método *console.log*-:

1.  Se reemplazarán unos caracteres por otros en el nodo de texto. Reemplazaremos desde la posición 6 –recuérdese que se comienza a contar desde cero- un total de 5 caracteres por el texto que se indica –*compañero*, en este caso-.

2.  Extraemos, mediante *data*, el valor del nuevo nodo de texto del elemento &lt;div&gt;.

3.  Extraemos, mediante *data.length*, el valor del tamaño del nuevo nodo de texto del elemento &lt;div&gt;.

**Listado 6: Uso del método replaceData para reemplazar unos caracteres por otros en el nodo de texto**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - replaceData&lt;/title&gt;

    &lt;script&gt;

    function replaceData() {

    document.querySelector('div').firstChild.replaceData(6, 5,
    'compañero');

    console.log(document.querySelector('div').firstChild.data);

    console.log(document.querySelector('div').firstChild.data.length);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;Hola, amigo de fatigas&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="replaceData" onclick="replaceData()"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image9.png)

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image10.png)

###Extracción de subcadenas


Aunque no se trata de una acción de edición o manipulación en sí, es muy
parejo el trabajo de extracción de subcadenas de una cadena principal.
Entendiendo por extracción la obtención del texto existente en unas
determinadas posiciones, pero sin su borrado de dichas posiciones –algo
que vimos ya anteriormente-.

El método a aplicar sobre el nodo de texto es del todo simple y se
recoge seguidamente:

  **Método**        | **Descripción**
  ----------------- | -----------------------------------------------------------------------------------------------------------------------------------------------
  *substringData*   | Nos permite extraer el valor de subcadenas de texto de un nodo de texto determinado, pasando la posición y el número de caracteres a conocer.

En el Listado 7 se ilustra un ejemplo de aplicación con lo que sigue:

Un elemento &lt;div&gt; con un nodo de texto.

Un botón de comando que, al ser pulsado, llama a la función
*substringData()*.

Dicha función realiza las siguientes tareas, entre ellas la salida por
la consola de texto del explorador –método *console.log*-:

1.  Extraeremos desde la posición 6 –recuérdese que se comienza a contar desde cero- un total de 8 caracteres –*‘amigo y ‘*, en este caso-.

2.  El resultado se mostrará en la salida de la consola de textos del explorador.

3.  El resultado también se mostrará en una caja de diálogo de alerta del explorador.


**Listado 7: Extracción de subcadenas de texto mediante el método substringData.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Text Node - substringData&lt;/title&gt;

    &lt;script&gt;

    function substringData() {

    console.log('"' +
    document.querySelector('div').firstChild.substringData(6, 8) + '"');

    alert('"' +
    document.querySelector('div').firstChild.substringData(6, 8) + '"');

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div&gt;Hola, amigo y compañero de fatigas&lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="substringData"
    onclick="substringData()" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Nodos-de-texto_Obtencion-y-manipulacion/image11.png)

###Conclusiones


En el presente artículo hemos visto cómo realizar diversas labores de
edición puras sobre los nodos de texto; desde la obtención de su
contenido, hasta la inserción o borrado de caracteres.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
