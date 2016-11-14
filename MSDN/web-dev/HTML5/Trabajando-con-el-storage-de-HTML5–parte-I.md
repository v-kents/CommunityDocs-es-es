---
title: Trabajando con el storage de HTML5 parte I
description: Trabajando con el storage de HTML5 parte I
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Trabajando con el storage de HTML5 parte I

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Una de las nuevas características que más me gustan de
[*HTML5*](http://dev.w3.org/html5/spec/single-page.html) es el storage,
pero para hablar de este tema quiero hablar un poco sobre las cookies,
pero no las galletas sino aquellos datos que se podían guardar en una
aplicación Web en el cliente.

Los cookies permiten guardan datos en el cliente, pero tienen algunos
pequeños problemas:

- Su tamaño es muy pequeño (si mal no estoy solo 100k de espacio)
- Se envían al servidor en cada petición que se realiza.
- Su creación y administración utilizando
    [*JavaScript*](http://es.wikipedia.org/wiki/JavaScript) puro es (en
    mi opinión) bastante cansona, claro existe un plugin de
    [*jQuery*](http://jquery.com/) que no hace la vida muy sencilla, y
    lo pueden ver en este
    [*post*](http://julitogtu.wordpress.com/2011/09/19/jquery-administrando-cookies-con-jquery/).

Ya aclarando un poco el tema de las cookies, el storage de
[*HTML5*](http://dev.w3.org/html5/spec/single-page.html) llega con la
idea de resolver estos problemas, y es por eso que ahora se definen dos
nuevos tipos de almacenamiento:

localStorage

    sessionStorage

Estos dos tipos de almacenamiento trabajan prácticamente igual, es decir
las funciones para guardar, recuperar y eliminar son los mismos, la
diferencia radica en que el sessionStorage funciona mientras el usuario
tiene el browser abierto, y el localStorage persiste aun después de
cerrar el explorador. Este tipo de storage tiene en promedio 5 Mb de
almacenamiento, es almacenado en el cliente y es enviado al servidor en
cada postback.

### Almacenando datos:

Para poder almacenar datos utilizamos el método setItem, el cual como
primer argumento define la llave a utilizar (para poderlo recuperar
luego) y el valor:

- window.sessionStorage.setItem('key', 'value');
- window.localStorage.setItem('key', 'value');

### Recuperando datos:

Para poder recuperar datos lo hacemos por medio de la llave establecida:

- window.sessionStorage.getItem('key', 'value');

- window.localStorage.getItem('key', 'value');

### Eliminando datos:

Para eliminar un valor, también lo hacemos por medio de la llave:

- window.sessionStorage.removeItem('key');

- window.localStorage.removeItem('key');

Ahora para verificar que realmente este storage funciona vamos a
escribir el siguiente
[*HTML*](http://dev.w3.org/html5/spec/single-page.html):

HTML

```
    &lt;h1&gt;Storage en HTML5&lt;/h1&gt;
    &lt;hr&gt;
    &lt;br&gt;
    &lt;b&gt;Nombre:&lt;/b&gt;&lt;input type="text" id="txtNombre"&gt;
    &lt;br&gt;
    &lt;b&gt;Email:&lt;/b&gt;&lt;input type="text" id="txtEmail"&gt;
    &lt;br&gt;
    &lt;fieldset&gt;
    &lt;legend&gt;Session Storage&lt;/legend&gt;
    &lt;input type="button" id="btnGuardar" value="Guardar"&gt;
    &lt;input type="button" id="btnObtener" value="Obtener"&gt;
    &lt;input type="button" id="btnEliminarNombre" value="Eliminar nombre"&gt;
    &lt;/fieldset&gt;
    &lt;fieldset&gt;
    &lt;legend&gt;Local Storage&lt;/legend&gt;
    &lt;input type="button" id="btnGuardar2" value="Guardar"&gt;
    &lt;input type="button" id="btnObtener2" value="Obtener"&gt;
    &lt;input type="button" id="btnEliminarNombre2" value="Eliminar nombre"&gt;
    &lt;/fieldset&gt;
```

Simplemente tenemos dos campos de texto, uno para el nombre y el otro
para la dirección de email, además de botones para el sessionStorage y
el localStorage. El código
[*JavaScript*](http://es.wikipedia.org/wiki/JavaScript) sería:

Javascript
```
    \$(document).on("ready", function(){
        2: //SESSION STORAGE
        3: \$("\#btnGuardar").on("click", function(){
        4: var nombre = \$("\#txtNombre").val();
        5: var email = \$("\#txtEmail").val();
        6: window.sessionStorage.setItem("nombre",nombre);
        7: window.sessionStorage.setItem("correo",email);
    })

    \$("\#btnObtener").on("click", function(){
        10: var nombre = window.sessionStorage.getItem("nombre");
        11: var email = window.sessionStorage.getItem("correo");
        12: \$("\#txtNombre").val(nombre);
        13: \$("\#txtEmail").val(email);
    })

    \$("\#btnEliminarNombre").on("click", function(){
        window.sessionStorage.removeItem("nombre");
    })

    //LOCAL STORAGE
    \$("\#btnGuardar2").on("click", function(){
        20: var nombre = \$("\#txtNombre").val();
        21: var email = \$("\#txtEmail").val();
        22: window.localStorage.setItem("nombre",nombre);
        23: window.localStorage.setItem("correo",email);
    })

    \$("\#btnObtener2").on("click", function(){
        26: var nombre = window.localStorage.getItem("nombre");
        27: var email = window.localStorage.getItem("correo");
        28: \$("\#txtNombre").val(nombre);
        29: \$("\#txtEmail").val(email);
    })

    \$("\#btnEliminarNombre2").on("click", function(){
        32: window.localStorage.removeItem("nombre");
    })

    34: })
```
Ahora, para ver que realmente si esta guardando datos voy a utilizar las
herramientas de Chrome (con F12 se muestra) y dentro de Resources esta
la opción de Local Storage y de Session Storage, y allí podremos ver los
datos guardados, como en la siguiente imagen:

![] (./img/Trabajando-con-el-storage-de-HTML5–parte-I/image1.png)

Como se puede observar realmente es muy sencillo, en el próximo post
vamos a revisar como poder almacenar datos el formato
[*JSON*](http://es.wikipedia.org/wiki/JSON), como siempre les dejo el
ejemplo para que lo descarguen:

> [Descargar
ejemplo](https://skydrive.live.com/redir.aspx?cid=3619ca7a3d74929a&resid=3619CA7A3D74929A!660&parid=3619CA7A3D74929A!617)




