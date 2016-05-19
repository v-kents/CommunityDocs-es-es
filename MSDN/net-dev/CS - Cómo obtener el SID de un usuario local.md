<properties
	pageTitle="C# - ¿Cómo obtener el SID de un usuario local?"
	description="¿Cómo obtener el SID de un usuario local en C#?"
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


# C\# - ¿Cómo obtener el SID de un usuario local?


![](./img/C# - Cómo obtener el SID de un usuario local/image1.PNG)


Por Juan Carlos Ruiz Pacheco, **Microsoft Technology Evangelist**

  Twitter   | <https://twitter.com/JuanKRuiz>
  ----------| ----------------------------------------
  Facebook  | <https://www.facebook.com/JuanKDev>
  LinkdIn   | <http://www.linkedin.com/in/juankruiz>
  Blog      | <http://juank.io>

Obtener el SID del usuario que se encuentra ejecutando la aplicación es
bastante sencillo:

* Adicionar using a System.Security.Principal

* Instanciar un objeto WindowsIdentity

* Construirlo a partir de WindowsIdentity.GetCurret()

* Usar la propiedad Value


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

Sin embargo tratar de acceder a la información de los usuarios
diferentes del logueado actualmente (y sin usar impersonación) puede ser
un poco más complejo. Una alternativa viable es hacer uso de **WMI**
(Windows Management instrumentation).

* Adicionar la referencia a System.Management y el respectivo using

* A traves de WMI se debe hacer un query al objeto Win32\_UserAccount

* Especificar el nombre del dominio, si es local es el nombre de la
máquina el cual se peude obtener a traves de System.Environment

* Hacer una búsqueda sobre el query

* Usar el indizador accediento con la cadena “SID”

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

Happy Learning!
