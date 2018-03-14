---
redirect_url: https://docs.microsoft.com/
title: Servicios REST en WCF – Mucho trabajo mismo resultado
description: Servicios REST en WCF
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Servicios REST en WCF – Mucho trabajo mismo resultado
  
Por Nicolás Herrera Farias

Tecnólogo en análisis y desarrollo de sistemas de información, líder en la comunidad de desarrolladores BDotNet en Colombia, colaborador en los foros de MSDN en español donde fue reconocido como Microsoft Community Contributor 2011, miembro Gold del grupo de Microsoft Community Specialist Colombia, blogger y speaker activo, en general un entusiasta de las tecnologías de la información. Actualmente se desempeña como desarrollador y consultor .NET   

[Blog](http://nicolocodev.wordpress.com/)


Desde que surgió WCF siempre se ha estado en constante evolución hacia
lograr hacer servicios web totalmente sobre HTTP, intentando dar soporte
por supuesto a los servicios RestFul y centrando su atención en todos
los poderes del protocolo http para empezar a verlo como lo que es, un
protocolo de aplicación.

Mucha gente se esforzó por darle el rumbo correcto a este producto,
varios APIs se vieron ir y venir en CodePlex, siempre persiguiendo el
mismo objetivo. Finalmente en la versión 3.5 y 4 de WCF se llego a decir
que era posible la construcción de servicios RESTFul.

Personalmente nunca me han gustado los servicios WCF y no puedo decir
que sea un experto en la materia, pero el hecho de tener que trabajar
con tantos y tantos tipos de configuraciones en archivos .config donde
no te saldrá un error de compilación si algo está mal \[Siempre será una
linda pantalla de error con un mensaje que nunca entiendes, y no lo
niegues que es así\], donde testear estos servicios requiere de un
cliente o aplicación \[WCF Test Client por ejemplo\] donde por cada
forma de consumo se debe teclear un nuevo EndPoint, tener que decorar
con tantos atributos los métodos para tener algún tipo de funcionalidad
personalizada y un gran etc. que hace que no me termine de gustar esta
tecnología.

Entonces sí! Pensar en construir servicios Rest con WCF “puede llegar a
ser” posible, si estás dispuesto a trabajar con todo ese gran “cascaron”
que envuelve a WCF. Para la muestra un par de entradas que muestran un
paso a paso de cómo construir un servicio rest haciendo uso de los
vervos de http y la “negociación” de contenido. Vi
[*este*](http://www.codeproject.com/Articles/105273/Create-RESTful-WCF-Service-API-Step-By-Step-Guide)
en *CodeProjet* y
[*este*](http://jramirezdev.net/wcf-creando-un-servicio-disponible-en-soap-y-rest-al-mismo-tiempo)
ultimo a un compañero de [*BDotNet*](http://bogotadotnet.org/). En ellos
se plantea una buena solución al problema, pero para mí sigue sin ser
Rest, ¿por qué? A simple vista no se está haciendo uso de una
negociación de contenido, simplemente se definen dos métodos distintos
decorados de forma diferente haciendo uso del atributo
[*WebInvoke*](http://msdn.microsoft.com/es-es/library/system.servicemodel.web.webinvokeattribute.aspx)
y dejando de lado el uso de los encabezados de http. Además de cómo se
muestran en los artículos se hace uso de “todo” el poder de los
*Bindings* y *Endpoints* y del conocido *webHttpBinding.*

Esta solución no me convenció y encontré
[*este*](http://msdn.microsoft.com/es-es/library/dd203052.aspx) artículo
muy detallado en MSDN, la verdad no lo termine e implementar y es que es
muy complejo y ¡me desgasta mucho!

### Una visión más clara, ASP.NET Web API

Con la llegada de MVC 4 salió WEB API, este framework SI se pensó para
la construcción de servicios sobre http, a diferencia de todas las
modificaciones de WCF que desde un inicio se pensó para soportar SOAP y
nada más que SOAP, la verdad no sé si se reescribió de cero \[creo que
no\], pero si se pensó bien, muy bien como debía trabajar.

A diferencia de los WCF con WEB API no debemos preocuparnos por archivos
de configuración de grandes magnitudes, ni de decorar con una gran
cantidad de atributos a nuestros métodos para que trabajen con los
verbos de http.

Basta con crear una nueva aplicación de ASP.NET MVC 4, y seleccionar la
opción Web Api. Uno de los primeros beneficios es el método
MapHttpRoute, que nos permitirá hacer uso de los verbos de http sin
tener que esforzarnos como lo haríamos con un método WCF que queremos
responda a un Get o a un Post.

![] (./img/Servicios-REST-en-WCF/image1.png)

Si consumimos este servicio, *desde un navegador* y vemos el cuerpo de
la respuesta veremos que por defecto en IE9 nos regresa un JSON, para
mí, esto ya es una ventaja ya no tenemos esos feos *envolve* que
teníamos con SOAP. Una muestra de lo anterior:

![] (./img/Servicios-REST-en-WCF/image2.png)

Y en este caso nosotros tenemos una completa negociación de contenido
haciendo uso del encabezado de la solicitud y sin escribir una línea de
más. Así:

![] (./img/Servicios-REST-en-WCF/image3.png)

![] (./img/Servicios-REST-en-WCF/image4.png)

Como vemos WEB API incorpora todos estos beneficios de fabrica, y no
tenemos que preocuparnos por construir enmarañados WCF para “*simular”*
Y NO NIEGO QUE SE PUEDA LOGRAR, que yo no lo he logrado hacer es otra
cosa, pero por ahí he oído de gente muy buena en esto de los servicios
WEB que si es posible… de lo que si estoy seguro es que les toca
escribir mas líneas que a mí.

Espero les sea de utilidad.

Hasta el próximo post.




