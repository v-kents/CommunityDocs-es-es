---
title: Azure Web Sites – Debugging
description: Depurar Azure Web Sites
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: cloud
ms.custom: CommunityDocs
---






#[Azure] Azure Web Sites – Debugging

Por [Julio Cesar Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS
Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, en el pasado post anterior vimos una pequeña introducción
al [Azure Explorer de Visual
Studio](http://www.julitogtu.com/2014/08/04/azure-azure-web-sites-utilizando-el-azure-explorer-desde-visual-studio/)
y una de las características que comentaba era la posibilidad de depurar
nuestros Web Sites, así que en esta entrada vamos a ver cómo lo podemos
hacer.

Lo primero es que cuando vamos a realizar la publicación del sitio, nos
aseguremos que el despliegue se haga en modo **Debug**:

![](./img/AzureDebugging/image1.png)


Ahora el siguiente paso es por el **Server Explorer** navegar hasta el
Web Site que acabamos de publicar, luego clic derecho y seleccionamos la
opción **View Settings**:

![](./img/AzureDebugging/image2.png)

Ahora se abre una nueva ventana en la cual podemos activar algunas
opciones para obtener mayor información de errores:

![](./img/AzureDebugging/image3.png)

Ahora, de nuevo abrimos el menú contextual del sitio pero en este caso
seleccionamos la opción **Attach Debugger**:

![](./img/AzureDebugging/image4.png)

Una vez hemos seleccionado la opción de Attach Debugger, se abre el
sitio y podemos navegar por él y los breakpoints que hemos definido en
el sitio funcionan sin problema:

![](./img/AzureDebugging/image5.png)

Finalmente, volvemos al sitio desde el Server Explorer y ya tenemos
información de los errores del sitio, así como los logs del IIS (si las
opciones que marcamos al inicio):

![](./img/AzureDebugging/image6.png)

Espero les sea de utilidad el post y no te olvides de compartirlo!

Saludos!


