---
title: Web API VII – Message Handlers
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

#[ASP.NET Web API] Web API VII – Message Handlers

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET
MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, luego una pequeña ausencia, retomo el blog con un nuevo
artículo sobre [Web API](http://julitogtu.com/asp-net-web-api/), en este
caso tratando el tema de los [Message
Handlers](http://www.asp.net/web-api/overview/working-with-http/http-message-handlers),
un Message Handler se ejecuta antes que cualquier action filter además
que son ejecutados para todos las acciones de los controladores, por lo
anterior, un Message Handler es ideal para tener lógica centralizada que
se deba ejecutar en cada request.

Como parte informativa, el primer Message Handler que se ejecuta es el
HttpServer, y luego si se ejecutarán los que nosotros definamos.

Para crear un Message Handler personalizado, se debe crear una clase que
herede de **DelegatingHandler** y sobrescribir el método **SendAsync**,
generalmente los Message Handler son utilizados para temas como
autenticación y autorización.

En nuestro caso, vamos a implementar un Message Handler que valide el
dominio desde el cual están realizando la petición, para autorizarla o
no, lo primero es crear una nueva clase a la que llamaremos
ValidationHandler y como ya se comentó dicha clase heredara de
DelegatingHandler:

C\#

```
    public class ValidationHandler : DelegatingHandler

    {

    protected override async Task SendAsync(HttpRequestMessage request,
    CancellationToken cancellationToken)

    {

    var domain = "localhost";

    if (!string.Equals(request.RequestUri.Host,
    domain, StringComparison.OrdinalIgnoreCase))

    return request.CreateResponse(HttpStatusCode.Unauthorized);

    var response = await base.SendAsync(request, cancellationToken);

    return response;

    }

    }
```

Allí, accedemos al valor del host que realiza la petición por medio del
objeto request que es del tipo HttpRequestMessage, en caso que el host
no sea válido se crea al vuelo la respuesta a la petición y se retorna
un código 401 que indica no autorizado (HttpStatusCode.Unauthorized).

Finalmente para que el Message Handler entre en ejecución, se debe
relacionar en el **Application\_Start**, y recuerden que tenemos una
clase llamada WebApiConfig donde se tiene configurado el routing para
Web API, por lo tanto es un buen lugar para relacionarlo, recuerda tener
presente el orden en que se añaden, ya que en ese mismo orden serán
ejecutados:

C\#

```
    public static void Register(HttpConfiguration config)

    {

    ...

    config.MessageHandlers.Add(new ValidationHandler());

    }

<!-- -->
```

![img1] (./img/Message-Handlers/image1.png)

Espero les haya gustado el post, ya nos seguiremos viendo por acá con
otras entregas sobre [Web API](http://julitogtu.com/asp-net-web-api/).

[Descarga el ejemplo!](http://sdrv.ms/1eLmJEF)




