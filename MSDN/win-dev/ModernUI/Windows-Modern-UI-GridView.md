---
title: Modern UI-  GridView
description: Modern UI-  GridView
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Modern UI:  GridView

Por **Josue Yeray Julian Ferreiro**


¡Hola a todos!

Hoy quiero que hablemos de uno de los nuevos controles que tenemos
disponibles en Windows 8. Estamos hablando del control GridView, que es
responsable de gran parte del look & feel de las aplicaciones Modern UI:

![] (./img/Windows-Modern-UI-GridView/image1.png)

Tanto es así que incluso la tienda oficial de Windows 8 se basa en un
GridView para presentarnos la información. Como podemos observar en la
imagen superior, tenemos grupos de datos (spotlight, games,…) que
contienen elementos. Además todo se organiza con un scroll horizontal en
vez del típico scroll vertical al que estamos acostumbrados cuando los
datos no entran en la pantalla. La estructura de este elemento es algo
más compleja que un simple **ListBox**:

![] (./img/Windows-Modern-UI-GridView/image2.png)

Como podemos observar, en el GridView la información se organiza en
grupos que contienen una cabecera y elementos. Lo mejor de esto es que
podemos definir el aspecto de la cabecera y el aspecto de los elementos,
de hecho, según podemos ver en la imagen anterior, incluso podemos
definir distintos aspectos para elementos dentro de un mismo grupo. Esto
nos exige que los datos que enviemos a nuestra GridView estén agrupados.
Vamos a definir unos datos de ejemplo, primero una clase que contendrá
cada item y otra que creará los grupos:


```
    public class ExampleData
    {
        public ExampleData()
        {
        }
        public string Title { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
    }
    public class DataGroup
    {
        public DataGroup()
        {
        }
        public string GroupTitle { get; set; }
        public ObservableCollection&lt;ExampleData&gt; Items { get; set;
        }
    }
```

Como podemos ver, **ExampleData** contiene un título, una descripción y
una imagen, mientras que **DataGroup** nos ofrece un título para el
grupo (que usaremos en la cabecera del mismo) y una colección de
ExampleData.

Ahora en nuestra **ViewModel** vamos a crear datos de ejemplo:


```
    Data = new ObservableCollection&lt;DataGroup&gt;()
    {
        new DataGroup()
        {
        GroupTitle = "SciFi Movies",
        Items = new ObservableCollection&lt;ExampleData&gt;()
        {
            new ExampleData()
            {
                Title = "Blade Runner",
                Description = "Deckard, a blade runner, ...",
                Image = "http://pics.filmaffinity.com/Blade\_Runner-351607743-large.jpg"
            }, new ExampleData()
            {
                Title = "Terminator 2",
                Description = "The cyborg who once tried to kill ...",
                Image = "http://pics.filmaffinity.com/Terminator\_2\_el\_juicio\_final-825143697-large.jpg"
            }, new ExampleData()
            {
                "Judge Dreed",
                Description = "In a dystopian future, ...",
                Image = "http://pics.filmaffinity.com/Juez\_Dredd-447589318-large.jpg"
            }
        }
    }, new DataGroup()
    {
        GroupTitle = "SciFi Books",
        Items = new ObservableCollection&lt;ExampleData&gt;()
        {
            new ExampleData()
            {
                Title = "Foundation",
                Description = "The Foundation Series is ...",
                Image = "http://isaac-asimov.com/wp-content/uploads/2012/01/Isaac-Asimov\_1951\_Foundation.jpg"
            },
            new ExampleData()
            {
                Title = "Ender's Game",
                Description = "Set in Earth's future, ...",
                Image = "http://www.hung-truong.com/blog/wp-content/uploads/2009/11/ender.gif"
            }
            }
        }
    };
```

Con estos datos tenemos dos grupos, uno para películas y otro para
libros, ambos de ciencia ficción. Para que el GridView pueda usar estos
grupos tenemos que usar como fuente de datos un CollectionViewSource que
podemos definir en nuestra página XAML:

```
    &lt;Grid.Resources&gt;
    &lt;CollectionViewSource x:Name="groupedItemsViewSource"
    Source="{Binding Data}"
    IsSourceGrouped="true" ItemsPath="Items" /&gt;
    &lt;/Grid.Resources&gt;
```

Simplemente le asignamos un nombre, le indicamos el binding a la
propiedad Data de nuestra ViewModel y le decimos que está agrupado **y
cuál es la propiedad que contiene los items de cada grupo**. Ahora ya
solo tenemos que añadir a nuestra página un GridView e indicarle que
obtenga los datos del CollectionViewSource que hemos llamado
**groupedItemsViewSource**:


```
    &lt;GridView ItemsSource="{Binding Source={StaticResource
    groupedItemsViewSource}}"&gt;
    &lt;/GridView&gt;
```

Si ejecutamos la aplicación el resultado será bastante pobre, una lista
de nuestros items sin división y sin ningún formato. Esto es así porque
necesitamos indicarle como debe crear y presentar los grupos mediante
tres propiedades:

**ItemsPanel**, que definirá el modo de colocar los grupos:


```
    &lt;GridView.ItemsPanel&gt;
    &lt;ItemsPanelTemplate&gt;
    &lt;StackPanel Orientation="Horizontal"/&gt;
    &lt;/ItemsPanelTemplate&gt;
    &lt;/GridView.ItemsPanel&gt;
```

**GroupStyle.HeaderTemplate**, que definirá el estilo de la cabecera de
cada grupo:


```
    &lt;GroupStyle.HeaderTemplate&gt;
    &lt;DataTemplate&gt;
    &lt;Grid Margin="1,0,0,6"&gt;
    &lt;Button AutomationProperties.Name="Group Title"
    Content="{Binding GroupTitle}"
    Style="{StaticResource TextButtonStyle}"/&gt;
    &lt;/Grid&gt;
    &lt;/DataTemplate&gt;
    &lt;/GroupStyle.HeaderTemplate&gt;
```

Y por último, GroupStyle.Panel, que definirá el panel donde se colocarán
los elementos del grupo:

```
    &lt;GroupStyle.Panel&gt;
    &lt;ItemsPanelTemplate&gt;
    &lt;VariableSizedWrapGrid Orientation="Vertical"
    Margin="0,0,80,0"/&gt;
    &lt;/ItemsPanelTemplate&gt;
    &lt;/GroupStyle.Panel&gt;
```

Si una vez definidas estas propiedades ejecutamos nuestra aplicación ya
podremos observar los grupos conteniendo sus respectivos elementos:

![] (./img/Windows-Modern-UI-GridView/image3.png)

 

###Algo de estilo…


Aunque todavía no se puede decir que sea demasiado espectacular, nos
falta definir la propiedad **ItemTemplate** que indicará al GridView
como mostrar cada elemento:


```
    &lt;GridView.ItemTemplate&gt;
    &lt;DataTemplate&gt;
    &lt;Grid Width="200" Height="300"&gt;
    &lt;Rectangle Fill="White"&gt;&lt;/Rectangle&gt;
    &lt;Image Source="{Binding Image}" Opacity=".5"
    Stretch="Fill"&gt;&lt;/Image&gt;
    &lt;TextBlock Foreground="White" Text="{Binding Title}"
    VerticalAlignment="Bottom"&gt;&lt;/TextBlock&gt;
    &lt;/Grid&gt;
    &lt;/DataTemplate&gt;
    &lt;/GridView.ItemTemplate&gt;
```

Vamos a usar las propiedades **Image** y **Title** para mostrar
información sobre nuestro elemento, el resultado final ahora:

![] (./img/Windows-Modern-UI-GridView/image4.png)

Sin duda mucho mejor. Como hemos visto es muy fácil poder usar un
elemento **GridView** para mostrar nuestros datos, pero… en el ejemplo
de la Store, los elementos tenían diferentes aspectos, tamaño, etc… y en
nuestro ejemplo son todos iguales. Esto podemos resolverlo usando una
propiedad del GridView llamada **ItemTemplateSelector** la cual recibirá
cada elemento y devolverá un **DataTemplate** que se usará para
mostrarlo. Lo primero que vamos a hacer es modificar nuestra clase
**ExampleData** para que tenga una propiedad **ItemType** de tipo entero
y que indicará el tipo 1 para las películas y el tipo 2 para los libros.

Ahora vamos a crear dos **DataTemplate** diferentes para nuestros
elementos, una para películas y otra para libros:


```
    &lt;DataTemplate x:Key="MoviesTemplate"&gt;
    &lt;Grid Width="300" Height="250" Background="\#33CCCCCC"&gt;
    &lt;Grid.ColumnDefinitions&gt;
    &lt;ColumnDefinition Width="160"&gt;&lt;/ColumnDefinition&gt;
    &lt;ColumnDefinition&gt;&lt;/ColumnDefinition&gt;
    &lt;/Grid.ColumnDefinitions&gt;
    &lt;Image Grid.Column="0" Source="{Binding Image}"
    Stretch="Fill"&gt;&lt;/Image&gt;
    &lt;TextBlock Grid.Column="1" Margin="10,10,0,0"
    Foreground="White" Text="{Binding Title}"
    FontWeight="Bold" FontSize="20"
    TextWrapping="Wrap"&gt;
    &lt;/TextBlock&gt;
    &lt;TextBlock Grid.Column="1" Margin="10,80,0,0"
    Foreground="White" Text="{Binding Description}"
    FontWeight="Light" FontSize="18"
    TextWrapping="Wrap" TextTrimming="WordEllipsis"&gt;
    &lt;/TextBlock&gt;
    &lt;/Grid&gt;
    &lt;/DataTemplate&gt;
    &lt;DataTemplate x:Key="BooksTemplate"&gt;
    &lt;Grid Width="600" Height="180" Background="\#CCFFD073"&gt;
    &lt;Grid.ColumnDefinitions&gt;
    &lt;ColumnDefinition Width="100"&gt;&lt;/ColumnDefinition&gt;
    &lt;ColumnDefinition&gt;&lt;/ColumnDefinition&gt;
    &lt;/Grid.ColumnDefinitions&gt;
    &lt;Image Grid.Column="0" Source="{Binding Image}"
    Stretch="Fill"&gt;&lt;/Image&gt;
    &lt;TextBlock Grid.Column="1" Margin="10,10,0,0"
    Foreground="White" Text="{Binding Title}"
    FontWeight="Bold" FontSize="20"
    TextWrapping="Wrap"&gt;
    &lt;/TextBlock&gt;
    &lt;TextBlock Grid.Column="1" Margin="10,45,0,0"
    Foreground="White" Text="{Binding Description}"
    FontWeight="Light" FontSize="18"
    TextWrapping="Wrap" TextTrimming="WordEllipsis"&gt;
    &lt;/TextBlock&gt;
    &lt;/Grid&gt;
    &lt;/DataTemplate&gt;
```

En la primera **DataTemplate**, MoviesTemplate, vamos a darle más
importancia a la imagen, dejando menos espacio para texto. En la segunda
**DataTemplate**, BooksTemplate, vamos a mostrar más información del
texto del libro. Para decidir que **DataTemplate** asignar a cada
elemento, vamos a crear una clase que herede de la base
**DataTemplateSelector** del namespace **WIndows.UI.Xaml.Controls** y
sobre escribimos el método **SelectTemplateCore**:


```
    public class TemplateSelector : DataTemplateSelector
    {
        public DataTemplate MovieTemplate { get; set; }
        public DataTemplate BookTemplate { get; set; }
        protected override DataTemplate SelectTemplateCore(object item, DependencyObject container)
        {
            if (item == null)
            return null;
            ExampleData element = (ExampleData)item;
            if (element.ItemType == 1)
            return MovieTemplate;
            else
            return BookTemplate;
        }
    }
```

Lo primero que hacemos en esta clase es crear dos propiedades públicas
de tipo **DataTemplate** en las que podemos indicar las
**DataTemplates** que hemos creado previamente, luego en el método
**SelectTemplateCore** recibimos el elemento que necesita una plantilla
y el contenedor de ese elemento, es en este método en el que podemos
decidir que plantilla usar.

¿El resultado? A continuación…

![] (./img/Windows-Modern-UI-GridView/image5.png)

Mucho mejor así, cada tipo de elemento tiene su representación única,
que podemos ajustar para resaltar las propiedades más importantes.

###Respondiendo al usuario


Ahora que ya sabemos cómo trabajar con el estilo de nuestros elementos,
es hora de ver como recibir órdenes desde los elementos. Tenemos que
tener en cuenta dos situaciones: que un usuario haga un “Tap” (un clic)
en un elemento o que lo seleccione (con un clic derecho o con el gesto
de pulsar y arrastrar que usamos en el menú inicio). Es importante tener
en cuenta que debemos manejar los eventos tanto con el ratón como con
entrada táctil.

En este aspecto hay mucha controversia por internet en los foros sobre
WinRT. El elemento **GridView** (y el **ListView** también) tiene
algunos comportamientos extraños entre el evento **click**, la propiedad
**SelectedItem** y el evento **tapped**/**righttapped**. Después de
buscar y buscar, la solución pasa por un poco de **code behind. **

En primer lugar podemos indicar la propiedad SelectedItem del GridView
para obtener el elemento seleccionado por el usuario haciendo uso del
gesto de seleccionar o del click derecho del ratón:


```
    1.  1: &lt;GridView x:Name="grdView" ItemsSource="{Binding Source={StaticResource groupedItemsViewSource}}"
    SelectionMode="Single"
    ItemTemplateSelector="{StaticResource GridViewTemplateSelector}"
    SelectedItem="{Binding SelectedData, Mode=TwoWay}"
    Margin="120,140,20,20"&gt;
```

De esta forma si probamos nuestra aplicación veremos que, tanto si
hacemos click como click derecho, se selecciona un elemento y llega el
mismo a nuestra propiedad **SelectedData**. Pero nosotros ahora queremos
que al hacer click sobre un elemento no se seleccione, queremos que nos
permita ejecutar, por ejemplo la navegación a los detalles de ese
elemento. Aquí entra en funcionamiento el code behind, debemos manejar
el evento **Tapped** de la grid del elemento (**DataTemplate**),
ejecutar el código que deseemos y marcar el evento como Handled, de esta
forma no se seguirá propagando y no se seleccionará ese mismo elemento:

```
    private async void element\_tapped(object sender, TappedRoutedEventArgs e)
    {
        e.Handled = true;
        MessageDialog dlg = new MessageDialog("Clicked!");
        await dlg.ShowAsync();
    }
```

De esta forma al hacer Tap, tanto con ratón como con interface táctil
obtendremos este mensaje y no se seleccionará el elemento:

![] (./img/Windows-Modern-UI-GridView/image6.png)

Podemos evitar el uso de **Code behind** en cierta medida implementando
un **EventToCommand**. En Silverlight o WPF era realmente sencillo
mediante el uso de **Behaviors** y **Triggers**, pero en WinRT nada de
esto está disponible. Esto hace que la implementación de
**EventToCommand** sea algo más complicada, pero podemos encontrar un
ejemplo muy bueno en el blog de **Joost van Schaik, [*NET By
example*](http://dotnetbyexample.blogspot.com.es/2012/07/a-winrt-behavior-to-mimic-eventtocommand.html),**
que nos permitirá enlazar a un comando de nuestra **ViewModel** y pasar
el elemento pulsado como parámetro del comando. Aunque tendremos que
modificarlo para que controle que el evento que llegue sea un evento
Tapped y lo marque como manejado.

###Conclusión


El elemento **GridView** es la piedra central sobre la que podremos
construir nuestras aplicaciones Modern UI, es importante implementarlo y
obtener todo su potencial, espero que este artículo os sirva para ello,
aunque todavía quedan cosas muy potentes como es el zoom semántico que
no hemos visto y que está íntimamente relacionado con el **GridView**.
Como siempre,
[***aquí***](https://skydrive.live.com/redir?resid=FD100135B82F3364!716)
tenéis un ejemplo de todo lo que hemos visto para que podáis jugar con
él y tenerlo como base y referencia para vuestros desarrollos.

Un saludo y Happy Coding!




