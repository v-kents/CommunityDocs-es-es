---
title: Windows Server 2012 – Contraseñas y Bloqueo de Cuentas
description: Windows Server 2012 – Contraseñas y Bloqueo de Cuentas
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: windows
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Windows Server 2012 – Contraseñas y Bloqueo de Cuentas

Por **Guillermo Delprato**

[Blog](http://windowserver.wordpress.com/)

Un tema que he visto muchas preguntas es sobre la posibilidad de tener
diferentes configuraciones de contraseñas y bloqueo de cuentas a
diferentes grupos de Dominio.

Esto no se puede hacer hasta Windows Server 2003 – 2003-R2. Si existía
la necesidad de implementarlo, la única forma era crear Dominios
diferentes, y hacerse cargo de la complejidad que eso implica

A partir de Windows Server 2008, la posiblidad está disponible, sólo que
el procedimiento no es fácil e intuitivo.\
Para aquellos que les interese vean: Active Directory Domain Services
(AD DS) Fine-Grained Password and Account Lockout Policy Step-by-Step
Guide:\
[*http://technet.microsoft.com/en-us/library/cc770842(WS.10).aspx*](http://technet.microsoft.com/en-us/library/cc770842(WS.10).aspx)

Pero a partir de Windows Server 2012 es mucho más sencillo

Lo primero que debemos conocer es el Active Directory Administrative
Center (ADAC.EXE) que podemos acceder desde Tools en el Server Manager

![] (./img/Contrasenas-y-Bloqueo-de-Cuentas/image1.png)

Expandimos el Dominio y vamos a System. Sobre el panel central veremos
“Password Settings Container” sobre el que con botón derecho elegiremos
New / Password Settings

![] (./img/Contrasenas-y-Bloqueo-de-Cuentas/image2.png)

En la siguiente pantalla podremos ingresar los requerimientos de
contraseñas y bloqueo de cuenta que necesitemos asignar a un grupo de
Dominio (adapten los datos a la propia necesidad)\
No olvidarse de utilizar el botón Add para indicar a qué grupo le
asignaremos esta configuración

![] (./img/Contrasenas-y-Bloqueo-de-Cuentas/image3.png)

![] (./img/Contrasenas-y-Bloqueo-de-Cuentas/image4.png)

Quedará como muestra la siguiente figura, y de ser necesario ingresando
por Properties podremos cambiar la configuración

![] (./img/Contrasenas-y-Bloqueo-de-Cuentas/image5.png)

Resumiendo: mucho más fácil y con un procedimiento amigable




