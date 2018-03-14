---
redirect_url: https://docs.microsoft.com/
title: WPF - Recibir notificaciones cuando hay cambios de sesión
description: WPF - Recibir notificaciones cuando hay cambios de sesión
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#WPF - Recibir notificaciones cuando hay cambios de sesión

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io

Afortunadamente es muy fácil de hacer si hacemo uso de esta librería:

[Win32 Session Changes
Notifier](https://github.com/JuanKRuiz/Win32SessionChangesNotifier/)

Que he creado yo mismo y está disponible en Github.

###Lecturas recomendadas


- [C\# – Win32SessionChangesNotifier libreria para recibir notificaciones
de cambios de
sesión](http://juank.io/c-win32sessionchangesnotifier-libreria-recibir-notificaciones-cambios-sesion/)

- [Qué es el bucle de mensajes, message loop o WndProc
?](http://juank.io/bucle-mensajes-message-loop-wndproc/)

- [Forms - Recibir notificaciones cuando hay cambios de
sesión](http://juank.io/forms-recibir-notificaciones-cuando-cambios-sesion/)

- [Cómo obtener un manejador (handle) para una ventana de
WPF](http://juank.io/c-como-obtener-manejador-handle-ventana-wpf/)

- [Como usar el WndProc en una Ventana
WPF](http://juank.io/c-como-usar-wndproc-en-ventana-wpf/)

Para **Windows forms** esta tarea es bastante sencilla e intuitiva, pero
este no es el caso de **WPF** dadas las propias características de esta
tecnología.

He creado una aplicación WPF sencilla con un ListBox que se irá llenando
a medida que lleguen notificaciones de cambios en las sesiones.

Para comenzar recibiendo notificaciones lo primero que se supone debemos
hacer es registrar nuestra Ventana ya que eso dice en la documentación
de MSDN:

**WTSRegisterSessionNotificationSession** change notifications are sent
in the form of a **WM*WTSSESSION*CHANGE** message. These notifications
are sent only to the windows that have registered for them using this
function.

Si vieron las lecturas relacionadas es exactamente lo que hemos hecho
para solucionar el problema en Windows Forms.

Para el caso de WPF esto no es necesario ya que al parecer
**PresentationCore** que es el ensamblado principal de una aplicación
WPF ya tiene rutinas de inicialización que lo hacen por nosotros.

Me pregunto si lo hace siempre, porque lo cierto es que esto casi nunca
se necesita.

Ya que por defecto estamos recibiendo las notificaciones de cambios en
las sesiones, lo que debemos hacer es interceptar estos mensajes en el
**WndProc** de manera muy similar a como lo hicimos con Windows Forms.

Fácil, solo que… una ventana de WPF **no expone el WndProc** pequeño
problema. :(

Para poder interceptar los mensajes desde WPF debemos:

1.  Obtener el manejador (handler) de la ventana, ya que lo necesitamos
    para el siguiente punto (también es inaccesible por default es
    desde WPF)

2.  Crear un Hook para el **WndProc** nativo(también es inaccesible por
    default es desde WPF)

3.  Modificar el comportamiento del **WndProc**

Tenemos problemas con los puntos 1 y 2 ya que WPF no expone métodos para
realizar estas tareas de interoperabilidad, sin embargo si son lectores
del blog o si ojearon las lecturas recomendadas, ambos temas ya los
hemos solucionado en el pasado, así que para esta ocasión es pan comido.

###Obtener el manejador de la ventana


Como ya lo comente necesitamos el manejador para posteriormente crear un
Hook al WndProc, easy (recuerden esta explicado en profundidad en otro
artículo):

>C\#

```

    WindowInteropHelper interopHelper;

    private void Window\_Loaded(object sender, RoutedEventArgs e)

    {

    //Conseguir el Handle de la ventana

    interopHelper = new WindowInteropHelper(this);

    }
```

###Crear un Hook para el WndProc nativo


WPF es de por si un sistema de ventanas montado encima del sistema
nativo de ventanas Win32, pero la intercepción de los mensajes de sesión
no se puede hacer desde el sistema de ventanas de WPF.

Ya que el sistema de ventanas de WPF está montado encima del de Win32
entonces podemos capturar el handler de la ventana de win32 (ya lo
hicimos) y con el crear un gancho (hook) para el WndProc Nativo.

Ya con acceso al WndProc podemos interceptar los mensajes de cambios en
la sesión.

>C\#

```

    WindowInteropHelper interopHelper;

    private void Window\_Loaded(object sender, RoutedEventArgs e)

    {

    //Conseguir el Handle de la ventana

    interopHelper = new WindowInteropHelper(this);

    //Crear un hook al WndProc

    HwndSource sourceWindow = HwndSource.FromHwnd(interopHelper.Handle);

    sourceWindow.AddHook(WndProc);

    }
```
Donde el parámetro **WndProc** es realmente un delegado a un método
llamado **intencionalmente** así, podría haberle puesto cualquier
nombre.

Una vez creado el hook, debemos interceptar los mensajes del
**WndProc**, revisamos la variable **wParam** del mensaje ya que esta
nos da detalles adicionales acerca del evento que se ha generado.

Para efectos de este ejemplo simplemente convierto ese valor a su
equivalente en los **enum** de la librería, y adiciono esa cadena al
listbox para que nos vaya mostrando los mensajes que van llegando.

>C\#

```
    private IntPtr WndProc(IntPtr hwnd, int msg, IntPtr wParam, IntPtr
    lParam, ref bool handled)

    {

    if (msg == W32HandleSessionChanges.WM\_WTSSESSION\_CHANGE)

    {

    var name = Enum.GetName(typeof(SessionNotificationMsg),
    (SessionNotificationMsg)wParam);

    this.listBoxOne.Items.Add(name);

    handled = true;

    return (IntPtr)1;

    }

    return IntPtr.Zero;

    }
```

###NOTA IMPORTANTE

¿Recuerdan que WPF por defecto nos permite recibir notificaciones?

Bien, solo notificaciones de la sesión actual, si queremos recibir
notificaciones de todas las sesiones debemos **des registrar** la
ventana y luego registrarla nuevamente con el parámetro
**NOTIFY*FOR*ALL\_SESSIONS**, así:


>C\#


```
    //Conseguir el Handle de la ventana

    interopHelper = new WindowInteropHelper(this);

    //Des Registramos

    W32HandleSessionChanges.WTSUnRegisterSessionNotification(interopHelper.Handle);

    //Registramos la forma para recibir notificaciones

    W32HandleSessionChanges.WTSRegisterSessionNotification(interopHelper.Handle,
    NotifyType.NOTIFY\_FOR\_ALL\_SESSIONS);
```

###El resultado


Ejecutamos el programa, bloquemos nuestra sesión de Windows, volvemos a
ingresar y… notificaciones de cambios en la sesión.


![] (./img/WPF-Recibir-notificaciones-cuando-hay-cambios-de-sesion/image1.png)

>###Descárgalo


Puedes descargar el ejemplo completo desde mi GitHub: [Win32 Session
Changes
Notifier](https://github.com/JuanKRuiz/Win32SessionChangesNotifier/)




