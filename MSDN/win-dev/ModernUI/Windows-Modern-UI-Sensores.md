---
redirect_url: https://docs.microsoft.com/
title: Web API II – Creando un CRUD, trabajando con verbos HTTP
description: Implementar fácilmente un CRUD
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Modern UI: Acceso al hardware (II): Sensores


Por **Josue Yeray Julian Ferreiro**



¡Hola a todos!

Hace unos días,
[*vimos*](http://geeks.ms/blogs/jyeray/archive/2012/07/12/windows-8-acceso-al-hardware-i-gps-y-bing-maps-sdk.aspx)
cómo obtener y usar en un mapa de Bing la información del GPS de nuestra
tablet Windows 8. Hoy vamos a dar un repaso al resto de sensores que
tenemos a nuestra disposición en una aplicación de Modern UI. En otras
plataformas, por ejemplo en Windows Phone, tenemos normalmente acceso a
tres sensores: Acelerómetro, Brújula y Giroscopio. En Windows 8 sin
embargo tendremos hasta 7 sensores a nuestra disposición:

**Acelerómetro**: Detecta la aceleración en los ejes X, Y, Z.

**Brújula**: Detecta cambios en la orientación del dispositivo.

**Giroscopio**: Detecta cambios en la velocidad angular.

**Sensor de inclinación**: Detecta cambios en el ángulo de inclinación

**Sensor de luz**: Detecta cambios en la luz ambiental.

**Sensor de orientación**: Combina las lecturas del acelerómetro, la
brújula y el giroscopio para obtener datos de movimiento más precisos.

**Sensor de orientación simple**: Usa solo el acelerómetro para obtener
la orientación del dispositivo como rotación.
 

Todos estos sensores se encuentran reunidos en el namespace
**Windows.Devices.Sensors** y se usan de forma idéntica. Todos ellos
tienen un método **GetDefault**, que nos devuelve la instancia por
defecto de cada sensor o **null** si el sensor no se encuentra en el
sistema:

```
    Windows.Devices.Sensors.Accelerometer acelerometer =
    Accelerometer.GetDefault();

        if (acelerometer != null)

        {

        //TODO: Add code to handle sensor here.

    }
```

Una vez que hemos obtenido la instancia de nuestro sensor, todos, a
excepción del sensor de orientación simple, tienen una propiedad
**ReportInterval** que se indica en milisegundos y que representa el
tiempo que pasará entre actualizaciones. Internamente cada sensor
convertirá este intervalo de tiempo en unidades propias de cambio,
siguiendo esta tabla:

  ||||
  ----------------------- |------------------------------ |------------------------------ |------------------------------
  Acelerómetro            |0,01G                          |0,02G                          |0,05G
  Brújula                 |0,01 grados                    |0,5 grados                     |2 grados
  Giroscopio              |0,1 DPS (grados por segundo)   |0,5 DPS (grados por segundo)   |1,0 DPS (grados por segundo)
  Sensor de inclinación   |0,01 grados                    |0,5 grados                     |2 grados
  Sensor de luz           |1%                             |1%                             |5%
  Sensor de orientación   |0,01 grados                    |0,5 grados                     |2 grados

Todos además incluyen una propiedad de solo lectura llamada
**MinimumReportInterval** que contiene el valor mínimo de intervalo
soportado por el sensor.

Una vez configurado el intervalo, podemos obtener la lectura del sensor
directamente, llamando al método **GetCurrentReading**, que nos
devolverá la última lectura disponible del mismo:


```
    //Acelerometer

    Windows.Devices.Sensors.Accelerometer acelerometer = Accelerometer.GetDefault();

    if (acelerometer != null)

    {

    AccelerometerReading read = acelerometer.GetCurrentReading();

    }

    //Light Sensor

    Windows.Devices.Sensors.LightSensor lightSensor = LightSensor.GetDefault();

    if (lightSensor != null)

    {

    LightSensorReading read = lightSensor.GetCurrentReading();

    }
```

O podemos suscribirnos al evento **ReadingChanged** del sensor, el cual
nos devolverá datos cada vez que la lectura del mismo cambie, teniendo
en cuenta el intervalo que le hayamos establecido. El segundo argumento
de este evento nos devolverá la lectura del sensor y un **timestamp**
indicando el momento exacto en el tiempo en el cual fue obtenida esa
lectura:

**XML**


```
    Windows.Devices.Sensors.OrientationSensor orientation = OrientationSensor.GetDefault();

    if (orientation != null)

    {

    orientation.ReportInterval = orientation.MinimumReportInterval;

    orientation.ReadingChanged += orientation\_ReadingChanged;

    }

    void orientation\_ReadingChanged(OrientationSensor sender,
    OrientationSensorReadingChangedEventArgs args)

    {

    DateTime readingDateTime = args.Reading.Timestamp.DateTime;

    var rotationX = args.Reading.Quaternion.X;

    var rotationY = args.Reading.Quaternion.Y;

    var rotationZ = args.Reading.Quaternion.Z;

    var rotationW = args.Reading.Quaternion.W;

    }
```

En este aspecto hay cambios en dos sensores: El sensor de orientación
simple nos devuelve un enumerado con la orientación de nuestro
dispositivo, que puede ser:

**NotRotated**: El dispositivo está en vertical hacia arriba.

**Rotated90DegreesCounterclockwise**: El dispositivo está en horizontal
hacia la izquierda.

**Rotated180DegressCounterclockwise**: El dispositivo está en vertical
hacia abajo.

**Rotated270DegressCounterclockwise**: El dispositivo está en horizontal
hacia la derecha.

**Faceup**: El dispositivo está colocado con la pantalla mirando al
usuario.

**Facedown**: El dispositivo está colocado con la pantalla al lado
contrario del usuario.


Esta lectura es muy útil, entre otras cosas, si queremos que nuestra
aplicación deje de trabajar o, por ejemplo, de reproducir sonido o video
cuando el usuario gira el tablet poniendo la pantalla contra la
superficie.

También el acelerómetro nos ofrece un evento extra, llamado **Shaken**,
que se lanza cuando el usuario ha sacudido el dispositivo, solo nos
informa de que ha sucedido y en qué momento de forma que solo tengamos
que responder a esta acción de la forma que necesitemos sin tener que
comprobar por nosotros si se está sacudiendo a partir de las lecturas
individuales del acelerómetro:



```
    Windows.Devices.Sensors.Accelerometer acelerometer = Accelerometer.GetDefault();

    if (acelerometer != null)

    {

    acelerometer.Shaken += acelerometer\_Shaken;

    }

    void acelerometer\_Shaken(Accelerometer sender,
    AccelerometerShakenEventArgs args)

    {

    DateTime readingDateTime = args.Timestamp.DateTime;

    }
```

Como podéis ver, trabajar con los sensores es realmente sencillo,
Microsoft ha unificado la forma de acceder a todos ellos para que
nuestro trabajo se centre en crear una experiencia que responda a sus
cambios, no en reinventar la rueda para poder integrarlos en nuestro
código.

**Espera, espera… ¿Cómo probamos esto?** Pues mucho me temo que la
respuesta es: comprándote una tablet que soporte 1º) Windows 8 y 2º)
Todos estos sensores o al menos el que te interese. Lamentablemente el
simulador de Windows 8 que se incluye con Visual Studio 2012 no nos
aporta un emulador de los sensores, por lo que, al menos en mi PC que no
tiene ni acelerómetro ni nada, todos los sensores devuelven null.
Esperemos que esto se solucione y al menos incluyan algún emulador
sencillo de acelerómetro y orientación que pueden ser los más
interesantes.

Bueno, esto ha sido todo por hoy, en esta ocasión el ejemplo que os dejo
es realmente todo el código que he puesto en el post, dentro del code
behind de una página XAML para que podáis tenerlo como referencia, el
ejemplo en sí no realiza ninguna función, porque no tengo sensores con
los que jugar y enseñaros cosas chulas. Como sea,
[*aquí*](https://skydrive.live.com/redir?resid=FD100135B82F3364!682)
podéis descargarlo para jugar con él.

Un saludo y Happy Coding!




