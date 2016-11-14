---
title: Web API II – Creando un CRUD, trabajando con verbos HTTP
description: Implementar fácilmente un CRUD
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: ie
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#IE11 update y status.modern.ie

Por **Carlos A. Lone**

Junio 12 de 2014

Durante la conferencia anual de [Microsoft Build
2014](http://channel9.msdn.com/Events/Build/2014) fue anunciada una
nueva versión actualizada de Internet Explorer 11 (IE11) para usuarios
con Windows 8.1, Windows 7 y se anunció el debut de esta versión del
Internet Explorer para Windows Phone 8.1, así mismo se introdujo los
sitios [22tracks.com](http://22tracks.com/) y
[FishGL](http://www.3dfishgl.com/)  los cuales tienen por objetivo
principal demostrar las nuevas capacidades del navegador IE11 en
dispositivos Windows y Windows Phone.

Una de las principales consideraciones al momento de trabajar en esta
nueva versión fue tomar en cuenta que hoy en día los usuarios navegan en
la Internet en múltiples dispositivos, moviéndose de su computadora
personal o laptop a una Tablet y luego a un teléfono inteligente durante
el día. Con esta premisa, la actualización de IE11 les permitirá llevar
con ustedes sus tabs y links favoritos independientemente del
dispositivo que estén utilizando.  Windows 8.1 y Windows Phone 8.1 
comparten la misma experiencia y soportan los mismos estándares Web, lo
que permite a nosotros desarrolladores, crear sitios interoperables y
aplicaciones que puedan funcionar en diferentes navegadores y
dispositivos. De lo novedoso de la actualización de IE11 se encuentra el
soporte a las últimas especificaciones para la aceleración por hardware
WebGL, así como también el soporte a contenido multimedia enriquecido
como la capacidad de utilizar HTML5 Video con close captioning, adaptive
streaming y rights management.

![] (./img/IE11-update-y-status-modern-IE/image1.png)

Otra de las novedades presentadas en esta conferencia fue el sitio
[status.modern.ie](http://status.modern.ie/)

![] (./img/IE11-update-y-status-modern-IE/image2.png)

###Qué es Status.modern.ie?


Alguna vez se han preguntado ¿cuáles son las nuevas características y
funcionalidades en la que se encuentra trabajando el equipo de
desarrollo de Internet Explorer?, bueno la respuesta a esta pregunta es
Status.modern.ie.  Por mucho tiempo los desarrolladores Web han tenido
que tirar sus cartas para anticipar que alguna nueva funcionalidad de
CSS o HTML estará disponible en los navegadores antes de que su sitio
salga a producción.

En el caso de Google Chrome, hace tiempo existe
<http://www.chromestatus.com/features> en donde se puede tener una
visualización de cuales estándares que en el tiempo van siendo aprobados
o madurados para CSS y HTML serán soportados por la siguiente versión de
este navegador.  Para Internet Explorer esto ha sido una especie de caja
negra en donde no se tenía mucha visibilidad sobre cuales
características o funcionalidades se están tomando en cuenta para la
siguiente versión.

Veamos un ejemplo.  Si visitamos <http://www.chromestatus.com/features>
y elegimos la opción “Battery Status API” para el caso de Internet
Explorer muchas de estas características aparecen con el estado “No
public Signals” y esto ha generado incertidumbre sobre el soporte de las
mismas en IE.

![] (./img/IE11-update-y-status-modern-IE/image3.png)

Bien este tipo de pregunta es la que pretende resolver status.modern.ie,
en este caso si consultamos esta característica en el sitio ya veremos
cuál es el estado en que el Equipo de IE está considerando la misma:

![] (./img/IE11-update-y-status-modern-IE/image4.png)

Como se puede observar ahora tenemos una vista 20-20 sobre lo que se
encuentra trabajando el equipo de Internet Explorer, finalmente existe
una genuina apertura para exponer en que se está trabajando y que de
alguna manera también los desarrolladores puedan ir teniendo una voz e
influir sobre las decisiones que el equipo de desarrollo de IE tome para
futuras versiones.

Recientemente [Status.Modern.ie](http://status.modern.ie/) cambio su
estado de Beta a Producción lo que incluye los siguientes cambios:

Les interesa conocer como fue desarrollado el sitio Status.Modern.ie? ,
¿Tienen alguna sugerencia que pudiera aplicarse a su diseño o
funcionalidad?, buenas noticias, el proyecto es ahora “Open Sourced”. Si
eres una estrella en el desarrollo y quieres colaborar con esta
iniciativa puedes descargar el código fuente desde
[GitHUB](https://github.com/InternetExplorer/Status.IE). Para mas
detalles pueden leer el
[ReadMe](https://github.com/InternetExplorer/Status.IE/blob/production/README.md)

Funcionalidad de Filtrado y Búsqueda Mejorada

Soporte a DeepLinking, por ejemplo si quieren ir directamente a alguna
característica como [Battery Status
API](http://status.modern.ie/batterystatusapi)

Mejor soporte para visualización en Dispositivos Móviles y mejora en el
rendimiento del sitio.

Alguna de las nuevas características que recientemente fueron
notificadas como “In Development” para la siguiente versión son:

- Web Audio

- Media Capture

- ES6 Promises

- HTTP/2

Y más…..

Bajo el nuevo lema “The Web should just work for everyone – users,
developers and business” (La web debería simplemente funcionar para
todos – usuarios, desarrolladores y negocios), el futuro al que apunta
el equipo de IE es el siguiente:

Hacer que los usuarios migren a versiones actualizadas. Históricamente
este ha sido un arduo tema de debate, sobre todo por el soporte a sitios
o aplicaciones empresariales “legacy”, el equipo ha trabajado arduamente
para buscar mecanismos que permitan a los usuarios migrar a la versión
más reciente de Internet Explorer y que las aplicaciones o sitios
“legacy” continúen funcionando sin problemas.

Seguridad. Tener un compromiso de garantizar a aplicaciones de negocio
críticas que puedan ser ejecutadas en Internet Explorar garantizando la
seguridad e integridad de la información.

Interoperabilidad y Compatibilidad. El equipo ha estado, esta y seguirá
participando con los Consorcios que definen los estándares para que sean
soportados por Internet Explorer

Si desean conocer más sobre las iniciativas del equipo de desarrollo de
Internet Explorer les recomiendo seguir la cuenta en twitter: @IEDevChat

También les comparto el siguiente video donde se explica la información
que les he compartido en este post:

Si tienen dudas o algún request para el equipo de Internet Explorer
estoy a sus órdenes,

Saludos Cordiales,

Carlos A. Lone




