---
redirect_url: https://docs.microsoft.com/
title: Paso a Paso - Administración de Lync Online con Powershell
description: Paso a Paso - Administración de Lync Online con Powershell
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: servers
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Paso a Paso - Administración de Lync Online con Powershell


**Por Peter Diaz**

Profesional en el área de IT con más de 10 años de experiencia en
proyectos y consultorías de Seguridad Informática, Infraestructura y
Comunicaciones Unificadas. MVP/MCT/MCITP Lync/MAP 2012/MCC MCP ID:
3095363 MVP ID: 4039848

LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>

Microsoft MVP

Como parte de los laboratorios realizados el día de ayer en el [*IT CAMP
de Lync
Online*](http://ucenespanol.com/2014/01/11/itcamp-lync-onlinecomunidad-office-365-espaa-2/)
en la [*Fundación
Tajamar*](http://www.tajamar.es/index.php?option=com_content&view=article&id=523:fundacion-tajamar&catid=94:noticias-fundacion&Itemid=349),
hubo uno de ellos el cual es mi favorito  que es instalar el módulo de
administración para Lync Online con Powershell a continuación intentare
de manera sencilla el paso a paso:

Pre requisitos:
---------------

La administración remota de Lync Online con Windows PowerShell solo se
admite en equipos de 64 bits que ejecutan uno de los siguientes sistemas
operativos:

- Windows 7

- Windows Server 2008 R2

- Windows Server 2012

- Windows 8

Además del sistema operativo admitido, el equipo también debe ejecutar
lo siguiente:

- Windows PowerShell 3.0

- Microsoft Online Services – Ayudante para el inicio de sesión para
profesionales de TI RTW

- Módulo del conector de Lync Online

[*http://technet.microsoft.com/es-es/library/dn362839.aspx*](http://technet.microsoft.com/es-es/library/dn362839.aspx)

1.- Debemos de descargar el módulo de Powershell para Lync Online en el siguiente URL:
--------------------------------------------------------------------------------------

[*http://www.microsoft.com/en-us/download/details.aspx?id=39366*](http://www.microsoft.com/en-us/download/details.aspx?id=39366)

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image1.png)

2.- Inmediatamente debemos de abrir nuestra consola de Windows Powershell 
--------------------------------------------------------------------------

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image2.png)

Import-Module LyncOnlineConnector

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image3.png)
    

3.- Ahora instalaremos el ayudante de administración para Lync Online:
----------------------------------------------------------------------

3.1
[*http://www.microsoft.com/es-es/download/details.aspx?id=28177*](http://www.microsoft.com/es-es/download/details.aspx?id=28177)

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image4.png)

Nota: Debemos antes de abrir la consola de Powershell para la
administración de Lync Online verificar si tenemos instalado el módulo
de Windows Powershell 3.0 como mínimo ejecutando el siguiente comando
Powershell.

Get-Host | Select-Object Version

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image5.png)
    

En este caso tenemos la versión 4.0 por tratarse de un sistema operativo
Windows 8.1

4.- Ahora si vamos a conectarnos a nuestro Lync Online para Administrarlo vía Powershell:
-----------------------------------------------------------------------------------------

4.1 Desde la consola Windows Powershell ejecutar los siguientes
comandos:

**$credential = Get-Credential**

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image6.png)
    

Nota: Con este comando cargamos en cache nuestra credencial
administrativa de la cuenta de Lync Online

4.2 Ejecuta el siguiente comando para verificar que estar cargadas en
cache nuestras credenciales

$credential

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image7.png)
    

5.- Iniciar la sesión con nuestro Lync Online (tardara algunos segundos no desesperes)
--------------------------------------------------------------------------------------

$session = New-CsOnlineSession -Credential $credential

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image8.png)
    

6. - Importar los módulos Powershell
------------------------------------

Import-PSSession $session

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image9.png)


7.- Chequeamos los módulos descargados
--------------------------------------

Get-Module

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image10.png)
    

8.- Listo ya podemos administrar nuestro Lync Online verificando todos los comandos disponibles con el siguiente comando
------------------------------------------------------------------------------------------------------------------------

Get-Command

![](./img/Paso a Paso - Administracion de Lync Online con Powershell/image11.png)
    

Si deseas descargar la guía completa de los laboratorios de Lync Online
ve al siguiente enlace:

[*http://sdrv.ms/1gtZ8KY*](http://sdrv.ms/1gtZ8KY)

Peter Diaz

Lync MVP – MCT – MAP




