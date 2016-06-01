<properties
	pageTitle="Web API II – Creando un CRUD, trabajando con verbos HTTP"
	description="Implementar fácilmente un CRUD"
	services="ie"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="ie"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>


#Personalización de IE11 con Internet Explorer Administration Kit IEAK

Por **Jesús Octavio Rodríguez de Santiago**, MVP

<https://www.facebook.com/freelance.deployment>

<https://plus.google.com/+JesusOctavioRodriguezdeSantiago>

<http://mx.linkedin.com/in/octaviordz>

[http://www.freelance-it.com.mx](http://www.freelance-it.com.mx/)

[@DeploymentMX](http://twitter.com/deploymentMX) 

Hola que tal amigos pues en esta ocasión vamos a desatender Internet
Explorer 11, compatible para Windows 7, para ello primero vamos a
descargar directamente de Microsoft IE11 en el siguiente link

![] (./img/Personalización-de-IE11-IEAK/image1.png)

<http://www.microsoft.com/es-es/download/details.aspx?id=40902>

Una vez descargada la aplicación descargamos la herramienta Kit de
Administración para Internet Explorer 11 en el siguiente link.

<http://www.microsoft.com/en-us/download/details.aspx?id=40903>

Para poder utilizar el Kit de Administración para IE11 debemos tener
instalado IE11 como nuestro navegador para poder crear los archivos
necesarios para poder después implementarlo con Windows 8.1 como lo
veremos en próximos post.

Instalamos  la nueva versión de IE11 tal y como se muestra a
continuación:

![] (./img/Personalización-de-IE11-IEAK/image2.png)

Una vez terminada la instalación ejecutamos la Herramienta de
Implementación de Internet Explorer 11 (IEAK). Nos aparece la primera
ventana la cual es un wizard que nos llevara de la mano para poder hacer
el paquete de instalación de acuerdo a nuestras necesidades.

![] (./img/Personalización-de-IE11-IEAK/image3.png)

La siguiente pantalla muestra el tipo de licencia en este caso lo
dejamos como esta y damos siguiente.

- Insert Caption


![] (./img/Personalización-de-IE11-IEAK/image4.png)

Escribimos el nombre de la organización para ejecutar el paquete de
instalación, damos en siguiente.

![] (./img/Personalización-de-IE11-IEAK/image5.png)

Y finalizamos con la siguiente pantalla.

![] (./img/Personalización-de-IE11-IEAK/image6.png)

Hasta este punto está la instalación de la herramienta, ahora tendremos
que crear el paquete para después implementarlo en otros equipos de
acuerdo a nuestro método preferido en mi caso MDT

Dentro de los programas encontraremos la aplicación “Asistente para
Personalizar IE11″ cual ejecutaremos como se muestra a continuación.

![] (./img/Personalización-de-IE11-IEAK/image7.png)

![] (./img/Personalización-de-IE11-IEAK/image8.png)


Al dar clic en siguiente por default el wizard nos muestra la carpeta
que creará con la ruta en donde tendremos nuestro paquete IEAK

La siguiente pantalla muestra para que plataforma vamos a crear el
paquete en este caso lo pondremos para Windows 8.1 tal y como se muestra
a continuación.

![] (./img/Personalización-de-IE11-IEAK/image9.png)

Especificamos el idioma y siguiente.

![] (./img/Personalización-de-IE11-IEAK/image10.png)

La siguiente pantalla muestra el tipo de paquete, si queremos configurar
para las opciones de solo configuración o crear un paquete para poder
implementarlo desde otro programa o en instalaciones de red local,
dejamos como esta y damos clic en siguiente.

![] (./img/Personalización-de-IE11-IEAK/image11.png)

Instalamos las características, en este punto podemos seleccionar una
característica de lado izquierdo de la pantalla, en donde podemos ver
una breve descripción de la misma en este caso ya dependerá de cada uno
de nosotros.

![] (./img/Personalización-de-IE11-IEAK/image12.png)

Aquí yo las opciones para desatender la instalación

![] (./img/Personalización-de-IE11-IEAK/image13.png)

Se sincronizan las versiones tanto de la que está instalada en el equipo
como de las actualizaciones de la web.

![] (./img/Personalización-de-IE11-IEAK/image14.png)

Sincronizamos y damos clic en siguiente.

![] (./img/Personalización-de-IE11-IEAK/image15.png)

En la siguiente pantalla muestra si queremos agregar complementos para
los usuarios de IE,

Los complementos de IE son pequeños programas de software que permiten a
los usuarios personalizar su experiencia de navegación de sus sitios web
favoritos y servicios. Complementos incluyen aceleradores, proveedores
de búsqueda, barras de herramientas y Web Slices. IE plug-ins – tales
como las que permiten a los usuarios reproducir video Flash o leer los
archivos PDF – en general, tienen un enfoque más estrecho que los
add-ons.

Para este ejemplo he descargado un complemento.

Aquí un ejemplo de más

1.  [Trixi](http://www.bhelpuri.net/Trixie/), El greasemonkey de
    Internet Explorer

2.  [Haute Secure](http://hautesecure.com/), protección extra contra el
    malware

3.  [StumbleUpon](http://stumbleupon.com/), toolbar del sitio
    [StumbleUpon](http://www.stumbleupon.com/)

4.  [PicLen](http://piclens.com/), visor de imagenes realmente
    espectacular

5.  [Medium](https://me.dium.com/), busca amigos desde Internet Explorer

6.  [IE7Pro](http://www.ie7pro.com/), profesionaliza tu Internet
    Explorer

7.  [Google Toolbar](http://toolbar.google.com/), toolbar de Google
    (Sobra la explicación ¿no?)

8.  [Web Of Trust](http://www.mywot.com/), obtén más info de la página
    que visitas.

9.  [KeyScrambler Personal](http://www.qfxsoftware.com/products.htm),
    encripta las teclas pulsadas a nivel de driver de teclado.

10. [Video Download](http://www.viloader.net/), descarga videos de las
    principales página de videos

11. [TorrentSeek](http://www.toolbarpro.net/toolbar_gallery.html), busca
    torrents directamente desde la toolbar.

12. [Free Music Zilla](http://www.freemusiczilla.com/), descarga música
    de los principales sitios de descarga sociales.

13. [QPedia](http://www.irondust.com/qpedia/), busca en Wikipedia
    cualquier palabra

14. [Advanced IE History
    Bar](http://www.585soft.com/advanced-ie-history.asp), mejora el
    historial de Internet Explorer.

15. [PricePirates](http://www.pricepirates.com/), compara precios de
    productos

16. [GripIE](http://www.gripie.com/), descarga MP3 desde Internet
    Explorer

17. [Password Scrambler](http://www.onepassword.com/), mejora del gestor
    de contraseñas

18. [Fleck](http://fleck.com/), sistema de anotaciones compartidas

19. [FoxyTunes](http://www.foxytunes.com/ie/download/), muestra y
    reproduce contenido multimedia en cualquier página

20. [MXPlay](http://www.mxplay.com/), muestra y reproduce contenido
    multimedia en cualquier página

21. [Del.icio.us toolbar](http://del.icio.us/help/ie/extension), toolbar
    para integrar Del.icio.us

22. [IE Developer
    Toolbar](http://www.microsoft.com/downloads/details.aspx?familyid=e59c3964-672d-4511-bb3e-2d5e1db91038&displaylang=en),
    Toolbar imprescindible para los desarrolladores web

23. [ColorPic](http://iconico.com/colorpic/), similar a colozilla de
    Firefox

24. [ProxyWay Free](http://www.proxyway.org/index.html#IE), gestor de
    proxys

25. [Video Detecter](http://download.leechvideo.com/), descarga videos
    flash fácilmente

26. [InLine Search](http://www.ieforge.com/InlineSearch/HomePage), busca
    en las página como en Firefox

27. [ShareThis](http://sharethis.com/download), comparte las páginas que
    visitas

28. [ZamZar Convert](http://www.zamzar.com/tools/), conversor de tipos
    de fichero

29. [IeSpell](http://www.iespell.com/), diccionar para Internet Explorer

30. (Enlace roto), permite recuperar sesión

31. [Quero ad blocker](http://www.quero.at/), reemplazo de la barra de
    navegación de IE y bloqueador de publicidad.

32. [Feeds Plus](http://www.enhanceie.com/ie/feedsplus.asp), mejoras en
    la gestión de feeds

33. [Mouse
    Gestures](http://www.ysgyfarnog.co.uk/utilities/mousegestures/),
    adaptación de la funcionalidad de Opera, que nos permite definir
    tareas a los eventos de ratón

34. [Open Last Closed
    Tab](http://www.muvenum.com/products/freeware/#openlastclosedtab),
    reabre pestañas cerradas accidentalmente

35. [Alia,](http://www.muvenum.com/products/freeware/#alias) crea alias
    de páginas para abrirlas más rápidamente.

36. [Power
    copier](http://ryanscook.com/adminsBlog/2007/02/firefox-ie-copy-context-menus.html),
    mejoras en la interacción con el portapapeles.

37. [Web Accessibility
    Toolbar](http://www.paciellogroup.com/resources/wat-ie-about.html),
    toolbar similar a webdeveloper toolbar pero para IE.

Fuente: Net Hackz

En mi caso descargaremos Google Earth Plugin

![] (./img/Personalización-de-IE11-IEAK/image16.png)

Podemos personalizar la barra de títulos sobreponiendo algún texto tal y
como se muestra a continuación.

![] (./img/Personalización-de-IE11-IEAK/image17.png)

Podemos agregar incluso proveedores de búsqueda como se muestra a
continuación.

![] (./img/Personalización-de-IE11-IEAK/image18.png)

la siguiente pantalla muestra todas las URL\`s que podemos agregar en
diferentes pestañas así como personalizar la URL de soporte técnico
cuando damos clic en ayuda del Explorer. tal y como se muestra a
continuación.

![] (./img/Personalización-de-IE11-IEAK/image19.png)

Podemos adjuntar aceleradores de internet explorer aquí la pantalla.

![] (./img/Personalización-de-IE11-IEAK/image20.png)

Podemos también agregar favoritos, barra de herramienta y un sin fin de
personalizaciones tal y como se muestra a continuación.

![] (./img/Personalización-de-IE11-IEAK/image21.png)

![] (./img/Personalización-de-IE11-IEAK/image22.png)

Podemos también personalizar la ejecución de la página de bienvenida
cuando es la primera vez que ejecutamos IE11.

![] (./img/Personalización-de-IE11-IEAK/image23.png)

Configuramos la vista de compatibilidad

![] (./img/Personalización-de-IE11-IEAK/image24.png)

Configuramos los programas y listo terminamos con nuestro paquete

![] (./img/Personalización-de-IE11-IEAK/image25.png)

![] (./img/Personalización-de-IE11-IEAK/image36.png)

Aquí es cuando se genera el paquete en la carpeta creada para poder
hacer un deployment en otro equipo

![] (./img/Personalización-de-IE11-IEAK/image27.png)

y listo aquí el paquete FULL de instalación, en este caso en los
próximos post veremos la forma de hacer una integración con el sistema
operativo Windows 8.1 e inyectarlo con Microsoft Deployment Toolkit 2013

En esta ocasión desinstalo mi IE11 para volverlo a instalar desde mi
paquete creado par a ver los resultados.

![] (./img/Personalización-de-IE11-IEAK/image28.png)

 Una vez ejecutado abrimos nuestro IE y vemos las siguientes
características las 2 páginas configuradas, la ayuda de soporte técnico,

La barra de favoritos. etc.

![] (./img/Personalización-de-IE11-IEAK/image29.png)

![] (./img/Personalización-de-IE11-IEAK/image30.png)

Amigos sé que este proceso es un poco largo pero les pongo la mayoría de
las opciones que podemos configurar para nuestro navegar sin tomar en
cuenta en esta ocasión algunos componentes que desde un principio no
configuramos.

Eso es todo por el momento y sobre este tema tendremos más artículos en
la parte de deployment, un gran saludo a todos mis lectores y estamos
con nuevos post.
