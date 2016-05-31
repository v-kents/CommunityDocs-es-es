<properties
	pageTitle="Modern UI: IoC & MVVM"
	description="Modern UI: IoC & MVVM"
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


#Modern UI: IoC & MVVM

Por **Josue Yeray Julian Ferreiro**


¡Hola a todos!

Uno de los puntos clave del patrón MVVM y donde he visto más formas de
aplicarlo es en lo referente a la unión entre Views y ViewModels. Hay
gente que las asigna en code behind, otros lo hacen referenciando
directamente a la ViewModel en XAML o Cargan las ViewModels y hacen que
las Views sean DataTemplates que se resuelvan mediante converters…
realmente hay mil formas de hacerlo, algunas más acertadas que otras,
pero todas válidas.

Tradicionalmente a mí me gusta usar una clase Locator, que se encargue
de resolver la instancia del ViewModel y sus dependencias y exponerla
mediante una propiedad pública para poder enlazarnos a ella mediante un
Binding en XAML. Esto además contando con el apoyo de Unity para
resolver las dependencias del ViewModel, se convierte en un sistema muy
ágil y rápido, ofreciéndonos un punto único dentro de nuestra aplicación
donde resolver todo lo necesario para que el ViewModel funcione.

Lamentablemente hasta hace relativamente poco tiempo, en WinRT no
contábamos con ningún mecanismo de **IoC** o **DI** que nos ayudase con
esta tarea, teniendo que relegar el trabajo en implementar nuestra clase
**Locator** de una forma más “manual”. Supongamos que tenemos un
**ViewModel** que depende de un servicio que contiene los métodos de
acceso al Api del GPS, este sería:

```
    public class VMMainPage : VMBase
    {
        private IGpsService gpsService = null;
        public VMMainPage(IGpsService gpsSrv)
        {
        gpsService = gpsSrv;
        }
        public double ActualAltitude
        {
            get
            {
            return gpsService.GetActualAltitude();
            }
        }
    }
```
Y el servicio de GPS sería este:

```
    public interface IGpsService
        {
            double GetActualAltitude();
        }
            public class GpsService : IGpsService
        {
            public double GetActualAltitude()
        {
            return 100.0;
        }
    }
```

El usar la interface desde nuestro ViewModel nos va a permitir aislarnos
del código del GPS (aunque en este caso es un simple “fake”) cuando
realicemos pruebas unitarias o si decidimos compartir la ViewModel con
una aplicación, por ejemplo, Windows Phone.

Para un ViewModel de este tipo, nuestra clase Locator tendría este
aspecto:

```
    public class VMLocatorWithoutIoC
    {
        private Lazy&lt;VMMainPage&gt; viewModelMainPage;
         public VMLocatorWithoutIoC()
        {
            viewModelMainPage = new Lazy&lt;VMMainPage&gt;(() =&gt; { return
            new VMMainPage(new GpsService()); });
        }
        public VMMainPage ViewModelMainPage
        {
        get
            {
            return viewModelMainPage.Value;
            }
        }
    }
```

Con este código nuestro ViewModel se comportará como un Singleton, pues
el tipo **Lazy** ejecutará el constructor la primera vez que accedamos a
la propiedad ViewModelMainPage y a continuación siempre devolverá esa
instancia.

Pero ahora tenemos disponible para nuestras aplicaciones WinRT
[***MetroIoC***](http://metroioc.codeplex.com/), un contenedor de IoC,
portado a WinRT a partir de
[***MicroIoC***](http://microioc.codeplex.com/) y con una sintaxis muy
cómoda. Lo más interesante de MetroIoC es que al ser un port de
MicroIoC, el modo de uso de ambos es muy parecido y hasta que Microsoft
se decida a portar oficialmente Unity, es la forma más comoda de incluir
IoC en nuestra aplicación UI Moderno.

Para usar MetroIoC solo necesitamos acceder al Administrador de paquetes
de NuGet e instalarlo desde allí:

![] (./img/Windows-Modern-UI-IoC-MVVM/image1.png)

Una vez que hayamos instalado MetroIoC, integrarlo en nuestro Locator
será realmente sencillo, en primer lugar creamos nuestro contenedor:
```
    private MetroContainer container = new MetroContainer();
```
Y a continuación le añadimos nuestra ViewModel y sus dependencias:

```
    public VMLocatorWithMetroIoC()
    {
        container.Register&lt;VMMainPage&gt;()
        .RegisterInstance&lt;IGpsService&gt;(new GpsService());
    }
```

De esta forma, en nuestra propiedad pública solo tenemos que pedir al
contenedor que resuelva el tipo que deseamos devolver:


```
    public VMMainPage ViewModelMainPage
    {
        get
        {
            return container.Resolve&lt;VMMainPage&gt;();
        }
    }
```

Aquí podemos configurar más cosas, por ejemplo podemos indicar al
contenedor si al resolver el tipo VMMainPage debe conservar una
instancia (**SingletonLifecycle**) o crear una instancia cada vez que la
solicitemos (**TransientLifecycle**) Lo que manualmente nos abría
ocupado algunas líneas extra de código aquí podemos indicarlo
simplemente usando un parámetro del método **Register** de nuestro
contenedor.

El uso es igual de sencillo que en el primer caso, añadimos la clase
**VMLocatorWithMetroIoC** como un recurso en nuestro archivo app.xaml:

```
    &lt;Application.Resources&gt;
    &lt;ResourceDictionary&gt;
    &lt;ResourceDictionary.MergedDictionaries&gt;
    &lt;!--
    Styles that define common aspects of the platform look and feel
    Required by Visual Studio project and item templates
    &gt;
    &lt;ResourceDictionary Source="Common/StandardStyles.xaml"/&gt;
    &lt;/ResourceDictionary.MergedDictionaries&gt;
    &lt;Locator:VMLocatorWithoutIoC
    x:Key="LocatorWithoutIoC"&gt;&lt;/Locator:VMLocatorWithoutIoC&gt;
    &lt;Locator:VMLocatorWithMetroIoC
    x:Key="LocatorWithIoC"&gt;&lt;/Locator:VMLocatorWithMetroIoC&gt;
    &lt;/ResourceDictionary&gt;
    &lt;/Application.Resources&gt;
```

Y en nuestra página añadirlo al DataContext:

```
    &lt;Page
    x:Class="Win8IoC.MainPage"
    IsTabStop="false"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:Win8IoC"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    DataContext="{Binding ViewModelMainPage, Source={StaticResource
    LocatorWithIoC}}"&gt;
    &lt;Grid Background="{StaticResource
    ApplicationPageBackgroundThemeBrush}"&gt;
    &lt;TextBlock Text="{Binding ActualAltitude}"
    FontSize="36"
    VerticalAlignment="Center"
    HorizontalAlignment="Center"&gt;
    &lt;/TextBlock&gt;
    &lt;/Grid&gt;
    &lt;/Page&gt;
```

De esta forma resolvemos la **ViewModel** mediante **IoC**, desde un
único punto en toda nuestra aplicación y conseguimos que modificar sus
dependencias y como se resuelven, sea realmente sencillo. Como siempre
[*aquí*](https://skydrive.live.com/redir?resid=FD100135B82F3364!665) os
dejo el código del ejemplo para que juguéis con él. A partir de ahora le
vamos a dar mucho uso en el blog, vamos a empezar a ver cómo acceder a
los sensores del dispositivo desde nuestra aplicación y para ello
haremos un uso intensivo de las dependencias en nuestros ViewModels.

Un saludo y Happy Coding!
