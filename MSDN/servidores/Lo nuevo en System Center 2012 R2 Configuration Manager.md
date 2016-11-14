---
title: Lo nuevo en System Center 2012 R2 Configuration Manager
description: Lo nuevo en System Center 2012 R2 Configuration Manager
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: servers
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Lo nuevo en System Center 2012 R2 Configuration Manager


Por [Marcela Berri](https://plus.google.com/102022832380927697290/posts/p/pub)

Instructor / Consultor Senior IT

Blog [IT Technology Site](http://ittechnologysite.blogspot.com.ar/)

Microsoft lanzó recientemente la versión R2 de Configuration Manager
2012.

Al momento está disponible para descargar la versión preview y para fin
de año estaría disponible la versión final (aunque no hay fecha definida
aún).

Con lo nuevo hay una serie de novedades que acerca al producto mas y mas
a la integración con el Sistema Operativo Windows Server 2012 y el resto
de la Suite de System Center 2012 con la nube.

La idea es brindarles un overview de estas interesantes nuevas
características. Espero que les sea de utilidad.

Instalación:
------------

Para instalar ConfigMgr R2, es necesario tener como mínimo Windows
Server 2008 R2.

Path de Upgrade: Solo es posible desde ConfigMgr SP1 con el pack de
Windows ADK 8.1 instalado. Es importante destacar que el esquema no
sufrió modificaciones.


Infraestructura:
----------------

Soporte para Windows 8.1 y Windows Server 2012 R2.

Módulo Power Shell de 64-bit nativo.

###Certificate Registration Point:


Es un Nuevo Site System Role para proveer el soporte de enrollment por Certificados de los dispositivos que ConfigMgr maneja.
Requiere IIS y trabaja en conjunto con el rol de AD Network Device
Enrollment Service.

###Mejoras en la distribución de contenido:

Hay resúmenes mejorados y más claros en la consola de monitoreo acerca de la distribución de paquetes, así como nuevos reportes con datos de uso de los distribution Points:

Distribution Point usage: Clientes que acceden, procesamiento, bytes
enviados

###Replication Traffic: Tráfico en MBs enviados entre Sites.

Se agregaron acciones de “Cancel” y “Redistribute” sobre aquellas
distribuciones en curso o fallidas de los distribution Points. Estas
nuevas acciones están en el Nodo de Monitoring.

Se optimizó la transferencia de contenido a los distribution point ya
que ahora calcula la velocidad de transferencia y dicha información se
usa luego para priorizar los siguientes envíos.

Se optimizó la validación de contenido del Distribution Point. Antes,
validaba un archivo por cada llamada de WMI, a partir de R2, valida
hasta 50 archivos por cada llamada de WMI.

###Pull Distribution Points:

Es posible mejorar ahora el uso de ancho de banda durante la
sincronización con los Distribution Points de origen ya que permite
asignar prioridades a los distintos Distribution Points desde los cuales
busca contenido.

Cada Pull DP entrega status al site server. Esto reduce el procesamiento
del distribution manager (distmgr).

###Network Access Accounts:


Soporte de múltiples cuentas de acceso por Site para dominios/forrest no
confiados.

Unified Device Management (UDM) - Intune:

Si bien, desde el SP1 es soportado los servicios de Cloud con el
conector para la subscripción de Intune, ahora está más ordenado y tiene
un ítem aparte bajo el nodo de Administración, llamado “Cloud Services”.

Además es posible personalizar el conector con las opciones de nuestra
marca: nombre de la compañía, URL, logo, información de contacto,
color.
El conector soporta las siguientes plataformas móviles: Android, iOS,
Windows RT, Windows Phone 8.

###SQL Setup:


Ahora es más flexible al momento de instalación del producto, pudiendo
especificar la ubicación de las bases y log de transacciones.
Soporta también el restore en una instancia distinta de SQL; siempre y
cuando los SQLs sean de la misma versión.

###Integración MDT:


En esta versión vienen varias acciones de MDT por default sin la
necesidad de integrarse con MDT: MDT gather, MDT validate, Set
PowerShell execution policy.

###Seguridad:


Ahora los reportes se basan en RBAC (Role-based administration control)
que permite controlar el acceso específico a los mismos.

Migración:
----------

Es posible unir una jerarquía existente de System Center R2
Configuration Manager con otra existente en R2.

Se pueden migrar “los datos” de un ambiente de laboratorio a uno
productivo.

Cuando se reasignan Distribution Points compartidos (Reassign Shared
Distribution Point wizard), es posible ahora elegir las mismas opciones
que cuando se crea uno nuevo: pull distribution, boundary groups, etc.


Funciones de Cliente:
---------------------

###Resultant Client Settings (RSOP):


Permite accede a un cuadro con los “settings efectivos” de las múltiples
configuraciones que puedan haber recibido los clientes por estar
asignados en más de una colección fácilmente desde la consola.

Unified Write Filter: Se soporta para ciertos sistemas operativos
Windows Embedded.

No es necesario configurar manualmente el firewall de Windows de los
clientes cuando se usa Wake-up Proxy.

Compliance para Mobile: Existe un nuevo ítem para evaluar la
configuración de dispositivos móviles: “Mobile Device Settings”.

###Workplace join


Soporte para “Work folders”: Con Windows 8.1 y Windows Server 2012 R2,
existe un nuevo concepto para que los usuarios accedan, almacenen y
sincronicen sus archivos personales tanto en la pc del trabajo como en
sus dispositivos personales asegurando el acceso con configuraciones de
encriptación. ConfigMgr 2012 R2 soporta configurar las opciones de
sincronización y el acceso desde Windows 8.1 Self Service Portal.

###Software Updates:


Ahora existen ventanas de mantenimiento específicas para updates. Si un
cliente tiene ambas ventanas de mantenimiento comunes y las de update,
los updates solo correrán durante la ventana de mantenimiento de
updates.

Existe ahora la posibilidad de cambiar el “deployment package” de una
regla de deploy ADR (Update Automatic Deployment Rules). La idea es
poder modificar periódicamente el paquete para conservar su tamaño y así
no tener posibles problemas de replicación de nuevos Distribution
Points.

Además existe un botón de “Preview” de los updates de software filtrados
en la regla ADR, de forma tal de ver previamente cuales serían los
updates antes de crear el deployment.

Mejoras en la distribución de contenido del cliente: Se optimizó la
bajada de contenido para aplicaciones supercedidas.

###Manejo de Aplicaciones Web:

Existe un nuevo tipo de Deployment type para Aplicaciones Web que
permite implementar un shortcut para la aplicación web que se use en el
dispositivo del usuario.

###Cliente para MAC:

Soporte para OS X Mountain Lion (versión 10.8) y User enrollment por
interface gráfica en vez de utilizar CMEnroll command line.


Dispositivos móviles:
---------------------

###Manejo de dispositivos BYOD (Bring-your-Own-Device)"traer tu propio dispositivo":


Permite configurar los dispositivos e identificarlos como: “Personal
owned” o “Company-owned” con la acción: “Change ownwership”.

Para Android e iOS, dependiendo del perfil, se inventarea selectivamente
las aplicaciones de estos dispositivos móviles.\
Si es un dispositivo “Corporativo” el inventario es completo; si es un
dispositivo “personal” inventarea solo las aplicaciones implementadas
por ConfigMgr.

Windows RT y Windows Phone 8 solo reportan inventario del contenido de
la compañía cuando es “Company-owned”.

Windows Mobile 6 reportarán inventario completo cuando es
“Company-owned”.

###Self Service Portal


Ahora existe un nuevo portal de autoservicio para manejar las
aplicaciones desde las plataformas de Windows x86, iOS, Android.

El portal estará disponible en Google Play para Android 4.0. La
instalación del portal, incluye el agente (management agent).

El agente brinda las siguientes capacidades:

Manejo de compliance settings: password, cámara y encriptación.

La posibilidad de instalar las aplicaciones directamente al dispositivo.

Las acciones que requieran notificaciones al usuario, usarán “Android
notification”


###El portal estará disponible en App store para iOS 6+ y tiene las
siguientes capacidades:

Cambiar o resetear passwords.

Baja e instalar aplicaciones de la compañía.

Enroll, unenroll o wipe de contenido de los dispositivos.

###Wipe de dispositivos móviles:


Básicamente ahora se soporta el poder remover el contenido de la
compañía: email, perfiles de VPN-WiFi y Certificados, Aplicaciones
instaladas, datos corporativos entre otras.\
Las plataformas soportadas son: Android, iOS, Windows RT 8.1, Windows
8.1 y cada una de ellas tendrán capacidades diferentes.

Windows 8.1 Preview puede ser manejado a través de Intune, si no está
agregado a dominio o no tiene el cliente de ConfigMgr instalado.

###Remote Connection Profiles:


Permite hacer deploy en los clientes de perfiles con opciones de “Remote
Desktop Connection” para que el cliente se pueda conectar rápidamente al
portal de la compañía y acceder a su computadora primaria de trabajo
bajo Remote Desktop.

###Certificate Profiles:


Se puede realizar deploy de certificados de usuarios y/o dispositivos
utilizando  Simple Certificate Enrollment Protocol (SCEP), para soporte
de Wi-Fi y VPN.

SCEP es el servicio que provee el manejo de dispositivos de red como
routers por medio de certificados. A partir de Windows Server 2008, el
servicio se encuentra dentro del rol de Active Directory Certificate
Services y se llama “Network Device Enrollment Service”. Para su
implementación, es necesario contar además con el nuevo rol de
“Certificate Registration Point” en ConfigMgr.

Se soportan dispositivos con Windows 8.1 / RT 8.1, Android e iOS.

###WiFi profiles:


Es posible configurar e implementar perfiles para manejar las
configuraciones de conexión WiFi para Windows 8 / RT, Windows 8.1/RT 8.1
e iOS.

###Manejo de VPN:


Soporta poder configurar perfiles de acceso de remoto para Microsoft
(SSL, IKEv2, PPTP, L2TP), Cisco, F5, Juniper, Dell SonicWall y Check
Point.

Se soportan dispositivos con Windows 8.1 / RT 8.1, Android e iOS.

Implementación de Sistemas Operativos (OSD):
--------------------------------------------

Soporte para Windows 8.1 y Windows Server 2012 R2.

Soporta imágenes de booteo hechas en Windows Automated Installation Kit
(Windows AIK) for Windows 7 SP1 and based on Windows PE 3.1. Windows ADK
8.1 no soporta mas Windows XP.

###Manejo de VHDs:


Permite el manejo de discos virtuales desde la consola para la creación,
modificación y offline servicing para luego subirlos a System Center
2012 R2 Virtual Machine Manager.

###Nuevos pasos para task sequences:


Se incorporaron nuevos Steps disponibles para la secuencia de tareas.

**Run PowerShell Script:** Corre comandos específicos de Windows
PowerShell script en la computadora destino.

**Check Readiness**: Verifica que la computadora destino cumpla con las
condiciones especificadas en los prerequisitos de un “deployment”.

**Set Dynamic Variables**: Trae información de una variable específica
de una task sequence y la llena dicha información. Luego evalúa las
reglas definidas y setea la variable basada en las variables y valores
configurados por las reglas que evalúa en True.


Se incorporaron nuevas Variables built-in para la secuencia de tareas:

**SMSTSDownloadRetryCount:** Esta variable se usa para especificar el
número de veces que Configuration Manager trata de bajar contenido desde
un Distribution Point.

**SMSTSDownloadRetryDelay:** Esta variable se usa para especificar el
número de segundos que Configuration Manager espera antes de reintentar
bajar contenido desde un Distribution Point.

**TSErrorOnWarning:** Esta variable se usa si el motor de task sequence
toma en cuenta la advertencia de “requirements not met” de una
aplicación como un error fatal. Se puede establecer la variable en True
o False. False es el default.

**\_TSAppInstallStatus:** Esta variable setea la variable
\_TSAppInstallStatus con el status de instalación para la aplicación
durante el paso “Install Application”. La secuencia de tareas setea la
variable con uno de los siguientes valores:
2.  **Undefined**: Se establece cuando el paso “Install Application”
    no ha corrido aún.

3.  **Error**: Se establece cuando por lo menos una aplicación falló a
    causa de un error durante el paso de “Install Application”.

4.  **Warning**: Se establece cuando no curren errors durante el paso de
    “Install Application”, pero una o mas aplicaciones, o una
    dependencia requerida, no instala porque un requerimiento no
    fue cumplido.

5.  **Success**: Se establece cunado no hay errores o warning detectados
    durante el paso de “Install Application”.


En resumen, System Center 2012 R2 Configuration Manager cada vez se
integra más a la familia de productos Microsoft y extiende sus
capacidades dándole a los administradores una herramienta espléndida
para el manejo de todo su parque de clientes y servidores.

Espero puedan implementarlo.




