<properties
	pageTitle="Explorando el DOM: Nodos de texto. Gestión multinodal"
	description="Labores de tratamiento de contenidos de los nodos de texto, gestión de nodos multinodos"
	services="web-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="web-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/12/2016"
	ms.author="andygonusa"/>


Por [Juan José Diaz Antuña] (https://mvp.microsoft.com/en-us/PublicProfile/5000260?fullName=Juan%20Jose%20Diaz%20Antu%C3%B1a)

[Twitter: @diazantuna] (https://twitter.com/diazantuna) 

**Microsoft MVP**

Windows Expert-IT Pro



En este post os explico cómo hacer para habilitar la captura de los diferentes logs del visor de eventos de una máquina virtual en Azure. Pasos a dar:

*Obtener fichero de publicación de Azure

**Descargamos el fichero**

**Importamos el fichero**

**Preparamos los eventos que queremos capturar con el fichero XML**

**Descargamos el fichero WAD para validar nuestro XML**

Si queremos validar nuestro archivo debemos de utilizar Visual Studio, en mi caso no lo he realizado

**Añado la cuenta de Azure**

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

Ya está configurada la captura de logs, para verlos utilizo el Azure Storage Explorer.
