---
title: Generando páginas de ayuda y documentación
description: Generando páginas de ayuda y documentación
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[ASP.NET Web API] Generando páginas de ayuda y documentación


Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

>[Descarga el código](https://github.com/julitogtu/WebApi/tree/examples)

 

Hola a todos, un tema importante al crear nuestros servicios es
documentarlos, y esta es una tarea bastante tediosa, sin embargo y para
fortuna de muchos (me incluyo) [ASP.NET Web
API](http://julitogtu.com/asp-net-web-api/) nos ayuda en esta labor
generando una página de ayuda y una documentación con tan solo modificar
un par de cosillas al proyecto.

Nota: El demo ha sido realizado con Visual Studio 2013, si tienen Visual
Studio 2012 deben agregar el paquete
[Microsoft.AspNet.WebApi.HelpPage](http://www.nuget.org/packages/microsoft.aspnet.webapi.helppage)

Iniciemos, creamos una nueva aplicación ASP.NET Web Application y luego
seleccionamos la plantilla Web API:

![] (./img/Generando-paginas-de-ayuda-y-documentacion/image1.png)

Ahora creamos un nuevo modelo:

C\#

```

    public class Client

    {

    \[JsonProperty(PropertyName = "Id")\]

    public int ClientId { get; set; }

    \[JsonProperty(PropertyName = "Nombre")\]

    public string Name { get; set; }

    \[JsonProperty(PropertyName = "Apellido")\]

    public string LastName { get; set; }

    \[JsonProperty(PropertyName = "Ciudad")\]

    public string City { get; set; }

    \[JsonIgnore\]

    public string Password { get; set; }

    }
```

Luego añadimos un controlador, en este caso con el nombre
ClientController, lo importante es añadir la información a cada método,
ya que dicha información será utilizada para la documentación de cada
acción:

C\#

```

    public class ClientController : ApiController

    {

    private AppContext db = new AppContext();

    /// &lt;summary&gt;

    /// Get all clients

    /// &lt;/summary&gt;

    /// &lt;returns&gt;List of clients&lt;/returns&gt;

    public IQueryable&lt;Client&gt; GetClients()

    {

    return db.Clients;

    }

    /// &lt;summary&gt;

    /// Get a client by Id

    /// &lt;/summary&gt;

    /// &lt;param name="id"&gt;Client id&lt;/param&gt;

    /// &lt;returns&gt;One Client&lt;/returns&gt;

    \[ResponseType(typeof(Client))\]

    public IHttpActionResult GetClient(int id)

    {

    Client = db.Clients.Find(id);

    if (client == null)

    {

    return NotFound();

    }

    return Ok(client);

    }

    /// &lt;summary&gt;

    /// Update a Client

    /// &lt;/summary&gt;

    /// &lt;param name="id"&gt;Client id&lt;/param&gt;

    /// &lt;param name="client"&gt;Client to be updated&lt;/param&gt;

    /// &lt;returns&gt;&gt;Operation result&lt;/returns&gt;

    public IHttpActionResult PutClient(int id, Client client)

    {

    if (!ModelState.IsValid)

    {

    return BadRequest(ModelState);

    }

    if (id != client.ClientId)

    {

    return BadRequest();

    }

    db.Entry(client).State = EntityState.Modified;

    try

    {

    db.SaveChanges();

    }

    catch (DbUpdateConcurrencyException)

    {

    if (!ClientExists(id))

    {

    return NotFound();

    }

    else

    {

    throw;

    }

    }

    return StatusCode(HttpStatusCode.NoContent);

    }

    /// &lt;summary&gt;

    /// Create a new Client

    /// &lt;/summary&gt;

    /// &lt;param name="client"&gt;Object Client&lt;/param&gt;

    /// &lt;returns&gt;Operation result&lt;/returns&gt;

    \[ResponseType(typeof(Client))\]

    public IHttpActionResult PostClient(Client client)

    {

    if (!ModelState.IsValid)

    {

    return BadRequest(ModelState);

    }

    db.Clients.Add(client);

    db.SaveChanges();

    return CreatedAtRoute("DefaultApi", new { id = client.ClientId },
    client);

    }

    /// &lt;summary&gt;

    /// Delete a client by id

    /// &lt;/summary&gt;

    /// &lt;param name="id"&gt;Client id&lt;/param&gt;

    /// &lt;returns&gt;Operation result&lt;/returns&gt;

    \[ResponseType(typeof(Client))\]

    public IHttpActionResult DeleteClient(int id)

    {

    Client = db.Clients.Find(id);

    if (client == null)

    {

    return NotFound();

    }

    db.Clients.Remove(client);

    db.SaveChanges();

    return Ok(client);

    }

    protected override void Dispose(bool disposing)

    {

    if (disposing)

    {

    db.Dispose();

    }

    base.Dispose(disposing);

    }

    private bool ClientExists(int id)

    {

    return db.Clients.Count(e =&gt; e.ClientId == id) &gt; 0;

    }

    }
```

Hasta el momento nada nuevo, pero si nos fijamos bien en la carpeta
**Areas**, encontramos una carpeta **HelpPage** que será el área
encargada de generar la documentación:

![] (./img/Generando-paginas-de-ayuda-y-documentacion/image2.png)

Allí vamos a la clase HelpPageConfig.cs y descomentariamos la siguiente
línea que se encuentra en la función Register:


```
config.SetDocumentationProvider(new XmlDocumentationProvider(HttpContext.Current.Server.MapPath("\~/App\_Data/XmlDocument.xml")));
```

Luego en las propiedades del proyecto, en la opción Build, sección
Output marcamos la casilla XML documentation file:

![] (./img/Generando-paginas-de-ayuda-y-documentacion/image3.png)

Ahora si ejecutamos y seleccionamos la opción API del menú tenemos el
listado de acciones con su descripción, y al seleccionar una en
particular vamos al detalle de dicha acción:

![] (./img/Generando-paginas-de-ayuda-y-documentacion/image4.png)

![] (./img/Generando-paginas-de-ayuda-y-documentacion/image5.png)

Adicionalmente, si vamos a la ruta App\_Data\\XmlDocument.xml del
proyecto, dicho archivo XML contiene la información que se está
mostrando en pantalla.

Espero les sea interesante el post, ¡saludos!




