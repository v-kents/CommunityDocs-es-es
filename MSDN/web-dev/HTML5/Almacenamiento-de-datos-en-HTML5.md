---
title: Almacenamiento de datos en HTML 5 - WebStorage
description: Almacenamiento de datos en HTML 5
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: web-dev
ms.custom: CommunityDocs
---







#Almacenamiento de datos en HTML 5 - WebStorage

©Jaime Peña Tresancos, 2013 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696) 

En la Web disponemos de dos sitios de dónde extraer y en dónde almacenar
información: en el servidor (o servidores) o en el ordenador del usuario
(en el lado del cliente). Cada sitio es adecuado para sus misiones y
según el tipo y la cantidad de información que movamos.

Por poner un caso paradigmático, cuando nos movemos con información
sensible que no deseamos que el usuario pueda alterar, el almacenamiento
en el servidor es la elección. En cambio aquella información sobre
procesos de navegación del usuario, propios de él y que deben estar muy
accesibles, sería un ejemplo de almacenamiento en local, del lado del
cliente.

Anteriormente a los sistemas con que disponemos con HTML 5, los
*cookies* era lo único accesible para ésta última finalidad. Cumplen sus
función, pero además de otras consideraciones, no gozan de buena fama;
han sido fuente de conflictos de seguridad y, desde el punto de vista de
la funcionalidad, se requiere un modelo de *JavaScript* asociado nada
claro, no se evita todo un tránsito de ida y vuelta a través de Internet
–penalizando sustancialmente el código- y cuando se maneja una cantidad
de información poco más que mínima, sin más, no valen o son muy poco
funcionales.

![] (./img/Almacenamiento-de-dato-en-HTML5/image1.png)

![] (./img/Almacenamiento-de-dato-en-HTML5/image2.png)

###¿Qué y cómo es el Web Storage?


HTML 5 tiene una mejor solución. Evita los problemas de caducidades, no
requiere ese tráfico a través de Internet –a menos que sea
explícitamente requerido- y se dispone de todo el espacio necesario en
el cliente. Esa funcionalidad se denomina *Web Storage* y entre otras
cosas nos da grandes posibilidades de trabajo con páginas y aplicaciones
trabajando *offline*, sin acceso a Internet.

Hay dos tipos de *Web Storage* e implican el trabajo con dos objetos:

*Local Storage*: Los datos almacenados no tienen fecha de caducidad,
permanecerán indefinidamente disponibles (se utiliza el objeto
*localStorage*)

*Session Storage*: Los datos almacenados sólo estarán disponibles
durante la sesión de navegación, cuando se cierre, desaparecerán (se
utiliza el objeto *sessionStorage*)

![] (./img/Almacenamiento-de-dato-en-HTML5/image3.png)

Algunas consideraciones útiles acerca de *Web Storage*:

Desde la perspectiva del código asociado a la página Web, *Local
Storage* y *Session Storage* se comportan de la misma manera. Sólo
cambia la disponibilidad temporal de la información.

Tanto el *Local Storage* como el *Session Storage* están asociados a un
dominio de Internet, no a una página concreta. Por ejemplo, si se usó
para
[www.dominio.com/carpeta/hoja1.html](http://www.dominio.com/carpeta/hoja1.html),
también estará disponible para
[www.dominio.com/default.html](http://www.dominio.com/default.html), ya
que pertenecen al mismo dominio.

Dado que está asociado a un determinado ordenador y usuario, si se
accede desde otro ordenador o desde el mismo ordenador pero como
diferente usuario, los anteriores datos de *Local Storage* no estarán
disponibles.

Aunque HTML 5 no fija nada acerca de la máxima capacidad, la mayor parte
de los exploradores trabajan con hasta 5 MB de *Web Storage*. El tamaño
máximo para las *cookies* es de 4 KB.

Los datos se almacenan siempre como texto, así pues han de utilizarse
funciones de conversión para acceder a datos de otro tipo –números,
fechas, …-

Los datos se almacenan en formato de parejas de *nombre/valor*, en dónde
el nombre es de la variable almacenada y el valor es el contenido
textual que se guarda.

**Tabla 1**: Soporte de *Web Storage* en los diferentes exploradores de
Internet:

  IE   |Firefox   |Chrome   |Safari   |Opera   |Safari iOS   |Android
  ---- |--------- |-------- |-------- |------- |------------|---------
  8    |3.5       |5        |4        |10.5    |2            |2

**C\# Listado 1: Rutina JavaScript para comprobar si es soportado el
Web Storage**

```
    if(typeof(Storage)!=="undefined")

    {

    // Son soportados localStorage y sessionStorage

    }

    else

    {

    // No es soportado el Web Storage

    }
```

###Almacenamiento y recuperación de datos


Como hemos indicado los datos se almacenan en pares de valores
*nombre/valor*. La sintaxis de creación de una entrada de almacenamiento
local o de sesión es similar y se recogen en los recuadros adjuntos:

```
  localStorage\[**keyName**\] = **data**;
  sessionStorage\[**keyName**\] = **data**;
```

Para la recuperación de los valores se sigue una sintaxis similar, pero
inversa:

```
  data = localStorage\[keyName\];
  
  **data** = sessionStorage\[**keyName**\];
```

En el listado que sigue se recoge un ejemplo completo de almacenamiento
y recuperación de almacenamiento local y de sesión.

Pruébese a cargar la página y crear los datos, guardarlos, borrarlos y
recuperarlos de la entrada de texto y a salir de la página y volver a
cargarla; al recuperar los datos, observaremos que sólo el
almacenamiento local se recuperará, dado que él de sesión se habrá
perdido al cerrar la página.

**Listado 2: Ejemplo de uso de almacenamiento local y se sesión.**


```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta http-equiv="Content-Type" content="text/html;
    charset=UTF-8" lang="es-es"&gt;

    &lt;title&gt;Web Storage 2&lt;/title&gt;

    &lt;script&gt;

    function saveData() {

    var localData = document.getElementById("local").value;

    var sessionData = document.getElementById("session").value;

    localStorage\["lData"\] = localData;

    sessionStorage\["sData"\] = sessionData;

    }

    function loadData() {

    var localData = localStorage\["lData"\];

    var sessionData = sessionStorage\["sData"\];

    if (localData != null) {

    document.getElementById("local").value = localData;

    }

    if (sessionData != null) {

    document.getElementById("session").value = sessionData;

    }

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;fieldset&gt;

    &lt;legend&gt;Web Storage&lt;/legend&gt;

    Se guardará en 'local storage'\_\_\_:&lt;input
    id="local"&gt;&lt;/input&gt;&lt;br&gt;

    Se guardará en 'session storage'\_:&lt;input
    id="session"&gt;&lt;/input&gt;

    &lt;/fieldset&gt;

    &lt;div&gt;

    &lt;button onclick="saveData()"&gt;Guardar&lt;/button&gt;

    &lt;button onclick="loadData()"&gt;Recuperar&lt;/button&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

También es soportada la sintaxis de punto, de la forma:

```
  localStorage.keyName = data;

  sessionStorage.**keyName** = **data**;
```

Y para la recuperación de los valores:
```
  data = localStorage.keyName;

  **data** = sessionStorage.**keyName**;
```

Aunque no es la recomendada y por tanto sólo damos el listado que sigue
a modo de ilustración.

Listado 2b: Ejemplo similar al anterior, pero utilizando la ‘sintaxis de
punto’.
```
   &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta http-equiv="Content-Type" content="text/html;
    charset=UTF-8" lang="es-es"&gt;

    &lt;title&gt;Web Storage 2b&lt;/title&gt;

    &lt;script&gt;

    function saveData() {

    var localData = document.getElementById("local").value;

    var sessionData = document.getElementById("session").value;

    localStorage.lData = localData;

    sessionStorage.sData = sessionData;

    }

    function loadData() {

    var localData = localStorage.lData;

    var sessionData = sessionStorage.sData;

    if (localData) {

    document.getElementById("local").value = localData;

    }

    if (sessionData) {

    document.getElementById("session").value = sessionData;

    }

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;fieldset&gt;

    &lt;legend&gt;Web Storage&lt;/legend&gt;

    Se guardará en 'local storage'\_\_\_:&lt;input
    id="local"&gt;&lt;/input&gt;&lt;br&gt;

    Se guardará en 'session storage'\_:&lt;input
    id="session"&gt;&lt;/input&gt;

    &lt;/fieldset&gt;

    &lt;div&gt;

    &lt;button onclick="saveData()"&gt;Guardar&lt;/button&gt;

    &lt;button onclick="loadData()"&gt;Recuperar&lt;/button&gt;

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Almacenamiento-de-dato-en-HTML5/image4.png)

###Búsquedas y eliminaciones de datos


La búsqueda directa de un valor determinado se realiza, como vimos
anteriormente en la recuperación de datos. Eso es simple, dado que se
supone conocemos el nombre de la clave. Una situación diferente es
cuando deseamos conocer los nombres de las claves almacenadas en un
ordenador concreto.

El primer paso será acudir al método *localStorage.length*, que dos da a
conocer el número de claves de almacenamiento local. Con ese valor,
podremos crear un bucle que lo recorra de la forma indicada en el código
siguiente:

C\#


```
    for (var i=0; i&lt;localStorage.length; i++) {

    var key = localStorage.key(i);

    var item = localStorage\[key\];

    …

    Listado 3: Ejemplo completo de recuperación de todo el contenido del
    almacenamiento local.

    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta http-equiv="Content-Type" content="text/html;
    charset=UTF-8" lang="es-es"&gt;

    &lt;title&gt;Web Storage 3&lt;/title&gt;

    &lt;script&gt;

    function findAllItems() {

    var itemList = document.getElementById("itemList");

    itemList.innerHTML = "";

    for (var i=0; i&lt;localStorage.length; i++) {

    var key = localStorage.key(i);

    var item = localStorage\[key\];

    var newItem = document.createElement("li");

    newItem.innerHTML = key + ": " + item;

    itemList.appendChild(newItem);

    }

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;button onclick="findAllItems()"&gt;Contenido del 'Local
    Storage'&lt;/button&gt;

    &lt;ul id="itemList"&gt;

    &lt;/ul&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Almacenamiento-de-dato-en-HTML5/image5.png)

Fácil será comprender que para el almacenamiento de sesión, deberíamos
haber empleado los métodos:

C\#


```
    for (var i=0; i&lt;sessionStorage.length; i++) {

    var key = sessionStorage.key(i);

    var item = sessionStorage\[key\];

    …
```

La eliminación de datos de *Web Storage* no podría ser más simple. Una
llamada al método *removeItem()*, pasando como parámetro el nombre de la
clave, y esa variable de almacenamiento local o de sesión desaparecerá.
Por ejemplo:

*localStorage.removeItem("lData");*

O bien:

*sessionStorage.removeItem("sFecha");*

Si se prefiere un método más drástico, que eliminaría todo el
almacenamiento local o de sesión, usaríamos *clear()*. Por ejemplo:

*sessionStorage.clear();*

O bien:

*localStorage.clear();*

###Almacenamiento de números y fechas


Dado que, como decíamos al comienzo del artículo, se almacenan los datos
en forma de cadenas de texto, por ejemplo:

C\#


```
    x = localStorage\[“valor”\];

    // JavaScript calcula “50”+”10” indeseadamente y devolvería “5010”.

    x += 10;
```

Por tanto, hemos de emplear alguna de las funciones de conversión de
JavaScript; así, por el contrario:

C\#


```
    x = Number(localStorage\[“valor”\]);

    // Ahora JavaScript calculará 50+10 correctamente y devolverá 60.

    x += 10;
```

En el listado que sigue se ilustra una de las múltiples maneras de
hacerlo.

**Listado 4: Ejemplo completo de almacenamiento y recuperación de
   valores numéricos en un almacenamiento local.**

```
   &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta http-equiv="Content-Type" content="text/html;
    charset=UTF-8" lang="es-es"&gt;

    &lt;title&gt;Web Storage 4&lt;/title&gt;

    &lt;script&gt;

    function contadorClics()

    {

    if(typeof(Storage)!=="undefined")

    {

    if (localStorage.contador)

    {

    localStorage.contador=Number(localStorage.contador)+1;

    }

    else

    {

    localStorage.contador=1;

    }

    document.getElementById("result").innerHTML="Se ha hecho clic en el
    botón " + localStorage.contador + " veces.";

    }

    else

    {

    document.getElementById("result").innerHTML=" No es soportado el Web
    Storage ";

    }

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p&gt;&lt;button onclick="contadorClics()" type="button"&gt;Haga
    clic&lt;/button&gt;&lt;/p&gt;

    &lt;div id="result"&gt;;-)&lt;/div&gt;

    &lt;p&gt;Al cerrar la pestaña o el navegador y volver a abrir la
    página, el contador continuará (no es reseteado).&lt;/p&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

Para el caso de las fechas la cuestión es algo diferente y un poco más
compleja. Se trata de utilizar la función *Date()* de *JavaScript*, pero
normalmente no nos interesará utilizar su valor en bruto, en un formato:

Fri Jun 22 11:40:42 UTC+0200 2012

Como se muestra en el listado que sigue.

**Listado 5: Código JavaScript que nos muestra el día actual, en el
   formato AAAA/MM/DD**


```
    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta http-equiv="Content-Type" content="text/html;
    charset=UTF-8" lang="es-es"&gt;

    &lt;script&gt;

    function displayDate()

    {

    document.getElementById("fecha").innerHTML=Date();

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="fecha"&gt;&lt;/p&gt;

    &lt;button type="button" onclick="displayDate()"&gt;Mostrar
    fecha&lt;/button&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

Para adaptarlo a una cadena adecuada acudimos a las funciones de
extracción de *JavaScript*. Imaginemos que deseamos almacenar el día
actual, las adecuadas serían:

*getFullYear*: Año de cuatro cifras

*getMonth*: Cifra del mes, empezando a contar desde 0 (enero) hasta 11
(diciembre)

*getDate*: Día del mes

Y con ellas el código más sencillo posible que nos mostrase la fecha
actual, podría ser:

C\#


```
    function displayDate()

    {

    var d = new Date();

    document.getElementById("fecha").innerHTML=d.getFullYear()+"/"+(d.getMonth()+1)+"/"+d.getDate();

    }

    &lt;/script&gt;
```

Llevado al caso del *Web Storage*, para un almacenamiento local,
tendríamos:

C\#


```
    // Crear el objeto tipo Date

    var d = new Date();

    // Crear la cadena de texto en la forma AAAA/MM/DD y almacenarla

    localStorage\["session\_started"\] = d.getFullYear() +
    "/" +(d.getMonth()+1) + "/" + d.getDate();
```

###Conclusiones


En el presente artículo hemos comprobado la facilidad de implementación
del *Web Storage* y cómo con él podremos obviar el empleo de *cookies*.
Hemos ilustrado una gran parte de las capacidades que nos proporciona
HTML 5 para el control de datos de una manera más simple, completa y
eficiente.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.


