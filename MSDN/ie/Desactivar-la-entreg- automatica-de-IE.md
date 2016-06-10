---
title: Web API II – Creando un CRUD, trabajando con verbos HTTP
description: Implementar fácilmente un CRUD
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: ie
ms.custom: CommunityDocs
---







#Desactivar la entrega automática de IE

Por **Jesús Octavio Rodríguez de Santiago**, MVP

https://www.facebook.com/freelance.deployment

<https://plus.google.com/+JesusOctavioRodriguezdeSantiago>

<http://mx.linkedin.com/in/octaviordz>

[http://www.freelance-it.com.mx](http://www.freelance-it.com.mx/)

[@DeploymentMX](http://twitter.com/deploymentMX) 

 

Hola que tal amigos pues si de acuerdo a un artículo publicado por
Renshollanders donde tiene la experiencia sobre un cliente en particular
vamos a ver estos casos.

Existe herramientas automatizadas o scripts que bloquean IE (X) versión
de acuerdo al sistema operativo que manejamos, yo en lo particular,
existen componentes dentro de mi empresa cuales los usuarios se reúsan a
utilizar nuevas mejoras de los productos, como es el caso también de
Internet Explorer, sabemos que por default Windows 7  o Windows Server
2008 R2 utilizan la versión de IE8 por lo que también existe la
posibilidad de poder bloquear en los updates las nuevas actualizaciones
hacia los usuarios.

![] (./img/Desactivar-la-entreg- automatica-de-IE/image1.png)

De acuerdo a las versiones previas podemos descargar la que mejor nos
ayude a solucionar este tipo de temas.

- [IE 7](http://www.microsoft.com/en-us/download/details.aspx?id=13428)

- [IE 8](http://www.microsoft.com/en-us/download/details.aspx?id=14149)

- [IE 9](http://www.microsoft.com/en-us/download/details.aspx?id=179)

- [IE 10](http://www.microsoft.com/en-us/download/details.aspx?id=36512)

Esta herramienta de bloqueo está dirigida a empresas que desean bloquear
la entrega automática de Internet Explorer.

Aquí algunas características a tomar en cuenta de acuerdo a la
información del archivo.

Para equipos que ejecutan Windows 7 o Windows Server 2008 R2, el Toolkit
bloqueador impide que la máquina receptora Internet Explorer 11 a través
de actualizaciones automáticas en los sitios de Windows Update y
Microsoft.

El kit de herramientas de bloqueo no impedir que los usuarios instalen
manualmente Internet Explorer 11 desde el Centro de descarga de
Microsoft o desde una unidad externa.

Las organizaciones no tienen que implementar el Kit de herramientas de
bloqueador en entornos administrados con una solución de administración
de actualizaciones como Windows Server Update Services o System Center
Configuration Manager 2012. Las organizaciones pueden utilizar estos
productos para administrar completamente la implementación de las
actualizaciones lanzadas a través de Windows Update y Microsoft Update,
incluyendo Internet Explorer 11, dentro de su entorno.

Si ha utilizado el kit de herramientas de bloqueador para bloquear
Internet Explorer 10 se instala como una actualización de alta
prioridad, es necesario utilizar la versión de Internet Explorer 11 del
Juego de Herramientas bloqueador para bloquear Internet Explorer 11 se
instale. Existen diferentes claves de registro utilizadas para bloquear
o desbloquear la entrega automática de Internet Explorer 10 e Internet
Explorer 11.

Podemos hacer uso de esta herramienta para despliegue tanto manual,
utilizando MDT, SCCCM, o GPO

El script crea una clave de registro y establece el valor asociado para
bloquear o desbloquear (dependiendo de la opción de línea de comandos
que se utiliza) la entrega automática de Internet Explorer 11 ya sea en
el equipo local o en un equipo de destino remoto.

![] (./img/Desactivar-la-entreg- automatica-de-IE/image2.png)

Si aún tenemos la encomienda de hacer despliegue de Windows 7 como este
es el caso, podemos ejecutar este script de IE11 para que no se tenga
que actualizar de forma automática.

Este bloqueado utiliza switches por ejemplo:

![] (./img/Desactivar-la-entreg- automatica-de-IE/image3.png)

Veamos un ejemplo en mi equipo de cómputo

Copiamos el archivo en c:\\ y abrimos cmd para colocar de acuerdo a la
imagen

![] (./img/Desactivar-la-entreg- automatica-de-IE/image4.png)

![] (./img/Desactivar-la-entreg- automatica-de-IE/image5.png)

El script en ese momento crea una clave para denegar las
actualizaciones, esto lo podemos observar en el árbol de REGEDIT en la
siguiente ruta.

        HKLM\\Software\\Microsoft\\Internet Explorer\\Setup\\11.0

![] (./img/Desactivar-la-entreg- automatica-de-IE/image6.png)

Ahora ejecutamos el comando /U para ver la clave que genera

![] (./img/Desactivar-la-entreg- automatica-de-IE/image7.png)

![] (./img/Desactivar-la-entreg- automatica-de-IE/image8.png)

Además de este ejecutable, también está el archivo ADM

La plantilla administrativa de directiva de grupo (. Archivo ADM)
permite a los administradores importar la nueva configuración de
directiva de grupo para bloquear o desbloquear la entrega automática de
Internet Explorer 11 en su entorno de directiva de grupo, y el uso de la
directiva de grupo para ejecutar el centro de la acción a través de los
sistemas en su entorno

Los usuarios que ejecutan Windows 7 (SP1) o Windows Server 2008 R2 (SP1)
verán la política en plantillas de configuración

Computer Configuration/Administrative Templates/Classic Administrative
Templates/Windows Components/Windows Update/Automatic Updates Blockers

Saludos a todos mis lectores y estamos con nuevos post


