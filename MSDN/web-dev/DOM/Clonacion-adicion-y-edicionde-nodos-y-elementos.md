---
redirect_url: https://docs.microsoft.com/
title: Explorando el DOM- Clonación, adición y edición de nodos y elementos
description: Clonación, adición y edición de nodos y elementos DOM
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Clonación, adición y edición de nodos y elementos

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


Un documento HTML no es un objeto estático y puede ser modificado en
tiempo de ejecución, las técnicas de gestión del DOM son las de más bajo
nivel para ciertas tareas de alteración de sus contenidos. Entre ellas,
las labores de edición, como copiar partes, añadir nuevos elementos,
eliminarlos o sustituirlos, pueden ser poderosas herramientas para dotar
a nuestras aplicaciones de gran dinamismo.

Todo esto será abordado con ejemplos ilustrativos en cada caso, en
concreto, en el presente artículo, trataremos:

* Clonación de nodos

* Añadir objetos al nodo

* Eliminar objetos del nodo

* Reemplazar objetos del nodo


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

###Clonar elementos del nodo


Disponemos de un poderoso método de clonar un nodo completo en otro
lugar del documento HTML, que se recoge en la tabla adjunta.

  Método        |Descripción
  ------------- |-------------------------------------------------------------------------------
  *cloneNode*   |Devuelve la referencia del nodo clonado de referencia sobre el que se aplica. Puede tener un parámetro opcional:
                |*true*: Clona el nodo, sus atributos y sus descendientes.
                |*false*: Clona el nodo y sus atributos, solamente (por defecto).
  ---------------------------------------------------------------------------------------------

Utilizaremos el método *cloneNode* para mostrar una entrada de textos
pidiendo un nombre, cuando se introduzca y se pulse el correspondiente
botón de comando, se clonará dicha entrada de textos con una petición de
un alias. Todo ello tiene varios puntos críticos que describimos
seguidamente.

El ejemplo del Listado 9 realiza varias tareas:

Dado que el alias no será lo mismo que el nombre, la clonación se lleva
a cabo en dos pasos, en primer lugar tomamos la referencia del nodo al
entrar en el documento, antes de haber introducido nada en la entrada de
textos del nombre. Es lo que se encontrará en el código *JavaScript* del
final del Listado 9.

Una vez pulsado el botón de comando se llamará a la función *clone()*.

Iniciamos creando la etiqueta de texto “Alias” para acompañar a la
entrada de textos que vamos a clonar:

* Tomamos la referencia del nodo padre.

* Utilizamos *innerHTML* para insertar el elemento correspondiente.

Ahora ejecutamos la segunda parte de la clonación del nodo, insertando
la referencia tomada mediante *cloneNode* al comienzo, mediante
*appendChild*.

Nos encontraremos con el problema de que ambas entradas de texto tendrán
el mismo identificador ID –“B” en este caso-. Nótese que la clonación
repite todos los atributos del origen en el destino y deberemos
resolverlo.

En el siguiente paso, cambiamos el ID de “B” por “C”. Eso hace que la
primera referencia a “B” en el DOM se cambie a “C”, por tanto la entrada
de nombre tendrá ahora de ID “C” y la del alias “B”.

Todo ello se podrá apreciar por el estilo de los fondos de las áreas de
entrada, ya que definimos un color grisáceo para “B” y azulado para “C”.


**Listado 9: Ejemplo de clonación de nodos del DOM y modificación al vuelo de sus atributos.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;cloneNode&lt;/title&gt;

    &lt;style&gt;

    \#B {

    background-color: lightgray;

    }

    \#C {

    background-color: lightblue;

    }

    &lt;/style&gt;

    &lt;script&gt;

    function clone() {

    // Creamos un nodo de texto para etiquetar el nuevo nodo

    var nodeAnchor = document.querySelector('p');

    nodeAnchor.innerHTML = ('Alias');

    // Clonamos el nodo

    document.querySelector('p').appendChild(nodo);

    alert(document.getElementById("B").value);

    // La cambiamos el ID al &lt;input&gt; original

    // para que no haya duplicidades con el clonado

    document.getElementById("B").id = "C";

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    Nombre

    &lt;div id="A"&gt;

    &lt;input id="B" type="text" value="" /&gt;

    &lt;/div&gt;

    Alias

    &lt;p&gt;&lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="clone()" value="cloneNode" /&gt;

    &lt;script&gt;

    // Tomamos la referencia del nodo a clonar

    // antes de que contenga entrada de texto

    var nodo = document.getElementById("A").cloneNode(true);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```


![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image1.png)


![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image2.png)

Si en el ejemplo después de pulsado el botón para ejecutar estas
acciones, en Internet Explorer, pulsamos F12, acudiremos a las
*Herramientas de desarrollo* y veremos todo el árbol del DOM, con los
nodos hijos creados conforme a lo que diseñamos, véase la figura
adjunta.

El DOM después de ejecutadas las acciones


![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image3.png)

###Añadir objetos al nodo


Disponemos de dos métodos para la inclusión de nodos hijo en otros ya
existentes. En ambos casos crearán nuevas dependencias en el árbol
jerárquico, la cuestión de la elección de cual elegir estriba en si
deseamos o no un control preciso de dónde exactamente se insertará el
nuevo contenido. La tabla que sigue recoge un resumen descriptivo de
ambos.

  Método           |Descripción
  ---------------- |------------------------------------------------------------------------------------------------------------
  *appendChild*    |Toma como parámetro el nodo a añadir como hijo al de referencia sobre el que se aplica.
  *insertBefore*   |Toma dos parámetros, el elemento a ser insertado y la referencia de dónde será insertado respecto a aquel:                
                   |El elemento hijo antes del cual será insertado
                   |Si es *null*, se insertará al final de los elementos hijos del nodo de referencia
  
El método *appendChild* se aplica a un nodo determinado y crea un nuevo
nodo hijo con las especificaciones del que se pasa como parámetro, si
nos fijamos en el Listado 5 vemos cómo funciona el proceso en su forma
más habitual:

* Los dos primeros pasos son la creación del nodo elemento y el nodo de
texto asociado a este nodo, como vimos anteriormente.

* En el tercer paso, tomamos la referencia del nodo sobre el cual queremos
crear el nodo hijo, que será el recién creado y le asociamos el elemento
mediante *appendChild*.

* En el cuarto paso, volvemos a tomar la referencia del nodo sobre el que
queremos añadir el nodo de texto y aplicamos nuevamente el método
*appendChild*.

**Listado 5: Uso simple de appendChild.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;appendChild&lt;/title&gt;

    &lt;script&gt;

    function append() {

    // Creamos el elemento y el nodo de texto

    var elementNode = document.createElement('strong');

    var textNode = document.createTextNode(' en su olivo');

    // Y los añadimos al DOM en ese mismo orden

    document.getElementById('A').appendChild(elementNode);

    document.getElementById('A').querySelector('strong').appendChild(textNode);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A"&gt;Cada mochuelo ...&lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="append()" value="appendChild" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

Si en el ejemplo después de pulsado el botón para ejecutar estas
acciones, en Internet Explorer, pulsamos F12, acudiremos a las
*Herramientas de desarrollo* y veremos todo el árbol del DOM, con los
nodos hijos creados conforme a lo que diseñamos, véase la figura
adjunta.

El DOM después de ejecutadas las acciones



![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image4.png)


El método *insertBefore* nos dota de una versatilidad mayor en algunas
ocasiones, como por ejemplo cuando se trata de sistemas complejos como
listas o tablas, al permitirnos afinar con precisión la localización del
lugar con referencias relativas pasadas en su segundo parámetro.

Observemos el Listado 6, en él se ha diseñado una lista no numerada con
el segundo y cuarto elemento y al pulsar el botón de comando se
insertarán el primero, tercero y quinto, mediante *insertBefore* y con
los parámetros de posición relativa:

* *ul.firstChild*: para el primer elemento, dado que será el primer nodo
hijo de &lt;ul&gt;

* *document.getElementById('A').nextSibling*: para el tercer elemento,
dado que el ID del segundo es “A”

* *ul.lastChild*: para el último elemento –el quinto-, dado que será el
último nodo hijo de &lt;ul&gt;


**Listado 6: Adición de elementos a una lista no numerada. Uso de insertBefore.**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;insertBefore&lt;/title&gt;

    &lt;script&gt;

    function insert() {

    // Creamos los elemento &lt;li&gt; y los correspondientes nodos de
    texto

    var text1 = document.createTextNode('Primero');

    var li1 = document.createElement('li');

    var text3 = document.createTextNode('Tercero');

    var li3 = document.createElement('li');

    var text5 = document.createTextNode('Quinto');

    var li5 = document.createElement('li');

    // Añadimos el texto a los elementos &lt;li&gt;

    li1.appendChild(text1);

    li3.appendChild(text3);

    li5.appendChild(text5);

    // Seleccionamos el elemento &lt;ul&gt; del documento

    var ul = document.querySelector('ul');

    // Añadimos los elementos &lt;li&gt; en las posiciones pertinentes

    ul.insertBefore(li3, document.getElementById('A').nextSibling)

    ul.insertBefore(li1, ul.firstChild);

    ul.insertBefore(li5, ul.lastChild);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;ul&gt;

    &lt;li id="A"&gt;Segundo&lt;/li&gt;

    &lt;li&gt;Cuarto&lt;/li&gt;

    &lt;/ul&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="insert()" value="insertBefore"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```


![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image5.png)


![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image6.png)


###Eliminar y reemplazar nodos


Dentro de las labores de edición del árbol jerárquico del DOM, también
podremos eliminar nodos y realizar labores de sustitución de contenidos.
Los dos métodos utilizados para ambas tareas se recogen en la tabla que
sigue.

  Método           |Descripción
  ---------------- |------------------------------------------------------------------------------------------------------------------
  *removeChild*    |Elimina el nodo hijo pasado como parámetro del nodo de referencia sobre el que se aplica.
  *replaceChild*   |Toma dos parámetros, el nodo a reemplazar y el nuevo nodo, dentro del nodo de referencia sobre el que se aplica.

Para retirar –eliminar- elementos del árbol de nodos, emplearemos, como
citábamos en la tabla, el método *removeChild*, que toma de parámetro el
nodo hijo a retirar del nodo sobre el cual se aplica el método.

Un ejemplo es lo codificado en la función *remove()* del Listado 7 que,
nótese, elimina todo un nodo aludiendo al nodo padre del hijo a ser
pasado como objeto a ser eliminado. Cómo sucedía a la hora de crear
nodos, la eliminación es en dos pasos:

* Se elimina primero el texto

* Para posteriormente eliminar el elemento

Justo el orden inverso al de su creación

**Listado 7: Eliminación elementos del árbol de nodos mediante removeChild.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;removeChild&lt;/title&gt;

    &lt;script&gt;

    function append() {

    // Creamos el elemento y el nodo de texto

    var elementNode = document.createElement('strong');

    var textNode = document.createTextNode(' en su olivo');

    // Y los añadimos al DOM en ese mismo orden

    document.getElementById('A').appendChild(elementNode);

    document.getElementById('A').querySelector('strong').appendChild(textNode);

    }

    &lt;/script&gt;

    &lt;script&gt;

    function remove() {

    // Eliminamos el nodo de texto

    var text = document.getElementById('B').firstChild;

    text.parentNode.removeChild(text);

    // Eliminamos el elemento

    var element = document.getElementById('B');

    element.parentNode.removeChild(element);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A"&gt;Cada mochuelo ...&lt;/p&gt;

    &lt;i id="B"&gt;Descansa felizmente&lt;/i&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="append()" value="appendChild" /&gt;

    &lt;input type="button" onclick="remove()" value="removeChild" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```


![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image7.png)


Si en el ejemplo, en Internet Explorer, pulsamos F12, acudiremos a las
*Herramientas de desarrollo* y veremos todo el árbol del DOM, conforme a
lo que diseñamos, véase la figura adjunta.

El DOM antes de ejecutar las acciones de eliminación



![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image8.png)


Si en el ejemplo después de pulsado el botón para ejecutar la acción de
eliminación, en Internet Explorer, pulsamos F12, acudiremos a las
*Herramientas de desarrollo* y veremos todo el árbol del DOM tal como ha
quedado, véase la figura adjunta.

El DOM después de ejecutar las acciones de eliminación


![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image9.png)


Para reemplazar elementos del árbol de nodos, por su parte, utilizaremos
el método *replaceChild*, con sus dos argumentos –véase el ejemplo del
Listado 8-:

* Tomamos la referencia del nodo de texto a reemplazar mediante
*firstChild*, que recordemos devuelve la referencia del nodo aludido

* Creamos el nuevo nodo de texto mediante el método anteriormente visto
*createTextNode*.

Nótese que no hace falta crear el elemento, dado que sólo reemplazamos
el texto.

* Aplicamos el método *replaceChild* con ambas referencias de los nodos,
primero la del nodo nuevo y en segundo lugar la del nodo a reemplazar.

**Listado 8: Reemplazo de un nodo de texto mediante el método replaceChild.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;replaceChild&lt;/title&gt;

    &lt;script&gt;

    function replace() {

    // Tomamos la referencia de nodo de texto

    var text = document.getElementById('A').firstChild;

    // Creamos el nuevo nodo de texto

    var newText = document.createTextNode('¡Hola a todos!');

    // Y hacemos el reemplazo

    var replaced = text.parentNode.replaceChild(newText, text);

    alert('El texto: '+replaced.textContent+'\\rFue reemplazadado por:
    '+newText.textContent);

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;strong id="A"&gt;Saludos&lt;/strong&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="replace()" value="replaceChild"
    /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```


![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image10.png)

Si en el ejemplo después de pulsado el botón para ejecutar estas
acciones de sustitución, en Internet Explorer, pulsamos F12, acudiremos
a las *Herramientas de desarrollo* y veremos todo el árbol del DOM tal
como ha quedado, véase la figura adjunta.

El DOM después de realizadas las acciones de sustitución



![] (./img/Clonacion-adicion-y-edicionde-nodos-y-elementos/image11.png)

###Conclusiones


En el presente artículo hemos visto cómo realizar las más comunes tareas
de edición de documentos HTML en tiempo de ejecución, mediante técnicas
de acceso al DOM, como copiar, eliminar, sustituir o insertar nuevos
elementos. Aplicadas convenientemente, nos proporcionarán una
versatilidad inusitada en nuestros diseños de HTML dinámicos, acudiendo
a las raíces mismas del documento.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2013**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




