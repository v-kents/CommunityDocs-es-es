
<properties
pageTitle="Funcionalidades de CM 2012"
description="Funcionalidades de CM 2012"
services="servers"
documentationCenter=""
authors="andygonusa"
manager=""
editor="andygonusa"/>

<tags
ms.service="servers"
ms.workload="CM"
ms.tgt_pltfrm="na"
ms.devlang="na"
ms.topic="how-to-article"
ms.date="05/12/2016"
ms.author="andygonusa"/>


#Funcionalidades de CM 2012



[**Marcela Berri**](https://plus.google.com/102022832380927697290/posts/p/pub)

Instructor / Consultor Senior IT

MCT – MVP Configuration Manager

MCTS Server Administrator - MCTS AD 2008 - MCTS Network Inf

MCTS - Server Virtualization

MCTS W7 & Off2010 - MCTS SCCM 2012/2007 - MCTS SCOM 2007

MCITP Exchange 2010/2007 - MCTS Exch 2010/2007 - MCTS Lync 2010

Blog [**IT Technology Site**: *About me*](http://ittechnologysite.blogspot.com.ar/)

Aquí les dejo un listado de todas las funcionalidades que tiene el
producto Configuration Manager 2012.

1)     Inventario de Hardware
-----------------------------

Realiza el inventario de los clientes, evaluando las clases del WMI.

Qué es WMI 
-----------

Es importante entender un concepto sencillo, pero que pocos conocen.\
*El WMI* es un repositorio central de información en donde hay muchas
aplicaciones que leen información y otras que escriben ahí.

*Primer ejemplo concreto:* Cuando uno verifica las propiedades de la
maquina (system properties), el SO informa el procesador, memoria,
versión, etc….\
De dónde creen que saca esa info?.... del WMI.

El WMI tiene una estructura de objetos: Clases de objetos, Objetos y sus
atributos (jerárquicamente hablando)

En W2k+/XP+ ya viene instalado como servicio: Winmgmt o  "Windows
Management Instrumentation" o "Instrumental de administración de
Windows"

*Segundo ejemplo:* Cuando se instala un driver o un dispositivo, dónde
creen que guarda esa info? Luego uno la explora por ejemplo desde el
“administrador de dispositivos” o “device manager” (que sería la
utilidad que lee el WMI.

#### Definición formal:

*WMI (Windows Management Instrumentation):* Es la implementación
Microsoft de la capa WBEM.\
*WBEN*: Centro unificado del manejo de entidades o tareas distribuidas.

Las aplicaciones se comunican con WBEM y esta llama a los “providers”
como la Registry, el Event Viewer, el Event Log, el System Monitor,
Win32, DMI (Desktop Management Interface) o SNMP.

Para acceder a WBEM, se utiliza aplicaciones DCOM/COM.

Las funciones básicas en las que SCCM usa WBEM son:

1.  *SCCM Administrator Console*: se conecta con WMI realiza inventario
    de Hardware.

2.  *Network Discovery Agent*: Usa WMI para almacenar datos en CIM
    repository.\
    No usa ningún provider.

3.  *Inventario*: Para relevar los datos del cliente.

4.  *WSUS updates*: Para verificar las actualizaciones instaladas.

5.  *Configuración deseada/ForeFront Client*: para verificar.



2)     Inventario de Software
-----------------------------

Realiza el inventario del software instalado en los clientes, evaluando
las clases del WMI. Permite además recolectar archivos que se encuentran
en la máquina de los clientes.

<span id="more" class="anchor"></span>

3)     Manejo de Licencias (Asset Intelligence)
-----------------------------------------------

Permite monitorear e inventariar el uso de licencias de las aplicaciones
instaladas en los clientes. Se utiliza un catálogo con la información de
licencias.\
Ayuda a planificar el licenciamiento corporativo

4)     Manejo de Reportes 
--------------------------

Se integra con los servicios de SQL Reporting Services y trae reportes
pre-configurados que extraen información de la base.

Incluye: Reportes de todas las funcionalidades, Alertas, Mensajes de
status, Estado de la replicación de base.

5)     Queries (Consultas por consola)
--------------------------------------

Permite ubicar objetos que coinciden con un determinado criterio y
mostrarlo por consola.

6)     Manejo de Colecciones
----------------------------

Vistas que permiten organizar los objetos que han sido descubiertos por
CM.

7)     Medición de uso de Software (Software Metering)
------------------------------------------------------

Colecta datos del uso de aplicaciones en los clientes, basadas en reglas
que se crean para tal fin. Luego se generan reportes con la información.

8)     Administración de dispositivos Móviles: (teléfonos móviles)
------------------------------------------------------------------

Permite ver y administrar los dispositivos móviles, implementando
aplicaciones, haciendo inventario o bajando políticas de uso en conjunto
con Microsoft Exchange Server.

9)     Administración fuera de Banda ( Out-of-Band Management)
--------------------------------------------------------------

Configuration Manager permite manejar computadoras con chip ser Intel
vPro y maquinas Intel ATM.

Es posible prenderlas, apagarlas, configurar remotamente, etc.

10)  Control Remoto
-------------------

Permite administrar en forma remota, proveer asistencia o ver cualquier
máquina cliente dentro de la jerarquía de CM.

11)  Administración de Aplicaciones (Implementación de software)
----------------------------------------------------------------

Antes llamado implementación de Software. En esta versión, es posible,
implementar una aplicación a los usuarios, dispositivos, grupos de
usuarios y/o grupos de dispositivos.

Se puede definir “Afinidad de dispositivo”, que establece una relación
entre el usuario y los dispositivos que mayormente utiliza y eso asegura
que las aplicaciones siempre estén disponibles para él.

12)  Uso de Aplicaciones Virtualizadas
--------------------------------------

Permite desplegar aplicaciones virtualizadas y realizar cualquier
seguimiento tal como se hace para las aplicaciones comunes.

13)  Manejo de actualizaciones de software (software Updates)
-------------------------------------------------------------

Permite configurar los updates de software integrándose con WSUS.
Contiene aprobación automática de parches y un mejor control de los
tiempos en que correrán las actualizaciones.

14)  Despliegue de Sistemas Operativos (OSD)(Operating System Deployment)
-------------------------------------------------------------------------

Permite utilizar e integrar herramientas para poder hacer upgrade de un
cliente existente o implementar masivamente nuevos clientes con o sin
sistema operativo.

15)  Cumplimiento de (software compliance)
------------------------------------------

Provee una ubicación central para manejar opciones de configuración y
cumplimiento de seteos, aplicaciones, entradas de registry, etc., que
los servers, clientes o dispositivos móviles deben tener o no
configurados o instalados.\
Antes se llamaba Desired Configuration Management.

16)  Wake on Lan
----------------

Permite prender las máquinas cliente para poder implementar un update,
instalar un software o instalar un sistema operativo.

17)  Protección de acceso a la red (Network Access Protection)
--------------------------------------------------------------

Integración con Windows 2008 NAP, para poder remediar situaciones de no
cumplimiento de un cliente, que evitan el ingreso a la red. Junto con
software updates, convierte un cliente “no-compliant” automáticamente en
“compliant”.

18)  Manejo de “energía”(power management)
------------------------------------------

Permite administrar en forma centralizada las características built-in
de opciones de energía, como hibernación, bajo consumo de monitor,
disco, etc.

19)  System Center Endpoint Protecction
---------------------------------------

Permite implementar el software de antivirus de cliente y reforzar el
cumplimiento del mismo desde la consola del Configuration Manager.
