<properties
	pageTitle="WebApi & oData Queries"
	description="Introducción OData open Data Protocol"
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




#WebAPI & oData Queries

Marc Rubiño

Entusiasta de la tecnología con más de 10 años de experiencia en
aplicaciones web y consultoría técnica. Fundador del grupo de usuarios
LonetCamp, colaborador habitual con los grupos de usuarios y de los
foros de ASP.NET en MSDN donde a su vez soy moderador.

Microsoft MVP

Blogs de Marc: <http://mrubino.net/>, <http://geeks.ms/blogs/mrubino/>

Twitter: <https://twitter.com/Marc_Rubino>

LinkedIn: <http://www.linkedin.com/in/mrubino>

Hace unos días Scott Guthrie nos anunció en su
[blog](http://weblogs.asp.net/scottgu/archive/2013/02/18/announcing-release-of-asp-net-and-web-tools-2012-2-update.aspx)
el lanzamiento de la versión Release de las [ASP.NET and Web Tools
2012.2 update](http://www.asp.net/vnext/overview/fall-2012-update)
disponible para Visual Studio 2012 y .Net framework 4.5

Una de las mejoras que más me ha gustado es el soporte de WebApi al
estándar [oData](http://www.odata.org/), este soporte otorga a nuestro
servicio REST la potestad de generar Url’s con consultas semánticas,
paginado, operaciones CRUD, etc .

###Introducción OData  “open Data Protocol”


OData es un protocolo especialmente diseñado para trabajar con datos y
para esto utiliza otros protocolos y tecnologías sobradamente
reconocidas como Http, AtomPub y JSon.

Gracias a que OData se está abriendo camino como solución estándar para
exponer los datos ya podemos disponer de diferentes recursos a nuestra
disposición:

**Clientes**: No solo desde el navegador podemos consumir los datos
expuestos desde el protocolo OData, también existen otras aplicaciones
preparadas para utilizar OData como  Excel 2010, OData Explorer,
Librerías cliente móviles, controles Telerik, etc.

**Aplicaciones**: Las aplicaciones que actualmente ya exponen sus datos
mediante OData como SharePoint 2010, Windows Azure, SQL Reporting
Services, etc.

**Servicios abiertos**: Servicios que exponen sus datos de forma
gratuita como Facebook Insights, Vancouver Street Parking, Nuget, Stack
Overflow, etc

Ahora cuando necesitemos exponer datos en nuestras aplicaciones por
ejemplo siguiendo las especificaciones REST, sabemos que OData nos
facilitará mucho la faena, y además dispondremos de muchos servicios
actualmente que ya exponen sus datos con este protocolo

###Configuración inicial


Para empezar a jugar con esta poderosa opción primero tenemos que tener
el ejemplo base listo:

**Instalar el** [web
Tools](http://www.asp.net/vnext/overview/fall-2012-update)

**Crear un nuevo proyecto WebApi**

**Que el servicio retorne datos de prueba**. En este caso una lista de
facturas para las pruebas

C\#


```
    // GET api/values

    public IEnumerable Get()

    {

    return \_pedidos.ListaPedidos();

    }

```

![img1] (./img/Introduccion-OData/image1.png)

    **Habilitar las Query**: desde la configuración del WebApi

![img2] (./img/Introduccion-OData/image2.png)



C\#


```
    config.EnableQuerySupport();

    **Especificar que la acción es Queriable**: Retornando un Tipo
    **IQueryable** y especificando que nuestra colección se convierta
    mediante **AsQueryable()**

```

C\#

```
    public IQueryable Get()

    {

    return \_pedidos.ListaPedidos().AsQueryable();

    }
```

    **Query:** Ahora ya podemos realizar consultas personalizadas desde 
    la propia llamada. *“api/values?\$orderby=Total asc”*

    Url  de la api: **api/values?**

    Parámetro para ordenar:  **\$orderby=**

    Campo a ordenar y parámetro “ascendente”:  **Total asc**

###Especificación oData


Los parámetros que podemos utilizar en nuestra URL para realizar las
consultas son:

![img4] (./img/Introduccion-OData/image4.PNG)



Más información sobre la convención de las URL en oData en
 <http://www.odata.org/media/30002/OData%20URL%20Conventions.html#url2>

###El Ejemplo


Ahora que ya tenemos el servicio preparado para recibir las queries
prepararemos un cliente sencillo para consumir y probar la potencia de
las queries con oData.

Tendremos una web que realiza una llamada AJAX utilizando JQuery para
facilitar las cosas.

C\#


```
    function cargar(filtro) {

    \$.getJSON(filtro, null, function (data) {

    var fact = \$("\#facturas");

    fact.html("");

    \$.each(data, function (index, obj) {

    var fecha = new Date(obj.Fecha);

    fact.append("&lt;/pre&gt;

    &lt;ul&gt;

    &lt;li&gt;Factura: " + obj.Id + " " + fecha.toDateString() + " Total
    : " + obj.Total + "&lt;/li&gt;

    &lt;/ul&gt;

    &lt;pre&gt;");

    });

    });

    }
```

Esta función recibe la consulta a pasar al servicio y rellena una lista
con el resultado obtenido de la llamada AJAX.

Ahora la podemos utilizar por ejemplo para consultar:

**las 5 facturas más altas**: Ordenamos descendentemente por el total y
cogemos los 5 elementos desde el elemento 0.

C\#

cargar("api/values?\$skip=0&\$top=5&\$orderby=Total desc");

![img3] (./img/Introduccion-OData/image3.png)

    **Filtrar por Población**: Podemos filtrar los resultados que la
    población sea Barcelona.



C\#

```

   cargar("api/values?\$filter=Poblacion eq 'Barcelona'");
```
    **Filtro por Fecha**: Buscamos las facturas del día 12



C\#


```
    cargar("api/values?\$filter=day(Fecha) eq 12");
```

    **Nº Factura de 5 dígitos**:



C\#


```
    cargar("api/values?\$filter=length(Id) eq 5");
```

    **Facturas con total entre 1.000€ y 2.000€** :



C\#


```
    cargar("api/values?\$filter=Total ge 1000 and Total le 2000");
```

###Conclusión


Creo que para los servicios de datos es muy interesante la potencia que
nos otorga la posibilidad de personalizar las consultas en el lado
del cliente, pero siempre que tengamos claros los límites y tener muy
bien definidos las políticas de seguridad.

Con estos cuatro ejemplos creo que queda muy claro toda la potencia y el
amplio abanico de posibilidades que se nos presentan para trabajar con
servicios REST de una manera mucho más ágil. Si creéis que este tema es
interesante podría hacer un par de entradas más sobre paginación, 
validación y seguridad entre otras opciones.
