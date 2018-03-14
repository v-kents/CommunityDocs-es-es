---
redirect_url: https://docs.microsoft.com/
title: Backup and Restoring en Microsoft Lync Server 2010-2013
description: Backup and Restoring en Microsoft Lync Server 2010-2013
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: server
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Backup and Restoring en Microsoft Lync Server 2010-2013

Por **Peter Diaz**

LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>



Uno de los procedimientos el cual es bastante manual dentro de Lync
Server es a la hora de realizar un backup (respaldo) y una restoring
(restauración), debido a esto me he animado a compartir con todos
ustedes un script que les hará la administración un poco más sencilla en
este sentido, los pasos a seguir son los siguientes:

BACKUP (RESPALDO)
-----------------

1.- Instalar en el servidor de Lync el Resources Kit que te lo podrás
descargar del siguiente enlace:

*http://www.microsoft.com/en-us/download/details.aspx?id=21165*


![] (./img/Backup-and-Restoring-Lync-Server/image1.png)

2.- Crear en el servidor de Lync las siguientes carpetas (directorios):

    c**:\\backups\\config\\**

    **c:\\backups\\LIS\\**

    **c:\\backups\\RGS\\**

    **c:\\backups\\scripts**

    **c:\\backups\\DBIMPEXP**

**Nota: Yo he seleccionado la unidad c:\\ pero puede ser cualquier
unidad dentro del servidor.**

3.- Abrimos un Notepad y copian y pegan el siguiente código, luego de
copiar y pegar el código debes de salvar el fichero .txt y renombrarlo
como .cmd **ejemplo: lo salvo como backup.txt y luego lo renombro como
backup.cmd**

```
    REM Scripts que permite realizar el backup al servidor de Lync Server
    2010\
    REM Creado por Peter Diaz – MVP

    del c:\\backups\\config\\config.xml\
    del c:\\backups\\config\\config.zip\
    del c:\\backups\\LIS\\lis.xml\
    del c:\\backups\\LIS\\lis.zip\
    del c:\\backups\\RGS\\rgs.zip

    “c:\\program files\\common files\\Microsoft Lync Server
    2010\\support\\DBImpExp.exe”
    /hrxmlfile:c:\\backups\\DBIMPEXP\\backup.xml /sqlserver:FQDN del
    servidor SQL\\instancia SQL

    c:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -command
    “cd \$env:Userprofile; Import-Module ‘C:\\Program Files\\Common
    Files\\Microsoft Lync Server
    2010\\Modules\\Lync\\Lync.psd1′;Import-Module ‘c:\\Program
    Files\\Microsoft Lync Server
    2010\\Reskit\\RgsImportExport.ps1′;c:\\backups\\scripts\\lync\_backup.ps1

    exit\
```

**Nota:** En la línea 9 del código hay que colocar el FQDN del servidor
SQL\\Instancia ejemplo: sqllync.dominio.com\\rtc

**Nota**: No copiar y pegar las líneas (\_\_\_\_\_\_) solo lo he hecho
para delimitar el código de los scripts

4.- Abrimos nuevamente el Notepad y copiamos y pegamos el siguiente
código:

```
    Export-CsConfiguration -FileName c:\\backups\\Config\\config.xml;\
    Export-CsConfiguration -FileName c:\\backups\\Config\\config.zip;\
    Export-CsLisConfiguration -FileName c:\\backups\\LIS\\lis.xml;\
    Export-CsLisConfiguration -FileName c:\\backups\\LIS\\lis.zip;\
    Export-CsRgsConfiguration -Source ApplicationServer:Pool.dominio.com 
    -filename c:\\backups\\RGS\\rgs.zip\
    exit

```
 

>**Nota**: En el Script en la línea 5 debes de colocar el nombre de tu
servidor pool de Lync

**Nota:** Luego de salvar l fichero,txt lo debes de renombrar a .ps1
**ejemplo: Salvarlo como Lync\_backup.txt luego debes de renombrarlo a
Lync\_backup.ps1, también este comando es solo para Lync Server 2013
pero les aconsejo que igual lo incluyan aunque se trate de un Lync
Server 2010**

**Nota:** Si utilizas la consola PowerShell para la creación de scripts
tendrás una pantalla como esta (esto es adicional)

**Nota**: No copiar y pegar las líneas (\_\_\_\_\_\_) solo lo he hecho
para delimitar el código de los scripts


![] (./img/Backup-and-Restoring-Lync-Server/image2.png)

5.- Por último lo recomendado es luego realizar un Windows Task
Scheduler en el Servidor de Lync con la programación que nosotros
creamos conveniente para que automáticamente se ejecute el scripts.

En estos 5 sencillos pasos podremos tener el backup (respaldo listo)

**RESTORING (RESTAURACION)**

Para realizar el restoring de nuestro Lync Server 2010 una vez tengamos
el backup listo debemos de seguir los pasos que nos indican en el
siguiente URL:

[*http://technet.microsoft.com/en-us/library/hh202185(v=ocs.14).aspx*](http://technet.microsoft.com/en-us/library/hh202185(v=ocs.14).aspx)


![] (./img/Backup-and-Restoring-Lync-Server/image3.png)




