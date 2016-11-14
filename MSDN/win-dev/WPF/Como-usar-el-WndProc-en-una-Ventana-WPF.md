---
title: Como usar el WndProc en una Ventana WPF
description: Como usar el WndProc en una Ventana WPF
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Como usar el WndProc en una Ventana WPF


![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io
  
WPF es una parte del .Net Framework muy robusta, pero a veces
necesitamos que nuestra aplicación interactue con aspectos más
relacionados con el sistema de ventanas del OS. En estos casos
requerimos interceptar mensajes en el **WndProc**.

###Lecturas recomendadas


Si de plano no sabes que es el WndProc no te pierdas este otro artículo
que te pondrá en contexto: [Qué es el bucle de mensajes, message loop o
WndProc ?](http://juank.io/bucle-mensajes-message-loop-wndproc/)\
Más abajo verás que necesitamos obtener un handler a la ventana WPF,
para ello revisa: [C\# – Como obtener un manejador (handle) para una
ventana de
WPF](http://juank.io/c-como-obtener-manejador-handle-ventana-wpf/)

Para lograr acceder al **WndProc** debemos obtener un manejador (handle)
para la ventana WPF y seguidamente utilizar la clase utilitaria
**HwndSource** para crear el **Hook**, allí creamos un delegado el cual
hara las veces de **WndProc** de nuestra ventana

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

    private IntPtr WndProc(IntPtr hwnd, int msg, IntPtr wParam, IntPtr
    lParam, ref bool handled)

    {

    //Hacer algo...

    return IntPtr.Zero;

    }
```

Y eso es todo ;)




