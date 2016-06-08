

<properties
	pageTitle="Los comandos que más uso de Powershell en Lync"
	description="Los comandos que más uso de Powershell en Lync"
	services="servers"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="servers"
	ms.workload="Lync"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>


#Los comandos que más uso de Powershell en Lync



**Por Peter Diaz**

Profesional en el área de IT con más de 10 años de experiencia en
proyectos y consultorías de Seguridad Informática, Infraestructura y
Comunicaciones Unificadas. MVP/MCT/MCITP Lync/MAP 2012/MCC MCP ID:
3095363 MVP ID: 4039848

LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>

Microsoft MVP

Hola a todos para muchos ITPRO es común en su día a día utilizar
constantemente comando Powershell que sin duda nos hace las tareas y
sobre todo la administración en ambientes muy complejos mucho más fácil.

Por eso quiero compartir con ustedes los comandos de Powershell de Lync
que más utilizo sin orden de preferencia:

**Enable-CsTopology**: Me permite publicar la topología de Lync sin
necesidad de utilizar la interface gráfica luego de publicar alguna
modificación o agregar alguna nueva funcionabilidad (rol) en el Topology
Builder de Lync.

Ejemplo - El comando que se muestra en el ejemplo 1 habilita la
topología publicada más recientemente.

*Enable-CsTopology*

|Parámetro  |Obligatorio   |Tipo |Descripción|
|-----------|--------------|-----|-----------|
|*Confirm*               |           Opcional      |System.Management.Automation.SwitchParameter  | Se le pedirá confirmación antes de ejecutar el comando.|
|*Force*     |                       Opcional  |    System.Management.Automation.SwitchParameter   |Suprime la visualización de los mensajes de error que no sean graves y que puedan producirse al ejecutar el comando.|
|*GlobalCatalog*        |            Opcional    |  Microsoft.Rtc.Management.Deploy.Fqdn  |         Nombre de dominio completo (FQDN) de un servidor de catálogo global del dominio. Este parámetro no es obligatorio si ejecuta el cmdlet Enable-CsTopology en un equipo con una cuenta del dominio específico.|
|*GlobalSettingsDomainController*  | Opcional  |    Microsoft.Rtc.Management.Deploy.Fqdn     |      Nombre de dominio completo de un controlador de dominio donde se almacenan las configuraciones globales. Si la configuración global se almacena en el contenedor del sistema de Servicios de dominio de Active Directory, este parámetro debe hacer referencia al controlador de dominio raíz. Si la configuración global está almacenada en el contenedor de configuración, se puede usar cualquier controlador de dominio y omitir este parámetro.|
|*Report*            |               Opcional    |  System.String       |                           Le permite especificar una ruta de acceso para el archivo de registro creado cuando se ejecuta el cmdlet. Por ejemplo: -Report "C:\\Logs\\Enable\_Topology.html"|
|*SkipPrepareCheck*   |              Opcional  |    System.Boolean           |                      Si se establece en True (\$True), el cmdlet Enable-CsTopology omite la comprobación de preparación inicial.|
|*WhatIf*    |                      Opcional  |    System.Management.Automation.SwitchParameter   |Describe qué sucedería si se ejecutara el comando sin ejecutarlo realmente.|
  

Referencia: <http://technet.microsoft.com/es-es/library/gg398398.aspx>

**Enable-CsComputer**: Me permite publicar y actualizar cualquier cambio
a nivel de infraestructura (eliminar-agregar) funcionabilidades en
Microsoft Lync.

Referencia: <http://technet.microsoft.com/es-es/library/gg412815.aspx>

>Ejemplo - El comando del ejemplo 1 activa cualquier rol de servidor o
servicio nuevo de Lync Server que se haya instalado en el PC local.

*Enable-CsComputer*

>Ejemplo - En el ejemplo 2 también se activa cualquier rol de servidor o
servicio nuevo de Lync Server que se haya instalado en el equipo local.
Sin embargo, en este caso, al incluir el parámetro Verbose se asegura de
que se dará cuenta detallada en pantalla de las tareas que realiza el
cmdlet **Enable-CsComputer**.

*Enable-CsComputer -Verbose*

**Invoke-CsManagementStoreReplication**: Permite la replicación de la
Managment Store entre los servidores de Lync (roles)

Referencia: <http://technet.microsoft.com/es-es/library/gg413060.aspx>

>Ejemplo - En el ejemplo 1, se llama al cmdlet
**Invoke-CsManagementStoreReplication** sin ningún parámetro, lo que
fuerza la replicación en todos los equipos con Lync Server.

*Invoke-CsManagementStoreReplication*

>Ejemplo - En el ejemplo 2, se usa el parámetro ReplicaFqdn al llamar al
cmdlet **Invoke-CsManagementStoreReplication**. De esta forma, la
replicación solo tiene lugar en el equipo atl-cs-001.litwareinc.com.

*Invoke-CsManagementStoreReplication -ReplicaFqdn
atl-cs-001.litwareinc.com*

**Update-CsUserDatabase**: Permite forzar la replicación de la libreta
de direcciones a los usuarios y la sincronización con el directorio
activo de la organización.

Referencia: <http://technet.microsoft.com/en-us/library/gg398682.aspx>

>Ejemplo - El comando del ejemplo 1 localiza la base de datos de usuarios
del grupo de servidores donde se incluye el PC local y fuerza la base de
datos a conectarse y devolver la información de usuario completa de
Active Directory.

*Update-CsUserDatabase*

>Ejemplo - En el ejemplo 2 se muestra cómo se puede forzar que una base
de datos de usuario concreta vuelva a leer los datos de Active
Directory. En este caso, esa es la base de datos de usuario para el
grupo atl-cs-001.litwareinc.com.

*Update-CsUserDatabase -Fqdn atl-cs-001.litwareinc.com*

**Get-CsAddressBookConfiguration**: Permite consultar el estado de la
configuración y actualización de la libreta de direcciones de los
usuarios.

Referencia: <http://technet.microsoft.com/es-es/library/gg398682.aspx>

>Ejemplo: El comando del ejemplo 1 localiza la base de datos de usuarios
del grupo de servidores donde se incluye el PC local y fuerza la base de
datos a conectarse y devolver la información de usuario completa de
Active Directory.

*Update-CsUserDatabase*

>Ejemplo: En el ejemplo 2 se muestra cómo se puede forzar que una base de
datos de usuario concreta vuelva a leer los datos de Active Directory.
En este caso, esa es la base de datos de usuario para el grupo
atl-cs-001.litwareinc.com.

*Update-CsUserDatabase -Fqdn atl-cs-001.litwareinc.com*

**Export-CsConfiguration**: Permite realizar una copia de seguridad de
la configuración de la administración central de Lync (CMS), también es
utilizado cuando vamos a configurar nuestro servidor de Edge Server.

Referencia: <http://technet.microsoft.com/es-ES/library/gg398627.aspx>

>Ejemplo: El comando del ejemplo 1 exporta datos de Lync Server desde
Almacén de administración central a un archivo llamado C:\\Config.zip.

*Export-CsConfiguration -FileName "C:\\Config.zip"*

Para más detalles de todos los comandos de Lync Powershell pueden ir al
siguiente enlace:

<http://technet.microsoft.com/es-ES/library/gg398306.aspx>

Peter Diaz

MVP Lync-MCT-MAP
