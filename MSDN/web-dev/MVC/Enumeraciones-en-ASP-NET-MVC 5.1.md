---
title: [ASP.NET MVC] Soporte para enumeraciones en ASP.NET MVC 5.1
description: Enumeraciones en ASP.NET MVC 5.1
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[ASP.NET MVC] Soporte para enumeraciones en ASP.NET MVC 5.1

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

[Descarga el código](https://github.com/julitogtu/mvc/tree/master)

Hola a todos, uno de las características que le hacía falta a [ASP.NET
MVC](http://julitogtu.com/category/asp-net-mvc/) era el soporte nativo
para trabajar con enumeraciones, sin embargo ya en la versión 5.1 (ojo
que todavía es RC) ya se dispone de un helper dedicado para trabajar con
enumeraciones, así que vamos a verlo (Revisa más características en este
[link](http://blogs.msdn.com/b/webdev/archive/2013/12/09/asp-net-and-web-tools-2013-2-preview-for-visual-studio-2013.aspx)).

Lo primero que debes hacer es descargar e instalar el update [Visual
Studio 2013 Update 1
RC](http://www.microsoft.com/en-us/download/confirmation.aspx?id=41204),
una vez instalado creamos un nuevo proyecto y añadimos el paquete
**Microsoft ASP.NET MVC**, como todavía no es oficial asegúrate de
seleccionar **Include Prerelease**:

![] (./img/Enumeraciones-en-ASP/image1.png)

O bien por el Package Manager Console con: Install-Package
Microsoft.AspNet.Mvc -Version 5.1.0-rc1 –Pre

Ahora, vamos a crear una enumeración que va a manejar los tipos de
clientes:

C\#

```
    public enum ClientType

    {

    Free = 0,

    VIP = 1,

    Gold = 2,

    Platinum = 3

    }
```

Y un modelo:

C\#


```
    public class Client

    {

    public int ClientId { get; set; }

    public string Name { get; set; }

    public ClientType { get; set; }

    }
```

Ahora creamos un controlador, para el ejemplo solo voy a crear las
acciones para crear (no te fijes si crea o no, porque no lo hace):

C\#


```
    public class ClientController : Controller

    {

    // GET: /Client/Create

    public ActionResult Create()

    {

    return View();

    }

    // POST: /Client/Create

    \[HttpPost\]

    public ActionResult Create(Client client)

    {

    ViewBag.type = client.ClientType;

    return View();

    }

    }
```

Y finalmente la vista:

C\#

```
    @model Enums.Models.Client

    @{

    ViewBag.Title = "Create";

    }

    &lt;h2&gt;Create&lt;/h2&gt;

    @using (Html.BeginForm())

    {

    @Html.AntiForgeryToken()

    &lt;div class="form-horizontal"&gt;

    &lt;h4&gt;Client&lt;/h4&gt;

    &lt;hr /&gt;

    @Html.ValidationSummary(true)

    &lt;div class="form-group"&gt;

    @Html.LabelFor(model =&gt; model.Name, new { @class = "control-label
    col-md-2" })

    &lt;div class="col-md-10"&gt;

    @Html.EditorFor(model =&gt; model.Name)

    @Html.ValidationMessageFor(model =&gt; model.Name)

    &lt;/div&gt;

    &lt;/div&gt;

    &lt;div class="form-group"&gt;

    @Html.LabelFor(model =&gt; model.ClientType, new { @class =
    "control-label col-md-2" })

    &lt;div class="col-md-10"&gt;

    @Html.EnumDropDownListFor(model =&gt; model.ClientType)

    @Html.ValidationMessageFor(model =&gt; model.ClientType)

    &lt;/div&gt;

    &lt;/div&gt;

    &lt;div class="form-group"&gt;

    &lt;div class="col-md-offset-2 col-md-10"&gt;

    &lt;input type="submit" value="Create" class="btn btn-default" /&gt;

    &lt;/div&gt;

    &lt;/div&gt;

    &lt;/div&gt;

    }
```

Ahora al probar la aplicación, se genera correctamente una lista con las
opciones de la enumeración:

![] (./img/Enumeraciones-en-ASP/image2.png)

Y si damos clic en Create y revisamos lo que pasa en la acción Create,
observamos que el valor seleccionado se mapea correctamente con la
propiedad del modelo:

![] (./img/Enumeraciones-en-ASP/image3.png)

Espero el post les sea interesante, ¡saludos!




