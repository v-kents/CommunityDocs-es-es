---
title: Condicionales y ciclos en JSRende
description: Condicionales y ciclos en JSRende
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Condicionales y ciclos en JSRender

Por [Julio Cesar Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Anteriormente vimos una introducción a
[*JSRender*](http://borismoore.github.com/jsrender/demos/) y como
podemos cargar los datos utilizando
[*WebAPI*](http://www.asp.net/web-api) (mira el
[*post*](http://julitogtu.wordpress.com/2012/10/06/asp-net-cargando-datos-con-webapi-y-jsrender/)),
y hoy quiero mostrarles dos características adicionales de
[*JSRender*](http://borismoore.github.com/jsrender/demos/) para manejar
las plantillas y tener una lógica más completa en lugar de solo mostrar
datos, y esas dos características son: condicionales y filtros.

Para este ejemplo vamos a seguir utilizando el ejemplo del anterior
post, así que te recomiendo le des una mirada primero, te dejo el link:

[*Cargando datos con WebAPI y
JSRender*](http://julitogtu.wordpress.com/2012/10/06/asp-net-cargando-datos-con-webapi-y-jsrender/)

Lo primero que haremos es añadir una nueva clase al modelo llamada
Ciudad:

C\#

```
    public class Ciudad

    {

    public int CiudadId { get; set; }

    public string Nombre { get; set; }

    }
```

Ahora, vamos a suponer que nuestros clientes han visitado algunas
ciudades, así que añadimos una nueva propiedad a la clase Cliente
quedando:

C\#


```
    public class Cliente

    {

    public int ClienteId { get; set; }

    public string Nombre { get; set; }

    public string Email { get; set; }

    public bool Activo { get; set; }

    public List&lt;Ciudad&gt; Ciudades { get; set; }

    }
```

Ahora en nuestro controlador modificamos la lista de clientes y le
añadimos algunas ciudades a algunos clientes:

 C\#


```
    private readonly List&lt;Cliente&gt; clientes =
    new List&lt;Cliente&gt;()

    {

    new Cliente{ ClienteId = 1,

    Nombre = "Julio Avellaneda",

    Email = "julito\_gtu@hotmail.com",

    Activo = true,

    Ciudades = new List&lt;Ciudad&gt;(){

    new Ciudad { CiudadId = 1, Nombre = "Bogotá"},

    new Ciudad { CiudadId = 2, Nombre = "Cali"},

    new Ciudad { CiudadId = 3, Nombre = "Medellin"}

    }},

    new Cliente{ ClienteId = 2, Nombre = "Juan Ruiz", Email =
    "juanruiz@hotmail.com", Activo = true},

    new Cliente{ ClienteId = 3, Nombre = "Nathalia Torres", Email =
    "nata@hotmail.com", Activo = false},

    new Cliente{ ClienteId = 1,

    Nombre = "Oscar Torres",

    Email = "oscart@hotmail.com",

    Activo = false,

    Ciudades = new List&lt;Ciudad&gt;(){

    new Ciudad { CiudadId = 1, Nombre = "Bogotá"},

    new Ciudad { CiudadId = 2, Nombre = "Cali"},

    new Ciudad { CiudadId = 3, Nombre = "Medellin"},

    new Ciudad { CiudadId = 3, Nombre = "Pereira"},

    }},

    new Cliente{ ClienteId = 5, Nombre = "Juan Ruiz", Email =
    "juanruiz@hotmail.com", Activo = true},

    new Cliente{ ClienteId = 6, Nombre = "Nathalia Torres", Email =
    "nata@hotmail.com", Activo = false},

    new Cliente{ ClienteId = 1,

    Nombre = "Sandra Aleman",

    Email = "s.aleman@hotmail.com",

    Activo = true,

    Ciudades = new List&lt;Ciudad&gt;(){

    new Ciudad { CiudadId = 1, Nombre = "Bogotá"},

    new Ciudad { CiudadId = 2, Nombre = "Cali"},

    }},

    new Cliente{ ClienteId = 8, Nombre = "Juan Ruiz", Email =
    "juanruiz@hotmail.com", Activo = true},

    new Cliente{ ClienteId = 9, Nombre = "Nathalia Torres", Email =
    "nata@hotmail.com", Activo = false}

    };
```

Ahora, la idea es realizar dos cambios en la plantilla:

* Si un cliente esta activo la fila será de un color naranja (o algo parecido) y si no está activo debe ser gris.

* Si un cliente ha visitado ciudades en la última celda de la fila las listaremos, de lo contrario se colocará el texto “-”.

[*JSRender*](http://borismoore.github.com/jsrender/demos/) nos provee
dos funciones, la primera es **if** para evaluar una condición y la
segunda es **for** para recorrer una colección (si muy al estilo de
C\#), entonces modificando un poco la definición de la plantilla para
cumplir con los dos requerimientos tenemos:

XAML

```
    &lt;script type="text/x-jsrender" id="DataTemplate"&gt;

    {{if Activo}}

    &lt;tr
    class='active'&gt;&lt;td&gt;{{:ClienteId}}&lt;/td&gt;&lt;td&gt;{{:Nombre}}&lt;/td&gt;&lt;td&gt;{{:Email}}&lt;/td&gt;&lt;td&gt;{{:Activo}}&lt;/td&gt;

    &lt;td&gt;

    {{if Ciudades}}

    {{for Ciudades}}

    &lt;p&gt;{{:Nombre}}&lt;/p&gt;

    {{/for}}

    {{else}}

    &lt;p&gt;-&lt;/p&gt;

    {{/if}}

    &lt;/td&gt;

    &lt;/tr&gt;

    {{else}}

    &lt;tr
    class='disable'&gt;&lt;td&gt;{{:ClienteId}}&lt;/td&gt;&lt;td&gt;{{:Nombre}}&lt;/td&gt;&lt;td&gt;{{:Email}}&lt;/td&gt;&lt;td&gt;{{:Activo}}&lt;/td&gt;

    &lt;td&gt;

    {{if Ciudades}}

    {{for Ciudades}}

    &lt;p&gt;{{:Nombre}}&lt;/p&gt;

    {{/for}}

    {{else}}

    &lt;p&gt;-&lt;/p&gt;

    {{/if}}

    &lt;/td&gt;

    &lt;/tr&gt;

    {{/if}}

    &lt;/script&gt;
```

Como se puede observar, lo primero que hacemos es evaluar el valor del
campo Activo con **{{if Activo}}** que devuelve true/false según sea,
también es posible hacer comparaciones como igual a, mayor o menor,
luego para las ciudades de nuevo tenemos un if pero observen el uso del
for en **{{for Ciudades}},** allí lo que hacemos es recorrer cada
elemento dentro de Ciudades y vamos mostrando el nombre. Finalmente si
ejecutamos lo que tenemos es algo como (no se fijen mucho en el diseño
ya que no es lo mío):

![] (./img/Condicionales-y-ciclos-en-JSRender/image1.png)

Espero les sea de utilidad el post, les dejo el código del ejemplo,
saludos!

[*Descarga el ejemplo!*](http://sdrv.ms/TsKI0m)




