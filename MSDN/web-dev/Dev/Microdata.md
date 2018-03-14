---
redirect_url: https://docs.microsoft.com/
title: Micro-datos. Semántica real en la Web
description: Micro-datos. Semántica real en la Web
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Micro-datos. Semántica real en la Web

![] (./img/Microdata/image1.png)


    <http://www.dnmplus.net>

    [Marino Posadas](http://www.dnmplus.net/autores)

    [Miguel Katrib](http://www.dnmplus.net/autores)

La introducción de algunas nuevas etiquetas y atributos en HTML5 está
empezando a aportar a los desarrolladores web un conjunto de
herramientas que añaden significado real a sus contenidos de cara a los
buscadores y nos ayudan a que estos contenidos sean catalogados
adecuadamente. Pero un verdadero catálogo requiere basarse en una
jerarquía previa bien definida, tal y como la que se usa en
Biblioteconomía. Ésa es la novedad de los micro-datos, y vamos a ver
cómo este aspecto –bastante desconocido aún- del estándar puede
aportarnos mucho desde el punto de vista de la SEO (*Search Engine
Optimization*).

En una definición rápida, podemos decir que los micro-datos
(*Microdata*) son conjuntos de atributos y valores que se aplican a un
contenido web normal para describir ese contenido y aportar un
significado.

Se trata de una idea similar a la que alimentó la creación de XML, en
cuanto a que propone acompañar la información con una parte de lenguaje
de marcas que la describa. Y esta descripción no solo está dirigida a
los motores de búsqueda y la Web en general, sino también a los seres
humanos que pudiesen acceder a ella en forma de código fuente.

###Esfuerzos previos


Seguramente el lector podrá preguntarse si esto tiene que ver con
algunas de las iniciativas con las que, probablemente, se habrá cruzado
en sus lecturas sobre las nuevas propuestas en la Web. No es la primera
vez que se habla de semántica, y no es el primer formato o estándar
propuesto con miras a conseguir ese objetivo. De hecho, existen
propuestas previas que no han llegado a cuajar de forma popular, por más
que las entidades responsables las hayan publicado en forma de
estándares o estén soportadas por algún navegador.

Tal es el caso del Marco de Descripción de Recursos (*Resource
Description Framework*, RDF), que proponía metadatos en Web y que
desarrolló el *World Wide Web Consortium* (W3C). Se trata de un lenguaje
de propósito general para representar la información en la Web (un
metadato), sobre el que se hicieron variaciones posteriores, como la
realizada por el organismo de defensa norteamericano DARPA, con el
lenguaje DAML, que aportaba ontología e inferencia basados en RDF.

###Micro-formatos


Tampoco debe confundirse esta iniciativa con la idea previa de los
micro-formatos \[2, 3\], que permiten definir ciertos fragmentos de
marcado con un contenido semántico especial, y que nacieron también como
una forma de añadir elementos de marcado simples a datos legibles por
seres humanos, tales como eventos, detalles de contactos, o ubicaciones,
dentro de una página web, etc., de forma que se facilitase su
tratamiento informático: extracción, indexación, búsqueda, modificación,
etc. Entre ellos, cabe destacar los micro-formatos para información
personal (las **hCard**) y los calendarios (**hCalendar**, \[4\]).

###Micro-datos


Así pues, tras varios intentos previos y no poca literatura de
anticipación, llegamos a la idea de los micro-datos. Y debemos
entenderlos como vocabularios encaminados a proporcionar la semántica, o
el significado de un elemento, que además pueden ser extensibles.


![] (./img/Microdata/image2.png)

Los desarrolladores web pueden
diseñar un vocabulario personalizado o utilizar vocabularios de uso
disponibles en la web. La entidad que está detrás de la propuesta
que los buscadores actuales ya están utilizando es **Schema.org**,
que ha publicado en su sitio una colección de vocabularios de
marcado comúnmente utilizados, que incluyen entidades de uso común
que son reconocidas como propias de cara a la indexación y relación
con otras y dentro de las categorías de búsqueda: *persona*,
*evento*, *organización*, *producto*, *revisión*, *oferta*, y un
larguísimo etcétera.

Los principales motores de búsqueda, como Google, Microsoft y Yahoo!, se
basan en este marcado para mejorar los resultados de las búsquedas. Se
anima a la comunidad a que colabore con nuevos vocabularios
descriptivos, aunque para un gran número de propósitos es casi seguro
que podemos encontrar los formatos adecuados -ya construidos- para
describir nuestra actividad o la de nuestra empresa.

###Nivel de implementación


Comentábamos antes que los buscadores ya están utilizando esta
tecnología. ¿Cómo averiguarlo? Bueno, basta con observar los resultados
que nos ofrecen ciertas búsquedas que incluyen sitios que utilizan este
formato para observar la diferencia. Por ejemplo, si buscamos “*mexican
food, Alburquerque New Mexico*” en Google, este buscador incluye unas
informaciones adicionales (*rich snippets*) donde apreciamos una clara
diferencia entre las dos entradas que muestra la figura 1.

Observemos que no solo tenemos la información habitual, sino también
resultados de opiniones de los usuarios, o intervalo de precios. Pero
los resultados pueden llegar a ser mucho más significativos, como sucede
cuando buscamos en un sitio de música como **Last FM** por el conocido
*bluesman* **Miles Davis** (figura 2). En este caso no solo se nos
ofrece una descripción de lo encontrado y del músico, sino de distintos
elementos que se encuentran disponibles en ese sitio en relación con él
(las canciones más populares), y datos relacionados con ellos (duración
y álbum al que pertenecen). Incluso, las canciones aparecen en forma de
un enlace que nos llevaría a la página de reproducción del tema.

Figura 1. El primer resultado es indexado por Google utilizando
    micro-datos

![] (./img/Microdata/image3.png)


Figura 2. En este caso, Google ofrece una categorización de
    contenidos

![] (./img/Microdata/image4.png)

###El código


En el sitio oficial, Schema.org, podemos ver toda la documentación
relacionada con los micro-datos, junto con ejemplos de uso. El código
fuente que debemos añadir utiliza la nueva familia de atributos
**item\*** definida en HTML5 para expresar esa información que describe
el contenido. La lista completa de atributos para expresar esta
meta-información consta de: **itemtype**, **itemprop**, **itemid**,
**itemscope** e **itemref**, que, respectivamente, sirven para indicar
el tipo de elemento, cualquiera de sus propiedades de interés, el
identificador (como un número ISBN, en el caso de los libros que vemos
en la figura 3), el ámbito que abarca la definición, y si hace
referencia a otro elemento de marcado. Estos atributos pueden
adicionalmente complementarse con etiquetas **meta**.

Tales atributos están presentes desde el inicio del soporte de HTML en
las dos versiones más populares de Visual Studio, y con especial énfasis
en Visual Studio 2012, como podemos ver en la captura del editor HTML de
una página Web que se muestra en la figura 3. Como se puede apreciar,
tanto los atributos de micro-datos, como los valores posibles a asignar
-en muchos casos-, son reconocidos perfectamente por el IDE, que nos
ofrece ayuda Intellisense respecto a ellos en cualquier documento HTML,
ASP.NET Web Forms, ASP.NET MVC, etc.

Figura 3: Soporte de micro-datos en Visual Studio 2012

![] (./img/Microdata/image5.png)

Bien entendido que la inclusión de estos micro-datos no tiene
absolutamente ninguna relevancia visual en sí, y solo se manifiesta
cuando nuestra página es indexada por los motores de búsqueda para que
en lo adelante éstos nos presenten una información relacionada con ella,
como hemos visto en las primeras figuras.

###Breve definición del propósito de cada atributo

Enumeramos a continuación con más detalle el significado y la
utilización recomendada de cada atributo al describir un bloque de
marcado que aporta significado con micro-datos.

**itemscope**: “Marca” un contenedor indicando que, hasta su cierre,
todas las etiquetas contenidas en él están relacionadas con el ítem que
describen.

**itemtype**: Quizá el más importante. Establece qué clase de ítem se
está describiendo. Utiliza una organización taxonómica definida por
Schema.org en su página de documentación.

**itemid**: Se utiliza en los casos en que el elemento a describir pueda
ser identificado de forma única (mediante un URI, por ejemplo), como una
página web, el ISBN de un libro o el DNI de una persona.

**itemprop**: Usado para cada una de las propiedades que se quiere
describir (por ejemplo, en un libro: su título, su precio, su número de
páginas, la editorial que lo publicó, etc.).

**itemref**: Puede ser utilizado para indicar que otro elemento fuera
del ámbito establecido por **itemscope** tiene una relación con éste,
igualmente, aún estando en otra zona de la página Web.



Con respecto a **itemprop**, hay que advertir que, en algunos casos, su
posible valor ya está establecido por la taxonomía, como es el caso de
un libro, tal y como vemos en la página dedicada a este tipo de ítem en
el sitio Web de Schema.org (figura 4). De hecho, la propia documentación
que encontramos en estas páginas incluye fragmentos de código prototipo
para explicar cómo pueden expresarse otras ideas, conceptos, entidades o
ítems de manera semántica, tal y como vemos en el código fuente asociado
a la página antes citada (listado 1).

Figura 4. Fragmento de la descripción del ítem “book” en Schema.org

![] (./img/Microdata/image6.png)

<!-- -->

Listado 1. Fragmento del código fuente que describe un libro


```
    &lt;div itemscope itemtype="http://schema.org/Book"&gt;

    &lt;img itemprop="image" src="catcher-in-the-rye-book-cover.jpg"
    /&gt;

    &lt;span itemprop="name"&gt;The Catcher in the Rye&lt;/span&gt; -

    &lt;link itemprop="bookFormat"
    href="http://schema.org/Paperback"&gt;

    Mass Market Paperback by

    &lt;a itemprop="author" href="/author/jd\_salinger.html"&gt;J.D.
    Salinger&lt;/a&gt;

    &lt;div itemprop="aggregateRating" itemscope

    itemtype="http://schema.org/AggregateRating"&gt;

    &lt;span itemprop="ratingValue"&gt;4&lt;/span&gt; stars -

    &lt;span itemprop="reviewCount"&gt;3077&lt;/span&gt; reviews

    &lt;/div&gt;

    ...

    &lt;/div&gt;
```

La propuesta, además, anima a los creadores web a utilizar estas
categorías en cualquier tipo de contenido, y de esa forma promover otras
categorías. Entre ellas, cabría destacar la de los formatos de marcado
para cuando una página incluye código fuente, y la manera correcta de
especificar versiones soportadas, librerías, etc.

De esa forma, en el artículo “*New Vocabularies for Technical
Publishing*” (\[6\]), del blog oficial de Schema.org, se proponen
soluciones para la marca semántica de versiones (listado 2), de
referencias a librerías (listado 3), o de descripciones de código
alojado en un sitio web (listado 4), donde, como vemos, se complementa
la descripción indicada en atributos, con otros elementos de tipo
**&lt;meta&gt;** que colaboran en aportar más contenido semántico a lo
publicado.

Listado 2


```
    &lt;meta itemprop="aboutProduct" content=".NET Framework 4.0" /&gt;

    &lt;meta itemprop="currentProduct" content=".NET Framework 4.5"
    /&gt;

```

Listado 3

```

    itemprop="programmingModel" content="Managed"

    itemprop="assembly" content="mscorlib.dll" /&gt;
```

Listado 4

```

    &lt;div itemscope itemtype="http://schema.org/Code"&gt;

    &lt;meta itemprop="codeRepository" content=

    "http://code.msdn.microsoft.com/Web-Authentication-d0485/view/SourceCode"

    /&gt;

    &lt;meta itemprop="sampleType" content="Visual Studio solution(SLN)"
    /&gt;

    &lt;/div&gt;
```

Además del soporte que el usuario puede obtener desde el propio Visual
Studio u otras herramientas, como WebMatrix, existen herramientas
*online* que pueden ayudar en la migración de sitios existentes de forma
que aprovechen esta característica, y que sugieren algunas
transformaciones, como **Live Microdata** \[5\].

###Conclusión 


En resumen, se trata de una propuesta fácil de implementar, ya
soportada, y parte del estándar HTML5, que puede aportar mucho más valor
SEO a nuestros sitios que algunas de las típicas soluciones al uso
(aunque no debamos nunca abandonar ésas).

###Referencias


\[1\] “The Semantic Web: An Introduction”:
<http://infomesh.net/2001/swintro/>.

\[2\] Sitio dedicado a los micro-formatos: <http://microformats.org/>.

\[3\] **Allsop, J**. “Microformats: Empowering Your Markup for Web 2.0”:
<http://books.google.es/books/about/Microformats.html?id=LbUL6gHklxcC>.

\[4\] hCalendar: <http://en.wikipedia.org/wiki/HCalendar>.

\[5\] Lista completa de tipos disponibles en la jerarquía de Schema.org:
<http://schema.org/docs/full.html>.

\[6\] “New Vocabularies for Technical Publishing”:
<http://blog.schema.org/>.

\[7\] “Live Microdata”: <http://foolip.org/microdatajs/live/>.

\[8\] **Goel, K**. y **Gupta, P**. “Introducing schema.org: Search
engines come together for a richer web”. Search Quality Team, Google
Inc.




