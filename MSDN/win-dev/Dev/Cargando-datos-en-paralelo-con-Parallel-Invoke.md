<properties
	pageTitle="Cargando datos en paralelo con Parallel.Invoke"
	description="Cargando datos en paralelo con Parallel.Invoke"
	services="win-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="win-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>


#Cargando datos en paralelo con Parallel.Invoke

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


Hola, hoy quiero mostrarles una forma en la cual podemos realizar tareas
en paralelo de una manera muy sencilla, aclaro que no es la única forma,
sin embargo me gusta bastante usar
[*Parallel.Invoke*](http://msdn.microsoft.com/es-ar/library/system.threading.tasks.parallel.invoke.aspx)
por su facilidad de uso, sin embargo debemos tener algunos puntos
pendientes:

- Los métodos que se llaman no pueden recibir parámetros

        No se garantiza un orden específico en la ejecución de los métodos

Pueden consultar la documentación oficial en MSDN:
[*Parallel.Invoke*](http://msdn.microsoft.com/es-ar/library/system.threading.tasks.parallel.invoke.aspx)

Pero veamos un ejemplo, suponemos que tenemos una página en la cual
queremos mostrar en un control gridview las personas y en otro grid los
productos de una base de datos, si lo miramos tradicionalmente primero
se ejecutara un método y después el otro, es decir de manera secuencial,
en ese caso vamos a declarar dos métodos que van a cargar los datos en
los gridview:

>C\#

```
    private void CargarPersonas()

    {

    grvPersonas.DataSource = BDManager.getInstance.ObtenerPersonas();

    grvPersonas.DataBind();

    }

    private void CargarProductos()

    {

    grvProductos.DataSource = BDManager.getInstance.ObtenerProductos();

    grvProductos.DataBind();

    }
```

En ambos métodos, se hace un llamado a la clase **BDManager** la cual
tiene los métodos para conectarnos a la base de datos, el código de
dicha clase es:

>C\#


```
    using System;

    using System.Collections.Generic;

    using System.Linq;

    namespace ParallelInvoke

    {

    public class BDManager

    {

    private static volatile BDManager \_uniqueInstance;

    private static readonly Object syncRoot = new Object();

    private BDManager() { }

    public static BDManager getInstance

    {

    get

    {

    if (\_uniqueInstance == null)

    {

    lock (syncRoot)

    {

    if (\_uniqueInstance == null)

    \_uniqueInstance = new BDManager();

    }

    }

    return \_uniqueInstance;

    }

    }

    public IEnumerable&lt;Person&gt; ObtenerPersonas()

    {

    using (var context = new AdventureWorks2008R2Entities())

    {

    return context.People.ToList();

    }

    }

    public IEnumerable&lt;Product&gt; ObtenerProductos()

    {

    using (var context = new AdventureWorks2008R2Entities())

    {

    return context.Products.ToList();

    }

    }

    }

    }
```

Lo único raro de la clase es que estamos usando un Singleton para crear
solo una única instancia de la clase, en el siguiente post lo veremos
más en detalle, pero volviendo al tema principal, para cargar los datos
de la manera tradicional lo que podemos tener es:

>C\#


```
    private void CargarDatos1()

    {

    CargarPersonas();

    CargarProductos();

    }
```

Y como comente antes se ejecutará unos tras el otro, ahora si
quisiéramos usar
[*Parallel.Invoke*](http://msdn.microsoft.com/es-ar/library/system.threading.tasks.parallel.invoke.aspx)
sería:

>C\#

```

    private void CargarDatos2()

    {

    Parallel.Invoke(new Action\[\]{CargarPersonas, CargarProductos});

    }
```

Como podemos observar el cambio es bastante sencillo, y finalmente si
usamos el
[*IntelliTrace*](http://msdn.microsoft.com/en-us/library/dd264915.aspx)
de Visual Studio nos daremos cuenta que el hilo de cada método es
diferente:

![] (./img/Cargando-datos-en-paralelo-con-Parallel-Invoke/image1.png)

Espero les sea de utilidad y de interés este post, saludos.
