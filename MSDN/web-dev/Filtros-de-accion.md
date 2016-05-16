<properties
	pageTitle="Web API V – Filtros de acción"
	description="Ejemplo de Web API"
	services="windows"
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

#[ASP.NET Web API] Web API V – Filtros de acción

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET\
MCT | MCSD | MCTS\
Core Group BDotNet\
[http://julitogtu.com](http://julitogtu.com/)\
[@julito](https://twitter.com/julitogtu)

Hola a todos, de nuevo con otro post de la serie de [ASP.NET Web
API](http://julitogtu.com/category/asp-net-web-api/), esta vez vamos a
revisar cómo podemos crear filtros de acción los cuales nos permiten
ejecutar código antes y después de la ejecución de una acción en
determinado controlador.

Para crear un filtro de acción, se debe crear una clase que herede de
**ActionFilterAttribute**, y sobrescribir las funciones
**OnActionExecuting** (ejecutada antes de la acción del controlador) y/o
**OnActionExecuted** (ejecutada una vez la acción del controlador ha
finalizado).

Para mostrar su uso, la idea es crear un filtro que permita tener un log
de  las ejecuciones de las ejecuciones de las acciones en
PersonController, pero antes de crear el filtro crearemos una clase
singleton que se encargará de hacer el log, así que primero definimos
una sencilla interfaz:

C\#

```
    interface ILogWriter

    {

    void Log(string message);

    }
```
Luego la clase que implementa dicha interfaz:

C\#

```

    public class LogWriter : ILogWriter

    {

    private static readonly Lazy instance = new Lazy(() =&gt; new
    LogWriter());

    private LogWriter() { }

    public static LogWriter Instance

    {

    get

    {

    return instance.Value;

    }

    }

    public void Log(string message)

    {

    Debug.WriteLine(message);

    }

    }
```

Ahora que ya tenemos lista la clase, creamos una clase llamada
**LogFilterAttribute** la cual debe heredar de **ActionFilterAttribute**
y sobrescribimos los métodos nombrados anteriormente:

C\#

```
    public class LogFilterAttribute : ActionFilterAttribute

    {

    public override void
    OnActionExecuting(System.Web.Http.Controllers.HttpActionContext actionContext)

    {

    //Get info using actionContext

    LogWriter.Instance.Log("Executed before at: " +
    System.DateTime.Now);

    }

    public override void
    OnActionExecuted(HttpActionExecutedContext actionExecutedContext)

    {

    //Get info using actionContext

    LogWriter.Instance.Log("Executed after at: " + System.DateTime.Now);

    }

    }
```

En este caso solo enviamos una simple cadena de texto, pero es posible
obtener información del request utilizando el objeto actionContext.

Por último, para que el filtro creado funcione, lo que hacemos es
decorar el controlador Person con el atributo creado:

C\#

```
    \[LogFilter\]

    public class PersonController : ApiController

    {

    ...

    }
```

Espero el post les sea de utilidad, nos vemos en el siguiente artículo
de [Web API](http://julitogtu.com/category/asp-net-web-api/).

¡Saludos!

[Descarga el ejemplo!](http://sdrv.ms/13XqLdW)
