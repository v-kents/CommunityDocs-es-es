---
title: Abrir ventana del Browser y compartir en redes sociales
description: Abrir ventana del Browser y compartir en redes sociales
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: ie
ms.custom: CommunityDocs
---





  
  
  
#Abrir ventana del Browser y compartir en redes sociales
  
Por **Gonzalo Pérez**                                                                                                                                                                 Junio 2012
                                                                                                                                                                                 
Microsoft Certified Trainer, Sun Certified Java Programmer, Orador de MSDN, Consultor, Instructor Academias de Visual Basic.NET. 4 Estrellas DCE 2003, 5 Estrellas DCE 2005.   
 
[Blog](http://geeks.ms/blogs/gperez/default.aspx)

Hola, como ya les había comentado, voy a estar compartiendo algunos tips
que me sirvieron bastante al momento de comenzar a desarrollar algunas
funcionalidades.

###Abrir ventana del Browser

Una de las funcionalidades que tiene la app que hice, aunque sea muy
poco visible, es que al hacer tap sobre @chalalo, voy a abrir una
ventana del explorador a la versión móvil de la pagina de Twitter
apuntando a mi cuenta

![] (./img/Compartir-el-browser-en-redes-sociales/image1.png)

Entonces primero importamos:

>C\#

```

    using Microsoft.Phone.Tasks;

    //Para luego asociar al texto TextBlock su handler:

    private void tx\_chalalo\_Tap(object sender, GestureEventArgs e)

    {

    WebBrowserTask webbrowser = new WebBrowserTask();

    webbrowser.Uri = new Uri("http://mobile.twitter.com/chalalo");

    webbrowser.Show();

    }
```

Y listo!

### Compartir en redes sociales

Una de las funcionalidades que quería era compartir los logros en las
redes sociales, primero comencé a revisar el código para ver alguna API
de conexión hacia Twitter, después de leer me di cuenta el SDK de WP7
provee todo lo necesario para poder conectarnos a todas las redes
sociales que están registradas en el teléfono.

![] (./img/Compartir-el-browser-en-redes-sociales/image2.png)

Entonces, fue muuuy sencillo, primero importamos:

>C\#

```

    using Microsoft.Phone.Tasks;

    //Para luego asociar al botón el handler

    private void Button\_Click\_2(object sender, RoutedEventArgs e)

    {

    ShareStatusTask shareStatusTask = new ShareStatusTask();

    shareStatusTask.Status = "He obtenido " + cont + " puntos! en el
    Juego Dead Dedo para Windows Phone 7, yeah!";

    shareStatusTask.Show();

    }
```
Vemos que la propiedad Status el texto que se va a compartir.

Luego aparecerá la pantalla para compartir el mensaje

![] (./img/Compartir-el-browser-en-redes-sociales/image3.png)

Ten en cuenta que no va aparecer en el emulador, pero en el dispositivo
físico no hay problema, genial, muy fácil.

Ahh! y que no se me olvide, la primera vez que subí una al Marketplace,
fue rechazada por que los screenshot que tomé tenían los datos de
depuración, (que son los números que están al lado derecho del
emulador), lamentablemente estos números aparecen en las imágenes.

![] (./img/Compartir-el-browser-en-redes-sociales/image4.png)

Para desactivar estos números simplemente vas al archivo App.xaml.cs y
comentas la siguiente línea:

>C\#

```
//Application.Current.Host.Settings.EnableFrameRateCounter = true;
```

Y listo, ahora si podemos subir los screenshot sin que los rechacen.\
Saludos


