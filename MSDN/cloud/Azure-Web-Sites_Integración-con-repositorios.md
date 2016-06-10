---
title: Azure Web Sites – Integración con repositorios
description: Características que permiten a Azure Web Sites robusto e interesante
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: cloud
ms.custom: CommunityDocs
---







#Azure Web Sites – Integración con repositorios

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola, últimamente he visto varias personas que ven los [Azure Web
Sites](http://www.windowsazure.com/en-us/services/web-sites/) como
simples “hosting”, creyendo que para lo único que sirven es para
publicar tu sitio Web y… listo, así que pienso hacer una pequeña serie
de post para mostrar algunas características que permiten a los [Azure
Web Sites](http://www.windowsazure.com/en-us/services/web-sites/) ser un
componente robusto e interesante.

En este post vamos a revisar cómo es posible enlazar el Azure Web Site
con algún tipo de repositorio (Visual Studio Online, Git Local, GitHub,
Dropbox, Bitbucket, CodePlex o alguno externo) para automatizar los
despliegues, en ese caso vamos a relacionarlo con un repositorio en
[GitHub](https://github.com/), para ello vamos al dashboard del Web Site
y seleccionamos **Set up deployment from source control**, luego se abre
una ventana modal para elegir el tipo de repositorio, por lo que para
este ejemplo escogemos [GitHub](https://github.com/):

![](./img/Azure-Web-Sites-repositorios/image1.png)

Luego nos pide autenticarnos con nuestra en GitHub, una vez confirmada
la autenticación, escogemos el repositorio y el branch:

![](./img/Azure-Web-Sites-repositorios/image2.png)

Una vez finalizada la integración, Windows Azure se encarga de realizar
el despliegue y nos informa del mismo:

![](./img/Azure-Web-Sites-repositorios/image3.png)

Uno de los puntos interesantes de esta integración, es que cada vez que
se haga commit al repositorio el **GitHub**, Azure realizará el
despliegue de los cambios y vamos a ver el historial de todos ellos:

![](./img/Azure-Web-Sites-repositorios/image4.png)

Si por alguna razón, necesitamos volver a un deploy anterior, lo podemos
hacer sin problema, basta con seleccionar el deploy y en la parte
inferior seleccionar **Redeploy** para hacer el rollback a una versión
anterior:

![](./img/Azure-Web-Sites-repositorios/image5.png)

Espero les sea de utilidad, en próximos post seguiremos hablando de los
**Azure Web Sites.**

¡Saludos!


