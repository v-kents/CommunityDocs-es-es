---
title: ASP.NET MVC Implementando Cache con Azure Cache
description: Implementar fácilmente el Azure Cache
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[ASP.NET MVC] Implementando Cache con Azure Cache

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, hoy quiero mostrarles como es de fácil implementar [Azure
Cache](http://www.windowsazure.com/en-us/documentation/services/cache/)
como proveedor de cache para una aplicación [ASP.NET
MVC](http://julitogtu.com/category/asp-net-mvc/).

Lo primero es crear el servicio de cache en Azure, para ello vamos a
**New -&gt; Data Services -&gt; Cache -&gt; Quick Create** y allí
ingresamos los datos correspondientes:

![] (./img/Implementando-Cache-con-Azure-Cache/image1.png)

Luego seleccionamos Create a new cache y esperamos que finalice la
creación de la cache.

Ahora ya en Visual Studio y en el proyecto de MVC buscamos el paquete
Nuget Azure Cache y lo agregamos:

![] (./img/Implementando-Cache-con-Azure-Cache/image2.png)

Una vez instalado, el paquete agrega las secciones correspondientes en
el web.config, aspi que vamos a dicho archivo, buscamos la sección Azure
Cache session state provider y descomentariamos las siguientes líneas:


```
    &lt;sessionState mode="Custom"
    customProvider="AFCacheSessionStateProvider"&gt;

    &lt;providers&gt;

    &lt;add name="AFCacheSessionStateProvider"

    type="Microsoft.Web.DistributedCache.DistributedCacheSessionStateStoreProvider,
    Microsoft.Web.DistributedCache"

    cacheName="default" dataCacheClientName="default"

    applicationName="AFCacheSessionState"/&gt;

    &lt;/providers&gt;

    &lt;/sessionState&gt;
```
Paso siguiente, en el mismo archivo de configuración, dentro del nodo
**dataCacheClients** en **identifier** le damos el valor del Endpoint,
dicho valor lo pueden consultar en el servicio de Cache en Azure:


```
    &lt;autoDiscover isEnabled="true"
    identifier="democache.cache.windows.net" /&gt;
```


![] (./img/Implementando-Cache-con-Azure-Cache/image3.png)

En el mismo nodo **dataCacheClients**, descomentariamos la parte de
**securityProperties** y en **authorizationInfo** definimos el valor
correspondiente a la Primary Access Key:

```
    &lt;securityProperties mode="Message" sslEnabled="false"&gt;

    &lt;messageSecurity authorizationInfo="YWNzOmh0dHBzOi8vZ....." /&gt;

    &lt;/securityProperties&gt;
```

![] (./img/Implementando-Cache-con-Azure-Cache/image4.png)

Por último solo resta comenzar a utilizar dicho servicio, para lo cual
simplemente debemos ir creando/leyendo objetos de session:

```
    //Añadir Objeto

    Session.Add("key", value);

    //Leer Objeto

    var item = Session\["key"\];
```

Espero les sea de utilidad el post, ¡saludos!




