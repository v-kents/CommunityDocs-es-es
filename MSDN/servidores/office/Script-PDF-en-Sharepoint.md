---
redirect_url: https://docs.microsoft.com/
title: Script para permitir a las bibliotecas abrir los archivos PDFS en SharePoint 2010
description: Script para permitir a las bibliotecas abrir los archivos PDFS en SharePoint 2010
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: servers
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Script para permitir a las bibliotecas abrir los archivos PDFS en SharePoint 2010


Manolo Herrera 

Más de 16 años como desarrollador de software para aplicaciones agrícola-comerciales. Amante de la tecnología .NET, disfruto mucho enseñando y compartiendo la experiencia y conocimientos adquiridos de la tecnología.   

  [Blog](http://jmhogua.blogspot.com/)
  
Junio 2012


Esta opción esta bloqueada en SharePoint 2010 de forma predeterminada y
a pesar que habilitemos a nivel de Aplicación Web el navegador de manejo
de archivos a permisivo, esto solo funcionará para las bibliotecas del
sitio primario de la colección de sitios, pero no para las bibliotecas
de otros sub-sitios, ya que SharePoint 2010 tiene a nivel interno de
cada biblioteca esta opción definida como estricta y no permisiva.

Al final hay que habilitar cada biblioteca en la colección de sitios la
opción “browserfilehandling” como permisiva, para ello necesitamos
ejecutar un script a nivel de línea de comando apoyados en powershell.

**Un agradecimiento por su contribución a la comunidad de SharePoint a
Kim Nguyen en:**
<http://www.freakingsharepoint.com/2010/08/sp2010-forces-users-to-save-pdfs.html>

Lo que hice, fue modificar un poco el script para que funcione para
cualquier colección de sitios y para que valide que la lista siempre sea
un documento library.

Para ejecutar el script sugiero creen un archivo ps1 como por ejemplo:

**ChangePermissiveOptionInLibs.ps1**

La sintaxis es la siguiente:

**.\\ChangePermissiveOptionInLibs.ps1 –siteurl
<http://yoursitecollectionAddress>**

Y el script es el siguiente:

```` script

# Inicio del Script

param (
[string]$siteUrl = "$(Read-Host 'Enter the Site Collection URL.
[e.g. http://sp2010vm]')"
)

function main() {

  # check to ensure Microsoft.SharePoint.PowerShell is loaded
  $snapin = Get-PSSnapin | Where-Object {$\_.Name -eq
  'Microsoft.SharePoint.Powershell'}
  if ($snapin -eq $null)
  {
  Write-Host "Loading SharePoint Powershell Snapin"
  Add-PSSnapin "Microsoft.SharePoint.Powershell"
  }

  $site = Get-SPSite($siteUrl)
  write-host $siteurl
  foreach ($web in $site.AllWebs)
  {

    write-host "web:" $web.Title

    foreach ($list in $web.Lists)

    {
      write-host "list:" $list.Title $list.BaseType
      if ($list.BaseType -eq "DocumentLibrary")
      {
        write-host "browserfilehandling:" $list.browserfilehandling
        if($list.browserfilehandling -eq "Strict")
        {
          $list.browserfilehandling = "Permissive";
          $list.update();
          write-host $site.url, $list.title, $list.browserfilehandling
        }
      } 
    }

  }

  $site.Dispose()
}

main

# Fin del Script
````

En este artículo vimos como habilitar la opción para permitir el manejo
de archivos en el navegador que esta bloqueada de forma predeterminada
en SharePoint 2010. Esto aunque representa un riesgo, es una
funcionalidad habitual que los usuarios de SharePoint están
acostumbrados a utilizar y que desean este disponible en el portal.




