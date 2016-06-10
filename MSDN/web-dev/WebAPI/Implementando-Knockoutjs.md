---
title: Web API IV – Implementando Knockoutjs
description: Ejemplo de Web API
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: web-dev
ms.custom: CommunityDocs
---






#[ASP.NET Web API] Web API IV – Implementando Knockoutjs

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


Hola a todos, en el post anterior vimos cómo podemos consumir nuestro
servicio REST de [Web
API](http://julitogtu.wordpress.com/category/asp-net-web-api/)
utilizando jQuery y AJAX ([míralo
acá](http://julitogtu.wordpress.com/2013/07/15/asp-net-web-api-web-api-iii-consumiendo-el-servicio/)),
creamos un archivo JavaScript para mantener separado el contenido (HTML)
del comportamiento de la página (JavaScript), sin embargo, con solo
observar el archivo es creado, nos damos cuenta que dicha afirmación no
es del todo cierta, puesto que tenemos una dependencia total a los
elementos del DOM, y si en algún momento el HTML llega a cambiar o los
id´s de los elementos vamos a tener problemas.

Para solucionar el problema anterior, una posible solución es
implementar un framework JavaScript como
[Knockout](http://knockoutjs.com/), el cual permite trabajar el patrón
MVVM (model-view-view model) en el cliente; en este post no voy a entrar
en detalles técnicos de este framework (probablemente luego haga una
serie sobre el tema) ni a discutir si es o no la mejor opción, solo
comentare que a mí me gusta, me ayuda a trabajar mejor en el cliente y
que cumple su objetivo, además si hasta inicias con JavaScript,
[Knockout](http://knockoutjs.com/) te será sencillo de entender.

Luego de una pequeña introducción iniciemos (seguimos con el ejemplo del
[anterior
post](http://julitogtu.wordpress.com/2013/07/15/asp-net-web-api-web-api-iii-consumiendo-el-servicio/)),
lo primero es añadir Knockout, para ello vamos a hacer uso de Nuget:

![img1] (./img/Implementando-Knockoutjs/image1.png)


Ahora en la clase BundleConfig (en la carpeta App\_Start) en el método
RegisterBundles añadimos un nuevo bundle para knockout:


```
bundles.Add(new ScriptBundle("\~/bundles/knockout").Include(

    "\~/Scripts/knockout-{version}.js"));
```
Luego en el layout (Views/Shared/\_Layout.cshtml) del sitio lo
referenciamos al final:

```
    @Scripts.Render("\~/bundles/knockout")
```

Ahora que ya tenemos listo a Knockout, iniciamos con el refactoring de
person.js, la idea es crear un ViewModel que permita trabajar de manera
desconectada del DOM las operaciones CRUD implementadas, lo primero que
haremos y para poder trabajar mejor con Knockout es agregar una
referencia a knockout-2.3.0.debug.js (en el momento de escribir el post
la versión que uso es la 2.3.0) en person.js para tener intellisense


```
/// &lt;reference path="../knockout-2.3.0.debug.js" /&gt;
```
Luego definimos el modelo:

```

   var PersonViewModel = function () {

    self = this;

    self.id = ko.observable();

    self.name= ko.observable();

    self.lastname= ko.observable();

    self.twitter= ko.observable();

    self.personList= ko.observableArray();

    .....

    }
```

Y al definir el modelo ya tenemos varios cambios importantes:

Definición del objeto PersonViewModel

A self le asignamos this para evitar conflictos al acceder a las
propiedades del objeto

Las propiedades se definen como observables, es decir si cambia la
propiedad el objeto HTML asociado también lo hará, y viceversa.

La propiedad personList es observable y a la vez es un array.

Ahora comenzamos a añadir funciones a nuestro viewmodel:

**Obtener todos los elementos**


```
    self.getAll = function () {

    \$.getJSON('/api/person', function (data) {

    self.personList(data);

    });

    }
```

En este caso de nuevo se realiza la petición con \$.getJSON, la
diferencia radica en que la respuesta se la seteamos como valor al array
observable.

**Obtener un elemento**


```
    self.getPersonById= function () {

    var url = '/api/person/' + self.id();

    \$.getJSON(url)

    .done(function (data) {

    self.name(data.Name);

    self.lastname(data.LastName);

    self.twitter(data.Twitter);

    })

    .fail(function (erro) {

    self.clearForm();

    });

    },
```

La funcionalidad básica permanece casi que igual, sin embargo los
cambios que se observan son:

Se utiliza self.id() para obtener el valor de la propiedad id del objeto
en lugar de consultar el DOM

Si la respuesta es correcta, se asignan los valores a las propiedades
del objeto y no directamente a los elementos del DOM.

Eliminar elemento por id

```
    self.deletePersonById= function () {

    var url = '/api/person/' + self.id();

    \$.ajax({

    url: url,

    type: 'DELETE',

    contentType: "application/json;chartset=utf-8",

    statusCode: {

    200: function () {

    self.getAll();

    alert('Person with id= ' + self.id() + ' was deleted');

    self.clearForm();

    },

    404: function () {

    alert('Person with id= ' + self.id() + ' was not found');

    }

    }

    });

    },
```

El cambio importante es que para acceder al id de la persona de utiliza
self.id() en lugar de acceder al elemento del DOM para leer su valor.

**Actualizar y crear un elemento**


```
    self.updatePerson= function () {

    var url = '/api/person/' + self.id();

    \$.ajax({

    url: url,

    type: 'PUT',

    data: ko.toJSON(self),

    contentType: "application/json;chartset=utf-8",

    statusCode: {

    200: function () {

    self.getAll();

    alert('Person with id= ' + self.id() + ' was updated');

    self.clearForm();

    },

    404: function () {

    alert('Person with id= ' + self.id() + ' was not found');

    self.clearForm();

    },

    400: function () {

    self.clearForm();

    alert('Error');

    }

    }

    });

    },

    self.createPerson= function () {

    var url = '/api/person/';

    \$.ajax({

    url: url,

    type: 'POST',

    data: ko.toJSON(self),

    contentType: "application/json;chartset=utf-8",

    statusCode: {

    201: function () {

    self.getAll();

    self.clearForm();

    alert('Person was created');

    },

    400: function () {

    self.clearForm();

    alert('Error');

    }

    }

    });

    },
```

En la actualización y creación de un elemento se comparten los cambios
(por eso no lo separe acá), las dos acciones en el lado del servidor
reciben un objeto de tipo Person, lo cual en el post anterior hacíamos
creando un nuevo objeto, asignándoles propiedades y finalmente
serializándolo, sin embargo Knockout ofrece una forma más sencilla de
realizar este proceso, simplemente con **ko.toJSON(modelo)** se realiza
la serialización del objeto (cool no?).

Bueno, lo anterior todo muy bonito… pero… y como relacionamos ese modelo
con nuestro HTML dicho proceso tiene dos pasos:

**Paso 1: Llamar el viewmodel y enlazarlo**

En este caso, una vez la página está cargada, creamos un nuevo objeto de
tipo PersonViewModel, luego con **ko.applyBindings(modelo)** aplicamos
los bindgins y finalmente hacemos el llamado a la función que obtiene
todos los elementos:


```
    \$(document).on("ready", function () {

    var personvm = new PersonViewModel();

    ko.applyBindings(personvm);

    personvm.getAll();

    })

Paso 2: Definir los bindings en el HTML

Llego el momento de modificar nuestra vista, el nuevo código es:

1.  

<!-- -->

1.  &lt;div class="hero-unit"&gt;

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

    &lt;tbody data-bind="foreach: personList"&gt;

    &lt;tr&gt;

    &lt;td data-bind="text: Name"&gt;&lt;/td&gt;

    &lt;td data-bind="text: LastName"&gt;&lt;/td&gt;

    &lt;td data-bind="text: Twitter"&gt;&lt;/td&gt;

    &lt;/tr&gt;

    &lt;/tbody&gt;

    &lt;/table&gt;

    &lt;/div&gt;

    &lt;h2&gt;Get one&lt;/h2&gt;

    &lt;div&gt;

    &lt;ul&gt;

    &lt;li&gt;

    &lt;label&gt;Id:&lt;/label&gt;

    &lt;input type="text" id="txtIdSearch" data-bind="value:id" /&gt;

    &lt;input type="button" id="btnSearch" value="Search"
    data-bind="click:getPersonById" /&gt;

    &lt;/li&gt;

    &lt;li&gt;

    &lt;label&gt;Name:&lt;/label&gt;

    &lt;input type="text" id="txtName" data-bind="value:name" /&gt;

    &lt;/li&gt;

    &lt;li&gt;

    &lt;label&gt;Last name:&lt;/label&gt;

    &lt;input type="text" id="txtLastName" data-bind="value:lastname"
    /&gt;

    &lt;/li&gt;

    &lt;li&gt;

    &lt;label&gt;Twitter:&lt;/label&gt;

    &lt;input type="text" id="txtTwitter" data-bind="value:twitter"
    /&gt;

    &lt;/li&gt;

    &lt;li&gt;

    &lt;input type="button" id="btnCreate" value="Create"
    data-bind="click:createPerson" /&gt;

    &lt;input type="button" id="btnDelete" value="Delete"
    data-bind="click:deletePersonById" /&gt;

    &lt;input type="button" id="btnUpdate" value="Update"
    data-bind="click:updatePerson" /&gt;

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

El primer cambio se da en la definición del cuerpo de la tabla, en este
caso haciendo uso de la propiedad **data-bind** le estamos asignamos la
propiedad personList, y como usamos la función foreach entonces Knockout
itera sobre cada elemento del array, luego en cada elemento td usando
nuevamente la propiedad data-bind a la propiedad text le relacionamos la
propiedad de la cual va a mostrar su valor.

Para los input, en el data-bind a la propiedad value le asignamos alguna
de las propiedades del ViewModel, para los botones igualmente con
data-bind al evento clic le relacionamos una función del ViewModel.

El cambio más importante en esta sencilla implementación de Knockout, es
que si revisamos de nuevo el archivo person.js NO se tiene ninguna
dependencia ni referencia al DOM, lo cual ofrece una mejor estructura de
nuestra aplicación y la puede hacer más mantenible y extensible.

Espero el post les haya gustado, y esperen la siguiente entrega de este
serie sobre Web API.

¡Saludos!

[Descarga el ejemplo!](http://sdrv.ms/12WU9KQ)


