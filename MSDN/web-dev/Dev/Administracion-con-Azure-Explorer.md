---
title: Azure Web Sites – Administración de Web Sites con el Azure Explorer
description: Azure Web Sites – Administración de Web Sites con el Azure Explorer
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: cloud
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Azure Web Sites – Administración de Web Sites con el Azure Explorer

Por [Julio Cesar Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS
Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


Hola a todos, hoy quiero mostrarles una cómo es posible conectarnos
desde Visual Studio a los [Web
Sites](http://www.julitogtu.com/tag/azure-web-sites/) de Microsoft
Azure, aunque no tenemos disponibles todas las posibilidades del portal
de Azure, en algunos casos nos puede ser de utilidad.

Entonces desde Visual Studio seleccionamos **View -&gt; Server
Explorer**:

![] (./img/Administracion-con-Azure-Explorer/image1.png)

Ahora damos clic en **Connect to Windows Azure** (Si, ahora se llama
Microsoft Azure :P) e ingresamos los datos:

![] (./img/Administracion-con-Azure-Explorer/image2.png)

Luego expandimos el nodo de **Windows Azure** y posteriormente el de
**Web Sites**, allí vamos a tener listados todos los Web Sites de
nuestra cuenta y de las cuentas de las que somos administradores (por
algunas razones no puedo dejar ver todos los sitios):

![] (./img/Administracion-con-Azure-Explorer/image3.png)

Ahora, clic derecho sobre algunos de los Web Sites para ver las opciones
disponibles:

![] (./img/Administracion-con-Azure-Explorer/image4.png)

En las opciones disponibles tenemos la posibilidad de detener e iniciar
el sitio, descargar el perfil de publicación del sitio y abrir el portal
de administración en Microsoft Azure.

Adicionalmente tenemos la opción de depurar el sitio (**Attach
Debugger**), pero esa opción la voy a detallar en el siguiente post.

Espero les sea de utilidad y no se olviden de compartir la entrada.




