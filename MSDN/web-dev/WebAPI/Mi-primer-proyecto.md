<properties
	pageTitle="Web API I – Mi primer proyecto"
	description="Proyecto ejemplo WebAPI"
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


#[ASP.NET Web API] Web API I – Mi primer proyecto

Por [Julio Cesar Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, últimamente me han preguntado bastante sobre como poder
trabajar con [Web API](http://www.asp.net/web-api), por lo que espero
realizar una pequeña serie de mini tutoriales para mostrar como iniciar
en este mundo, así que va el primero, y será bastante, vamos a revisar
como creamos nuestro primer proyecto Web API.

Como una pequeña aproximación comentarle un poco sobre [Web
API](http://www.asp.net/web-api), Web API es una opción que tenemos
disponible en el mundo .Net para el desarrollo de servicios REST, los
cuáles básicamente trabajan sobre el protocolo HTTP, permitiendo hacer
uso de los diferentes verbos disponibles como Get, Put, Post, Delete,
entre otros. Otro de los puntos interesante al trabajar con Web API, es
que vamos a gastar poco tiempo en configuraciones muchas veces tediosas
y aburridas para enfocarnos más en la creación del servicio (en realidad
lo más importante), lo anterior se logra por la idea de
Convención/Configuración, es decir, a medida que desarrollamos servicios
la misma convención que usa Web API nos va a brindar la configuración
básica necesaria.

Y finalmente para dejar tanta carreta, algo supremamente importante es
entender y tener claro que **Web API NO es ASP.NET MVC!**

Lo primero es crear una nueva aplicación de tipo ASP.NET Web
Application, si quieres entender más del concepto de **Todo en Uno**
para el desarrollo Web en Visual Studio 2013 te recomiendo el post del
amigo [@chalalo](https://twitter.com/chalalo):
[Link!](http://geeks.ms/blogs/gperez/archive/2013/07/01/nuevo-y-mejorado-el-concepto-un-solo-asp-net.aspx)

![img1] (./img/Mi-primer-proyecto/image1.png)

Luego seleccionamos la plantilla Web API:

![img2] (./img/Mi-primer-proyecto/image2.png)

Una vez finaliza la creación del proyecto, ya tenemos toda la estructura
necesaria para trabajar con servicios REST con Web API.

Todos los controladores en Web API deben heredar de la clase
**ApiController**, disponible en el namespace **System.Web.Http**, los
nombres de los controladores deben finalizar con el texto Controller,
así entonces si creamos un controlador llamado Test, su nombre real será
TestController.

Si revisamos la carpeta Controllers, podemos ver que la plantilla nos ha
creado dos controladores, un HomeController de ASP.NET MVC y un
ValuesControles de Web API, y dándole una mirada a ValuesController
tenemos:

C\#


```
    public class ValuesController : ApiController

    {

    // GET api/values

    public IEnumerable Get()

    {

    return new string\[\] { "value1", "value2" };

    }

    // GET api/values/5

    public string Get(int id)

    {

    return "value";

    }

    // POST api/values

    public void Post(\[FromBody\]string value)

    {

    }

    // PUT api/values/5

    public void Put(int id, \[FromBody\]string value)

    {

    }

    // DELETE api/values/5

    public void Delete(int id)

    {

    }

    }
```

Dicho controlador tiene ya varias acciones definidas, y en especial dos
métodos Get para obtener datos, así que probemos esos dos métodos, para
ello ejecutemos la aplicación y en la barra de direcciones adicionamos:

**/api/Values** el cual llama el método Get que retorna toda la
colección de objetos y con **/api/Values/id** llama el método Get que
recibe un id como parámetro.

Por el momento es todo, y como dicen en la TV (aún recuerdo de niño,
porque ya no la veo) en el próximo capítulo realizaremos un CRUD
completito.

¡Saludos!
