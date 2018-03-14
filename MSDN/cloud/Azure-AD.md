---redirect_url: https://docs.microsoft.com/
title: Active Directory en Azure
description: Active Directory en Azure
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: cloud
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Active Directory en Azure

Por **Por Juan José Diaz Antuña**

Uno de los elementos  básicos cuando  quiero trabajar con Azure o aplicaciones online es la administración de identidad de los usuarios o lo que es lo mismo como autentico a usuarios para que accedan a esas aplicaciones. Cuando trabajamos onpremise esta fase es relativamente sencilla ya que la mayoría de la gente está acostumbrada a trabajar con Active Directory. Pero ¿y en la nube de Azure? ¿Cómo autentico yo a mis usuarios para que utilicen office 365 o CRM Online?

La respuesta a  estas preguntas es la quiero plasmar en este artículo. A nivel de Azure existen dos opciones a la hora de administrar la identidad y el control de acceso, que son Azure Active Directory y Windows Server AD en Azure. 
Lo primero que tenemos que decir es que no son excluyentes, es decir yo puede tener implementadas ambas soluciones dependiendo de mis necesidades. Detallo a continuación lo que es cada uno de ellos.
Azure Active Directory es la forma de administrar identidad y control de acceso que Microsoft tienes para sus aplicaciones SaaS, como Office 365, CRM Online, Onedrive… Decir que no penséis que solo se puedes utilizar para aplicaciones SaaS Microsoft, yo puedo utilizar Azure Active Directory para autenticarme contra Google Apps, Amazon Web Services, Dropbox … así hasta un total de 2400 apps, pero no solo eso, incluso podría utilizarlo junto con Azure aplication proxy para autenticar las aplicaciones onpremises de mi empresa.


![] (./img/Azure-AD/image1.png)

En cambio Windows Server Active Directory en Azure son la extensión de mi directorio activo onpremise en la nube de Azure, bien siendo parte de mi CPD de respaldo o bien porque tengo maquinas en Azure que necesitan de ese Active Directory para funcionar (Por ejemplo Navision).
¿Y cómo conecto, y sincronizo todo esto? Pues la verdad es que más fácil de lo que uno se piensa. Azure Active Directory se sincroniza de forma muy sencilla con mi Active Directory OnPremise llamada Directory Sync. Esta conexión única, fiable y segura me permite sincronizar mis cuentas de Active Directory Onpremise con mis Saas en Azure, permitiendo autenticarme con un a única cuenta de usuario en todas aquellas aplicaciones SaaS asociadas sean o no de Microsoft. 

![] (./img/Azure-AD/image2.png)

En cambio sí utilizo Windows Server Active Directory tendré una conexión entre mi red local onpremise y la red virtual de Azure, mediante un conexión VPN o mediante ExpressRoute. Azure será un site más de directorio activo. 

![] (./img/Azure-AD/image3.png)





