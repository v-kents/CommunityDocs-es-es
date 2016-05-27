<properties
	pageTitle="WPF – Hacer tus aplicaciones con tamaño de fuente responsive"
	description="WPF – Hacer tus aplicaciones con tamaño de fuente responsive"
	services="win-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="win-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>



#WPF – Hacer tus aplicaciones con tamaño de fuente responsive

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io


Cambiar el tamaño de la fuente a medida que el control cambia de tamaño
es una tarea frecuente y necesaria para una aplicación 'responsive', sin
embargo en el caso de WPF pero esta pobremente documentado el Cómo
hacerlo, en este articulo esta la respuesta.

Este es uno de esos temas…

Puedes pasar horas buscando diferentes alternativas alrededor de la web,
encontraras cosas como\
•ViewBox •FontSizeConverter •IValueConverter •etc.

Nada de eso funciona al menos no como se espera, aunque según el caso
pueden dar una buena aproximación a la solución.

He escrito este artículo para ayudar a muchos desarrolladores (y
diseñadores) a resolver este problema de manera definitiva.

###CÓMO REALIZAR EL CÁLCULO DE TAMAÑO DE FUENTE


Dado que las fuentes, en su mayoría, son más altas que anchas es
importante entonces que usemos como referencia la propiedad **Height**
del control contenedor para definir el tamaño de la fuente con respecto
a su dimensión más grande.

El alto de la fuente esta dictado por la medición de tres partes
básicas:

1.  Ascendente

2.  Descendente

3.  Separación

Observando esta gráfica es fácil hacerse una mejor idea:

![] (./img/Aplicaciones-con-fuente-responsive/image2.png)

La clase **FontFamily** en WPF posee la propiedad **LineSpacing**, la
cual es ni más ni menos que el alto total de la fuente de acuerdo a los
parámetros anteriormente citados.

Sin embargo esto no es todo, la propiedad LineSpacing es un valor
genérico para la FontFamily sin importar el tamaño actual de la fuente
utilizada, es decir este atributo nos da una relación proporcional
respecto al tamaño de la fuente en unidades **em**.

Por ende podemos decir que el alto de una fuente en unidades em es

>C\#


```
    Alto = tamaño fuente \* FontFamily.LineSpacing;
```
Eso es correcto, pero nosotros no necesitamos calcular el alto de la
fuente, sino *calcular el tamaño de la fuente con respecto al **Height**
del contenedor* ( Button, Window etc), en ese caso la formula a utilizar
sería:

>C\#


```
    TamañoFuente = Alto / FontFamily.LineSpacing
```
####IMPLEMENTACIÓN


Creamos una ventana de WPF con el siguiente código

>C\#

```

    &lt;Window x:Class="AutoScaleFont.MainWindow"

    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"

    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"

    Title="MainWindow" Height="350" Width="525"&gt;

    &lt;DockPanel&gt;

    &lt;Label HorizontalContentAlignment="Center"
    VerticalContentAlignment="Center"

    SizeChanged="Control\_SizeChanged"&gt;

    Test&lt;/Label&gt;

    &lt;/DockPanel&gt;

    &lt;/Window&gt;
```



En el archivo de código creamos el controlador para el evento
**SizeChanged**.

>C\#

```
    private void Control\_SizeChanged(object sender,
    SizeChangedEventArgs e)

    {

    Control tmp = sender as Control;

    tmp.FontSize = e.NewSize.Height / tmp.FontFamily.LineSpacing;

    }
```

El código se explica a si mismo, sin embargo haré una ampliación breve.

Establecemos la propiedad **FontSize** de acuerdo a la formula explicada
más arriba, tomamos el nuevo **Alto** del control y lo dividimos en la
propiedad **LineSpacing** del **FontFamily** utilizado por el control.

Una optimización adicional es hacer que el alto de la fuente sea
calculado con un valor levemente menor al del control contenedor para
dejar un espacio de margen, con el ánimo de hacerlo proporcional le
restamos solo un porcentaje respecto al alto total, en este caso el 5%,
quedando así:

>C\#

```

    private void Control\_SizeChanged(object sender,
    SizeChangedEventArgs e)

    {

    Control tmp = sender as Control;

    tmp.FontSize = (e.NewSize.Height - e.NewSize.Height \* .05d) /
    tmp.FontFamily.LineSpacing;

    }
```

Iniciemos la ejecución y revisemos el resultado:

![] (./img/Aplicaciones-con-fuente-responsive/image3.png)

![] (./img/Aplicaciones-con-fuente-responsive/image4.png)

¡Funcionó perfecto!

Si lo deseas puedes hacerlo respecto al ancho del control en lugar de
respecto al alto, según sea tu necesidad, en ese caso debes ayudarte con
la clase FormattedText y su propiedad Width para hallar el largo total
en pixeles de la cadena.
