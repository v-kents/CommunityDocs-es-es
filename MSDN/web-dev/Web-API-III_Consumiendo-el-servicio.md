<properties
	pageTitle="Web API III – Consumiendo el servicio"
	description="Ejemplo de Web API"
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
	
# [ASP.NET Web API] Web API III – Consumiendo el servicio

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Y seguimos con un nuevo post sobre [Web
API](http://www.asp.net/web-api), ya en los dos pasados revisamos como
crear un servicio con [ASP.NET Web
API](https://julitogtu.wordpress.com/2013/07/08/asp-net-web-api-web-api-i-mi-primer-proyecto/)
y además como crearlo para trabajar un
[CRUD](http://julitogtu.wordpress.com/2013/07/10/asp-net-web-api-web-api-ii-creando-un-crud-trabajando-con-verbos-http/)
completo, pero hasta ahora no hemos consumido el servicio, lo cual es el
objetivo de este post.

El ejemplo que usaremos será el creado en el post anterior así que dale
una mirada: [Creando un
CRUD](http://julitogtu.wordpress.com/2013/07/10/asp-net-web-api-web-api-ii-creando-un-crud-trabajando-con-verbos-http/)

Primero vamos a modificar un poco el HTML de la vista Index del
controlador Home, para el ejemplo todas las operaciones las vamos a
realizar allí:


```


    &lt;div class="hero-unit"&gt;

    &lt;h2&gt;Get All&lt;/h2&gt;

    &lt;div&gt;

    &lt;table id="tblList" class="table table-bordered table-hover"&gt;

    &lt;thead&gt;

    &lt;tr&gt;

    &lt;th&gt;Name&lt;/th&gt;

    &lt;th&gt;Last Name&lt;/th&gt;

    &lt;th&gt;Twitter&lt;/th&gt;

    &lt;/tr&gt;

    &lt;/thead&gt;

    &lt;tbody&gt;&lt;/tbody&gt;

    &lt;/table&gt;

    &lt;/div&gt;

    &lt;h2&gt;Get one&lt;/h2&gt;

    &lt;div&gt;

    &lt;ul&gt;

    &lt;li&gt;

    &lt;label&gt;Id:&lt;/label&gt;

    &lt;input type="text" id="txtIdSearch" /&gt;

    &lt;input type="button" id="btnSearch" value="Search" /&gt;

    &lt;/li&gt;

    &lt;li&gt;

    &lt;label&gt;Name:&lt;/label&gt;

    &lt;input type="text" id="txtName" /&gt;

    &lt;/li&gt;

    &lt;li&gt;

    &lt;label&gt;Last name:&lt;/label&gt;

    &lt;input type="text" id="txtLastName" /&gt;

    &lt;/li&gt;

    &lt;li&gt;

    &lt;label&gt;Twitter:&lt;/label&gt;

    &lt;input type="text" id="txtTwitter" /&gt;

    &lt;/li&gt;

    &lt;li&gt;

    &lt;input type="button" id="btnDelete" value="Delete" /&gt;

    &lt;input type="button" id="btnUpdate" value="Update" /&gt;

    &lt;/li&gt;

    &lt;/ul&gt;

    &lt;/div&gt;

    &lt;/div&gt;

    @section scripts

    {

    &lt;script type="text/javascript"
    src="@Url.Content("/Scripts/app/person.js")"&gt;&lt;/script&gt;

    }
```

Listo, ya tenemos el HTML listo, ahora a implementar cada funcionalidad:

Obtener todos

C\#

```

    \$(document).on("ready", function () {

    GetAll();

    })

    //Get all persons

    function GetAll() {

    var item = "";

    \$('\#tblList tbody').html('');

    \$.getJSON('/api/person', function (data) {

    \$.each(data, function (key, value) {

    item += "

    " + value.Name + "" + value.LastName + "" + value.Twitter + "

    ";

    });

    \$('\#tblList tbody').append(item);

    });

    };
```

Lo primero que hacemos es validar que la página se ha cargado
totalmente, luego realizamos un llamado a la función GetAll la cual se
encarga de realizar la petición a la acción **GetPerson()** del
controlador que retorna todo el conjunto de resultados, y cómo lo hace?,
como estamos usando la función getJSON entonces ya la petición al verbo
Get, y como no le estamos enviando parámetros entonces responde la
acción que no recibe ninguno…si GetPeron(); luego con el \$.each
recorremos los elementos y llenamos la tabla.

**Obtener un elemento**

Ahora si queremos obtener 1 solo elemento, debemos pasarle el id que
deseamos buscar, ya que en la acción en el controlador lo recibe
**GetPerson(Int32 id),** entonces añadimos la siguiente función:

C\#

```

    function GetPersonById(idPerson) {

    var url = '/api/person/' + idPerson;

    \$.getJSON(url)

    .done(function (data) {

    \$('\#txtName').val(data.Name);

    \$('\#txtLastName').val(data.LastName);

    \$('\#txtTwitter').val(data.Twitter);

    })

    .fail(function (erro) {

    ClearForm();

    });

    };
```

Y al botón de buscar un manejador para el evento clic:

C\#

```

    \$('\#btnSearch').on('click', function () {

    GetPersonById(\$('\#txtIdSearch').val());

    })
```

De nuevo usamos \$.getJSON, y en este caso cuando la petición se ejecuta
correctamente entra al done donde asignamos valores a los campos de
texto con los datos de la persona retornada, en caso que se produzca
algún error se va la ejecución por el fail.

**Eliminar un elemento por su id**

Pasamos ahora a la eliminación, y en este caso vamos a enviarle el id de
la persona que deseamos eliminar, por lo que se usará la acción
DeletePerson(Int32 id), como antes lo primero es la función que hace el
llamado:

C\#

```

    function DeletePersonById(idPerson) {

    var url = '/api/person/' + idPerson;

    \$.ajax({

    url: url,

    type: 'DELETE',

    contentType: "application/json;chartset=utf-8",

    statusCode: {

    200: function () {

    GetAll();

    ClearForm();

    alert('Person with id: ' + idPerson + ' was deleted');

    },

    404: function () {

    alert('Person with id: ' + idPerson + ' was not found');

    }

    }

    });

    }
```

Luego el manejador para el botón y el evento click:

 C\#

```

    \$('\#btnDelete').on('click', function () {

    DeletePersonById(\$('\#txtIdSearch').val());

    })
```

En este caso hacemos uso de \$.ajax, definimos la url y le adicionamos
el id de la persona a eliminar, definimos el type (verbo Http a usar) en
DELETE, y manejamos entonces el código Http como respuesta de consumir
el servicio (statusCode), ya que si revisan la acción esta retorna un
HttpResponseMessage, en donde se tiene un código 200 (HttpStatusCode.OK)
cuando la eliminación es correcta o un 404 (HttpStatusCode.NotFound)
cuando no se encuentra una persona con el id enviado o la eliminación
falla.

**Actualizar un elemento**

Solo nos resta la actualización, así que primero la función:

C\#

```

    function UpdatePerson(idPerson,person) {

    var url = '/api/person/' + idPerson;

    \$.ajax({

    url: url,

    type: 'PUT',

    data: person,

    contentType: "application/json;chartset=utf-8",

    statusCode: {

    200: function () {

    GetAll();

    ClearForm();

    alert('Person with id: ' + idPerson + ' was updated');

    },

    404: function () {

    ClearForm();

    alert('Person with id: ' + idPerson + ' was not found');

    },

    400: function () {

    ClearForm();

    alert('Error');

    }

    }

    });

    }
```

Luego el manejador para el botón y el evento click:

C\#

```

    \$('\#btnUpdate').on('click', function () {

    var person = new Object();

    person.id = \$('\#txtIdSearch').val();

    person.name = \$('\#txtName').val();

    person.lastname = \$('\#txtLastName').val();

    person.twitter = \$('\#txtTwitter').val();

    UpdatePerson(person.id, JSON.stringify(person));

    })
```

Al igual que para la eliminación usamos \$.ajax pero en este caso el
type lo definimos con el verbo PUT, en la url le pasamos el id de la
persona y en el parámetro data le enviamos el objeto person y finalmente
de nuevo validamos la respuesta usando los códigos Http, 200
(HttpStatusCode.OK), 404 (HttpStatusCode.NotFound) y 400
(HttpStatusCode.BadRequest).

En el llamado a la función creamos un nuevo objeto al cual le definimos
los propiedades y sus correspondientes valores (mismos nombres que las
propiedades en la clase C\#) y la serializamos con JSON.stringify.

**Insertar un nuevo elemento**

Como última acción a implementar, ahora vamos a crear una nueva persona,
primero entonces la función que hace el llamado:

C\#

```

    function CreatePerson(person) {

    var url = '/api/person/';

    \$.ajax({

    url: url,

    type: 'POST',

    data: person,

    contentType: "application/json;chartset=utf-8",

    statusCode: {

    201: function () {

    GetAll();

    ClearForm();

    alert('Person with id: ' + idPerson + ' was updated');

    },

    400: function () {

    ClearForm();

    alert('Error');

    }

    }

    });

    }
```
El manejador para el botón y el evento click:

C\#

```

    \$('\#btnCreate').on('click', function () {

    var person = new Object();

    person.name = \$('\#txtName').val();

    person.lastname = \$('\#txtLastName').val();

    person.twitter = \$('\#txtTwitter').val();

    CreatePerson(JSON.stringify(person));

    })
```

Y de nuevo aparece en escena \$.ajax en esta ocasión con el type POST, y
manejamos la respuesta de nuevo con códigos Http, el 201
(HttpStatusCode.Created) que indica que se creó el elemento y el 400
para el error.

Finalmente la sencilla aplicación se verá como:

![img1] (./img/Consumiendo-el-servicio/image1.png)


Y hasta llegamos por esta vez, espero les guste el post y les ayude a
seguir con Web API, en el próximo post haremos un refactoring en el lado
de cliente para usar Knockoutjs y su facilidad para implementar
propiedades observables.

¡Saludos!

[Descarga el ejemplo!](http://sdrv.ms/18XmkR5)
