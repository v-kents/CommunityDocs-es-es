---
redirect_url: https://docs.microsoft.com/
title: ASP.NET MVC Implementando autenticación con Azure Active Directory
description: Implementando autenticación con Azure Active Directory
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[ASP.NET MVC] Implementando autenticación con Azure Active Directory


Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, con el release de [Visual Studio
2013](http://www.microsoft.com/visualstudio/esn/downloads), Microsoft ha
lanzado características súper interesantes para los desarrolladores Web,
y una de ellas trata sobre el concepto de 1 solo ASP.NET, en donde
podemos realizar una mezcla bien cool de las diferentes opciones
disponibles, adicionalmente, se ha incluido un pequeño wizard para poder
configurar el sistema de autenticación (algo de lo que tratará este
post), y lo mejor de todo es que lo podemos trabajar con [Azure Active
Directory](http://www.windowsazure.com/en-us/services/active-directory/).

Lo primero que necesitamos es crear un nuevo Acitve Directory en Azure,
así que una vez logueados vamos a **New &gt; App Services &gt; Active
Directory &gt; Directory &gt; Custom Create:**

![] (./img/Autenticacion-con-Azure-Active-Directory/image1.png)

En la ventana modal que se abre ingresamos la información relacionada:

![] (./img/Autenticacion-con-Azure-Active-Directory/image2.png)

Luego ya solo queda navegar a la opción **Active Directory**,
seleccionar el directorio que acabamos de crear e iniciar la creación de
usuarios:

![] (./img/Autenticacion-con-Azure-Active-Directory/image3.png)

Ahora, vamos a [Visual Studio
2013](http://www.microsoft.com/visualstudio/esn/downloads) donde se va a
crear una nueva aplicación ASP.NET:

![] (./img/Autenticacion-con-Azure-Active-Directory/image4.png)

Ahora para el ejemplo, solo seleccionaré el template MVC:

![] (./img/Autenticacion-con-Azure-Active-Directory/image5.png)

En la misma pantalla, se va a cambiar el tipo de autenticación, así que
clic en Change Authentication, se abre una ventana en la cual se debe
como primera medida seleccionar Organizational Accounts, y en la parte
derecha para el campo Domain se ingresa la cuenta de Active Directoy
creada anteriormente:

![] (./img/Autenticacion-con-Azure-Active-Directory/image6.png)

Una vez ingresada la información anterior, al dar OK se debe ingresar la
información de autenticación del Active Directory:

![] (./img/Autenticacion-con-Azure-Active-Directory/image7.png)

Una vez autenticados ya se crea el template de la aplicación, dicha
aplicación ya tiene todo implementando para conectarnos con el Active
Directory creado, como punto importante, para que la aplicación se
ejecute correctamente dicha aplicación debe ejecutarse sobre https,
afortunadamente cuando se ejecuta la aplicación desde Visual Studio,
podemos simular el https:

![] (./img/Autenticacion-con-Azure-Active-Directory/image8.png)

Simplemente le decimos continuar a este sitio Web, una vez logueados
somos redirigidos  a nuestra aplicación ya logueados (súper, ¿no?):

![] (./img/Autenticacion-con-Azure-Active-Directory/image9.png)

Espero el post les haya gustado, ¡saludos!




