<properties
	pageTitle="[ASP.NET Web API] HttpActionResult, ahora en Web API 2"
	description="HttpActionResult, ahora en Web API 2"
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


#[ASP.NET Web API] HttpActionResult, ahora en Web API 2

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


[Descarga el código](https://github.com/julitogtu/WebApi/tree/examples)

Hola a todos, una de las nuevas características que me ha gustado mucho
de Web API 2 es que ahora podemos definir como respuesta un
**IHttpActionResult**, y esto básicamente reemplaza a las respuestas con
**HttpResponseMessage** y nos hace la vida mucho más fácil.

Así que iniciemos, partimos de un modelo muy sencillo:

C\#


```
    public class Person

    {

    public int Id { get; set; }

    public string Name { get; set; }

    public string LastName { get; set; }

    public string Twitter { get; set; }

    }
```

Y un contexto:

C\#


```
    public class PersonDBContext : DbContext

    {

    public DbSet&lt;Person&gt; Person { get; set; }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)

    {

    base.OnModelCreating(modelBuilder);

    }

    }
```

Ahora, añadimos un nuevo item, primero seleccionamos **New Scaffolded
Item**:

![] (./img/HttpActionResult-ahora-en-Web-API-2/image1.png)

Luego Web API 2 Controller with actions, using Entity Framework:

![] (./img/HttpActionResult-ahora-en-Web-API-2/image2.png)

Y finalmente le damos un nombre, seleccionamos el modelo y el contexto
(dejamos para otro post la casilla Use async controller actions):

![] (./img/HttpActionResult-ahora-en-Web-API-2/image3.png)

Y el resultado es:

C\#


```
    public class PersonController : ApiController

    {

    private PersonDBContext db = new PersonDBContext();

    // GET api/Person

    public IQueryable&lt;Person&gt; GetPerson()

    {

    return db.Person;

    }

    // GET api/Person/5

    \[ResponseType(typeof(Person))\]

    public IHttpActionResult GetPerson(int id)

    {

    Person = db.Person.Find(id);

    if (person == null)

    {

    return NotFound();

    }

    return Ok(person);

    }

    // PUT api/Person/5

    public IHttpActionResult PutPerson(int id, Person person)

    {

    if (!ModelState.IsValid)

    {

    return BadRequest(ModelState);

    }

    if (id != person.Id)

    {

    return BadRequest();

    }

    db.Entry(person).State = EntityState.Modified;

    try

    {

    db.SaveChanges();

    }

    catch (DbUpdateConcurrencyException)

    {

    if (!PersonExists(id))

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

    // POST api/Person

    \[ResponseType(typeof(Person))\]

    public IHttpActionResult PostPerson(Person person)

    {

    if (!ModelState.IsValid)

    {

    return BadRequest(ModelState);

    }

    db.Person.Add(person);

    db.SaveChanges();

    return CreatedAtRoute("DefaultApi", new { id = person.Id }, person);

    }

    // DELETE api/Person/5

    \[ResponseType(typeof(Person))\]

    public IHttpActionResult DeletePerson(int id)

    {

    Person = db.Person.Find(id);

    if (person == null)

    {

    return NotFound();

    }

    db.Person.Remove(person);

    db.SaveChanges();

    return Ok(person);

    }

    protected override void Dispose(bool disposing)

    {

    if (disposing)

    {

    db.Dispose();

    }

    base.Dispose(disposing);

    }

    private bool PersonExists(int id)

    {

    return db.Person.Count(e =&gt; e.Id == id) &gt; 0;

    }

    }
```

Ahora, revisando el controlador anterior, notamos que ahora la respuesta
de las acciones es un **IHttpActionResult**, y en esencia la respuesta
ahora es mucho más simple para construir, ya que podemos retornar
directamente el “resultado” de la operación utilizando los siguientes
métodos:

Ok()

BadRequest()

NotFound()

¡Saludos!
