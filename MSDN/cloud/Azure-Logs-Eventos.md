---
title: Captura logs de seguridad en Azure
description: Habilitar la captura de los diferentes logs del visor de eventos
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: cloud
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Captura logs de seguridad en Azure

Por [Juan José Diaz
Antuña](http://mvp.microsoft.com/en-us/mvp/Juan%20Jose%20Diaz%20Antu%c3%b1a-5000260),
@diazantuna 

Microsoft MVP

Windows Expert-IT Pro

En este post os explico cómo hacer para habilitar la captura de los
diferentes logs del visor de eventos de una máquina virtual en Azure.
Pasos a dar:

Obtener fichero de publicación de Azure

![](./img/Azure Logs Eventos/image1.png)

Descargamos el fichero

Importamos el fichero

![](./img/Azure Logs Eventos/image2.png)

Preparamos los eventos que queremos capturar con el fichero XML

![](./img/Azure Logs Eventos/image3.png)

Descargamos el fichero WAD para validar nuestro XML

![](./img/Azure Logs Eventos/image4.png)

Si queremos validar nuestro archivo debemos de utilizar Visual Studio,
en mi caso no lo he realizado

Añado la cuenta de Azure

![](./img/Azure Logs Eventos/image5.png)

Creo el script

Script

\$storage\_name =* *“Nombre del almacenamiento en Azure”*\

\$key = “Clave almacenamiento en Azure”*\

\$config\_path=”Path fichero configuración configurado anteriormente”*\

\$service\_name=”Nombre del servicio”*\

\$vm\_name=”Nombre VM”*\

\$storageContext = New-AzureStorageContext -StorageAccountName
\$storage\_name -StorageAccountKey \$key*\

\$VM1 = Get-AzureVM -ServiceName \$service\_name -Name \$vm\_name*\

\$VM2 = Set-AzureVMDiagnosticsExtension -DiagnosticsConfigurationPath
\$config\_path -Version “1.\*” -VM \$VM1 -StorageContext
\$storageContext*\

\$VM3 = Update-AzureVM -ServiceName \$service\_name -Name \$vm\_name -VM \$VM2.VM*\

Ejecuto el script

![](./img/Azure Logs Eventos/image6.png)

Ya está configurada la captura de logs, para verlos utilizo el Azure
Storage Explorer.




