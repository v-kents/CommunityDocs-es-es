---
redirect_url: https://docs.microsoft.com/
title: Explorando el DOM- Objeto element. Selección de elementos I
description: Métodos de selección de elementos y grupos de elementos
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Objeto element. Selección de elementos I

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


En nuestros anteriores artículos:

Explorando el DOM: Objeto element. Creación, propiedades y métodos:

**http://msdn.microsoft.com/es-es/library/dn766203.aspx**

Explorando el DOM: Objeto element. Atributos y su gestión:

**http://msdn.microsoft.com/es-es/library/dn766202.aspx**

Habíamos tratado los aspectos más generales del objeto *element*, en el
presente nos detendremos en los métodos de selección de elementos y
grupos de elementos, que tengan algún factor común, como podría ser el
tipo de etiqueta o la pertenencia a una clase de tipo de estilo,
mediante rutinas muy simples en código *JavaScript*.

Esto será abordado con ejemplos ilustrativos, en concreto, en el
presente artículo, trataremos:

* Selección de elementos específicos del DOM.

* Selección de grupos de elementos por tipo de etiqueta.

* Selección de grupos de elementos por clases de estilo de pertenencia.

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

###Selección de un elemento específico


Una de las acciones que más nos interesará es seleccionar un elemento
específico del DOM, para en el realizar operaciones particulares de
edición, adición o eliminación.

Para comenzar, disponemos de dos métodos, el primero de un ámbito más
general, el segundo más específico, relacionado con el ID de un elemento
–de tenerlo definido-:

querySelector(): Devolverá el primero de los elementos hijos que
pertenezcan al tipo de selector que se pase como parámetro. El selector
deberá ser un CSS Selector, como un tipo de etiqueta, un ID, etc.,
véase:

**https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting\_Started/Selectors**

getElementById(): Devolverá el elemento que esté identificado por el ID
que se pase como parámetro.

Con todo, podremos ser más específicos al pasar el elemento padre, en
vez de sólo *document* y así afinar la selección, al estilo:

*document.getElementById('C').querySelector('p')*

Se referiría al primer elemento &lt;p&gt; que pertenezca, como elemento
hijo, al elemento cuyo ID sea C. Más adelante hablaremos de ésta opción
con algunos ejemplos específicos.

Aun caben otras posibilidades que serán comentadas en el apartado
siguiente, al hablar de los conjuntos o grupos de elementos
seleccionados.

### En nuestro ejemplo del Listado 1:

Exponemos una lista no ordenada de cuatro nombres.

Uno de los boliches –etiquetas &lt;li&gt;- tiene un identificador ID –el
último-.

Localizamos el primero de los nombres de la lista, con el código
*querySelector('li')*.

Utilizamos el método *textContent* para mostrarlo en la *Consola de
texto* del explorador de Internet, mediante *console.log(…)*.

Localizamos el identificado como *last* mediante el código
*getElementById('last')*.

Repetimos los pasos para mostrarlo en la *Consola de texto* del
explorador de Internet.

**Listado 1: Selección de elementos específicos mediante querySelector y getElementById.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Selecting Node&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;ul&gt;

    &lt;li&gt;Alfonso&lt;/li&gt;

    &lt;li&gt;Carlos&lt;/li&gt;

    &lt;li&gt;Fernando&lt;/li&gt;

    &lt;li id="last"&gt;Joaquín&lt;/li&gt;

    &lt;/ul&gt;

    &lt;script&gt;

    console.log(document.querySelector('li').textContent); //Recogerá
    Alfonso

    console.log(document.getElementById('last').textContent); //Recogerá
    Joaquín

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```


![] (./img/Seleccion-de-elementos-I/image1.png)

###Selección de grupos de elementos


Disponemos para ello de tres métodos, que abarcan las posibilidades de
selección según la pertenencia a grupos de selectores, etiquetas y
clases:

querySelectorAll(): Devolverá todo el grupo de elementos hijos que
pertenezcan al tipo de selector que se pase como parámetro. El selector
deberá ser un CSS Selector, como un tipo de etiqueta, un ID, etc.,
véase:

**https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting\_Started/Selectors**

getElementsByTagName(): Devolverá todo el grupo de elementos hijos que
pertenezcan al tipo de etiqueta HTML que se pase como parámetro.

getElementsByClassName(): Devolverá todo el grupo de elementos hijos que
pertenezcan al tipo de clase CSS que se pase como parámetro.

En todos los casos, el grupo o la colección de elementos, a modo de
matriz, comienza a numerarse en cero y tiene una dimensión dada por la
propiedad *length*.

En el Listado 2 vemos como acceder a uno de los elementos cualesquiera
de la colección recogida por *querySelectorAll*, el modo de operar es
bien simple:

Utilizamos el método *querySelectorAll* aplicado a la etiqueta
&lt;li&gt; para obtener todo el grupo de elementos de las listas
numeradas del documento.

Nos referiremos al segundo de tales elementos del grupo aludiendo al de
posición \[1\] en la lista, ya que comienza a numerarse en cero.

Extraemos su contenido textual con la propiedad *textContent*, que
mostramos en la *Consola de texto* del explorador de Internet mediante
el código *console.log*.

Posteriormente localizamos el identificado como *last* mediante el
código *getElementById('last')*.

Repetimos los pasos para mostrarlo en la *Consola de texto* del
explorador de Internet.

**Listado 2: Selección de elementos específicos mediante querySelectorAll**

```
   &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Selecting Node&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;ul&gt;

    &lt;li&gt;Alfonso&lt;/li&gt;

    &lt;li&gt;Carlos&lt;/li&gt;

    &lt;li&gt;Fernando&lt;/li&gt;

    &lt;li id="last"&gt;Joaquín&lt;/li&gt;

    &lt;/ul&gt;

    &lt;script&gt;

    console.log(document.querySelectorAll('li')\[1\].textContent);
    //Recogerá Carlos

    console.log(document.getElementById('last').textContent); //Recogerá
    Joaquín

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```


![] (./img/Seleccion-de-elementos-I/image2.png)


Para concluir, exponemos en el Listado 3 cómo mostrar todos los
elementos del grupo extraído, según:

Utilizamos exclusivamente *querySelectorAll*, que como vimos recoge la
totalidad de los elementos de un grupo de pertenencia al selector
pasado, en nuestro caso la etiqueta &lt;li&gt;.

Crearemos un bucle para recorrer todos los elementos del grupo. Como
sabemos el grupo es del tipo matriz o colección de elementos que
comienza a numerarse en cero y llega a la longitud menos uno, de ahí los
parámetros de *for (…)*.

Tomaremos en cada pasada el elemento correspondiente y como ya vimos en
otros ejemplos utilizaremos *textContent* y mostraremos su contenido en
la *Consola de texto* del explorador de Internet.

**Listado 3: Exposición de todos los elementos de un criterio específico, mediante querySelectorAll**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Selecting Node&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;ul&gt;

    &lt;li&gt;Alfonso&lt;/li&gt;

    &lt;li&gt;Carlos&lt;/li&gt;

    &lt;li&gt;Fernando&lt;/li&gt;

    &lt;li id="last"&gt;Joaquín&lt;/li&gt;

    &lt;/ul&gt;

    &lt;script&gt;

    for (i = 0; i &lt; document.querySelectorAll('li').length;i++)

    console.log(document.querySelectorAll('li')\[i\].textContent);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```


![] (./img/Seleccion-de-elementos-I/image3.png)

###Conclusiones


En el presente artículo hemos visto cómo seleccionar elementos del DOM
según diferentes selectores, tipos de etiquetas, identificadores o
estilos de pertenencia. También nos hemos introducido a la selección de
grupos de elementos, algo que profundizaremos en un próximo artículo.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




