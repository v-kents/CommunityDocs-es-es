
<properties
	pageTitle="C# - Cómo encontrar los archivos pst de outlook"
	description="Cómo encontrar los archivos pst de outlook en C#"
	services="net-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="net-dev"
	ms.workload="CS"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/17/2016"
	ms.author="andygonusa"/>


# C\# - ¿Cómo encontrar los archivos pst de Outlook?

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io


>**Recuerda que** <br/>
>Puedes ver el artículo original en: 
> [C# - Cómo encontrar los archivos pst de outlook?](https://juank.io/c-como-encontrar-archivos-pst-outlook/)


Con ayuda de las facilidades de interoperabilidad que ofrece .Net
Framework y desde luego con ayuda de Visual Studio este proceso es
bastante sencillo.

El primer paso es desde luego agregar una referencia al Outlook para que
Visual Studio nos importe el componente y esto nos permita acceder al
objeto COM como lo haríamos normalmente con cualquiero otra librería
para usar con el framework.

El componente COM a que debemos acceder es (o equivalente de acuerdo a
la versión de office instalada):

![](img/CS - Cómo encontrar los archivos pst de outlook/image2.png)
    

Como buena práctica resulta importante colocarle un alias al namespace,
por ejemplo:

```csharp
    using Outlook = Microsoft.Office.Interop.Outlook;
```

Los pasos que se deben realizar son:

Instanciar un objeto de la aplicación (outlook)

* Obtener los stores (almacenamientos de datos) para la sesión actual

* Verificar que exista un FilePath, esto es necesario puesto que si el
    store esta en exchange el FilePath es nulo.

* Verificar que el FilePath termine en “.pst”, pues algunos stores de
    caché tienen extensiones diferentes.

* El resto es maquillaje

 ```csharp
    using System;
    using System.Text;
    using Outlook = Microsoft.Office.Interop.Outlook;
    
    class Program { static void Main(string[] args)
       { 
        StringBuilder sb = new StringBuilder();
        Outlook._Application outlookObj = new Outlook.Application();
        foreach (Outlook.Store store in outlookObj.Session.Stores)
        if (store.FilePath != null && store.FilePath.EndsWith(".pst"))
        sb.AppendLine(store.FilePath);
        Console.WriteLine(sb.ToString());
        Console.ReadLine();
        }
    }
```

Happy Learning!
