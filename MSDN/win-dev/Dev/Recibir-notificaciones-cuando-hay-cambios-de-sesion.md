---
title: Forms - Recibir notificaciones cuando hay cambios de sesión
description: Forms - Recibir notificaciones cuando hay cambios de sesión
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Forms - Recibir notificaciones cuando hay cambios de sesión

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io

Afortunadamente es muy fácil de hacer si hacemo uso de esta libreria:

Win32 Session Changes Notifier

Que he creado yo mismo y esta disponible en Github.

###Lecturas recomendadas


- C\# – Win32SessionChangesNotifier librería para recibir notificaciones
de cambios de sesión

- Qué es el bucle de mensajes, message loop o WndProc ?

- WPF - Recibir notificaciones cuando hay cambios de sesión

- **Divide ¡y vencerás**!, mi principio favorito. Seguiremos estos tres
pasos:

- Registrar la ventana para recibir notificaciones

- Modificar el comportamiento del WndProc

- Des registrar la ventana para dejar de recibir notificaciones

He creado una aplicacion Windows Forms en blanco, tan solo con un
ListBox que se irá llenando a medida que lleguen notificaciones de
cambios en las sesiones.

###Registrar la ventana para recibir notificaciones


Para comenzar recibiendo notificaciones lo primero que debemos hacer es
registrar nuestra Ventana (Form) utilizando la API para ello utilizamos
la libreria que les he referenciado arriba, simplemente usamos el evento
load del form.

>C\#

```

    private void Form1\_Load(object sender, EventArgs e)

    {

    //Registramos la forma para recibir notificaciones

    W32HandleSessionChanges.WTSRegisterSessionNotification(this.Handle,
    NotifyType.NOTIFY\_FOR\_ALL\_SESSIONS);

    }
```

Con esto nuestra ventana ya comienza a recibir notificaciones de cambios
en las sesiones.

###Modificar el comportamiento del WndProc


Sino sabes qué es el **WndProc** revisa las lecturas recomendadas más
arriba.

Aunque ya estamos recibiendo las notificaciones lo cierto es que no
estamos haciendo nada con ellas, para interceptarlas y comenzar a hacer
algo es necesario hacerle override al **WndProc** del form y capturar el
mensaje de notificación que se envía desde el sistema de ventanas.

Una vez interceptado debemos revisar la propiedad **wParam** del mensaje
ya que esta nos da detalles adicionales acerca del evento que se ha
generado.

Para efectos de este ejemplo simplemente convierto ese valor a su
equivalente en los **enum** de la librería, y adiciono esa cadena al
listbox para que nos vaya mostrando los mensajes que van llegando.

En este caso paso como parámetro **NOTIFY\_FOR\_ALL\_SESSIONS** para
recibir notificaciones de cambios en todas las sesiones no solo en la
actual.

>C\#


```
    protected override void WndProc(ref Message m)

    {

    //Verificamos cuando el mensaje recibido sea el de cambios en la
    sesión

    if (m.Msg == W32HandleSessionChanges.WM\_WTSSESSION\_CHANGE)

    {

    //convertimos el valor de wParam a su equivalente en nombre del enum

    var name = Enum.GetName(typeof(SessionNotificationMsg),
    (SessionNotificationMsg)m.WParam);

    this.listBox1.Items.Add(name);

    }

    base.WndProc(ref m);

    }
```

###Des-registrar la ventana para dejar de recibir notificaciones

Esta es la parte más fácil, antes de cerrar la ventana la des
registramos:

>C\#


```
    private void Form1\_FormClosed(object sender, FormClosedEventArgs e)

    {

    //Des Registramos la forma para no recibir notificaciones

    W32HandleSessionChanges.WTSUnRegisterSessionNotification(this.Handle);

    }
```

###El resultado


Ejecutamos el programa, bloquemos nuestra sesión de Windows, volvemos a
ingresar y… ¡notificaciones de cambios en la sesión!

![] (./img/Recibir-notificaciones-cuando-hay-cambios-de-sesion/image2.png)

###Descárgalo


Puedes descargar el ejemplo completo desde mi GitHub: Win32 Session
Changes Notifier




