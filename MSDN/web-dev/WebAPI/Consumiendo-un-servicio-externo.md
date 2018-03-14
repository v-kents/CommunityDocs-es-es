---
redirect_url: https://docs.microsoft.com/
title: Web API IV – Implementando Knockoutjs
description: Ejemplo de Web API
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[ASP.NET Web API] Web API IX – Consumiendo un servicio externo, CORS

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS
Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, hoy vamos a retomar la serie de post sobre [Web
API](http://julitogtu.com/asp-net-web-api/), para hablar específicamente
el cómo podemos consumir dichos servicios pero de un dominio diferente,
lo primero que vamos a realizar es desplegar lo que se ha venido
trabajando, y lo he hecho ayudándome de Azure y en un par de clics ya
está listo:
[http://testwebapi.azurewebsites.net](http://testwebapi.azurewebsites.net/),
ahora el siguiente paso es crear un cliente para consumir dicho servicio
(que ya todos conocemos), para este caso he replicado lo que hemos
venido trabajando, la diferencia es que en el archivo person.js al
realizar el llamado al servicio ahora es necesario utilizar el dominio
del sitio:

http://testwebapi.azurewebsites.net/api/person/...

Bueno, hasta el momento todo parece listo, entonces si probamos vamos a
obtener el siguiente error:

![img1] (./img/Consumiendo-un-servicio-externo/image1.png)

Revisando el error, podemos deducir que el problema se da porque estamos
realizando la petición entre dominios diferentes, ¡y es acá donde
iniciamos a hablar de CORS!

[CORS](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing) que
quiere decir algo como intercambio de recursos entre dominios cruzados
(Cross-Origin Resource Sharing, si mucho mejor la definición en inglés)
lo que hace es definir un modelo para poder acceder a recursos de
diferentes dominios, en ese caso tanto el cliente como el servidor
digamos que trabajan de la mano usando encabezados HTTP.

Cuando estamos usando el método GET para la petición, en la cabecera del
request se envía la propiedad **Origin** con el dominio desde el cual
estamos realizando la petición, luego el servicio [Web
API](http://julitogtu.com/asp-net-web-api/) válida si el dominio que
realiza la petición es permitido, en caso afirmativo en la cabecera de
la respuesta en la propiedad **Access-Control-Allow-Origin** se retorna
el mismo dominio que realizo la petición o un \* para permitir todos los
dominios, si la respuesta no cumple esa condición el browser elimina la
respuesta:

![img2] (./img/Consumiendo-un-servicio-externo/image2.png)


Y ahora la solución, nos vamos al método Get del servicio y en el header
de la respuesta le agregamos la propiedad
**Access-Control-Allow-Origin** con el valor \*, o bien si se tiene un
listado de dominios permitidos allí hacer la validación y retornar el
dominio específico en lugar del \*, por lo tanto el código quedaría:

C\#


```
    public HttpResponseMessage GetPerson()

    {

    var data = db.Person.AsEnumerable();

    var httpResponseMessage =
    Request.CreateResponse&lt;IEnumerable&lt;Person&gt;&gt;(HttpStatusCode.OK,
    data);

    httpResponseMessage.Headers.Add("Access-Control-Allow-Origin","\*");

    httpResponseMessage.Headers.CacheControl =
    new CacheControlHeaderValue()

    {

    MaxAge = TimeSpan.FromMinutes(1)

    };

    return httpResponseMessage;

    }

    \[ActionName("getbyid")\]

    public HttpResponseMessage GetPerson(Int32 id)

    {

    var person = db.Person.Find(id);

    if (person == null)

    {

    var httpResponseMessage =
    Request.CreateResponse&lt;Person&gt;(HttpStatusCode.NotFound,person);

    httpResponseMessage.Headers.Add("Access-Control-Allow-Origin",
    "\*");

    return httpResponseMessage;

    }

    else

    {

    var httpResponseMessage =
    Request.CreateResponse&lt;Person&gt;(HttpStatusCode.OK, person);

    httpResponseMessage.Headers.Add("Access-Control-Allow-Origin",
    "\*");

    return httpResponseMessage;

    }

    }
```

Ahora si probamos de nuevo la petición Get funciona correctamente:

![img3] (./img/Consumiendo-un-servicio-externo/image3.png)


Bueno, ya tenemos el GET, ahora vamos a trabajar con los demás verbos
Http, por ejemplo si intentamos realizar una petición PUT obtenemos:

![img4] (./img/Consumiendo-un-servicio-externo/image4.png)


Revisando la información del request, tenemos dos cosas importantes, la
primera es que en Request Method el valor es OPTIONS y la segunda que el
Status Code es el 405 (Método no permitido), bueno ¿y ahora? Lo que
debemos hacer ahora es leer el encabezado de la petición y hacer algunas
pequeñas adiciones como especificar que se permitan los verbos PUT y
DELETE, permitir todos los dominios y aceptar en el header el atributo
Content-Type, para este caso, vamos a crear un [Message
Handler](http://julitogtu.com/2013/08/15/asp-net-web-api-web-api-vii-message-handlers/)
con el nombre **RequestMethodHandler**:

C\#

```
    public class RequestMethodHandler : DelegatingHandler

    {

    protected override async Task&lt;HttpResponseMessage&gt;
    SendAsync(HttpRequestMessage request,
    CancellationToken cancellationToken)

    {

    if (request.Headers.Contains("Origin") && request.Method
    == HttpMethod.Options)

    {

    var response = new HttpResponseMessage(HttpStatusCode.OK);

    response.Headers.Add("Access-Control-Allow-Origin", "\*");

    response.Headers.Add("Access-Control-Allow-Methods", "PUT, DELETE");

    response.Headers.Add("Access-Control-Allow-Headers", "Origin,
    X-Requested-With, Content-Type, Accept");

    return response;

    }

    return await base.SendAsync(request, cancellationToken);

    }

    }
```

Y no olviden llamarlo en WebApiConfig:

C\#

```
    config.MessageHandlers.Add(new RequestMethodHandler());
```

Ahora replicamos los cambios que realizamos en el método GET del
controlador para los demás métodos que tenemos allí (POST, UPDATE,
DELETE), por lo que ahora el controlador quedaría:

C\#


```
    public class PersonController : ApiController

    {

    private PersonDBContext db = new PersonDBContext();

    /// &lt;summary&gt;

    /// Get all persons

    /// &lt;/summary&gt;

    public HttpResponseMessage GetPerson()

    {

    var data = db.Person.AsEnumerable();

    var httpResponseMessage =
    Request.CreateResponse&lt;IEnumerable&lt;Person&gt;&gt;(HttpStatusCode.OK,
    data);

    httpResponseMessage.Headers.Add("Access-Control-Allow-Origin","\*");

    return httpResponseMessage;

    }

    \[ActionName("getbyid")\]

    public HttpResponseMessage GetPerson(Int32 id)

    {

    var person = db.Person.Find(id);

    if (person == null)

    {

    var httpResponseMessage =
    Request.CreateResponse&lt;Person&gt;(HttpStatusCode.NotFound,person);

    httpResponseMessage.Headers.Add("Access-Control-Allow-Origin",
    "\*");

    return httpResponseMessage;

    }

    else

    {

    var httpResponseMessage =
    Request.CreateResponse&lt;Person&gt;(HttpStatusCode.OK, person);

    httpResponseMessage.Headers.Add("Access-Control-Allow-Origin",
    "\*");

    return httpResponseMessage;

    }

    }

    /// &lt;summary&gt;

    /// Get a person by an id

    /// &lt;/summary&gt;

    /// &lt;param name="id"&gt;&lt;/param&gt;

    /// &lt;returns&gt;&lt;/returns&gt;

    \[ActionName("getbyotherid")\]

    public Person GetPersonByOtherId(Int32 id)

    {

    Person = db.Person.Find(id);

    if (person == null)

    {

    throw new
    HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));

    }

    return person;

    }

    // PUT api/Person/5

    public HttpResponseMessage PutPerson(Int32 id, Person person)

    {

    HttpResponseMessage response;

    if (!ModelState.IsValid)

    {

    response = Request.CreateResponse(HttpStatusCode.BadRequest,
    ModelState);

    }

    else if (id != person.Id)

    {

    response = Request.CreateResponse(HttpStatusCode.BadRequest);

    }

    else

    {

    db.Entry(person).State = EntityState.Modified;

    try

    {

    db.SaveChanges();

    response = Request.CreateResponse(HttpStatusCode.OK);

    }

    catch (DbUpdateConcurrencyException ex)

    {

    response = Request.CreateResponse(HttpStatusCode.NotFound, ex);

    }

    }

    response.Headers.Add("Access-Control-Allow-Origin", "\*");

    return response;

    }

    // POST api/Person

    public HttpResponseMessage PostPerson(Person person)

    {

    if (ModelState.IsValid)

    {

    db.Person.Add(person);

    db.SaveChanges();

    HttpResponseMessage response =
    Request.CreateResponse(HttpStatusCode.Created, person);

    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id
    = person.Id }));

    response.Headers.Add("Access-Control-Allow-Origin", "\*");

    return response;

    }

    else

    {

    return Request.CreateErrorResponse(HttpStatusCode.BadRequest,
    ModelState);

    }

    }

    // DELETE api/Person/5

    public HttpResponseMessage DeletePerson(Int32 id)

    {

    Person = db.Person.Find(id);

    HttpResponseMessage response;

    if (person == null)

    {

    response = Request.CreateResponse(HttpStatusCode.NotFound);

    }

    else

    {

    db.Person.Remove(person);

    try

    {

    db.SaveChanges();

    response = Request.CreateResponse(HttpStatusCode.OK, person);

    }

    catch (DbUpdateConcurrencyException ex)

    {

    response = Request.CreateResponse(HttpStatusCode.NotFound);

    }

    }

    response.Headers.Add("Access-Control-Allow-Origin", "\*");

    return response;

    }

    protected override void Dispose(bool disposing)

    {

    db.Dispose();

    base.Dispose(disposing);

    }

    }
```

Y si probamos de nuevo, podemos ver que ahora si todo nos funciona
correctamente.

Espero este post les sirva bastante, ¡saludos!

[Descarga el ejemplo](http://sdrv.ms/1eJ1irX)




