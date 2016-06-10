---
title: [ASP.NET MVC] Cargando datos con WebAPI y JSRender
description: Cargando datos con WebAPI y JSRender
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: web-dev
ms.custom: CommunityDocs
---








#[ASP.NET MVC] Cargando datos con WebAPI y JSRender

Por [Julio Cesar Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


Hace algún tiempo, realice algunos post sobre las **Microsoft jQuery
Templates** (míralos acá: [*post
I*](http://julitogtu.wordpress.com/2012/01/25/asp-net-asp-net-y-las-microsoft-jquery-templates-i-introduccin/),
[*post
II*](http://julitogtu.wordpress.com/2012/01/26/asp-net-asp-net-y-las-microsoft-jquery-templates-ii-fuente-de-datos-externa/),
[*post
III*](http://julitogtu.wordpress.com/2012/01/27/asp-net-asp-net-y-las-microsoft-jquery-templates-iii-filtrando-datos/))
y en resumen lo que podíamos realizar era obtener datos de alguna fuente
como puede ser un servicio y mostrarlos en el cliente, todo esto
utilizando JavaScript, lamentablemente ese proyecto se ha quedado atrás…
y ahora tenemos una nueva y muy buena alternativa,
[*JSRender*](http://borismoore.github.com/jsrender/demos/),
[*JSRender*](http://borismoore.github.com/jsrender/demos/) tiene la
misma filosofía de las jQuery Templates pero con mejores
características, así que quiero mostrarles un pequeño ejemplo de como lo
podemos usar en conjunto con [*WebAPI*](http://www.asp.net/web-api)..
como ya sabrán [*WebAPI*](http://www.asp.net/web-api) esta muy de moda y
no des para menos, realmente es muy bueno y me ha gustado bastante, así
que manos a la obra:

### El modelo

Como primera medida vamos a crear una clase Cliente que va a actuar como
el modelo:

C\#


```
    public class Cliente

    {

    public int ClienteId { get; set; }

    public string Nombre { get; set; }

    public string Email { get; set; }

    public bool Activo { get; set; }

    }
```

### El controlador

En este caso vamos a crear un controlador
[*WebAPI*](http://www.asp.net/web-api), recuerden que
[*WebAPI*](http://www.asp.net/web-api) no solo esta disponible para
[*ASP.NET MVC*](http://www.asp.net/mvc), también es posible utilizarla
con [*ASP.NET Web Forms*](http://www.asp.net/web-forms). Añadimos un
nuevo ítem de tipo Web API Controller y como nombre le damos
ClienteController, y allí para este ejemplo solo vamos a tener una
función llamada GetAll la cual retornará todos los clientes existentes.

C\#

```

    public class ClienteController : ApiController

    {

    private readonly List&lt;Cliente&gt; clientes =
    new List&lt;Cliente&gt;()

    {

    new Cliente{ ClienteId = 1, Nombre = "Julio", Email =
    "email1@contoso.com", Activo = true},

    new Cliente{ ClienteId = 2, Nombre = "Juan", Email =
    "email2@contoso.com", Activo = true},

    new Cliente{ ClienteId = 3, Nombre = "Nathalia", Email =
    "email3@contoso.com", Activo = false},

    new Cliente{ ClienteId = 4, Nombre = "Julio", Email =
    "email1@contoso.com", Activo = true},

    new Cliente{ ClienteId = 5, Nombre = "Juan", Email =
    "email2@contoso.com", Activo = true},

    new Cliente{ ClienteId = 6, Nombre = "Nathalia", Email =
    "email3@contoso.com", Activo = false},

    new Cliente{ ClienteId = 7, Nombre = "Julio", Email =
    "email1@contoso.com", Activo = true},

    new Cliente{ ClienteId = 8, Nombre = "Juan", Email =
    "email2@contoso.com", Activo = true},

    new Cliente{ ClienteId = 9, Nombre = "Nathalia", Email =
    "email3@contoso.com", Activo = false}

    };

    public IEnumerable&lt;Cliente&gt; GetAll()

    {

    return clientes;

    }

    }
```

### Configurando WebAPI

Una vez que tenemos listo el controlador, lo que necesitamos hacer es
configurar el ruteo para poder llamar a los métodos del controllador,
así que lo primero que haremos es crear una clase con un método estático
y luego llamarlo en el evento **Application\_Start** de el Global.asax:

C\#

```

    public class RouteConfig

    {

    public static void RegisterRoutes()

    {

    RouteTable.Routes.MapHttpRoute(

    name: "DefaultApi",

    routeTemplate: "api/{controller}/{id}",

    defaults: new { id = RouteParameter.Optional }

    );

    }

    }
```

### Y en el Global.asax:

Script


```
    protected void Application\_Start(object sender, EventArgs e)

    {

    RouteConfig.RegisterRoutes();

    }
```

### Creando el HTML

Una vez que tenemos todo listo, vamos a crear una página para mostrar
los datos:

Script


```
    &lt;div&gt;

    &lt;h1&gt;Listado de clientes&lt;/h1&gt;

    &lt;hr /&gt;

    &lt;table id="tblData"&gt;

    &lt;thead&gt;

    &lt;tr&gt;

    &lt;th&gt;Cliente Id&lt;/th&gt;

    &lt;th&gt;Nombre&lt;/th&gt;

    &lt;th&gt;Email&lt;/th&gt;

    &lt;th&gt;Estado&lt;/th&gt;

    &lt;/tr&gt;

    &lt;/thead&gt;

    &lt;tbody&gt;&lt;/tbody&gt;

    &lt;/table&gt;

    &lt;/div&gt;
```

Para el ejemplo tenemos definida una tabla en la cual mostraremos los
datos.

### Referenciando Scripts

Ahora, vamos a añadir referencias a dos archivos JavaScript, uno será
jQuery y le otro jsrender, sin embargo acá quiero dejar claro que a
diferencia de muchos plugin jsrender NO necesita de jQuery, simplemente
lo he añadido ya que me facilita el acceso al DOM y a eventos del lado
del cliente:

Script


```
    &lt;script src="Scripts/jquery-1.8.2.js"&gt;&lt;/script&gt;

    &lt;script src="Scripts/jsrender.js"&gt;&lt;/script&gt;
```

### Creando la plantilla

Ahora es tiempo de crear la plantilla que usará jsrender para mostrar
los datos:

Script


```
    &lt;script type="text/x-jsrender" id="DataTemplate"&gt;

    &lt;tr&gt;&lt;td&gt;{{:ClienteId}}&lt;/td&gt;&lt;td&gt;{{:Nombre}}&lt;/td&gt;&lt;td&gt;{{:Email}}&lt;/td&gt;&lt;td&gt;{{:Activo}}&lt;/td&gt;&lt;/tr&gt;

    &lt;/script&gt;
```

Lo primero que se debe tener presente es que el tipo del script debe ser
**text/x-jsrender**, y le debemos definir un id para luego poder
referenciarla, el cuerpo de la plantilla simplemente es una pequeña
parte del body de una tabla (recuerdan que en el HTML definimos una
tabla, paso 4), y con la sintaxis: **{{:NOMBRE\_CAMPO}}** es que se
define cual es el dato que se desea mostrar.

### Enlazando datos:

Finalmente, llego la hora de enlazar la plantilla con los datos
proporcionados por [*WebAPI*](http://www.asp.net/web-api), para este
trabajo nos apoyaremos en jQuery y su facilidad para llamar servicios:

Script

```

    &lt;script type="text/javascript"&gt;

    \$(document).on("ready", function () {

    \$.getJSON("/api/cliente",

    function (data) {

    \$("\#tblData tbody").html(\$("\#DataTemplate").render(data));

    });

    })

    &lt;/script&gt;
```

Como el servicio nos devuelve los datos en formato JSON por brevedad se
hace uso de **\$.getJSON**, como primer parámetro le pasamos la URL que
debe llamar, y en segundo lugar la función de callback, en dicha función
lo que hacemos es cargarle un HTML al cuerpo de la tabla, pero como en
este caso es una plantilla lo primero es referenciarla por medio de su
ID y luego le decimos los datos a cargar con **render(data)**.

Ahora si ejecutamos la aplicación tenemos:

![] (./img/Cargando-datos-con-WebAPI/image1.png)

Espero les sea de utilidad, les dejo el código con el ejemplo.

[*Descarga el ejemplo.*](http://sdrv.ms/SE2yRl)


