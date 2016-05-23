<properties
	pageTitle="[ASP.NET MVC] Inyectando dependencias con Microsoft Unity"
	description="Inyectando dependencias con Microsoft Unity"
	services="web-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="web-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>




#[ASP.NET MVC] Inyectando dependencias con Microsoft Unity

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


>[Descarga el
código](https://github.com/julitogtu/mvc/tree/master/ControllerFactoryDI)

Hola a todos, en el anterior post ([míralo
acá](http://julitogtu.com/2014/01/07/asp-net-mvc-creando-una-factoria-de-controladores/))
vimos cómo podemos crear una factoría de controladores personalizada
para poder instanciar controladores que tienen un constructor que recibe
parámetros, hoy vamos a ver algo muy parecido, solo que en este caso
vamos a utilizar un DI Container (contenedor de inyección de
dependencias).

El ejemplo, básicamente consiste en que vamos a inyectar un objeto que
nos va a permitir escribir en un log, entonces en el controlador
tenemos:

```
    public class HomeController : Controller

    {

    private ILog log;

    public HomeController(ILog log)

    {

    this.log = log;

    }

    public ActionResult Index()

    {

    log.Log("Escribiendo en el log");

    return View();

    }

    }
```

Revisando el anterior código, vemos que **HomeController** requiere un
objeto de tipo **ILog**, es decir que vamos a poder inyectar cualquier
clase que implemente dicha interfaz, recuerden que uno de los principios
de la inyección de dependencias es trabajar contra abstracciones y no
implementaciones.

Ahora vamos con la interfaz **ILog:**

C\#

```
    public interface ILog

    {

    void Log(string str);

    }
```

Y ahora una clase que implementa dicha interfaz (la lógica para el
ejemplo no es importante):

 C\#

```
    public class LogFile : ILog

    {

    public void Log(string str)

    {

    Debug.Write(str);

    }

    }
```

Ahora viene lo interesante, como DI Container vamos a utilizar
[Microsoft Unity](http://unity.codeplex.com/), así que añadimos por
Nuget el paquete Unity.MVC4:


![] (./img/Inyectando-dependencias-con-Microsoft-Unity/image1.png)

La ventaja de añadir dicho paquete es que en la raíz del sitio nos añade
la clase **Bootstrapper** donde vamos a poder registrar los componentes:

    C\#

```
    public static class Bootstrapper

    {

    public static IUnityContainer Initialise()

    {

    var container = BuildUnityContainer();

    DependencyResolver.SetResolver(new
    UnityDependencyResolver(container));

    return container;

    }

    private static IUnityContainer BuildUnityContainer()

    {

    var container = new UnityContainer();

    RegisterTypes(container);

    return container;

    }

    public static void RegisterTypes(IUnityContainer container) {}

    }
```

Ahora es tiempo de registrar nuestras dependencias, para ello hacemos
uso del método **RegisterTypes** de la clase **Bootstrapper**, para ello
usamos **container.RegisterType**:

C\#


```
    public static void RegisterTypes(IUnityContainer container)

    {

    container.RegisterType&lt;ILog, LogFile&gt;();

    }
```

Finalmente solo resta realizar el llamado a nuestro DI Container, en
este caso usamos el evento **Application\_Start** del **Global.asax**:

C\#

```
    protected void Application\_Start()

    {

    AreaRegistration.RegisterAllAreas();

    FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

    RouteConfig.RegisterRoutes(RouteTable.Routes);

    BundleConfig.RegisterBundles(BundleTable.Bundles);

    Bootstrapper.Initialise();

    }
```

Y eso es todo, la dependencia es inyectada gracias al uso del DI
Container.
