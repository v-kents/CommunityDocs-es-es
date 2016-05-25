<properties
	pageTitle="Creando mi nube privada: Self Service portal 2.0 Instalación"
	description="Creando mi nube privada: Self Service portal 2.0 Instalación"
	services="cloud"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="cloud"
	ms.workload="setup"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/13/2016"
	ms.author="andygonusa"/>

# Creando mi nube privada: Self Service portal 2.0 Instalación

  ----------------------------------------------------------------
  Pablo Campos                                         Mayo 2012
                                                       
  MVP                                                  
  ---------------------------------------------------- -----------
  [Blog](http://geeks.ms/blogs/pcampos/default.aspx)
  ----------------------------------------------------------------

Ya esta claro que la tendencia es la nube, es por esto que Microsoft
lanza un producto llamado Self Service Portal 2.0, que lo pueden
descargar desde
[*acá*](http://www.microsoft.com/downloads/en/details.aspx?FamilyID=fef38539-ae5a-462b-b1c9-9a02238bb8a7&displaylang=es),
el cual nos permitirá confeccionar nuestra propia nube privada, para así
poder ofrecer servicios de datacenter en la nube.

- Serie de artículos “Creando mi nube privada”

- Parte 1: Instalación

- Parte 2: Configuración Inicial

- Parte 3: Creación de Plantillas de VM

    

Cuales son los requisitos para esta nube privada

- Windows Server 2008 R2 Enterprise o Datacenter Edition

- SQL Server 2008 (r2) Enterprise o Standard Edition …. NO EXPRESS

- System Center Virtual Machine Manager 2008 R2

    

Este SSP 2.0 no remplaza para nada al SSP que ya tiene el SCVMM y pueden
trabajar los dos juntos sin ningún problema

La arquitectura que desarrollaremos en este demo es simple:
Un Servidor llamado **2008R2Sp1.alx.local** que desempeñara las labores
de:

- Hyper-v Server

- Active Directory

- SCVMM 2008 R2 Server

    

Un Servidor llamado **SSP2.alx.local** que desempeñara las labores de:

- SQL Server

- Servidor web front end de SSP2

- Servidor de base de datos de SSP2

- Servidor de SSP2

    

Antes de comenzar crearemos una cuenta llamada **ssp2** en nuestro
Active Directory que será la encargada de levantar los servicios mas
adelante.

Instalación
===========

Primero que todo los prerrequisitos

- **IIS 7 (**Static Content, Default Document,ASP.NET,.NET Extensibility, ISAPI Extensions, ISAPI Filters, Request Filtering, Windows Authentication, IIS 6 Metabase Compatibility)

- **SQL Server 2008 “*en mi caso instalado por defecto*”**

- **Windows PowerShell 2.0 **

- **Microsoft .NET Framework 3.5 SP1 **

- **Message Queuing** “con la integración de active directory”



![](./img/Creando mi nube privada/image1.png)

Instalar solo la consola de administración de SCVMM 2008 R2 en el servidor SSP2

Existen varios tipos de instalación, hay una bastante sencilla, donde
todos los componentes del SSP, se instalan en un solo servidor “Ese en
mi caso”, existe otra que podemos instalar los componentes por separados
en distintos servidores.

Todo en uno

Componentes separados


![](./img/Creando mi nube privada/image2.png)

![](./img/Creando mi nube privada/image3.png)

Ahora comenzamos el proceso de instalación del Self Service portal
2.0

![](./img/Creando mi nube privada/image4.png)

En este paso usamos nuestra cuenta previamente creada, para que lance el
servicio del ssp

![](./img/Creando mi nube privada/image5.png)

Eso es toda la instalación, la configuración y primeros pasos, los
veremos en el próximo post.

![](./img/Creando mi nube privada/image6.png)


