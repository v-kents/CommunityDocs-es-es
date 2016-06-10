---
title: Mejoras a F12 Developer Tools
description: Mejoras a F12 Developer Tools
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: ie
ms.custom: CommunityDocs
---








#Mejoras a F12 Developer Tools

Por [*@IEDevChat*](https://twitter.com/IEDevChat)

*[En abril](http://blogs.msdn.com/b/ie/archive/2014/04/14/what-s-new-in-f12-with-windows-8-1-update.aspx)*
2014 describimos algunas de las nuevas capacidades de F12 Developer
Tools en IE11 con Windows 8.1 Update, y su enfoque de proveer datos
precisos en DOM Explorer y datos accionables en las herramientas de
memoria y desempeño. IE Developer Channel viene con aún más mejoras a
las herramientas de desarrollo de F12, entre las que se encuentran:

![] (./img/Mejoras-a-F12-Developer-Tools/image1.png)

Una experiencia mejorada de depuración con **pausas de eventos** que
   les ayudan a llegar más rápido a su bugs manejados por eventos.

Capacidades de análisis más ricas a través de perfiladores de
   Memoria y Reacción de la UI, que soporta reducción de ruido extra a
   través de **filtro de línea de tiempo multi-dimensional**, a la vez
   que incrementa el valor semántico de los datos reportados al
   resaltar instrumentación basada **performance.measure()** y
   **dominator folding**.

Una experiencia de navegación mejorada que provee **más atajos de
   teclado** (Ctrl+\[ y Ctrl + \]), así como nuevas **notificaciones de
   encabezado**, que les permiten determinar de manera rápida si alguna
   de las herramientas de evaluación de perfil corren o cuántos errores
   tiene su página. Un conjunto completo de mejoras está disponible en
   MSDN http://msdn.microsoft.com/en-us/library/ie/dn743687(v=vs.85).aspx.

###Automaticen sus pruebas con WebDriver


IE Developer Channel también viene con soporte para el estándar
emergente [*WebDriver*](http://www.w3.org/TR/webdriver/) a través del
cual, los desarrolladores web pueden escribir pruebas para automatizar
los navegadores web para probar sus sitios. Es un control remoto
programable para desarrollar escenarios de usuario complejos y correrlos
en un modo automatizado en su sitio web y su navegador. Vean cómo pueden
[*instalar
WebDriver*](http://msdn.microsoft.com/en-us/library/ie/dn725045(v=vs.85).aspx)
en IE Developer Channel y prueben este [*proyecto de muestra de
WebDriver*](http://go.microsoft.com/fwlink/?LinkId=401000).

###Utilicen su control Xbox para juegos web


¿Alguna vez han querido utilizar su control de Xbox para jugar en su
navegador? IE Developer Channel viene con soporte del estándar emergente
[*Gamepad API*](http://go.microsoft.com/fwlink/?LinkId=398250) que les
permite utilizar JavaScript para agregar soporte del gamepad a sus
aplicaciones y juegos web. Pruébenlo utilizando su control Xbox 360 y
jueguen [*Escape from
XP*](http://go.microsoft.com/fwlink/?LinkId=398253), o sus juegos
favoritos de [*Atari Arcade*](http://atari.com/arcade) o
[*Hover.IE*](http://hover.ie/).

- Usen su control Xbox en Escape from XP

![] (./img/Mejoras-a-F12-Developer-Tools/image1.png)

IE Developer Channel también mejora el desempeño de WebGL y agrega
soporte para extensión de ejemplo, texturas de 16 bit, variables
integradas GLSL, y ventiladores en triángulo. Este lanzamiento mejora la
calificación de [*Khronos WebGL Conformance Test
1.0.0*](https://www.khronos.org/registry/webgl/conformance-suites/1.0.0/webgl-conformance-tests.html)
de un 93% a 97%. Para más información sobres las API WebGL, vayan
[*aquí*](http://msdn.microsoft.com/en-us/library/ie/dn725046(v=vs.85).aspx).

###El primero de muchos lanzamientos de Developer Channel


Conforme trabajamos en nuevas características y estándares,
continuaremos compartiendo código nuevo a través de IE Developer
Channel. Pueden visitar la página
[*DevChannel.Modern.IE*](http://devchannel.modern.ie/) cuando quieran
para conocer más sobre las más recientes características en IE Developer
Channel. Todas estas nuevas características soportadas en IE Developer
Channel también están listadas en
[*Status.Modern.IE*](http://status.modern.ie/), nuestro nuevo portal
para comunicar nuestro camino para características de plataforma web
interoperable.

![] (./img/Mejoras-a-F12-Developer-Tools/image2.png)

Este lanzamiento de IE Developer Channel utiliza una combinación de
cambios de código y [*App-V
Client*](http://technet.microsoft.com/en-us/windows/hh826068.aspx) para
virtualizar y correr a la par de IE11. Esta virtualización crea un
pequeño golpe de desempeño, por lo que no les recomendamos utilizar esta
versión para medir el desempeño de su sitio. Tampoco recomendamos que
instalen esta versión en su ambiente empresarial. Para más sobre
problemas conocidos, vean nuestra lista de [*Preguntas
Frecuentes*](http://msdn.microsoft.com/en-us/library/ie/dn725043(v=vs.85).aspx).

Esperamos ver sus comentarios en
[*@IEDevChat*](https://twitter.com/IEDevChat) o a través de
[*Connect*](http://connect.microsoft.com/ie), para que nos ayuden a
mover la industria hacia adelante y seguir con las mejoras para el
navegador.

Gracias


