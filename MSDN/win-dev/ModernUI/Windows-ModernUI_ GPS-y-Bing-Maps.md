<properties
	pageTitle="Windows Modern UI - Acceso al hardware (I) - GPS y Bing Maps SDK"
	description="Examinar el acceso al hardware en las aplicaciones de Modern UI para Windows 8"
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
	ms.date="05/12/2016"
	ms.author="andygonusa"/>



#Windows Modern UI - Acceso al hardware (I) - GPS y Bing Maps SDK

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

![img1] (./img/Windows-ModernUI_-GPS-y-Bing-Maps/img1.png)

De esta forma tendremos los permisos adecuados para poder acceder a los
datos de localización del sistema. Tenemos que tener en cuenta que aun
así, por defecto es el usuario quien tendrá que hacer efectivo este
permiso activando el acceso a la localización, desde los permisos de la
aplicación:

![img2] (./img/Windows-ModernUI_-GPS-y-Bing-Maps/img2.png)

Una vez que tenemos estas dos cosas claras, usar el GPS en nuestra
aplicación es increíblemente sencillo. Para los ejemplos necesitaremos
el SDK de Bing Maps para aplicaciones de Modern UI, podemos instalarlo
desde el menú **TOOLS &gt; Extensions and Updates**, buscando en la
sección **Visual Studio Gallery** por Bing Maps:

![img3] (./img/Windows-ModernUI_-GPS-y-Bing-Maps/img3.png)

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

![img4] (./img/Windows-ModernUI_-GPS-y-Bing-Maps/img4.png)

¿Por qué x86 y no x64? No es un capricho, el diseñador de XAML de Visual
Studio no muestra la vista previa para las arquitecturas x64 y ARM, por
lo que, por comodidad al trabajar, usamos x86.

Ahora ya solo nos queda agregar la referencia en XAML y añadir el mapa a
nuestra página:

```
    1: &lt;Page

    2: x:Class="Win8Gps.MainPage"

    3: IsTabStop="false"

    4: xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"

    5: xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"

    6: xmlns:local="using:Win8Gps"

    7: xmlns:d="http://schemas.microsoft.com/expression/blend/2008"

    8:
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"

    9: xmlns:map="using:Bing.Maps"

    10: mc:Ignorable="d"&gt;

    11:

    12: &lt;Grid Background="{StaticResource
    ApplicationPageBackgroundThemeBrush}"&gt;

    13: &lt;map:Map x:Name="GpsMap"&gt;&lt;/map:Map&gt;

    14: &lt;/Grid&gt;

    15: &lt;/Page&gt;

```

Y con esto, si ejecutamos tendremos ya nuestro mapa de Bing, aunque con
un feo mensaje en la pantalla:

![img5] (./img/Windows-ModernUI_-GPS-y-Bing-Maps/img5.png)

Esto es porque necesitamos registrarnos y obtener una clase de
desarrollador en
[*https://www.bingmapsportal.com/*](https://www.bingmapsportal.com/),
una vez registrados podremos ir al menú **create or view keys** y añadir
nuestra aplicación para obtener una clave:

![img6] (./img/Windows-ModernUI_-GPS-y-Bing-Maps/img6.png)

Al pinchar en **Submit** nos dará nuestra Key que podremos añadir a la
propiedad **Credentials** del mapa para que no muestre el mensaje
anterior:

```
    1: &lt;Grid Background="{StaticResource
    ApplicationPageBackgroundThemeBrush}"&gt;

    2: &lt;map:Map x:Name="GpsMap"
    Credentials="TU\_KEY\_AQUI"&gt;&lt;/map:Map&gt;

    3: &lt;/Grid&gt;
```

Ahora que ya tenemos un punto en el que mostrar nuestra posición, para
obtener la posición actual usaremos la clase **Geolocator** dentro del
namespace **Windows.Devices.Geolocation**, que nos ofrece dos formas de
trabajar. Un método async **GetGeopositionAsync** que podemos llamar y
nos devuelve un objeto **GeoCoordinates** con la posición actual:

```
    1: Geolocator location = new Geolocator();

    2:

    3: private async void GetActualPosition()

    4: {

    5: Geoposition actualPosition = await
    location.GetGeopositionAsync();

    6: }

```

O suscribiéndonos al evento **PositionChanged**, que nos enviará las
coordenadas actuales cada vez que estas cambien:

XML

```
<!-- -->

    1: Geolocator location = new Geolocator();

    2:

    3: public MainPage()

    4: {

    5: this.InitializeComponent();

    6:

    7: location.PositionChanged += location\_PositionChanged;

    8: }

    9:

    10: void location\_PositionChanged(Geolocator sender,
    PositionChangedEventArgs args)

    11: {

    12: Geoposition actualPosition = args.Position;

    13: }
```

En ambos casos debemos tener en cuenta que el usuario puede activar o
desactivar nuestro acceso a la localización o que podemos perder la
señal GPS y no obtener datos, para estar al tanto de estos cambios, es
necesario controlar el evento **StatusChanged** de la clase
**Geolocator**:


<!-- -->

```
    1: public MainPage()

    2: {

    3: this.InitializeComponent();

    4: location.StatusChanged += location\_StatusChanged;

    5: }

    6:

    7: void location\_StatusChanged(Geolocator sender,
    StatusChangedEventArgs args)

    8: {

    9: if (args.Status == PositionStatus.Ready)

    10: {

    11: location.PositionChanged += location\_PositionChanged;

    12: }

    13: else if (args.Status == PositionStatus.Disabled)

    14: {

    15: location.PositionChanged -= location\_PositionChanged;

    16: }

    17: }
```

Para poder probar que todo esté funcionando correctamente, el simulador
de Windows 8 nos da un simulador de GPS, donde podremos introducir
latitud, longitud, altitud y radio de error y establecer la posición
como si fuese el GPS Real:

![img7] (./img/Windows-ModernUI_-GPS-y-Bing-Maps/img7.png)

Para incluir el marcador de posición que vemos en la imagen (el punto
azul) necesitamos usar la clase **Pushpin** del namespace **Bing.Maps**,
añadiéndolo como hijo del mapa:

XML

<!-- -->

```
    1: Pushpin pin = new Pushpin();

    2: public MainPage()

    3: {

    4: this.InitializeComponent();

    5:

    6: GpsMap.Children.Add(pin);

    7: }
```

Y en el evento **PositionChanged** actualizar su posición en el mapa:

XML

<!-- -->

```
    1: void location\_PositionChanged(Geolocator sender,
    PositionChangedEventArgs args)

    2: {

    3: Geoposition actualPosition = args.Position;

    4:

    5: this.Dispatcher.RunAsync(CoreDispatcherPriority.Normal,
    new DispatchedHandler(() =&gt;

    6: {

    7: Location loc = new Location(args.Position.Coordinate.Latitude,
    args.Position.Coordinate.Longitude);

    8: MapLayer.SetPosition(pin, loc);

    9: GpsMap.SetView(loc, 15.0f);

    10: }));

    11: }
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
