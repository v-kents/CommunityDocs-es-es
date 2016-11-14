---
title: [ASP.NET MVC] Creando una factoría de controladores personalizada
description: Creando una factoría de controladores personalizada
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[ASP.NET MVC] Creando una factoría de controladores personalizada

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


> [Descarga el
código](https://github.com/julitogtu/mvc/tree/master/ControllerFactory)

Hola a todos, como ya sabemos, un controlador en [ASP.NET
MVC](http://julitogtu.com/category/asp-net-mvc/) no es más que una
clase, la cual hereda de la clase Controller, sin embargo dicha clase no
tiene un constructor definido, o bueno no al menos uno que podamos ver,
dicho esto cuando una clase no tiene un constructor definido (o varios)
por defecto si se tiene un constructor para esa clase que no recibe
parámetros, ahora bien, en MVC tenemos algo que se conoce como factoría
de controladores, cuya principal función es inicializar los
controladores usando ese constructor vacío que todos tienen…y de que va
todo esto? simple, que pasa cuando tenemos un controlador pero este
requiere un constructor personalizado? Por ejemplo, si tenemos el
siguiente controlador con un constructor personalizado:

C\#

```
    public class HomeController : Controller

    {

    private string username = string.Empty;

    public HomeController(string username)

    {

    this.username = username;

    }

    }
```

Ahora si intentamos ejecutar, vamos a obtener el siguiente error:

![] (./img/Creando-una-factoria-de-controladores-personalizada/image1.png)

El error anterior se da porque el controlador no tiene un constructor
sin parámetros por lo tanto no es posible inicializarlo. Pero ¿y el
constructor vacío que tienen todas las clases? Bueno, pues resulta que
eso solo aplica cuando no se ha definido ningún constructor en la clase,
y como nuestro controlador le definimos uno el otro ahora si desaparece.

Debido al problema anterior, necesitamos definir una nueva forma de
inicializar el controlador HomeController y pasarle el parámetro que
requiere, y para ello podemos crear una factoría personalizada,
básicamente debemos crear una nueva clase que implemente la interfaz
**IControllerFactory**, y en la función **CreateController** definimos
como inicializar el controlador anterior.

Por organización vamos a crear una nueva carpeta llamada Factory, y allí
dentro una nueva clase con el nombre **CustomControllerFactory** que
implementa **IControllerFactory**:

C\#

```
    public class CustomControllerFactory : IControllerFactory

    {

    public IController CreateController(RequestContext,
    string controllerName)

    {

    // TODO: Implement this method

    throw new NotImplementedException();

    }

    public SessionStateBehavior
    GetControllerSessionBehavior(RequestContext requestContext,
    string controllerName)

    {

    // TODO: Implement this method

    throw new NotImplementedException();

    }

    public void ReleaseController(IController controller)

    {

    // TODO: Implement this method

    throw new NotImplementedException();

    }

    }
```

Ya con la clase creada, vamos a iniciar a definir lógica para cada
método, iniciemos con **ReleaseController**, cuya función es liberar
recursos:

C\#


```
    public void ReleaseController(IController controller)

    {

    var disposable = controller as IDisposable;

    if (disposable != null)

    disposable.Dispose();

    }
```

Luego vamos con **GetControllerSessionBehavior**, por el momento vamos a
dejar el comportamiento por defecto:

 C\#


```
    public SessionStateBehavior
    GetControllerSessionBehavior(RequestContext requestContext,
    string controllerName)

    {

    return SessionStateBehavior.Default;

    }
```

Y finalmente **CreateController**, donde vamos a especificar la nueva
forma de instanciar el controlador que hemos modificado anteriormente:

C\#


```
    public IController CreateController(RequestContext,
    string controllerName)

    {

    if (controllerName.ToLower() == "home")

    {

    var controller = new HomeController("julitogtu");

    return controller;

    }

    var defaultFactory = new DefaultControllerFactory();

    return defaultFactory.CreateController(requestContext,
    controllerName);

    }
```

Lo que hace el código anterior es validar si el controlador que se está
requiriendo en Home, en caso afirmativo lo instanciamos usando el
constructor que hemos creado, en caso que no sea el controlador Home,
entonces dejamos que la factoría por defecto haga su trabajo. Ahora el
código completo de nuestra factoría:

C\#


```
    public class CustomControllerFactory : IControllerFactory

    {

    public IController CreateController(RequestContext requestContext,
    string controllerName)

    {

    if (controllerName.ToLower() == "home")

    {

    var controller = new HomeController("julitogtu");

    return controller;

    }

    var defaultFactory = new DefaultControllerFactory();

    return defaultFactory.CreateController(requestContext,
    controllerName);

    }

    public SessionStateBehavior
    GetControllerSessionBehavior(RequestContext requestContext,
    string controllerName)

    {

    return SessionStateBehavior.Default;

    }

    public void ReleaseController(IController controller)

    {

    var disposable = controller as IDisposable;

    if (disposable != null)

    disposable.Dispose();

    }

    }
```

Finalmente, para que la factoría funcione, la llamamos en el evento
**Application\_Start** del **Global.asax**:

C\#


```
    ControllerBuilder.Current.SetControllerFactory(new CustomControllerFactory());
```

Espero el ejemplo les sea interesante, ¡saludos!




