---
title: [ASP.NET MVC] Integrando ASPNET MVC con MongoLab
description: Integrando ASPNET MVC con MongoLab
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[ASP.NET MVC] Integrando ASPNET MVC con MongoLab

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


>[Descarga el código](https://github.com/julitogtu/DemoMvcMongoLab)

Hola a todos, en esta ocasión quiero mostrarles cómo podemos integrar
una aplicación Web construida con [ASP.NET
MVC](http://www.julitogtu.com/category/asp-net-mvc/) a una base de datos
[MongoDB](http://www.mongodb.org/) en [MongoLab](https://mongolab.com/),
para la base de datos vamos a hacer uso del Add-in disponible en
Microsoft Azure que nos ofrece una opción gratuita de hasta 0.5 Gb de
espacio.

Lo primero es activar **MongoLab** en **Microsoft Azure**, para ello
seleccionamos  **New -&gt; Store** y allí buscamos **MongoLab**:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image1.png)

En la siguiente ventana del wizard seleccionamos el plan gratuito (a
menos que requieras mayores features), la suscripción a usar, el nombre
y en donde va a estar ubicado:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image2.png)

Finalmente en la última ventana del wizard solo tenemos que confirmar
los datos para activar el servicio, luego en el portal de Azure en el
panel de la izquierda escogemos **Add-ons** y allí vamos a ver el
servicio de MongoLab que acabamos de crear:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image3.png)

Por el momento vamos a dejar hasta ahí la parte de Azure, ahora en el
proyecto de ASPNET MVC vamos a agregar una referencia al driver de
MongoDB para poder conectarnos a la base de datos creada, para ello
podemos buscarlo por el UI de Nuget:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image4.png)

O por la consola de Nuget ejecutar **Install-Package
mongocsharpdriver**:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image5.png)

Para el demo solo vamos a trabajar con una entidad, así que vamos a
crearla, en este caso es necesario tener en cuenta que en MongoDB los
datos se guardan en formato **BSON**, y una de sus característica es que
el id por defecto es un ObjectId y su nombre es \_id, este campo podemos
pensar que es como un GUID (espero luego hablar más de MongoDB), por lo
anterior el id de la entidad será de tipo string (y no int como se hace
generalmente con Entity Framework) y estará decorada con
**BsonRepresentation(BsonType.ObjectId)**:

```
    public class Customer

    {

    \[BsonRepresentation(BsonType.ObjectId)\]

    public string Id { get; set; }

    public string Name { get; set; }

    public string Email { get; set; }

    }
```

Ahora vamos a crear una clase llamada **AppContext** que será la
encargada de inicializar el cliente de MongoDB, para luego poder obtener
el servidor y finalmente una instancia de **MongoDatabase** que
representa la base de datos, para obtener la cadena de conexión en el
portal de Azure, en el item de MongoLab en la parte inferior seleccionar
**Connection Info** y allí podemos ver la cadena de conexión:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image6.png)

Y entonces la clase **AppContext**:

```
    public class AppContext

    {

    public MongoDatabase Database;

    readonly string connnectionstring =
    @"mongodb://DemoMvcMongoLab:z25DOUq0grml4Wy6uLwN3Wlg.ZZWdyGXkxIc0A5Hh0s-@ds045077.mongolab.com:45077/DemoMvcMongoLab";

    readonly string databaseName = "DemoMvcMongoLab";

    public AppContext()

    {

    var mongoClient = new MongoClient(connnectionstring);

    var server = mongoClient.GetServer();

    Database = server.GetDatabase(databaseName);

    }

    }
```

Ahora vamos a crear un controlador con el nombre CustomerController, lo
primero en el controlador es que vamos a declarar un objeto que será del
tipo **AppContext** y una variable para trabajar contra la colección de
entidades Customer que vamos a tener, la colección va a tener el nombre
**Customers**:

```
    private readonly AppContext context = new AppContext();

    private readonly MongoCollection&lt;Customer&gt; customersCollection
    = null;

    public CustomerController()

    {

    customersCollection =
    context.Database.GetCollection&lt;Customer&gt;("Customers");

    }
```

Lo primero que vamos a hacer es la creación, así que añadimos dos
acciones Create, una para el método Get y la otra para el método Post, y
será en el Post en donde vamos a guardar el nuevo objeto; para generar
un nuevo Id utilizamos ObjectId.GenerateNewId().ToString() y finalmente
con el método Save de la colección se guarda la entidad:

```
    \[HttpGet\]

    public ActionResult Create()

    {

    return View();

    }

    \[HttpPost\]

    \[ValidateAntiForgeryToken\]

    public ActionResult Create(\[Bind(Include = "Name,Email")\]
    Customer customer)

    {

    customer.Id = ObjectId.GenerateNewId().ToString();

    customersCollection.Save(customer);

    return RedirectToAction("Index");

    }
```

Para validar que la creación fue exitosa, en el portal de Azure tenemos
la opción de administrar la base de datos, al seleccionar esa opción se
abre el sitio en MongoLab y allí podemos ver la colección Customers y el
número de documentos que tiene:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image7.png)

Al dar clic sobre la colección podemos ver los documentos que tiene:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image8.png)

Listo, ya tenemos la creación funcionando, ahora vamos a crear el método
Index en donde vamos a listar todos los customers:

```
    \[HttpGet\]

    public ActionResult Index()

    {

    return View(customersCollection.FindAll());

    }
```

Y en la vista efectivamente vemos los documentos almacenados:

![] (./img/Integrando-ASPNET-MVC-con-MongoLab/image9.png)

Ahora para ver el detalle de un documento, creamos la acción Details que
recibe como parámetro el id del documento, para realizar la búsqueda por
el id utilizamos el método **FindOneById** pero debemos parsear el id a
un **ObjectId** de MongoDB:

```
    \[HttpGet\]

    public ActionResult Details(string id)

    {

    if (id == null)

    {

    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

    }

    Customer = customersCollection.FindOneById(ObjectId.Parse(id));

    if (customer == null)

    {

    return HttpNotFound();

    }

    return View(customer);

    }
```

Para eliminar el documento, vamos a tener dos acciones, la primera en
donde mostramos el detalle del documento (Get) y la segunda para
eliminarlo (Post), aquí hacemos uso del método **Remove**, si quieren
eliminar todos los documentos de la colección se tiene el método
**RemoveAll**:

```
    \[HttpGet\]

    public ActionResult Delete(string id)

    {

    if (id == null)

    {

    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

    }

    Customer = customersCollection.FindOneById(ObjectId.Parse(id));

    if (customer == null)

    {

    return HttpNotFound();

    }

    return View(customer);

    }

    \[HttpPost, ActionName("Delete")\]

    \[ValidateAntiForgeryToken\]

    public ActionResult DeleteConfirmed(string id)

    {

    customersCollection.Remove(Query.EQ("\_id",ObjectId.Parse(id)));

    return RedirectToAction("Index");

    }
```

Finalmente solo queda la actualización, de nuevo tenemos dos acciones,
una para obtener la información actual del documento y la otra para
confirmar la actualización, en la confirmación de la actualización se
debe crear un **UpdateBuilder** con los datos a actualizar, y luego
hacer uso del método **Update** de la colección:

```
    \[HttpGet\]

    public ActionResult Edit(string id)

    {

    if (id == null)

    {

    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

    }

    Customer = customersCollection.FindOneById(ObjectId.Parse(id));

    if (customer == null)

    {

    return HttpNotFound();

    }

    return View(customer);

    }

    \[HttpPost\]

    \[ValidateAntiForgeryToken\]

    public ActionResult Edit(\[Bind(Include = "Id,Name,Email")\]
    Customer customer)

    {

    var updateBuilder = Update

    .Set("Name", customer.Name)

    .Set("Email", customer.Email);

    customersCollection.Update(Query.EQ("\_id",
    ObjectId.Parse(customer.Id)), updateBuilder);

    return RedirectToAction("Index");

    }
```

Y por fin hemos finalizado el CRUD sobre la entidad Customer.

No olvides que el código del ejemplo lo puedes ver en mi repositorio de
[GitHub](https://github.com/julitogtu/DemoMvcMongoLab)

Espero está introducción les haya gustado y no se olviden de
compartirla!

Saludos.




