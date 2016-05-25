  <properties
	pageTitle="[ASP.NET MVC] Estableciendo reglas de validación"
	description="Estableciendo reglas de validación"
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

  
  
#[ASP.NET MVC] Estableciendo reglas de validación
  

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Uno de los puntos más importantes cuando se realizan aplicaciones Web es
la de validar los datos ingresados por el usuario y todos aquellos datos
que se envían a la base de datos, y en este punto al framework [*ASP.NET
MVC*](http://www.asp.net/mvc) permite definir muchas validaciones
directamente en el modelo, y la ventaja de establecer estas reglas de
validación en el modelo es que automáticamente se realizará la
validación en el cliente como en el servidor, entonces vamos a revisar
todo el proceso de validación, así que vamos a iniciar creando una clase
que va actuar como nuestro modelo:

C\#


```
    public class Cliente

    {

    public int ClienteId { get; set; }

    public string Nombre { get; set; }

    public string Apellido { get; set; }

    public string Email { get; set; }

    public int Edad { get; set; }

    public string SitioWeb { get; set; }

    }
```

Ahora vamos a crear el controlador, en este caso solo vamos a definir
dos acciones:

C\#


```
    public class ClienteController : Controller

    {

    public ActionResult Index()

    {

    return View();

    }

    public ActionResult Create()

    {

    return View();

    }

    }
```

En el momento la lógica de las acciones de los controladores no es
importante, y ahora vamos a crear la vista para la acción Create:

C\#

```

    @model Validando\_Formularios.Models.Cliente

    @{

    ViewBag.Title = "Create";

    }

    &lt;h2&gt;Create&lt;/h2&gt;

    @using (Html.BeginForm()) {

    @Html.ValidationSummary(true)

    &lt;fieldset&gt;

    &lt;legend&gt;Cliente&lt;/legend&gt;

    &lt;div class="editor-label"&gt;

    @Html.LabelFor(model =&gt; model.Nombre)

    &lt;/div&gt;

    &lt;div class="editor-field"&gt;

    @Html.EditorFor(model =&gt; model.Nombre)

    @Html.ValidationMessageFor(model =&gt; model.Nombre)

    &lt;/div&gt;

    &lt;div class="editor-label"&gt;

    @Html.LabelFor(model =&gt; model.Apellido)

    &lt;/div&gt;

    &lt;div class="editor-field"&gt;

    @Html.EditorFor(model =&gt; model.Apellido)

    @Html.ValidationMessageFor(model =&gt; model.Apellido)

    &lt;/div&gt;

    &lt;div class="editor-label"&gt;

    @Html.LabelFor(model =&gt; model.Email)

    &lt;/div&gt;

    &lt;div class="editor-field"&gt;

    @Html.EditorFor(model =&gt; model.Email)

    @Html.ValidationMessageFor(model =&gt; model.Email)

    &lt;/div&gt;

    &lt;div class="editor-label"&gt;

    @Html.LabelFor(model =&gt; model.Edad)

    &lt;/div&gt;

    &lt;div class="editor-field"&gt;

    @Html.EditorFor(model =&gt; model.Edad)

    @Html.ValidationMessageFor(model =&gt; model.Edad)

    &lt;/div&gt;

    &lt;div class="editor-label"&gt;

    @Html.LabelFor(model =&gt; model.SitioWeb)

    &lt;/div&gt;

    &lt;div class="editor-field"&gt;

    @Html.EditorFor(model =&gt; model.SitioWeb)

    @Html.ValidationMessageFor(model =&gt; model.SitioWeb)

    &lt;/div&gt;

    &lt;p&gt;

    &lt;input type="submit" value="Create" /&gt;

    &lt;/p&gt;

    &lt;/fieldset&gt;

    }

    &lt;div&gt;

    @Html.ActionLink("Back to List", "Index")

    &lt;/div&gt;

    @section Scripts {

    @Scripts.Render("\~/bundles/jqueryval")

    }
```

Y ahora si ejecutamos la aplicación y damos click en el botón Create nos
damos cuenta que no existe ninguna validación… ahora como la idea es
realizar la validación de los campos vamos a hacer uso de **Data
Annotations**, en resumen **Data Annotations** lo que nos permite es
establecer ciertas reglas para cada una de nuestras propiedades,
entonces si modificamos la clase cliente y añadimos algunas reglas lo
que tenemos es:

C\#


```
    public class Cliente

    {

    public int ClienteId { get; set; }

    \[Required(ErrorMessage="El nombre es requerido")\]

    \[Display(Name="Nombre Completo", Description="xxxxx")\]

    public string Nombre { get; set; }

    \[Required(ErrorMessage = "El apellido es requerido")\]

    public string Apellido { get; set; }

    \[Required(ErrorMessage = "El email es requerido")\]

    \[EmailAddress(ErrorMessage = "El email no tiene el formato
    correcto")\]

    public string Email { get; set; }

    \[Required(ErrorMessage = "La edad es requerida")\]

    \[Range(12,50,ErrorMessage="La edad debe estar entre los 12 y los 50
    años")\]

    public int Edad { get; set; }

    \[Required(ErrorMessage="El sitio Web es requerido")\]

    \[Url(ErrorMessage="La dirección del sitio Web no es válida")\]

    public string SitioWeb { get; set; }

    }
```

Revisando la clase y sus propiedades, tenemos algunas reglas
establecidas:

-   Required: Especifíca que el valor es requerido

-   Display: El texto relacionado al campo, este será el texto del label
   que acompaña a la caja de texto.

-   Range: Permite definir un rango de valores aceptados.

-   EmailAddress: Valida que el valor ingresado tenga el formato
   correcto de una dirección de correo electrónico.

-   Url: Valida que el valor ingresado sea una URL con formato valido.

Cada una de las anteriores opciones, permiten parametrizar el texto que
se muestra cuando el valor ingresado es incorrecto o no cumple las
reglas definidas, esto se logra dando un valor al atributo
**ErrorMessage**.

Ahora, si lanzamos la aplicación y damos en Create las reglas
establecidas se disparan y podemos ver los errores encontrados:


![] (./img/Estableciendo-reglas-devalidacion/image1.png)


![] (./img/Estableciendo-reglas-devalidacion/image2.png)

Y como se ve en las imágenes, las reglas definidas en el modelo
funcionan perfectamente.

Posteriormente vamos a revisar como podemos crear atributos de
validación personalizados.

Espero les sea de utilidad el post… Saludos!
