---
title: [ASP.NET Web API] Personalizando la serialización de los objetos en JSON
description: Serialización de los objetos en JSON
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: web-dev
ms.custom: CommunityDocs
---








#[ASP.NET Web API] Personalizando la serialización de los objetos en JSON


Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

[Descarga el código](https://github.com/julitogtu/WebApi/tree/examples)

Hola a todos, en algunas ocasiones cuando exponemos nuestras entidades a
través de algún servicio (para este caso REST), la respuesta que
entregamos al cliente tiene en algunas ocasiones toda la información de
la entidad y/o los nombres por defecto de los atributos, sin embargo en
algunas casos necesitamos realizar la personalización de 1. Los nombres
de los atributos y 2. La cantidad de atributos que van a entregarse en
la respuesta.

Para solucionar los dos casos anteriores, tenemos varias opciones, como
utilizar DTO’s (luego lo veremos con
[AutoMapper](http://automapper.org/)) y lo otra es personalizar dicha
serialización decorando las propiedades de la entidad con algunos
atributos.

Para iniciar, tenemos el siguiente modelo:

C\#


```
    public class Client

    {

    public int ClientId { get; set; }

    public string Name { get; set; }

    public string LastName { get; set; }

    public string City { get; set; }

    public string Password { get; set; }

    }
```

Ahora un controlador bien sencillo:


```
    public class ClientController : ApiController

    {

    private readonly List&lt;Client&gt; clients = new
    List&lt;Client&gt;(){

    new Client(){ ClientId = 1, Name = "Julio", LastName = "Avellaneda",
    City = "Bogotá", Password = "123456"},

    new Client(){ ClientId = 1, Name = "Juan", LastName = "Ruiz", City =
    "Bogotá", Password = "123456"}

    };

    public IEnumerable&lt;Client&gt; GetClients()

    {

    return clients;

    }

    }
```

Si entonces ejecutamos y probamos (en este caso usemos
[fiddler](http://fiddler2.com/)):

![] (./img/Serializacion-de-objetos-en-JSON/image1.png)


Vemos que la respuesta tiene todos los campos de la entidad y que los
nombres de cada propiedad están tal cual en nuestra entidad, para
cambiar ese comportamiento vamos a usar dos atributos:

JsonProperty: Permite personalizar el nombre al serializar el atributo.

JsonIgnore: Especifíca que un atributo no debe ser serializado.

Aplicando los dos atributos anteriores sobre la entidad tenemos:

C\#


```
   public class Client

    {

    \[JsonProperty(PropertyName="Id")\]

    public int ClientId { get; set; }

    \[JsonProperty(PropertyName = "Nombre")\]

    public string Name { get; set; }

    \[JsonProperty(PropertyName = "Apellido")\]

    public string LastName { get; set; }

    \[JsonProperty(PropertyName = "Ciudad")\]

    public string City { get; set; }

    \[JsonIgnore\]

    public string Password { get; set; }

    }
```

Y si volvemos a probar:

![] (./img/Serializacion-de-objetos-en-JSON/image2.png)


Y listo, ¡nos vemos en otro post amigos!


