---
redirect_url: https://docs.microsoft.com/
title: Cómo hacer Backup y Restaurar un Modelo MDS (Deploy)
description: Cómo hacer Backup y Restaurar un Modelo MDS (Deploy)
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: servers
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Cómo hacer Backup y Restaurar un Modelo MDS (Deploy)


Por **Freddy Angarita**

SqlServer MVP - [Perfil
MVP](https://mvp.support.microsoft.com/es-es/mvp/Freddy%20Leandro%20Angarita%20Castellanos-4028407)

<freddy_angarita@hotmail.com>

<http://geeks.ms/blogs/fangarita/default.aspx>



Para exportar la información del modelo podemos usar el siguiente
comando:

**C:\\Program Files\\Microsoft SQL Server\\110\\Master Data
Services\\Configuration&gt;MDSModelDeploy.exe createpackage **

**-model ModelName -package C:\\Folder\\MyPackage -version "VERSION\_1"
-includedata**

**Creating a package for model ModelName**

**Saving package to file C:\\Folder\\MyPackage.pkg**

**MDSModelDeploy operation completed successfully. Elapsed time:
00:00:34.1175437**

Parámetros usados:

 | Parámetro    |   Descripción|
 | ---------------|------------------|
 | createpackage  | Indica que se desea generar un paquete para deployment|
 | -model     |     Nombre del modelo a publicar (sensible a la mayúscula)|
 | -package     |   Nombre del archivo a crear|
  |-version    |    Nombre de la versión que se desea publicar (sensible a la mayúscula)|
 | -includedata  |  Al agregarlo indica que los datos contenidos se adjunten al archivo a crear (considerar su uso en escenarios con grandes volúmenes de datos)|

Para Restaurar un Modelo MDS en otra instancia podemos seguir los
siguientes pasos:

Lo primero es establecer el nombre del servicio con el que se está
trabajando para ello se puede ejecutar el siguiente comando:

**C:\\Program Files\\Microsoft SQL Server\\110\\Master Data
Services\\Configuration&gt;MDSModelDeploy.exe listservices**

**MDS services (Service, Website, Virtual Path):**

**MDS1, Default Web Site, MDS**

**MDSModelDeploy operation completed successfully. Elapsed time:
00:00:04.8538819**

y luego, con el dato del nombre del servicio podemos proceder a ejecutar
el procedimiento de restauración

**C:\\Program Files\\Microsoft SQL Server\\110\\Master Data
Services\\Configuration&gt;MDSModelDeploy.exe deployclone **

**-package MyPackage.pkg -service MDS**

**Deploying clone of package MyPackage.pkg**

**MDSModelDeploy operation completed successfully. Elapsed time:
00:01:41.6708683**

** **

Espero sea de ayuda,

**FREDDY LEANDO ANGARITA CASTELLANOS**\
Sql Server MVP




