---
redirect_url: https://docs.microsoft.com/
title: Modern UI- Acceso al hardware (I)- GPS y Bing Maps SDK
description: Modern UI- Acceso al hardware (I)- GPS y Bing Maps SDK
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Modern UI: Acceso al hardware (I): GPS y Bing Maps SDK

Por **Josue Yeray Julian Ferreiro**

¡Hola a todos!

Hoy vamos a comenzar a examinar el acceso al hardware del que disponemos
en las aplicaciones de Modern UI para Windows 8. En primer lugar
hablaremos del GPS, de cómo acceder a él y utilizar los datos que nos
brinda.

Para que nuestra aplicación pueda hacer uso del GPS, lo primero que
necesitamos hacer es declarar en el **appxmanifest** de nuestra
aplicación, en la pestaña de capacidades, que deseamos hacer uso de la
localización del usuario:

![] (./img/Windows-Modern-UI-GPS-Bing-Maps-SDK/image1.png)

De esta forma tendremos los permisos adecuados para poder acceder a los
datos de localización del sistema. Tenemos que tener en cuenta que aun
así, por defecto es el usuario quien tendrá que hacer efectivo este
permiso activando el acceso a la localización, desde los permisos de la
aplicación:

![] (./img/Windows-Modern-UI-GPS-Bing-Maps-SDK/image2.png)

Una vez que tenemos estas dos cosas claras, usar el GPS en nuestra
aplicación es increíblemente sencillo. Para los ejemplos necesitaremos
el SDK de Bing Maps para aplicaciones de Modern UI, podemos instalarlo
desde el menú **TOOLS &gt; Extensions and Updates**, buscando en la
sección **Visual Studio Gallery** por Bing Maps:

![] (./img/Windows-Modern-UI-GPS-Bing-Maps-SDK/image3.png)

Una vez instalado, simplemente tenemos que ir a nuestra solución y
añadir una referencia en la pestaña **Windows &gt; Extensions** a **Bing
Maps** y al **runtime de Visual C++** para poder desplegar la aplicación
en un dispositivo. Después de añadir las referencias, veremos que
tenemos varios Warnings indicándonos que el processor architecture
“**AnyCPU**” no está soportado y debemos cambiarlo a **x86**, **x64** o
**ARM**. Esto se debe a que el control de Bing Maps usa código no
manejado y tenemos que compilar para cada arquitectura, en nuestro
ejemplo lo pondremos en x86 accediendo al menú **BUILD &gt;
Configuration Manager**:

![] (./img/Windows-Modern-UI-GPS-Bing-Maps-SDK/image4.png)


¿Por qué x86 y no x64? No es un capricho, el diseñador de XAML de Visual
Studio no muestra la vista previa para las arquitecturas x64 y ARM, por
lo que, por comodidad al trabajar, usamos x86.

Ahora ya solo nos queda agregar la referencia en XAML y añadir el mapa a
nuestra página:


```
    &lt;Page
    x:Class="Win8Gps.MainPage"
    IsTabStop="false"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:Win8Gps"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    xmlns:map="using:Bing.Maps"
    mc:Ignorable="d"&gt;
    &lt;Grid Background="{StaticResource
    ApplicationPageBackgroundThemeBrush}"&gt;
    &lt;map:Map x:Name="GpsMap"&gt;&lt;/map:Map&gt;
    &lt;/Grid&gt;
    &lt;/Page&gt;
```

Y con esto, si ejecutamos tendremos ya nuestro mapa de Bing, aunque con
un feo mensaje en la pantalla:

![] (./img/Windows-Modern-UI-GPS-Bing-Maps-SDK/image5.png)

Esto es porque necesitamos registrarnos y obtener una clase de
desarrollador en
[*https://www.bingmapsportal.com/*](https://www.bingmapsportal.com/),
una vez registrados podremos ir al menú **create or view keys** y añadir
nuestra aplicación para obtener una clave:

![] (./img/Windows-Modern-UI-GPS-Bing-Maps-SDK/image6.png)

Al pinchar en **Submit** nos dará nuestra Key que podremos añadir a la
propiedad **Credentials** del mapa para que no muestre el mensaje
anterior:

```
    &lt;Grid Background="{StaticResource
    ApplicationPageBackgroundThemeBrush}"&gt;
    &lt;map:Map x:Name="GpsMap"
    Credentials="TU\_KEY\_AQUI"&gt;&lt;/map:Map&gt;
     &lt;/Grid&gt;
```

Ahora que ya tenemos un punto en el que mostrar nuestra posición, para
obtener la posición actual usaremos la clase **Geolocator** dentro del
namespace **Windows.Devices.Geolocation**, que nos ofrece dos formas de
trabajar. Un método async **GetGeopositionAsync** que podemos llamar y
nos devuelve un objeto **GeoCoordinates** con la posición actual:

```
    Geolocator location = new Geolocator();
    private async void GetActualPosition()
    {
        Geoposition actualPosition = await
        location.GetGeopositionAsync();
    }
```

O suscribiéndonos al evento **PositionChanged**, que nos enviará las
coordenadas actuales cada vez que estas cambien:

**XML**


```
    Geolocator location = new Geolocator();
    public MainPage()
    {
        this.InitializeComponent();
        location.PositionChanged += location\_PositionChanged;
    }
    void location\_PositionChanged(Geolocator sender,
    PositionChangedEventArgs args)
    {
        Geoposition actualPosition = args.Position;
    }
```

En ambos casos debemos tener en cuenta que el usuario puede activar o
desactivar nuestro acceso a la localización o que podemos perder la
señal GPS y no obtener datos, para estar al tanto de estos cambios, es
necesario controlar el evento **StatusChanged** de la clase
**Geolocator**:

```
    public MainPage()
    {
        this.InitializeComponent();
        location.StatusChanged += location\_StatusChanged;
    }
     void location\_StatusChanged(Geolocator sender,
    StatusChangedEventArgs args)
    {
        if (args.Status == PositionStatus.Ready)
        {
            location.PositionChanged += location\_PositionChanged;
        }
            else if (args.Status == PositionStatus.Disabled)
        {
            location.PositionChanged -= location\_PositionChanged;
        }
    }
```

Para poder probar que todo esté funcionando correctamente, el simulador
de Windows 8 nos da un simulador de GPS, donde podremos introducir
latitud, longitud, altitud y radio de error y establecer la posición
como si fuese el GPS Real:

![] (./img/Windows-Modern-UI-GPS-Bing-Maps-SDK/image7.png)

Para incluir el marcador de posición que vemos en la imagen (el punto
azul) necesitamos usar la clase **Pushpin** del namespace **Bing.Maps**,
añadiéndolo como hijo del mapa:

**XML**

```
    Pushpin pin = new Pushpin();
    public MainPage()
    {
        this.InitializeComponent();
         GpsMap.Children.Add(pin);
    }
```

Y en el evento **PositionChanged** actualizar su posición en el mapa:

**XML**

```

    void location\_PositionChanged(Geolocator sender,
    PositionChangedEventArgs args)
    {
        Geoposition actualPosition = args.Position;
        this.Dispatcher.RunAsync(CoreDispatcherPriority.Normal,
        new DispatchedHandler(() =&gt;
    {
        Location loc = new Location(args.Position.Coordinate.Latitude, args.Position.Coordinate.Longitude);
        MapLayer.SetPosition(pin, loc);
        GpsMap.SetView(loc, 15.0f);
        }));
    }
```

Tenemos que tener en cuenta que el evento **PositionChanged** se ejecuta
en un hilo distinto al de la interface de usuario, por lo que debemos
hacer uso del **Dispatcher** para poder actualizar cualquier control,
como en este caso hacemos con el mapa.

Si ejecutamos y jugamos con las coordenadas, veremos cómo se va moviendo
la posición de la vista del mapa y el marcador que hemos incluido.

###Conclusión


Y esto es todo por hoy, ahora ya sabemos cómo usar el control de Bing
Maps, añadirle marcadores de posición y como obtener y usar nuestra
propia posición, teniendo en cuenta los cambios de estado que se puedan
provocar por acción del usuario o del ambiente. Como siempre,
[*aquí*](https://skydrive.live.com/redir?resid=FD100135B82F3364!672)
podéis obtener este ejemplo en funcionamiento para que juguéis con él.

Un saludo y Happy Coding!




