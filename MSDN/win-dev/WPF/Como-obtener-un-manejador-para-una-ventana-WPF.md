<properties
	pageTitle="Web API II – Creando un CRUD, trabajando con verbos HTTP"
	description="Implementar fácilmente un CRUD"
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


#Cómo obtener un manejador (handle) para una ventana de WPF

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
necesitamos que nuestra aplicación interactúe con aspectos más nativos
del sistema operativo donde se ejecuta. En estos casos requerimos el
manejador (handle) de la ventana el cual no es expuesto por WPF.

Para obtenerlo debemos hacer uso de una clase utilitaria llamada
**WindowInteropHelper** la cual tiene un elemento muy importante, la
propiedad **Handle** que no es ni más menos que el manejador a la
ventana de WPF. Su uso es muy sencillo:

>C\#


```
    Window miVentana = this;

    WindowInteropHelper interopHelper = new
    WindowInteropHelper(miVentana);

    IntPtr manejadorVentana = interopHelper.Handle;
```

Si requerimos el handler de una ventana WPF basta con hacer:

>C\#

```

    WindowInteropHelper interopHelper = new WindowInteropHelper(this);
    IntPtr manejadorVentana = interopHelper.Handle;
```

Ya teniendo el manejador de la ventana podemos acceder a muchas otras
funcionalidades fuertemente atadas con el SO como por ejemplo las
expuestas en **Win32Api** o equivalente en otras plataformas
