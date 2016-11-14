---
title: Modern UI Tip- Crear un control de rating
description: Modern UI Tip- Crear un control de rating
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Modern UI Tip: Crear un control de rating 

Por **Josue Yeray Julian Ferreiro**


¡Hola a todos!

En las aplicaciones se ha puesto muy de moda usar un control de rating
para indicar la valoración de un elemento en concreto:


![] (./img/Windows-Modern-UI-Tip-control-de-rating/image1.png)

Si estamos desarrollando nuestra aplicación para Windows 8 en HTML5/JS
disponemos de serie de un control de rating pero si por el contrario la
estamos desarrollando usando XAML/C\# este control no existe. En
internet hay varios controles listos para descargar, pero si lo único
que necesitamos es mostrar la valoración de un elemento, es realmente
sencillo construirnos nosotros mismos uno usando una simple
**ProgressBar** y el resultado es increíble.

Lo primero que necesitamos es crear un nuevo proyecto en blanco para
Windows 8:


![] (./img/Windows-Modern-UI-Tip-control-de-rating/image2.png)

En la página en blanco que nos crea añadimos una **ProgressBar** cuyo
mínimo sea 0 y su máximo 5 y le asignamos un valor de 3:

```
    &lt;Grid Background="{StaticResource
    ApplicationPageBackgroundThemeBrush}"&gt;
    &lt;ProgressBar Minimum="0" Maximum="5"
    Value="3"
    Foreground="White"
    VerticalAlignment="Center"
    HorizontalAlignment="Center"
    Width="300" Height="45"&gt;
    &lt;/ProgressBar&gt;
    &lt;/Grid&gt;
```

El resultado será el siguiente:


![] (./img/Windows-Modern-UI-Tip-control-de-rating/image3.png)

Mmmm, no es demasiado espectacular, de hecho no se parece absolutamente
en nada a un control de rating (salvo por el color blanco…) Vamos a
corregir esto, todo elemento en XAML tiene una propiedad **Template** en
la que podemos indicar la plantilla con la que se dibuja el control. En
el caso en particular de la **ProgressBar** además, hay un hecho
particular, el código interno del control busca un elemento con el
nombre “**ProgressBarIndicator**”, al encontrarlo, usará las propiedades
**minimum**, **maximum** y **value** para calcular el porcentaje del
elemento que debe estar visible y cortar el resto. Siguiendo este
razonamiento, podríamos hacer algo parecido a esto:


```
    &lt;ControlTemplate&gt;
    &lt;Viewbox HorizontalAlignment="Left"&gt;
    &lt;Grid&gt;
    &lt;TextBlock Text="Hello!" Foreground="White" Opacity=".5"
    HorizontalAlignment="Left"&gt;&lt;/TextBlock&gt;
    &lt;TextBlock Text="Hello!" Name="ProgressBarIndicator"
    Foreground="White" HorizontalAlignment="Left"&gt;&lt;/TextBlock&gt;
    &lt;/Grid&gt;
    &lt;/Viewbox&gt;
    &lt;/ControlTemplate&gt;
```

Hemos indicado dos **textblocks**, uno de ellos con el nombre
**ProgressBarIndicator** y color blanco, el otro con color blanco y
opacidad del 50% y los hemos metido dentro de un **ViewBox** para que
los textos se ajusten al tamaño del **ProgressBar**, ¿El resultado?


![] (./img/Windows-Modern-UI-Tip-control-de-rating/image4.png)

**Voilá**! nuestra barra ahora parece que rellena las letras de la
palabra Hello!. Simplemente cambiando el **Template** de la
**ProgressBar** lo hemos conseguido, pero sigue sin parecerse a un
control rating, vamos a por nuestro último truco: Vamos a indicarle a
los **TextBlocks** que usen la **fuente Wingdings** que viene de serie
con Windows y vamos a abrir la **aplicación Character Map** para ver los
caracteres que nos ofrece, en concreto yo he escogido dos:


![] (./img/Windows-Modern-UI-Tip-control-de-rating/image5.png)

La ventaja de usar fuentes en lugar de imágenes es una principalmente:
Escalabilidad, las fuentes soportan escalar a altas resoluciones
normalmente mucho mejor que cualquier imagen y el sistema de dibujado de
XAML es más eficiente dibujando texto que imágenes.

Ahora vamos a cambiar los textos para que el primero sea cinco veces la
estrella con círculo y el segundo sea cinco veces la estrella sin
círculo:


```
    &lt;ControlTemplate&gt;
    &lt;Viewbox HorizontalAlignment="Left"&gt;
    &lt;Grid&gt;
    &lt;TextBlock Text="µµµµµ" FontFamily="Wingdings"
    Foreground="White" Opacity=".5"
    HorizontalAlignment="Left"&gt;&lt;/TextBlock&gt;
    &lt;TextBlock Text="«««««" FontFamily="Wingdings"
    Name="ProgressBarIndicator" Foreground="White"
    HorizontalAlignment="Left"&gt;&lt;/TextBlock&gt;
    &lt;/Grid&gt;
    &lt;/Viewbox&gt;
    &lt;/ControlTemplate&gt;
```

Y el resultado final:

![] (./img/Windows-Modern-UI-Tip-control-de-rating/image6.png)

Ahora sí! es como el control rating de siempre, permite rellenar
parcialmente las estrellas y todo esto con 8 líneas de XAML y 0 de C\#,
también podemos poner el mismo carácter en ambos **TextBlocks** para que
sea más parecido al Rating original e incluso cambiar el color:

![] (./img/Windows-Modern-UI-Tip-control-de-rating/image7.png)

Es tan sencillo de hacer que es una muestra clara de la versatilidad de
XAML y su arquitectura de extensibilidad visual de elementos. En total,
nuestra página MainPage.xaml tiene el siguiente código:


```
    &lt;Page
    x:Class="Win8rating.MainPage"
    IsTabStop="false"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:Win8rating"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"&gt;
    &lt;Grid Background="{StaticResource
    ApplicationPageBackgroundThemeBrush}"&gt;
    &lt;ProgressBar Minimum="0" Maximum="5"
    Value="4"
    Foreground="White"
    VerticalAlignment="Center"
    HorizontalAlignment="Center"
    Width="300" Height="75"&gt;
    &lt;ProgressBar.Template&gt;
    &lt;ControlTemplate&gt;
    &lt;Viewbox HorizontalAlignment="Left"&gt;
    &lt;Grid&gt;
    &lt;TextBlock Text="«««««" FontFamily="Wingdings"
    Foreground="White" Opacity=".5"
    HorizontalAlignment="Left"&gt;&lt;/TextBlock&gt;
    &lt;TextBlock Text="«««««" FontFamily="Wingdings"
    Name="ProgressBarIndicator" Foreground="Gold"
    HorizontalAlignment="Left"&gt;&lt;/TextBlock&gt;
    &lt;/Grid&gt;
    &lt;/Viewbox&gt;
    &lt;/ControlTemplate&gt;
    &lt;/ProgressBar.Template&gt;
    &lt;/ProgressBar&gt;
    &lt;/Grid&gt;
    &lt;/Page&gt;
```

**DISCLAIMER**: Esto es un ejemplo muy concreto, por eso he puesto el
ControlTemplate dentro del propio ProgressBar. ¡Esto NUNCA debe hacerse
en una aplicación real, siempre a un diccionario de estilos!

[***Aquí***](https://skydrive.live.com/redir?resid=FD100135B82F3364!730)
os dejo el código de ejemplo como siempre para que juguéis con él.

Un saludo y Happy Coding!




