<properties
	pageTitle="[ASP.NET MVC] Implementando el helper chart de Kendo UI"
	description="Implementando el helper chart de Kendo UI"
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



#[ASP.NET MVC] Implementando el helper chart de Kendo UI

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


[Descarga el
código](https://github.com/julitogtu/kendoui/tree/helpers/KendoUIChartMvcWrapper)

Hola a todos, hoy quiero mostrarles como es de sencillo crear un chart
utilizando los helpers de Kendo UI para ASP.NET MVC, lo primero es
referenciar la dll Kendo.Mvc:

![] (./img/Implementando-el-helper-chart-de-Kendo-UI/image1.png)

Luego los archivos JavaScript y CSS:

![] (./img/Implementando-el-helper-chart-de-Kendo-UI/image2.png)

Creamos los bundles correspondientes en la clase **BundleConfig**:

C\#

```
    bundles.Add(new ScriptBundle("\~/bundles/kendo").Include(

    "\~/Scripts/kendo/kendo.all.min.js",

    "\~/Scripts/kendo/kendo.aspnetmvc.min.js"));

    bundles.Add(new StyleBundle("\~/Content/kendocss").Include(

    "\~/Content/kendo.common.min.css",

    "\~/Content/kendo.flat.min.css",

    "\~/Content/kendo.dataviz.flat.min.css"));
```

Y los referenciamos en la sección head del layout:

 C\#

```   

    @Styles.Render("\~/Content/css")

    @Styles.Render("\~/Content/kendocss")

    @Scripts.Render("\~/bundles/modernizr")

    @Scripts.Render("\~/bundles/jquery")

    @Scripts.Render("\~/bundles/bootstrap")

    @Scripts.Render("\~/bundles/kendo")
```

Ahora, un sencillo modelo:

```

   public class Values

    {

    public int Id { get; set; }

    public int Value { get; set; }

    public DateTime Date { get; set; }

    }
```

Luego en el controlador retornamos una colección de elementos:

   C\#

```
    public class HomeController : Controller

    {

    private List&lt;Values&gt; values = new List&lt;Values&gt;()

    {

    new Values (){ Id = 1, Date = DateTime.Now, Value = 10},

    new Values (){ Id = 2, Date = DateTime.Now.AddMinutes(10), Value =
    5},

    new Values (){ Id = 2, Date = DateTime.Now.AddMinutes(20), Value =
    15},

    new Values (){ Id = 2, Date = DateTime.Now.AddMinutes(30), Value =
    0},

    new Values (){ Id = 2, Date = DateTime.Now.AddMinutes(40), Value =
    20}

    };

    public ActionResult Index()

    {

    return View(values);

    }

    }
```

Y finalmente la vista:

C\#


```
    @using Kendo.Mvc.UI;

    @model IEnumerable&lt;KendoUIChartMvcWrapper.Models.Values&gt;

    @{

    ViewBag.Title = "Index";

    }

    @(Html.Kendo().Chart(Model)

    .Name("chart")

    .Title("Kendo UI Chart")

    .Legend(legend =&gt; legend

    .Position(ChartLegendPosition.Bottom)

    )

    .ChartArea(chartArea =&gt; chartArea

    .Background("transparent")

    )

    .SeriesDefaults(seriesDefaults =&gt;

    seriesDefaults.Line()

    )

    .Series(series =&gt;

    {

    series.Line(model =&gt; model.Value)

    .Name("Cantidad")

    .Labels(true)

    .Opacity(0.8);

    })

    .CategoryAxis(axis =&gt; axis

    .Categories(model =&gt; model.Date)

    .MajorGridLines(lines =&gt; lines.Visible(false))

    .Labels(labels =&gt; labels.Rotation(-90))

    .Date()

    .BaseUnitStep(10)

    .MinorGridLines(lines =&gt; lines.Visible(true))

    )

    .Tooltip(tooltip =&gt; tooltip

    .Visible(true)

    .Format("{0}")

    )

    )
```

En la vista hacemos uso del helper **Html.Kendo().Chart(Model)** y
simplemente le pasamos el modelo que estamos usando, que en este caso es
una colección de elementos, luego solo parametrizamos algunas
propiedades del helper como el nombre (Name), el título (Title) entre
otras…. y finalmente el resultado:

![] (./img/Implementando-el-helper-chart-de-Kendo-UI/image3.png)

Espero les sea interesante, ¡saludos!
