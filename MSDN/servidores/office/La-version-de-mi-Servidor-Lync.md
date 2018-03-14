---
redirect_url: https://docs.microsoft.com/
title: ¿Cómo saber la versión de mi Servidor Lync 2010-2013?
description: ¿Cómo saber la versión de mi Servidor Lync 2010-2013?
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: server
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#¿Cómo saber la versión de mi Servidor Lync 2010-2013?

Por **Peter Diaz**

LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>



En el siguiente artículo les enseñare las distintas maneras de saber en
qué versión esta nuestro servidor de Lync en su versión 2010 y/o 2013.

1.- El primer método y quizás el más sencillo es a través del comando
Lync Server Managment Shell
[**Get-CsServerVersion**](http://technet.microsoft.com/es-es/library/gg398470.aspx) 

**Lync 2010.**

![] (./img/La-versiion-de-mi-Servidor-Lync/image1.png)

Lync 2013.

![] (./img/La-versiion-de-mi-Servidor-Lync/image2.png)

2.- Utilizando el comando Powershell publicado en el blog de [*Premal
Ghandi*](http://blogs.technet.com/b/premal/archive/2011/06/07/powershell-command-to-find-the-version-of-lync-server-installed-components.aspx)

*Get-WmiObject -query ‘select \* from win32\_product’ | where {\$\_.name
-like “Microsoft Lync Server\*”} |ft Name, Version -AutoSize*

**Lync 2010.**

![] (./img/La-versiion-de-mi-Servidor-Lync/image3.png)

Lync 2013.

![] (./img/La-versiion-de-mi-Servidor-Lync/image4.png)
 
3.- Instalando los Cummulative Update de Lync Server 2010 (únicamente)
que podemos descargar desde el sitio oficial [***Update Resources
Center***](http://technet.microsoft.com/en-us/lync/gg131945.aspx)
inmediatamente al descargar  y dar clic sobre el fichero (archivo)
***LyncServerupdateInstaller.exe*** nos desplegara la versión en la que
se encuentra instalada en nuestro Lync Server 2010.

**Lync 2010 (únicamente)**

![] (./img/La-versiion-de-mi-Servidor-Lync/image5.png)

![] (./img/La-versiion-de-mi-Servidor-Lync/image6.png)

4.- Chequeando el software instalado desde nuestro Control Panel –&gt;
Programs and Features

![] (./img/La-versiion-de-mi-Servidor-Lync/image7.png)

Lync 2010

![] (./img/La-versiion-de-mi-Servidor-Lync/image8.png)

Lync2013

![] (./img/La-versiion-de-mi-Servidor-Lync/image9.png)





