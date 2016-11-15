---
title: Edge Server en Lync 2013 “No Replica” Troubleshooting
description: Edge Server en Lync 2013 “No Replica” Troubleshooting
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: servers
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Edge Server en Lync 2013 “No Replica” Troubleshooting

**Por Peter Diaz**

Profesional en el área de IT con más de 10 años de experiencia en
proyectos y consultorías de Seguridad Informática, Infraestructura y
Comunicaciones Unificadas. MVP/MCT/MCITP Lync/MAP 2012/MCC MCP ID:
3095363 MVP ID: 4039848

LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>

Microsoft MVP




Escenario
---------

Nuestro Servidor de Edge Server de Lync 2013 no replica, nos vamos al
Lync Control Panel y verificamos la Topología:

![](./img/Edge Server en Lync 2013 No Replica Troubleshooting/image1.png)


Ahora nos vamos a nuestro Lync Managment Shell y ejecutamos el siguiente
comando, para verificar el estado de las replicaciones:

Get-CsManagementStoreReplicationStatus
--------------------------------------

![](./img/Edge Server en Lync 2013 No Replica Troubleshooting/image2.png)

Como podemos ver nuestro servidor de Edge no está replicando.

Solución
--------

La solución pasa por agregar una nueva llave en el **REGEDIT** de
nuestro servidor **Windows Server 2012** donde está instalado el Edge
Server de Lync 2013.

En la clave:

![](./img/Edge Server en Lync 2013 No Replica Troubleshooting/image3.png)

Agregamos un nuevo registro **DWORD** bajo el nombre:

**Value Name: ClientAuthTrustMode **

**Value data: 2**

![](./img/Edge Server en Lync 2013 No Replica Troubleshooting/image4.png)


Inmediatamente “**reiniciamos nuestro servidor de Edge Server de Lync
2013”** y ejecutamos el siguiente comando Lync Managment Shell en el
Front End para forzar la replicación:

**Invoke-CsManagementStoreReplication**

![](./img/Edge Server en Lync 2013 No Replica Troubleshooting/image5.png)

Luego nos vamos a nuestro Lync Control Panel, ya ahora debería de ir la
replicación sin problemas:

![](./img/Edge Server en Lync 2013 No Replica Troubleshooting/image6.png)


![](./img/Edge Server en Lync 2013 No Replica Troubleshooting/image7.png)


Peter Diaz

MVP-MCT-MAP




