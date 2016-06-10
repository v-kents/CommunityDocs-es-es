---
title: LAB Virtual WS 2012 y Windows 8 [Parte 2] – Instalación y Configuración en Windows Server 2012 de los roles- Active Directory, DNS, DHCP
description: LAB Virtual WS 2012 y Windows 8 [Parte 2] – Instalación y Configuración en Windows Server 2012 de los roles- Active Directory, DNS, DHCP
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: web-dev
ms.custom: CommunityDocs
---







#LAB Virtual WS 2012 y Windows 8 [Parte 2] – Instalación y Configuración en Windows Server 2012 de los roles: Active Directory, DNS, DHCP

Por [Jesús Enrique
Gonzales](http://mvp.microsoft.com/en-us/mvp/Jesus%20Enrique%20Gonzales%20Azcarate-5000714)

Blog: <http://geeks.ms/blogs/JesusGonzales/>

<http://pe.linkedin.com/pub/jesus-enrique-gonzales-azcarate/24/a41/530>

Continuamos con la elaboración de la segunda parte de la serie, así
vamos teniendo listo nuestro LAB con WS 2012 para luego realizar un
despliegue con Windows Deployment Services de Windows 8.

Ahora procedemos a realizar la instalación de Active Directory Domain
Services, así luego podemos concluir con la instalación de AD.

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image1.PNG)

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image2.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image3.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image4.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image5.PNG)
    

Una vez finalizada la instalación de Active Directory Domain Services,
podemos observar en el Server Manager una advertencia indicando que
falta ejecutar el asistente para la configuración de Active Directory. 

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image6.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image7.PNG)
    

Se agrega de forma automática el rol de DNS:

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image8.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image9.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image10.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image11.PNG)
    

Reinicia el servidor y ahora nos autenticamos en el DC con la cuenta y
password respectivo:

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image12.PNG)
    

Nos dirijimos al Server Manager y agregamos el rol de DHCP:

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image13.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image14.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image15.PNG)
    

Ingresamos al DHCP para configurar el Scope respectivo:

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image16.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image17.PNG)
    

![](./img/LAB Virtual WS 2012 y Windows 8 Parte 2/image18.PNG)
    

Hasta el momento ya tenemos configurado nuestro servidor WS 2012 como
DC, DNS y DHCP.

Continuaremos con la elaboración de la serie, ahora faltaría instalar y
configurar WDS para realizar el despliegue de Windows 8 por la red.

Saludos!


