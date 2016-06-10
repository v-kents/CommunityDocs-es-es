---
title: [ASP.NET Web API] Subiendo archivo con jQuery y Web API
description: Subiendo archivo con jQuery y Web API
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: web-dev
ms.custom: CommunityDocs
---







#[ASP.NET Web API] Subiendo archivo con jQuery y Web API

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola, hoy quiero mostrarles cómo podemos subir archivos al servidor
utilizando jQuery y un servicio con [ASP.NET Web
API](http://julitogtu.com/category/asp-net-web-api/).

Lo primero es que vamos a definir el código HTML, lo importante es
definir un **input** de tipo **file**:

```
    &lt;div class="jumbotron"&gt;

    &lt;h1&gt;ASP.NET Web API - File Upload&lt;/h1&gt;

    &lt;div class="row"&gt;

    &lt;div class="col-md-12" style="font-size:medium"&gt;

    &lt;div class="form-group"&gt;

    &lt;label class="col-md-2 control-label"&gt;Archivo:&lt;/label&gt;

    &lt;div class="col-md-10"&gt;

    &lt;input id="inputFile" type="file" multiple="multiple" /&gt;

    &lt;/div&gt;

    &lt;/div&gt;

    &lt;div class="form-group"&gt;

    &lt;div class="col-md-offset-2 col-md-10"&gt;

    &lt;input type="submit" value="Subir" id="btnUpload" class="btn
    btn-default" /&gt;

    &lt;/div&gt;

    &lt;/div&gt;

    &lt;/div&gt;

    &lt;/div&gt;

    &lt;/div&gt;
```

Ahora vamos a implementar la parte de JavaScript, en este caso vamos a
asociar un manejador para el evento clic del botón **btnUpload** y allí
dentro haremos uso de AJAX para comunicarnos con el servidor:

```
    \$(document).on("ready", function () {

    \$("\#btnUpload").on('click', function () {

    var files = \$("\#inputFile").get(0).files;

    var data = new FormData();

    for (i = 0; i &lt; files.length; i++) {

    data.append("file" + i, files\[i\]);

    }

    \$.ajax({

    type: "POST",

    url: "/api/file",

    contentType: false,

    processData: false,

    data: data,

    success: function (result) {

    if (result)

    {

    alert('Archivos subidos correctamente');

    \$("\#inputFile").val('');

    }

    }

    });

    })

    })
```

Lo que el código anterior hace es:

1.  Obtiene la colección de archivos seleccionados.

2.  Crea un nuevo objeto FormData y añade los archivos seleccionados

3.  Se realiza la petición al servidor utilizando AJAX (en este caso
    apoyados en [jQuery](http://julitogtu.com/category/jquery/)), en URL
    definimos la URL del servicio (que vamos a crear en el siguiente
    paso), el verbo Http que es un POST y los datos a enviar.

Ahora el controlador:

```
    public class FileController : ApiController

    {

    public IHttpActionResult Post()

    {

    var request = HttpContext.Current.Request;

    if (request.Files.Count &gt; 0)

    {

    foreach (string file in request.Files)

    {

    var postedFile = request.Files\[file\];

    var filePath =
    HttpContext.Current.Server.MapPath(string.Format("\~/Uploads/{0}",
    postedFile.FileName));

    postedFile.SaveAs(filePath);

    }

    return Ok(true);

    }

    else

    return BadRequest();

    }

    }
```

El código del controlador es sencillo, simplemente leemos la cantidad de
archivos en el request y en caso de ser mayor a 0 iteramos sobre cada
uno de ellos y lo guardamos.

Espero el ejemplo les sea de utilidad, ¡saludos!


