---
redirect_url: https://docs.microsoft.com/
title: Explorando el DOM- Objeto element. Selección de elementos II
description: Aspectos más generales de la selección de elementos y grupos de elementos
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Explorando el DOM: Objeto element. Selección de elementos II

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


En nuestro anterior artículo **Explorando el DOM: Objeto *element*.
Selección de elementos I**:

**http://msdn.microsoft.com/es-es/library/dn817846.aspx**

Tratamos los aspectos más generales de la selección de elementos y
grupos de elementos, en el presente nos detendremos en las posibilidades
de selección de subgrupos –un paso más allá-, el uso de métodos de
selección de grupos específicos y un poco de elucidación del cuerpo del
documento HTML.

Esto será convenientemente ilustrado con ejemplos, mediante rutinas muy
simples en código *JavaScript*; en concreto, en el presente artículo,
nos ocuparemos de:

* Selección de subgrupos de elementos, dentro de un grupo dado.

    * Por selector específico

    * Por tipo de etiqueta

    * Por clase de pertenencia

* Selecciones preconfiguradas de grupos de elementos.

    * Los elementos _body_ y _head_. Su contenido.

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

###Selección de subgrupos de elementos


Lo ilustraremos con los tres métodos de selección de grupos que habíamos
comentado en el apartado anterior, aplicándolos no sobre *document*,
sino sobre el elemento padre que queramos como subgrupo de elección.

Comencemos con lo ilustrado en el Listado 4:

Se trata de diferenciar los nombres de los dos grupos, utilizando el
método *querySelectorAll*.

Si programásemos *document.querySelectorAll('li')*, recogeríamos un
grupo que contendría la globalidad de nombres que aparecen en el
documento. Como hemos visto anteriormente.

Si sólo deseamos recoger los nombres que aparecen en el apartado
*&lt;div id="A"&gt;,* hemos de programar el elemento padre como:

*var divA = document.getElementById("A");*

Y posteriormente extraer los elementos hijos que nos interesan, de la
forma:

*divA.querySelectorAll('li')*

El resto es mostrar cada componente del grupo con un bucle que determina
la longitud del grupo y muestra en consola cada elemento de éste.
Recuérdese que se comienza contar en cero hasta su longitud menos uno.

**Listado 4: Exposición de todos los elementos de un subgrupo específico, mediante querySelectorAll**

```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Selecting Node&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="A"&gt;

    &lt;ul&gt;

    &lt;li&gt;Alfonso&lt;/li&gt;

    &lt;li&gt;Carlos&lt;/li&gt;

    &lt;li&gt;Fernando&lt;/li&gt;

    &lt;li&gt;Joaquín&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;div id="B"&gt;

    &lt;ul&gt;

    &lt;li&gt;Antonio&lt;/li&gt;

    &lt;li&gt;Daniel&lt;/li&gt;

    &lt;li&gt;Julio&lt;/li&gt;

    &lt;li&gt;Manuel&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;script&gt;

    console.log("Equipo A ...");

    var divA = document.getElementById("A");

    for (i = 0; i &lt; divA.querySelectorAll('li').length; i++)

    console.log(divA.querySelectorAll('li')\[i\].textContent);

    console.log("Equipo B ...");

    var divB = document.getElementById("B");

    for (i = 0; i &lt; divB.querySelectorAll('li').length; i++)

    console.log(divB.querySelectorAll('li')\[i\].textContent);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Seleccion-de-elementos-II/image1.png)

En el Listado 5, mostramos una modificación al Listado 4, en dónde
utilizamos el método más específico *getElementsByTagName*, por el resto
todo transcurre de forma idéntica.

**Listado 5: Exposición de todos los elementos de un subgrupo específico, mediante getElementsByTagName**


```
    &lt;script&gt;

    console.log("Equipo A ...");

    var divA = document.getElementById("A");

    for (i = 0; i &lt; divA.getElementsByTagName('li').length; i++)

    console.log(divA.getElementsByTagName('li')\[i\].textContent);

    console.log("Equipo B ...");

    var divB = document.getElementById("B");

    for (i = 0; i &lt; divB.getElementsByTagName('li').length; i++)

    console.log(divB.getElementsByTagName('li')\[i\].textContent);

    &lt;/script&gt;

```

![] (./img/Seleccion-de-elementos-II/image1.png)

Una última posibilidad que exponemos es cuando nos encontramos con la
necesidad de seleccionar elementos en función de su clase de estilo de
pertenencia.

Fijémonos en el Listado 6, esencialmente el mismo visto anteriormente,
pero algo más simple. Notaremos que ya no hay apartados &lt;div&gt; y sí
diferenciaciones de estilo en las viñetas de los nombres –unas azules y
otras rojas-; el que hayan sido separados en dos grupos es meramente
ornamental. Podrían incluso ir mezclados y el resultado sería el mismo
en la salida de la *Consola de texto* –una opción a probar-.

Un resumen de lo esencial es:

Se utiliza el código *document.getElementsByClassName('rojo')* para
acceder a la colección de elementos pertenecientes al grupo deseado.

Se usa el método *length* para conocer el número de elementos del grupo.

Se accede al nombre de cada elemento del grupo con el método
*textContent*, aplicado de la forma
*document.getElementsByClassName('rojo')\[i\].textContent*.

**Listado 6: Exposición de todos los elementos de un subgrupo específico, mediante getElementsByClassName**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Selecting Node&lt;/title&gt;

    &lt;style&gt;

    li.azul{

    color:blue;

    }

    li.rojo{

    color:red;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;ul&gt;

    &lt;li class="azul"&gt;Alfonso&lt;/li&gt;

    &lt;li class="azul"&gt;Carlos&lt;/li&gt;

    &lt;li class="azul"&gt;Fernando&lt;/li&gt;

    &lt;li class="azul"&gt;Joaquín&lt;/li&gt;

    &lt;/ul&gt;

    &lt;ul&gt;

    &lt;li class="rojo"&gt;Antonio&lt;/li&gt;

    &lt;li class="rojo"&gt;Daniel&lt;/li&gt;

    &lt;li class="rojo"&gt;Julio&lt;/li&gt;

    &lt;li class="rojo"&gt;Manuel&lt;/li&gt;

    &lt;/ul&gt;

    &lt;script&gt;

    console.log("Equipo A (viste de azul) ...");

    for (i = 0; i &lt;
    document.getElementsByClassName('azul').length; i++)

    console.log(document.getElementsByClassName('azul')\[i\].textContent);

    console.log("Equipo B (viste de rojo) ...");

    for (i = 0; i &lt;
    document.getElementsByClassName('rojo').length; i++)

    console.log(document.getElementsByClassName('rojo')\[i\].textContent);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Seleccion-de-elementos-II/image2.png)

###Selecciones preconfiguradas de elementos


También se dispone de métodos predefinidos que atañen a selecciones de
especial interés, entre ellos nos encontramos con:

  Método                   |Descripción
  ------------------------ |----------------------------------------------------------------------
  *document.all*           |Todos los elementos del documento HTML.
  *document.forms*         |Todos los elementos &lt;form&gt; del documento HTML.
  *document.images*        |Todos los elementos &lt;img&gt; del documento HTML.
  *document.links*         |Todos los elementos &lt;a&gt; del documento HTML.
  *document.scripts*       |Todos los elementos &lt;script&gt; del documento HTML.
  *document.styleSheets*   |Todos los elementos &lt;link&gt; o &lt;style&gt; del documento HTML.

Seguidamente proponemos dos ejemplos muy simples, derivados de los
anteriormente comentados, en los que empleamos los métodos:

Listado 7: document.all

Listado 8: document.scripts

Respecto al Listado 7, observará que la salida en la *Consola de texto*
del explorador de Internet nos mostrará repetidas veces la lista
numerada; eso se debe a que se muestran todos los elementos y por tanto
irán los elementos padre de la propia lista no numerada que contienen
dicha lista también.

**Listado 7: Utilización de document.all para la localización de todos los elementos del documento HTML.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Selecting document.all&lt;/title&gt;

    &lt;style&gt;

    li.azul{

    color:blue;

    }

    li.rojo{

    color:red;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="A"&gt;

    &lt;ul&gt;

    &lt;li class="azul"&gt;Alfonso&lt;/li&gt;

    &lt;li class="azul"&gt;Carlos&lt;/li&gt;

    &lt;li class="azul"&gt;Fernando&lt;/li&gt;

    &lt;li class="azul"&gt;Joaquín&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;div id="B"&gt;

    &lt;ul&gt;

    &lt;li class="rojo"&gt;Antonio&lt;/li&gt;

    &lt;li class="rojo"&gt;Daniel&lt;/li&gt;

    &lt;li class="rojo"&gt;Julio&lt;/li&gt;

    &lt;li class="rojo"&gt;Manuel&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;script&gt;

    console.log("document.all ...");

    var contenido = document.all;

    for (i = 0; i &lt; contenido.length; i++)

    console.log(i, ' --&gt; ', contenido\[i\].textContent);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Seleccion-de-elementos-II/image3.png)



**Listado 8: Utilización de document.scripts para la localización de todos los elementos &lt;script&gt; del documento HTML.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;Selecting document.scripts&lt;/title&gt;

    &lt;style&gt;

    li.azul{

    color:blue;

    }

    li.rojo{

    color:red;

    }

    &lt;/style&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div id="A"&gt;

    &lt;ul&gt;

    &lt;li class="azul"&gt;Alfonso&lt;/li&gt;

    &lt;li class="azul"&gt;Carlos&lt;/li&gt;

    &lt;li class="azul"&gt;Fernando&lt;/li&gt;

    &lt;li class="azul"&gt;Joaquín&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;div id="B"&gt;

    &lt;ul&gt;

    &lt;li class="rojo"&gt;Antonio&lt;/li&gt;

    &lt;li class="rojo"&gt;Daniel&lt;/li&gt;

    &lt;li class="rojo"&gt;Julio&lt;/li&gt;

    &lt;li class="rojo"&gt;Manuel&lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;script&gt;

    console.log("document.scripts ...");

    var contenido = document.scripts;

    for (i = 0; i &lt; contenido.length; i++)

    console.log(i, ' --&gt; ', contenido\[i\].textContent);

    &lt;/script&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Seleccion-de-elementos-II/image4.png)

###¿Qué hay de body y head?


Como complemento a lo anteriormente visto, ilustramos dos métodos
especialmente interesantes para recabar información del contenido de un
documento HTML.

En el Listado 9 nos encontramos con el método *document.body*. Se
tratará de sustituir el código &lt;script&gt; allí mostrado en uno de
los ejemplos anteriores, como el del Listado 8.

Se refiere a un modo muy potente de recabar todo el contenido del cuerpo
del documento HTML, es decir, el contenido de la etiqueta &lt;body&gt;,
que mostraremos en la *Consola de texto* del explorador de Internet,
mediante el ya conocido método *innerHTML*.

En el Listado 10 se nos muestra el método *document.head*. También se
tratará de sustituir el código &lt;script&gt; allí mostrado en uno de
los ejemplos anteriores, como el del Listado 8.

En esta ocasión se recabará todo el contenido de la cabecera del
documento HTML, es decir, el contenido de la etiqueta &lt;head&gt;, que
mostraremos en la *Consola de texto* del explorador de Internet,
mediante el ya conocido método *innerHTML*.

**Listado 9: Utilización del método document.body.**

```
    &lt;script&gt;

    console.log("document.body ...");

    var contenido = document.body;

    console.log(contenido.innerHTML);

    &lt;/script&gt;

```

![] (./img/Seleccion-de-elementos-II/image5.png)



**Listado 10: Utilización del método document.head.**

```

    &lt;script&gt;

    console.log("document.head ...");

    var contenido = document.head;

    console.log(contenido.innerHTML);

    &lt;/script&gt;

```

![] (./img/Seleccion-de-elementos-II/image6.png)

###Conclusiones


En el presente artículo hemos visto cómo gestionar un poco más
profundamente la selección de elementos, yendo al nivel de los
subgrupos, grupos de especial interés y algo de cuerpo y cabecera del
documento HTML.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




