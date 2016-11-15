---
title: Roles de Site System en CM 2012
description: Roles de Site System en CM 2012
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: servers
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Roles de Site System en CM 2012


Por [Marcela Berri](https://plus.google.com/102022832380927697290/posts/p/pub)

Instructor / Consultor Senior IT

Blog [IT Technology Site](http://ittechnologysite.blogspot.com.ar/)



CM, realizó cambios en los Roles que utiliza el producto. 
----------------------------------------------------------

Definición de un Site de ConfMgr: Unidad administrativa que define un
set of recursos (+) y site systems (\*) manejados por CM.

(+) Resources Discovery: Se debe descubrir recursos para utilizar
funciones de SCCM.

Los recursos son: Active Directory Users/Groups/Computers, hubs,
routers, IP objects ( gateways, printers),

Una vez que se produce el discover, los datos pasan en DDR (discovery
data record) al Site Server y el recurso pasa a la base de CM. Se ven en
All Systems Collections

(\*) Site Systems: Grupo de servers y shares que cumple una función
específica

Roles Default en Site System
----------------------------

Cuando se instala un Site Server, existen roles que se instalan por
defecto.

**Site Server**: Máquina W2008/R2 en donde CM está instalado y de donde
se maneja el Site de SCCM.

Contiene el Core del producto.

Debe ser miembro de un dominio y no es recomendado que sea un DC.

Corre los sig. servicios:

SMS Executive (servicio principal de SCCM contiene threads o
componentes)

SMS Site Component Manager (se asegura que todo corra como fue
configurado)

SMS Site VSS Writer Maneja la comunicación entre el Site y SQL

SMS Site Backup. Realiza la tarea de backup del Sites obre un Schedule

**Component Server**: Server que corre 1 o más threads del SCCM
Executive en W2008/R2.

El Site Server es además component server ya que corre los Executives.
Es instalado en todos los Site

Systems, excepto Distribution Point.

**Site Database Server**: W2008/R2 que tiene las bases de CM en un SQL
que interactúa mediante el servicio SCCM SQL Monitor. Además utiliza WMI
para este control (SMS Provider).

**SMS Provider**: Es la interface entre la consola de CM y la base del
site. Es instalado automáticamente cuando se instala el site de Adm.
Central o Primary Site. Los Secondary Sites, no instalan SMS provider.

El rol puede ser movido a otra máquina, salvo a aquella que hostea la
base de CM en cluster.

**Site System**: Es una máquina que hostea, uno o más roles de site. Es
decir, toda máquina con un rol de Configuration Manager es referenciada
como un "Site System".

**Management Point**: Punto inicial de contacto con el Cliente.

Se encarga de entregar el Site asignado al Cliente.

Accede a la Base del SCCM para obtener información sobre los Site
Boundaries.

Provee al cliente del Site que determina donde está el cliente (IP) y
una lista de dónde el cliente puede chequear por advertisements, local
Distributions Points.

Provee configuración, archivos y software a instalar; es el lugar desde
donde chequea por

advertisements y escribe los datos cuando completó el inventario de
software y hardware.

Envía información del Cliente al Site directamente

Es el punto de comunicación con los dispositivos móviles cliente.

**Distribution Point**: Es un server W2008/R2 en donde se almacenan los
paquetes de archivos apuntados por el advertisement.

Cuando se distribuye un paquete, SCCM busca un DP y almacena los datos
en el drive con más espacio libre en una carpeta SMSPKGSIG que comparte,
salvo que el administrador configure la ubicación.

Es el rol que inicia y responde a las implementaciones de Sistemas
Operativos mediante requerimientos de booteo PXE

Se puede controlar la distribución del contenido entre varios DPs usando
ancho de banda, throttling,

y opciones de Schedule.

Roles Opcionales en Site System
-------------------------------

Los roles opcionales, proveen funcionalidades adicionales a la
estructura de Configuration Manager.

**FallBack Status point**: Es el rol que escucha los mensajes de
“estado” de los clientes que:

- Se instalaron o no se instalaron correctamente.

- No se pudieron asignar a un Site o no pueden comunicarse en forma segura
con su Site asignado por un problema de Certificado.

- No pudieron encontrar al Management Point o tienen problemas de
conectividad.

- El MP no está configurado correctamente o hay problemas con IIS.

Es un rol opcional, pero recomendado para troubleshooting

Acepta comunicaciones “no seguras”, con lo que refleja los problemas de
Certificados de un Site

si hay varios certificados asignados y no hay un orden de entrega, o
están expirados o revocados.

Si se usa ClientPush, se asigna automáticamente, sin no se puede colocar
en CCMSetup.exe

SMSSITECODE=A01 FSP=server1 o server1.dominio.com o IP

Los dispositivos móviles manejados por CM, no usan este rol, utilizan
directamente el conector al Exchange Server.

**Software Update Point**: Es la máquina que tiene instalado el WSUS.
(Ms Windows Server Update Services)

**State Migration Point**: Almacena los datos del estado de los usuarios
(user state data) mientras que la computadora está migrando a un nuevo
Sistema Operativo.

**System Health Validator point**: Es la máquina W2008/R2 que corre el
servicio de “Network Policy Service”. Permite reforzar políticas de
conexión hacia el server y se utiliza mediante la característica de
“Network Access Protection” de CM.

**Asset Intelligence synchronization point**: Rol que se usa para
conectarse a “System Center Online” para manejar la actualización de la
información de un cierto catálogo. Es requerido para sincronizar el
“local Asset Intelligence catalog” para clientes Microsoft SA license.

**Out of Band Service Point**: Rol que descubre, provisiona y maneja los
escritorios de las computadoras que tienen “controladores de Management”
(como AMT-based computers).

**Reporting Service Point**: Es un Server con SQL Server Reporting
Services instalado que contiene para poder ver los reportes. Se comunica
sólo con el Site Database Server

**Application Catalog web site point**: Provee a los usuarios con la
lista de software que tienen disponible. Es un nuevo rol en CM2012

**Application Catalog web service point**: Es el rol que provee
información de software al Web site que contiene el catálogo desde la
Librería de Software. Es un nuevo rol en CM2012.

**Enrollment point**: Es el rol que usa certificados de PKI para
completar la inscripción para dispositivos móviles y máquinas ATM. Es un
nuevo rol en CM2012.

**Enrollment proxy point**: Maneja los requerimientos de los
dispositivos móviles para que CM pueda manejarlos. Es un nuevo rol en
CM2012.

**Endpoint Protection point**: Brinda la posibilidad de manejar y
solucionar los problemas de configuración de firewall y malware,
remediando aquellas PCs que no tienen instalado SC2012 Endpoint
Protection. (antes conocido como ForeFront End Point Protection)



Roles que cambiaron 
--------------------

Hay determinados roles, que han sido integrados a otros roles en
Configuration Manager.

1. Branch distribution point: Este rol fue retirado. CM 2012 soporta
    sólo Distribution Points, que puede ser instalado en servers o
    workstations y además es posible controlar los seteos de ancho de
    banda (bandwidth throttling) que utiliza desde las propiedades
    del DPoint.

2.  PXE Service point: Su funcionalidad se integró al rol de
    Distribution Point.

3.  Reporting point: Este rol ha sido retirado. CM2012, solo usa
    Reporting Services de SQL.

4.  Server Locator point: Su funcionalidad se integró al role de
    Management Point.






