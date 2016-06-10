---
title: LAB Virtual WS 2012 y Windows 8 [Parte 1] – Creación de la Máquina Virtual y Configuración de Hyper-V en Windows Server 2012
description: LAB Virtual WS 2012 y Windows 8 [Parte 1] – Creación de la Máquina Virtual y Configuración de Hyper-V en Windows Server 2012
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: web-dev
ms.custom: CommunityDocs
---






#LAB Virtual WS 2012 y Windows 8 [Parte 1] – Creación de la Máquina Virtual y Configuración de Hyper-V en Windows Server 2012

Por [Jesús Enrique
Gonzales](http://mvp.microsoft.com/en-us/mvp/Jesus%20Enrique%20Gonzales%20Azcarate-5000714)

Blog: <http://geeks.ms/blogs/JesusGonzales/>

<http://pe.linkedin.com/pub/jesus-enrique-gonzales-azcarate/24/a41/530>

Primero empezamos creando la VM en donde instalaremos Windows Server
2012, para ésto debemos agregar el rol de Hyper-V en

Windows Server y luego procedemos a crear la máquina virtual desde cero
para continuar con la instalación del S.O.

Pueden descargar una copia trial de Windows Server 2012:
[*http://technet.microsoft.com/en-us/evalcenter/hh670538.aspx*](http://technet.microsoft.com/en-us/evalcenter/hh670538.aspx) 

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 1/image1.PNG)

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 1/image2.PNG)

Una vez configurada la VM con los recursos necesarios, agregamos el ISO
de instalación de WS 2012 y continuamos con la instalación:

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 1/image3.PNG)

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 1/image4.PNG)

Configuramos la cuenta Administrator y agregamos el password respectivo.

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 1/image5.PNG)

Luego debemos de activar nuestro WS 2012, accedemos al CMD como
administrador y ejecutamos lo siguiente:

Ejecuta CMD como Administrator

slmgr.vbs –ipk **“Ingresar product key” **

slmgr.vbs -ato

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 1/image6.PNG)

En una próxima entrega estaremos instalando y configurando nuestro
servidor WS 2012 como Active Directory, DNS y DHCP.

Nos vemos!


