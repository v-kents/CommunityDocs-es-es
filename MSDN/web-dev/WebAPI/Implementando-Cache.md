---
redirect_url: https://docs.microsoft.com/
title: Web API VI – Implementando Caché
description: Ejemplo de Web API
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[ASP.NET Web API] Web API VI – Implementando Caché

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, vuelvo con otro post sobre [Web
API](http://julitogtu.com/asp-net-web-api/), en esta ocasión quiero
mostros como podemos implementar un sencillo sistema de caché para
reducir las peticiones que se realizan a nuestro servicio y así poder
mejorar el rendimiento del mismo, para el ejemplo implementaremos dicho
sistema en la acción que retorna todo el listado de personas, recordando
tenemos algo como:

C\#

```

    public IEnumerable&lt;Person&gt; GetPerson()

    {

    var data = db.Person.AsEnumerable();

    return data;

    }
```

La acción anterior simplemente consulta la fuente de datos y los
retorna, sin embargo este tipo de comportamientos puede traernos
problemas futuros ya que constantemente se está consultando la fuente de
datos para traer todos los registros existentes y si dicha fuente de
datos es una base de datos se debe tener presente el abrir y cerrar
conexiones, el delay entre que se lanza el query y el momento en que el
servidor de base de datos responde… ¿ya vemos por donde va todo no?

Pensando en el problema anterior, una solución es implementar un sistema
de caché para reducir las peticiones a la base de datos y en algunos
casos (como este) también disminuir los request al servicio. Lo primero
es añadir un nuevo botón que realice la petición a la acción GetPerson()
para ver su comportamiento:


```
    &lt;input type="button" id="btnGetAll" value="Get all"
    data-bind="click:getAll" /&gt;
```

Ahora probamos de nuevo la aplicación y para ver el comportamiento damos
clic varias veces en el botón creado anteriormente, con ayuda de firebug
revisemos las peticiones:

![img1] (./img/Implementando-Cache/image1.png)

Y el detalle de alguna de ellas:

![img2] (./img/Implementando-Cache/image2.png)

Resumiendo la prueba, cada vez que damos clic en el botón se realiza una
nueva llamada al servicio, y como se aprecia en el detalle de la
petición, en el Header de la respuesta el **Cache-Control** tiene el
valor **no-cache**, que como adivinan indica que no se está manejando.

Para aplicar caché, vamos a hacerle un refactoring a la acción
GetPerson() teniendo en cuenta los siguientes puntos:

Se retornará HttpResponseMessage en lugar de IEnumerable&lt;Person&gt;.

Se definirá la caché en el header de la respuesta.

Con los dos puntos anteriores en mente, ahora la acción GetPerson()
quedaría:

C\#

```
    public HttpResponseMessage GetPerson()

    {

    var data = db.Person.AsEnumerable();

    var httpResponseMessage =
    Request.CreateResponse&lt;IEnumerable&lt;Person&gt;&gt;(HttpStatusCode.OK,
    data);

    httpResponseMessage.Headers.CacheControl =
    new CacheControlHeaderValue()

    {

    MaxAge = TimeSpan.FromMinutes(1)

    };

    return httpResponseMessage;

    }
```

Lo primero es obtener los datos, luego se crea el objeto
**HttpResponseMessage**, se define el tipo de dato que se retornará, en
este caso un IEnumerable&lt;Person&gt;, el código de la respuesta es 200
(HttpStatusCode.OK) y los datos; y ahora para especificar el uso y
tiempo de vida de la cache, modificamos el valor de la propiedad
**CacheControl** del header y definimos que su tiempo de vida será de 1
minuto.

Si ahora repetimos la prueba realizada, y damos clic varias veces
seguidas en el botón para obtener todos los datos, visualizamos que ya
no se realizan tantas peticiones como clics,  ya que la caché usada
guarda los datos en JSON en el cliente y los utiliza cada vez que
hacemos clic, claro que una vez se complete 1 minuto, la siguiente
petición SI se realizará normalmente y se volverá a cachear la
respuesta, y para que no quede duda, revisemos de nuevo la información
de la petición y su respuesta con firebug, la propiedad
**Cache-Control** ahora tiene el valor **max-age=60**, es decir que usa
caché con un duración de 60 segundos.

![img3] (./img/Implementando-Cache/image3.png)

Espero e post les haya gustado, nos vemos.

¡Saludos!

[Descarga el ejemplo!](http://sdrv.ms/1c1HoFS)




