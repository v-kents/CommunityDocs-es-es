---
title: Captura logs de seguridad en Azure
description: Habilitar la captura de logs del visor de eventos de una máquina virtual en Azure
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: cloud
ms.custom: CommunityDocs
---





# Captura logs de seguridad en Azure

Por [Juan José Diaz Antuña] (https://mvp.microsoft.com/en-us/PublicProfile/5000260?fullName=Juan%20Jose%20Diaz%20Antu%C3%B1a)

[Twitter: @diazantuna] (https://twitter.com/diazantuna) 

**Microsoft MVP**, Windows Expert-IT Pro



En este post os explico cómo hacer para habilitar la captura de los diferentes logs del visor de eventos de una máquina virtual en Azure. Pasos a dar:

**Obtener fichero de publicación de Azure**

![img1] (./img/Captura-logs-de-seguridad-en-Azure/img1.png)


**Descargamos el fichero**

**Importamos el fichero**

![img2] (./img/Captura-logs-de-seguridad-en-Azure/img2.png)

**Preparamos los eventos que queremos capturar con el fichero XML**

![img3] (./img/Captura-logs-de-seguridad-en-Azure/img3.png)

**Descargamos el fichero WAD para validar nuestro XML**

![img4] (./img/Captura-logs-de-seguridad-en-Azure/img4.png)

Si queremos validar nuestro archivo debemos de utilizar Visual Studio, en mi caso no lo he realizado

**Añado la cuenta de Azure**

![img5] (./img/Captura-logs-de-seguridad-en-Azure/img5.png)

**Creo el script**
Script

````
\$storage_name = “Nombre del almacenamiento en Azure”*\ *

\$key = “Clave almacenamiento en Azure”*\ *

\$config_path=”Path fichero configuración configurado anteriormente”*\ *

\$service_name=”Nombre del servicio”*\ *

\$vm_name=”Nombre VM”*\ *

\$storageContext = New-AzureStorageContext -StorageAccountName \$storage_name -StorageAccountKey \$key*\ *

\$VM1 = Get-AzureVM -ServiceName \$service_name -Name \$vm_name*\ *

\$VM2 = Set-AzureVMDiagnosticsExtension -DiagnosticsConfigurationPath \$config_path -Version “1.*” -VM \$VM1 -StorageContext \$storageContext*\ *
````

````
\$VM3 = Update-AzureVM -ServiceName \$service_name -Name \$vm_name -VM \$VM2.VM*\ * 
````


**Ejecuto el script**

![img6] (./img/Captura-logs-de-seguridad-en-Azure/img6.png)

Ya está configurada la captura de logs, para verlos utilizo el Azure Storage Explorer.


