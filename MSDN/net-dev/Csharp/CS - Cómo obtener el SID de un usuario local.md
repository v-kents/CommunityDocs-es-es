---
title: C# - ¿Cómo obtener el SID de un usuario local?
description: ¿Cómo obtener el SID de un usuario local en C#?
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: net-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

# C# - ¿Cómo obtener el SID de un usuario local?

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
> [C# - Cómo obtener el SID de un usuario local?](https://juank.io/c-como-obtener-sid-usuario-local/)



Obtener el SID del usuario que se encuentra ejecutando la aplicación es
bastante sencillo:

* Adicionar using a System.Security.Principal
* Instanciar un objeto WindowsIdentity
* Construirlo a partir de WindowsIdentity.GetCurret()
* Usar la propiedad Value

```csharp
    using System;
    using System.Security.Principal;

    class Program
    {
        static void Main(string[] args)
        {
	        WindowsIdentity currentUser = WindowsIdentity.GetCurrent();
	        Console.WriteLine(currentUser.User.Value);
	        Console.ReadLine();
        }
    }
```    

Sin embargo tratar de acceder a la información de los usuarios
diferentes del logueado actualmente (y sin usar impersonación) puede ser
un poco más complejo. Una alternativa viable es hacer uso de **WMI**
(Windows Management instrumentation).

* Adicionar la referencia a System.Management y el respectivo using
* A traves de WMI se debe hacer un query al objeto Win32\_UserAccount
* Especificar el nombre del dominio, si es local es el nombre de la máquina el cual se peude obtener a traves de System.Environment
* Hacer una búsqueda sobre el query
* Usar el indizador accediento con la cadena “SID”

```csharp
    using System;
    using System.Management;

    class Program
    {
        static void Main(string[] args)
        {
        SelectQuery sQuery = new SelectQuery("Win32_UserAccount",
        "Domain='" + System.Environment.MachineName + "'");
        ManagementObjectSearcher mSearcher = new
        ManagementObjectSearcher(sQuery);
        Console.WriteLine("User Accounts");
        Console.WriteLine("");
        foreach (ManagementObject mObject in mSearcher.Get())
            Console.WriteLine(mObject["SID"]);
        Console.ReadLine();
        }

    }
```

Happy Learning!




