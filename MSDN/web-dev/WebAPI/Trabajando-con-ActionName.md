---
title: Web API VIII – Trabajando con ActionName
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

#[ASP.NET Web API] Web API VIII – Trabajando con ActionName

Por Julio Cesar Avellaneda

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

http://julitogtu.com

@julito

Hola a todos, volviendo con la serie sobre ASP.NET Web API, en esta
oportunidad quiero mostrarles cómo podemos personalizar el nombre de las
acciones y además poder tener dos o más métodos que trabajen con el
mismo verbo HTTP y una misma firma.

Para personalizar el nombre de las acciones, es necesario decorar cada
acción con el atributo **ActionName** y especificar el nombre que
deseamos utilizar:


```
\[ActionName("nombre\_de\_la\_acción")\]
```

Para nuestro ejemplo vamos a crear una nueva acción con el nombre
GetPersonByOtherId(Int32 id), dicha acción obedece al verbo Http Get y
tiene la misma firma que la acción GetPerson, adicionalmente decoramos
las acciones con el atributo ActionName y le asignamos un nombre (si en
este caso la lógica de cada acción es la misma):

C\#


```
    \[ActionName("getbyid")\]

    public Person GetPerson(Int32 id)

    {

    Person = db.Person.Find(id);

    if (person == null)

    {

    throw new
    HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));

    }

    return person;

    }

    \[ActionName("getbyotherid")\]

    public Person GetPersonByOtherId(Int32 id)

    {

    Person = db.Person.Find(id);

    if (person == null)

    {

    throw new
    HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));

    }

    return person;

    }
```

Adicionalmente agregamos un nuevo elemento en nuestro HTML:

C\#
```
    &lt;input id="btnSearch2" type="button" value="Search by Other Id"
    data-bind="click:getPersonByOtherId" /&gt;
```
Ahora modificamos el ViewModel y agregamos la función getPersonById, así
como en la función getPersonById hacemos un pequeño cambio a la url que
se está llamando, en este caso agregando el nombre de la acción:

C\#



...
```
    self.getPersonById= function () {

    var url = '/api/person/getbyid/' + self.id();

    \$.getJSON(url)

    .done(function (data) {

    self.name(data.Name);

    self.lastname(data.LastName);

    self.twitter(data.Twitter);

    })

    .fail(function (erro) {

    self.clearForm();

    });

    },

    self.getPersonByOtherId = function () {

    var url = '/api/person/getbyotherid/' + self.id();

    \$.getJSON(url)

    .done(function (data) {

    self.name(data.Name);

    self.lastname(data.LastName);

    self.twitter(data.Twitter);

    })

    .fail(function (erro) {

    self.clearForm();

    });

    },
```
    ...

Luego es necesario agregar una nueva ruta en la tabla de routing, en
este caso en la clase **WebApiConfig**:

C\#

```

    config.Routes.MapHttpRoute(

    name: "ApiByOtherId",

    routeTemplate: "api/{controller}/{action}/{id}",

    defaults: new { id = RouteParameter.Optional }

    );
```

Y ahora si ejecutamos y probamos podemos ver como en efecto los
ActionName funcionan correctamente:

![img1] (./img/Trabajando-con-ActionName/image1.png)

Espero el post les haya gustado, hasta el próximo.

[Descarga el ejemplo!](http://sdrv.ms/1ddFWSQ)




