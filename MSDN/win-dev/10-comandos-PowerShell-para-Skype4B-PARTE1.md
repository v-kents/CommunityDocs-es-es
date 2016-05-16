# 10 comandos PowerShell para usar en Skype4B PARTE I

<properties
	pageTitle="10 comandos PowerShell para usar en Skype4B PARTE I"
	description="Comandos de Powershell para Skype For Business"
	services="windows"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="windows"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>

Por Peter Diaz, Microsoft MVP

LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>

Profesional en el área de IT con más de 10 años de experiencia en
proyectos y consultorías de Seguridad Informática, Infraestructura y
Comunicaciones Unificadas. MVP/MCT/MCITP Lync/MAP 2012/MCC MCP ID:
3095363 MVP ID: 4039848

Hola a todos siguiendo un poco la tradición que siempre me acompaña en
enseñar comandos Powershell para Skype For Business quiero compartir con
ustedes los 10 comandos que más utilizo en este sentido.

![img1] (./img/10-comandos-PowerShell/image1.png)

Figura 1. Consola de Administración de Skype For Business

Lista de comandos:

1.- Get-CsAddressBookConfiguration: Me permite consultar como está
configurada la replicación de los contactos (address book) desde el
directorio activo hacia los clientes de Skype for Business.

Por líneas generales la replicación global se lleva a cabo todos los
días a las 01:30, esta hora se puede modificar con el comando
Set-CsAddressBookConfiguration

y la sincronización del pool se lleva a cabo cada 5 minutos, también se
puede elevar los minutos en este sentido.

Nota:
[*https://technet.microsoft.com/en-us/library/gg398132.aspx*](https://technet.microsoft.com/en-us/library/gg398132.aspx)

![img2] (./img/10-comandos-PowerShell/image2.png)
 

**2.- Invoke-CSManagementStoreReplication:** Nos sirve cuando hemos
realizado un cambio en nuestro Skype For Business a nivel de Topología y
queremos forzar los cambios realizados para que se repliquen las Central
Management Store de Skype for Business.

Nota:
[*http://blogs.technet.com/b/jenstr/archive/2010/10/13/what-is-central-management-store-cms.aspx*](http://blogs.technet.com/b/jenstr/archive/2010/10/13/what-is-central-management-store-cms.aspx)

Nota:
[*https://technet.microsoft.com/en-us/library/gg413060.aspx*](https://technet.microsoft.com/en-us/library/gg413060.aspx)

**Al ejecutarlo veremos que la replicación se perderá por unos segundos,
pero luego volverá “no se asusten” es normal.**

![img3] (./img/10-comandos-PowerShell/image3.png)

![img4] (./img/10-comandos-PowerShell/image4.png)

![img5] (./img/10-comandos-PowerShell/image5.png)



**3.- Enable-CsTopology – Verbose:** Este es uno de los comandos que más
utilizo, me sirve para publicar la topología luego de realizar un cambio
o de agregar algún componente adicional que haya configurado. 

No quiere decir que dejemos de utilizar la publicación de la topología a
través del Topology Builder, pero particularmente a mí me parece más
cómodo por Powershell, además que con el comando – Verbose podemos ver
que está pasando por debajo del comando y podemos ver donde se aloja el
logs del mismo.

Nota:
[*https://technet.microsoft.com/en-us/library/gg398398.aspx*](https://technet.microsoft.com/en-us/library/gg398398.aspx)

![img6] (./img/10-comandos-PowerShell/image6.png)

**4.-Enable-CsComputer – Verbose:** Con este comando podemos actualizar
de manera inmediata cualquier cambio a la configuración que hagamos en
nuestros servidores de Skype For Business sin necesidad de utilizar la
interfaz gráfica Skype For Business Deployment Wizard.

**Importante que para utilizar este comando hay que ejecutarlo con
privilegios administrativos.**

![img7] (./img/10-comandos-PowerShell/image7.png)

Nota:
[*https://technet.microsoft.com/en-us/library/gg412815.aspx*](https://technet.microsoft.com/en-us/library/gg412815.aspx)

**5.- Get-CsCertificate:** Este comando es útil para verificar los
certificados instalados en nuestros servidores de Skype For Business
sobre todo para consultar el Thumbprint que es uno de los parámetros que
nos solicitara por ejemplo si vamos a realizar una integración con la
parte de mensajería unificadas de Exchange o para la integración de
aptitudes con SharePoint.

Nota:
[*https://technet.microsoft.com/en-us/library/gg398227.aspx*](https://technet.microsoft.com/en-us/library/gg398227.aspx)

![img8] (./img/10-comandos-PowerShell/image8.png)
