<properties
	pageTitle="Web API II – Creando un CRUD, trabajando con verbos HTTP"
	description="Implementar fácilmente un CRUD"
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



#[ASP.NET Web API] Web API II – Creando un CRUD, trabajando con verbos HTTP


Por [Julio Cesar Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, en el post pasado vimos una pequeña introducción a
[ASP.NET Web API](http://www.asp.net/web-api) y creamos nuestro primer
proyecto ([míralo
acá](https://julitogtu.wordpress.com/2013/07/08/asp-net-web-api-web-api-i-mi-primer-proyecto/)),
hoy vamos a revisar cómo podemos implementar fácilmente un CRUD (create,
read, update y delete), así que a darle entonces.

Lo primero que necesitamos es una clase (modelo) sobre la cual
implementar el CRUD, la clase es sencilla pero de utilidad para el
ejemplo:


```
    public class Person

    {

    public int Id { get; set; }

    public string Name { get; set; }

    public string LastName { get; set; }

    public string Twitter { get; set; }

    }
```
Ahora, crearemos la clase que será el contexto de nuestra base de datos
(si, usaremos Entity Framework):

```
    public class PersonDBContext : DbContext

    {

    public DbSet Person { get; set; }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)

    {

    base.OnModelCreating(modelBuilder);

    }

    }
```
Ya que tenemos el contexto y nuestro modelo, es momento de definir como
se inicializara nuestra base de datos, así entonces en la carpeta
App\_Start adicionamos una nueva clase llamada PersonDBInitializer:


```
    public class PersonDBInitializer : DropCreateDatabaseAlways

    {

    protected override void Seed(PersonDBContext context)

    {

    var persons = new List {

    new Person { Name = "Julio", LastName = "Avellaneda", Twitter =
    "@julitogtu"},

    new Person { Name = "Juan", LastName = "Ruiz", Twitter =
    "@juankruiz"},

    new Person { Name = "Roberto", LastName = "Alvarado", Twitter =
    "@ralvaradot"},

    new Person { Name = "Nicolas", LastName = "Herrera", Twitter =
    "@nicolocodev"},

    new Person { Name = "Jorge", LastName = "Ramirez", Twitter =
    "@jramirezdev"},

    new Person { Name = "Nelson", LastName = "Venegas", Twitter =
    "@nvenegar"}

    };

    persons.ForEach(c =&gt; context.Person.Add(c));

    context.SaveChanges();

    }

    }
```

Ahora en el Application\_Start() del Global.asax lo definimos:


```
    protected void Application\_Start()

    {

    ...

    Database.SetInitializer(new PersonDBInitializer());

    }
```

Y para finalizar con el tema asociado definimos la cadena de conexión en
el web.config:


```
    &lt;connectionStrings&gt;

    &lt;add name="PersonDBContext"

    connectionString="Data Source=.;

    Initial Catalog=test;Integrated Security=True"

    providerName="System.Data.SqlClient" /&gt;

    &lt;/connectionStrings&gt;
```

Ahora volviendo al tema de Web API, es hora de crear el controlador, y
para ello Web API nos ayuda bastante; damos clic derecho en la carpeta
Controllers, luego Add -&gt; Scaffold:

![img1] (./img/Creando-un-CRUD/image1.png)

Luego seleccionamos **Web API 5 with read/write actions, using Entity
Framework**, y en la ventana que se abre definimos el nombre del
contralor, el modelo y el contexto de base de datos:

![img2] (./img/Creando-un-CRUD/image2.png)

![img3] (./img/Creando-un-CRUD/image3.png)

Una vez finaliza la creación del controlador, el asistente nos ha creado
el controlador con todas las acciones CRUD:

C\#

```
    public class PersonController : ApiController

    {

    private PersonDBContext db = new PersonDBContext();

    // GET api/Person

    public IEnumerable GetPerson()

    {

    return db.Person.AsEnumerable();

    }

    // GET api/Person/5

    public Person GetPerson(Int32 id)

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

    if (!ModelState.IsValid)

    {

    return Request.CreateErrorResponse(HttpStatusCode.BadRequest,
    ModelState);

    }

    if (id != person.Id)

    {

    return Request.CreateResponse(HttpStatusCode.BadRequest);

    }

    db.Entry(person).State = EntityState.Modified;

    try

    {

    db.SaveChanges();

    }

    catch (DbUpdateConcurrencyException ex)

    {

    return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);

    }

    return Request.CreateResponse(HttpStatusCode.OK);

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

    if (person == null)

    {

    return Request.CreateResponse(HttpStatusCode.NotFound);

    }

    db.Person.Remove(person);

    try

    {

    db.SaveChanges();

    }

    catch (DbUpdateConcurrencyException ex)

    {

    return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);

    }

    return Request.CreateResponse(HttpStatusCode.OK, person);

    }

    protected override void Dispose(bool disposing)

    {

    db.Dispose();

    base.Dispose(disposing);

    }

    }
```

Revisando entonces cada una de las acciones, podemos ver que todas las
operaciones CRUD ya fueron implementadas, y en este caso el nombre de
cada acción tiene una fuerte relación con el nombre de los verbos Http:

![img4] (./img/Creando-un-CRUD/image4.PNG)

Ahora ya tenemos todo listo para comenzar a consumir el servicio, lo
cual revisaremos en el próximo post.

Saludos.

[Descarga el ejemplo!](http://sdrv.ms/1bhhQEp)
