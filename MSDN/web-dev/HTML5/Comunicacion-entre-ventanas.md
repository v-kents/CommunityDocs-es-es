---
redirect_url: https://docs.microsoft.com/
title: HTML 5 Storage. Comunicación entre ventanas
description: HTML 5 Storage. Comunicación entre ventanas
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#HTML 5 Storage. Comunicación entre ventanas

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


El almacenamiento en local proporcionado por HTML 5, denominado *Local
Storage*, puede también servirnos como modo de guardado para intercambio
de información entre aplicaciones e incluso que eso se haga de forma
automatizada e instantánea.

A modo de guía, en el presente artículo, trataremos:

Almacenamiento de sesión y local en HTML 5.

Seguimiento y escucha de eventos.

El *Storage Event Object*.

El proyecto de aplicación base de trabajo con almacenamiento local y
escucha de eventos.

La correspondiente segunda aplicación de gestión de almacenamiento y
escucha de eventos.

Veremos cómo ambas intercambian la información modificada en cualquiera
de ellas.

###Almacenamiento de sesión y local en HTML 5


Los dos modos de almacenamiento tipo *Web Storage* que nos proporciona
como novedad HTML 5, se recogen en la tabla que sigue. En el presente
artículo damos por supuesto que se conocen las bases del trabajo con él
y usaremos tanto el almacenamiento de un tipo como el de otro, dado que
lo tratado es aplicable para ambos casos.

  Método             |Descripción
  ------------------ |----------------------------------------------------------------------------------
  *sessionStorage*   |Almacenará el nombre y valor de una clave durante el tiempo que dure una sesión.
                     |Toma como parámetro el nombre de la clave que va a ser almacenada.
                     |Se le asigna el valor de la clave.
  *localStorage*     |Almacenará el nombre y valor de una clave de forma permanente. 
                     |Toma como parámetro el nombre de la clave que va a ser almacenada. 
                     |Se le asigna el valor de la clave.
  -----------------------------------------------------------------------------------------------------

Para más información acerca del almacenamiento en HTML 5, sugerimos
acuda a nuestro artículo **Almacenamiento de datos en HTML 5.
WebStorage**:

[**http://msdn.microsoft.com/es-es/library/dn194486.aspx**](http://msdn.microsoft.com/es-es/library/dn194486.aspx)

Sólo recordaremos que los modos de asignación son del estilo:

*sessionStorage\['sValue'\] = valor;*

Siendo:

*sValue*: el nombre de la clave

*valor*: el valor de la clave, en forma de cadena de caracteres

Para su recuperación, emplearemos una codificación del estilo:

*var valor = sessionStorage\['sValue'\];*

También pueden emplearse las sintaxis de punto –véase el artículo
referenciado- y los métodos *setItem(key, valor)* y *var
valor=getItem(key)*. Todo esto tanto para *sessionStorage* como para
*localStorage*.

###Herramientas utilizadas


Si se cargan directamente los ejemplos en un explorador de Internet, no
se ejecutarán correctamente las acciones de *Web Storage*, se precisa
sean subidas desde un servidor, no por carga directa –téngase siempre
muy presente-.

Por tanto, hemos utilizado herramientas que facilitan la ejecución desde
un servidor lanzado desde el propio entorno de desarrollo de forma
totalmente transparente para nosotros, tales como *WebMatrix 3.0* o
*Visual Studio 2013* –incluidas las versiones *Express*-.

Desde ellos, a la vista del código fuente –el editor de código-:

En *WebMatrix*: Pulsaremos el botón derecho del ratón sobre el nombre
del archivo y en el menú emergente seleccionaremos **Iniciar en
Explorador**.

En *Visual Studio*: Pulsaremos el botón derecho del ratón en un área
libre del editor y en el menú emergente seleccionaremos **Ver en
Explorador**.

![] (./img/HTML-5 Storage-Comunicación-entre-ventanas/image1.png)

![] (./img/HTML-5 Storage-Comunicación-entre-ventanas/image2.png)

###Seguimiento –escucha- de eventos


Cuando se modifica el *Web Storage* se produce un evento que puede
seguirse con los métodos habituales de escucha de eventos de
*JavaScript*.

Para una información general de la gestión del seguimiento de eventos,
acúdase a la siguiente dirección URL:

[**https://developer.mozilla.org/es/docs/DOM/elemento.addEventListener**](https://developer.mozilla.org/es/docs/DOM/elemento.addEventListener)

En nuestro caso concreto, que se trata un evento surgido del
almacenamiento local HTML 5, se puede obtener la información devuelta en
el parámetro *Storage Event Object*, véase más adelante.

La tabla que sigue recoge el método a implementar y la función de
respuesta a codificar para dichas labores.

   Método                      |Descripción
  -----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------
  *addEventListener*          |Creará una función de escucha de eventos en general.                       
                              |Toma como parámetros:  
                              |El tipo de eventos a seguir, se especifica con una constante que los identificará
                              |La referencia de la función de respuesta que codificaremos
                              |Un tercer parámetro opcional que si es *true* indica que será el usuario el que controlará el evento antes de ser emitido al destinatario
  *function respuesta(evt)*   |La función de respuesta contiene de parámetro un objeto de tipo *Storage Event Object* y es la llamada cuando se produce un evento del tipo capturado.
                              |Nos ocuparemos más debajo de ese tipo de objeto y de la información que nos proporciona.

En esencia, un código de captura de evento del *Web Storage* debería ser
algo así como lo recogido en el Listado 1.

**Listado 1: Código a insertar para la escucha y seguimiento de
   eventos del Web Storage de HTML 5.**


```
    &lt;script&gt;

    function reportStorage(evt) {

    alert("El \`Storage\` fue modificado");

    }

    window.onload = function () {

    window.addEventListener('storage', reportStorage, false);

    }

    &lt;/script&gt;
```

###El Storage Event Object


Este objeto que es transferido a la función de respuesta tiene numerosos
métodos y propiedades, que no es de interés inminente tratar en detalle,
nos interesarán especialmente las propiedades recogidas en la tabla que
sigue:

  Propiedad     |Descripción
  ------------- |---------------------------------------------------------------------------------------------------------------
  *key*         |La clave que ha sido cambiada y es objeto del evento.
  *newValue*    |El antiguo valor de.
  *oldValue*    |El nuevo valor.
  *timeStamp*   |La hora del evento en formato *timestamp*, que son los milisegundos trascurridos desde el 1 de enero de 1970.
  *url*         |La dirección desde la cual se ha emitido el evento de cambio.

Para una información completa de los métodos y propiedades del *Storage
Event Object*, puede acudir a la siguiente dirección URL:

[**http://msdn.microsoft.com/en-us/library/windows/apps/hh465809.aspx**](http://msdn.microsoft.com/en-us/library/windows/apps/hh465809.aspx)

La propiedad *timeStamp* es la única que merece una atención especial,
para pasarla a un modo que sea significativo para nosotros, normalmente
una fecha en nuestro calendario de uso local, codificaremos algo similar
a:

*(new Date(evt.timeStamp)).toLocaleString('es-ES')*

En donde:

evt: seria el parámetro pasado a la función de respuesta

‘es-ES’: determina la localización de la fecha y hora a mostrar
–cámbiese para cada caso particular-

###Nuestro proyecto


Se trata de implementar la comunicación entre dos documentos HTML a
través del almacenamiento de *Web Storage* que nos proporciona HTML 5.
Así, almacenaremos datos en él desde un documento, que serán leídos
desde otros y viceversa; a la par, implementaremos funciones de escucha
de eventos para actualizar las páginas, cuando se modifiquen algunos de
los datos en una u otra.

Podríamos decir que se trata de dos aplicaciones corriendo en paralelo:

La primera aplicación, podríamos llamarla la principal, será la que
lleve el peso de los contenidos a intercambiar, sin más.

La segunda aplicación, o aplicación complementaria, sólo gestionará
parte de los contenidos intercambiados y será como un modificador de la
primera, por el resto, su código de gestión es similar.

Nótese que es necesario trabajar con el *Local Storage* para la
intercomunicación entre aplicaciones, ya que es la que abarca a todo el
sistema y no se restringe a la sesión de navegación de una única
aplicación.

Puede comprobarlo al final de nuestra exposición, cambiando todas las
referencias de *localStorage* por *sessionStorage*.

###La aplicación principal (o primera)


Se trata de una mimetización de un breve cuestionario de entrada de un
nombre y un alias que en vez de ser guardados en una base de datos o
enviados por email, serán guardados en el *Local Storage*.

El código correspondiente se muestra en el Listado 2. Lo que contiene y
las acciones que se llevan a cabo son, en resumen:

Los siguientes elementos funcionalmente significativos:

Una caja de entrada de texto identificada como *Nombre* que servirá de
contenedor y entrada de un supuesto nombre de usuario.

Una caja de entrada de texto identificada como *Alias* que servirá de
contenedor y entrada de un supuesto alias de dicho usuario.

Un botón de comando etiquetado *Guardar* para enviar al *Local Storage*
los valores actuales de las cajas de entrada de nombre y alias.

Se ha codificado una función de seguimiento –escucha- de los eventos del
*Web Storage*, similar al que hemos implementado en el ejemplo anterior
–*window.onload()* …-.

Al arranque de la aplicación, también codificado en *window.onload()*
con una llamada a la función *paste()*, se cargarán desde el *Local
Storage* el valor del nombre y el alias previamente almacenados en el
sistema.

Esas cargas darán lugar a dos llamadas a la función de escucha de
eventos del *Web Storage*, antes de emitirse la correspondiente alerta
*JavaScript* programada en la función *paste()*.

Al pulsar el botón *Guardar* se llama sucesivamente a las funciones
*nombre()* y *alias()* que guardarán el nombre y el alias que contienen
las cajas de entrada correspondientes en el *Local Storage* del sistema.

Esas acciones darán lugar a dos llamadas a la función de escucha de
eventos del *Web Storage*, antes de emitirse las correspondientes
alertas *JavaScript* programadas en las funciones *nombre()* y
*alias()*.

Cada vez que se produzca una alteración del *Local Storage*, será
llamada la función de escucha y se recargarán los valores de nombre y
alias, por si hubieran sido cambiados.

También se recargará la página para asegurarnos de que se muestran los
valores actualizados convenientemente.

**Listado 2: Código fuente de la aplicación primera del sistema de
   escucha e intercambio de información.**

```
   &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;localStorage con addEventListener 1&lt;/title&gt;

    &lt;style&gt;

    \#B {

    background-color: lightgray;

    }

    \#C {

    background-color: lightblue;

    }

    &lt;/style&gt;

    &lt;script&gt;

    var flag1 = 'off';

    function reportStorage(evt) {

    alert("El \`Storage\` fue modificado desde: " + evt.url);

    alert("Se ha actualizado: " + evt.key);

    // Actualizamos el valor del alias y del nombre

    if (flag1 == 'off') {

    paste();

    window.location.reload(true);

    }

    }

    window.onload = function () {

    window.addEventListener('storage', reportStorage, false);

    paste();

    }

    function alias() {

    var valor = document.getElementById("C").value;

    localStorage\['aValue'\] = valor;

    alert('Alias: ' + valor);

    }

    function nombre() {

    // Tomamos la referencia del nombre a copiar

    var valor = document.getElementById("B").value;

    localStorage\['sValue'\] = valor;

    alert('Nombre: ' + valor);

    }

    function paste() {

    // Recuperamos el valor del nombre y el alias

    var localValue = localStorage\['sValue'\];

    var localValueAlias = localStorage\['aValue'\];

    // Pegamos el valor del nombre y el alias

    document.getElementById("B").value = localValue;

    document.getElementById("C").value = localValueAlias;

    alert('ACTUALIZADOS en 1');

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p&gt;Nombre&lt;/p&gt;

    &lt;div&gt;

    &lt;input id="B" type="text" value="" /&gt;

    &lt;/div&gt;

    &lt;p&gt;Alias&lt;/p&gt;

    &lt;div&gt;

    &lt;input id="C" type="text" value="" /&gt;

    &lt;/div&gt;

    &lt;hr /&gt;

    &lt;input type="button" onclick="flag1 = 'on'; alias(); nombre();
    flag1 = 'off'" value="Guardar" /&gt;

    &lt;hr /&gt;

    &lt;footer style="width: 230px"&gt;

    &lt;a href="http://www.w3.org/html/logo/"&gt;

    &lt;img
    src="http://www.w3.org/html/logo/badge/html5-badge-h-css3-semantics.png"
    width="165" height="64" alt="HTML5 Powered with CSS3 / Styling, and
    Semantics" title="HTML5 Powered with CSS3 / Styling, and
    Semantics"&gt;

    &lt;/a&gt;

    &lt;br /&gt;

    &lt;a href="http://jigsaw.w3.org/css-validator/check/referer"&gt;

    &lt;img style="border: 0; width: 88px; height: 31px"

    src="http://jigsaw.w3.org/css-validator/images/vcss-blue"

    alt="¡CSS Válido!" /&gt;

    &lt;/a&gt;

    &lt;/footer&gt;

    ©Jaime Peña Tresancos, 2013

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/HTML-5 Storage-Comunicación-entre-ventanas/image3.png)

###La aplicación complementaria (o segunda)


El código correspondiente se muestra en el Listado 3. Lo que contiene y
las acciones que se llevan a cabo son, en resumen:

Una mimetización reducida del diálogo de la primera aplicación.

Con los siguientes elementos funcionalmente significativos:

Una etiqueta identificada como *Nombre* que servirá de contenedor de un
supuesto nombre de usuario.

Una caja de entrada de texto identificada como *Alias* que servirá de
contenedor y entrada de un supuesto alias de dicho usuario.

Un botón de comando etiquetado *Guardar alias* para enviar al *Local
Storage* el valor actual de la caja de entrada de alias.

Se ha codificado una función de seguimiento –escucha- de los eventos del
*Web Storage*, similar al que hemos implementado en la aplicación
anterior –*window.onload()* …-.

Al arranque de la aplicación, también codificado en *window.onload()*
con una llamada a la función *paste()*, se cargarán desde el *Local
Storage* el valor del nombre y el alias previamente almacenados en el
sistema.

Esas cargas darán lugar a dos llamadas a la función de escucha de
eventos del *Web Storage*, antes de emitirse la correspondiente alerta
*JavaScript* programada en la función *paste()*.

Al pulsar el botón *Guardar alias* se llama a las función *alias()* que
guardará el alias que contiene las caja de entrad correspondiente en el
*Local Storage* del sistema.

Cada vez que se produzca una alteración del *Local Storage*, será
llamada la función de escucha y se recargarán los valores de nombre y
alias, por si hubieran sido cambiados.

También se recargará la página para asegurarnos de que se muestran los
valores actualizados convenientemente.

**Listado 3: Código fuente de la aplicación segunda del sistema de
   escucha e intercambio de información.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;localStorage con addEventListener 2&lt;/title&gt;

    &lt;style&gt;

    \#B {

    background-color: lightgray;

    }

    \#C {

    background-color: lightblue;

    }

    &lt;/style&gt;

    &lt;script&gt;

    var flag2 = 'off';

    function reportStorage(evt) {

    alert("El \`Storage\` fue modificado desde: " + evt.url);

    alert("Se ha actualizado: " + evt.key);

    // Actualizamos el valor del alias y del nombre

    if (flag2 == 'off') {

    paste();

    window.location.reload(true);

    }

    }

    window.onload = function () {

    window.addEventListener('storage', reportStorage, false);

    paste();

    }

    function alias() {

    var valor = document.getElementById("C").value;

    localStorage\['aValue'\] = valor;

    alert('Alias: ' + valor);

    }

    function paste() {

    // Recuperamos el valor del alias y el nombre original

    var localValueAlias = localStorage\['aValue'\];

    var localValue = localStorage\['sValue'\];

    // Pegamos el valor del alias y el nombre original

    document.getElementById("C").value = localValueAlias;

    document.getElementById("B").textContent = localValue;

    alert('ACTUALIZADOS en 2');

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;h2&gt;¿Desea cambiar el alias?&lt;/h2&gt;

    &lt;p&gt;Nombre&lt;/p&gt;

    &lt;div&gt;

    &lt;label id="B"&gt;&lt;/label&gt;

    &lt;/div&gt;

    &lt;p&gt;Alias&lt;/p&gt;

    &lt;div&gt;

    &lt;input id="C" type="text" value="" /&gt;

    &lt;/div&gt;

    &lt;hr /&gt;

    &lt;div&gt;

    &lt;input type="button" onclick="flag2 = 'on'; alias(); flag2 =
    'off'" value="Guardar alias" /&gt;

    &lt;/div&gt;

    &lt;hr /&gt;

    &lt;footer style="width: 230px"&gt;

    &lt;a href="http://www.w3.org/html/logo/"&gt;

    &lt;img
    src="http://www.w3.org/html/logo/badge/html5-badge-h-css3-semantics.png"
    width="165" height="64" alt="HTML5 Powered with CSS3 / Styling, and
    Semantics" title="HTML5 Powered with CSS3 / Styling, and
    Semantics"&gt;

    &lt;/a&gt;

    &lt;br /&gt;

    &lt;a href="http://jigsaw.w3.org/css-validator/check/referer"&gt;

    &lt;img style="border: 0; width: 88px; height: 31px"

    src="http://jigsaw.w3.org/css-validator/images/vcss-blue"

    alt="¡CSS Válido!" /&gt;

    &lt;/a&gt;

    &lt;/footer&gt;

    ©Jaime Peña Tresancos, 2013

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/HTML-5 Storage-Comunicación-entre-ventanas/image3.png)

![] (./img/HTML-5 Storage-Comunicación-entre-ventanas/image4.png)

###Conclusiones


En el presente artículo hemos visto cómo implementar un sistema de
escucha de modificaciones en el *Local Storage* y a partir de él cómo
intercambiar información entre aplicaciones que se ejecutan
simultáneamente.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




