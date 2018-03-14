---
redirect_url: https://docs.microsoft.com/
title: 10 comandos PowerShell para usar en Skype4B PARTE II
description: Comandos de Powershell para Skype For Business
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: windows
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

# 10 comandos PowerShell para usar en Skype4B PARTE II





Por Peter Diaz, Microsoft MVP

LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>

Profesional en el área de IT con más de 10 años de experiencia en
proyectos y consultorías de Seguridad Informática, Infraestructura y
Comunicaciones Unificadas. MVP/MCT/MCITP Lync/MAP 2012/MCC MCP ID:
3095363 MVP ID: 4039848


Hola a todos, en el artículo pasado he dado los primeros 5 comandos de
Powershell para Skype For Business puedes verlo aquí (Parte I):

[*http://ucenespanol.com/2015/09/20/10-comandos-powershell-para-usar-en-skype4b-parte-i/*](http://ucenespanol.com/2015/09/20/10-comandos-powershell-para-usar-en-skype4b-parte-i/)

Siguiendo esta línea dejare los últimos 5 comandos Powershell que nos
ayudaran a hacer de nuestra administración un poco más sencilla.

**6.-  Stop-CsWindowsService:** Por algún motivo como una migración de
usuarios, el mantenimiento de un servidor o vamos a migrar a Skype For
Business y necesitamos parar todos los servicios de Skype for Business
este comando nos permitirá hacerlo con la máxima garantía que será así.


![img1] (./img/10-comandos-PowerShell2/image1.png)

Figura 1

![img1] (./img/10-comandos-PowerShell2/image2.png)


Figura 2

Nota:
[*https://technet.microsoft.com/es-es/library/gg398426.aspx*](https://technet.microsoft.com/es-es/library/gg398426.aspx)

7.- Start-CsWindowsService: Nos permite iniciar todos los servicios de
Skype For Business en nuestro servidor luego de detenerlos por algún
mantenimiento, actualización o migración de usuarios a un nuevo pool o
servidor.

![img1] (./img/10-comandos-PowerShell2/image3.png)


Figura 3

![img1] (./img/10-comandos-PowerShell2/image4.png)


Figura 4

Nota:
[*https://technet.microsoft.com/es-es/library/gg398561.aspx*](https://technet.microsoft.com/es-es/library/gg398561.aspx)

8.- Get-CsServerVersion: Con este comando nos da la versión o el
Cummulative Update que se encuentra nuestro servidor de Skype For
Business.

Una vez que tengamos la versión nos vamos a Bing para comprobar en que
CU se encuentra el servidor.

En este ejemplo esta en: 6.0.93.19.0

![img1] (./img/10-comandos-PowerShell2/image5.png)


Figura 5

La versión instalada es el CU de Junio del 2015.

![img1] (./img/10-comandos-PowerShell2/image6.png)


Figura 6

Nota:
[*https://technet.microsoft.com/es-ES/library/gg398470.aspx*](https://technet.microsoft.com/es-ES/library/gg398470.aspx)

9.- Update-CsAddressBook:  Se utiliza para forzar la replicación de la
libreta de direcciones desde y hacia la base de datos de los usuarios,
al ejecutar este comando podemos comprobar luego en el visor de eventos
de nuestro Front End de Skype4B si fue exitosa.

![img1] (./img/10-comandos-PowerShell2/image7.png)


Figura 7

![img1] (./img/10-comandos-PowerShell2/image8.png)


Figura 8

Nota:
[*https://technet.microsoft.com/es-ES/library/gg398194.aspx*](https://technet.microsoft.com/es-ES/library/gg398194.aspx)

10.- Get-CsSipDomain: Con este comando nos retorna el nombre SIP de
nuestro servidor de Skype For Business, muy útil cuando nos los piden
para realizar integraciones SIP con otros fabricantes.

![img1] (./img/10-comandos-PowerShell2/image9.png)


Figura 9




