---
title: Creación de una política en directorio activo para despliegue de certificados para OCS Lync cliente
description: Creación de una política en directorio activo para despliegue de certificados para OCS Lync cliente
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: server
ms.custom: CommunityDocs
---






#Creación de una política en directorio activo para despliegue de certificados para OCS Lync cliente

Por **Peter Diaz**


LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>


Es de gran utilidad contar con una política de dominio para realizar el
despliegue de certificados a los clientes de OCS-Lync, a continuación
les daré los detalles de cómo realizarla:

**Esta opción aplica para Windows Server 2003-2008 (las imágenes
proceden de un servidor Windows 2003), les recuerdo que para utilizar la
consola GPMC en Windows Server 2003 se debe proceder a descargarla de la
web e instalarla en el servidor:**
***http://www.microsoft.com/download/en/details.aspx?id=21895* Para
Windows Server 2008 la consola ya viene en el Server Manager (no hace
falta descargarla)**


![] (./img/Politica-para-OCS-Lync/image1.png)

1.- Abrir consola GPMC y crear una política para OCS-Lync -&gt; Edit


![] (./img/Politica-para-OCS-Lync/image2.png)

2.- Clic Edit


![] (./img/Politica-para-OCS-Lync/image3.png)

3.- Ir hasta la sección Windows Settings-&gt;Security
Settings-&gt;Public Key Policies-&gt;Trusted Publishers-&gt;Botón
derecho del mouse-&gt; Import


![] (./img/Politica-para-OCS-Lync/image4.png)

4.- Seleccionar el certificado que se ha dejado en el servidor en la
siguiente ruta:

C:\\certificado\\certificado.cer (por ejemplo), ya previamente debimos
de hacer exportado el certificado desde la consola administrativa de la
entidad certificadora.


![] (./img/Politica-para-OCS-Lync/image5.png)

5.- Siguiente


![] (./img/Politica-para-OCS-Lync/image6.png)

6.- Siguiente


![] (./img/Politica-para-OCS-Lync/image7.png)

7.- Finish

8.- Forzar la política con el comando: gpupdate /force (si aplica)

Fuente:
[*http://technet.microsoft.com/en-us/library/cc770315(v=ws.10).aspx*](http://technet.microsoft.com/en-us/library/cc770315(v=ws.10).aspx)

*Nota: Las opciones para la creación de la política se han realizado en
el idioma Ingles, las opciones en Español son las mismas pero con
diferente literatura.*



