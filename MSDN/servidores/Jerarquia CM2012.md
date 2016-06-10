---
title: Jerarquía Configuration Manager 2012
description: Jerarquía Configuration Manager 2012
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: servers
ms.custom: CommunityDocs
---









#Jerarquía Configuration Manager 2012

Por [Marcela Berri](https://plus.google.com/102022832380927697290/posts/p/pub)

Instructor / Consultor Senior IT

Blog [IT Technology Site](http://ittechnologysite.blogspot.com.ar/)



Cómo es la jerarquía de Site en Configuration Manager 2012? 

Configuration Manager es un producto que provee el manejo global de
clientes, automatiza implementaciones, refuerza el cumplimiento de
estándares y mantiene protegidos a los clientes. Además provee monitoreo
y reportes centralizados de sus clientes.

En Configuration Manager 2012, existe un pequeño cambio en la jerarquía
que suma un nuevo componente y regula la administración completa:
<span id="more" class="anchor"></span>


a)  “Central Administration Site”
---------------------------------

Lo antes se conocía como “Site Central”, ahora se llama “Central
Administration Site” y cambia su rol administrativo.

El Site de Adm. Central, es como la “cabeza” de la jerarquía y se
encarga de cuatro tareas:

- Proveer el manejo centralizado de la jerarquía.

- Generar reportes con datos de toda la jerarquía.

- Dar soporte a determinados roles.

- Participa de la replicación de la Base de Datos.



Algo importante: NO procesa datos de los clientes y de hecho no tiene
asignados clientes directamente, como así también, no soporta clientes
roaming.

Los únicos datos de cliente que procesa son los de Heartbeat Discovery
(DDR)
Bajo su jerarquía quedan como siempre el Site Primario y Site
Secundario.

Soporta hasta 25 Primary Sites hijos y 400.000 clientes si se instala
sobre un SQL Enterprise Edition.  Si es SQL Standard soporta 50.000
clientes.

Si se instaló con un SQL Standard y se actualiza la edición a
Enterprise, la jerarquía sigue manteniendo el límite de 50.0000 clientes
ya que la base no se reparticiona.

Es el primer Site que se instala si se planifica una estructura con
varios Sites en conjunto, ya que vincular un Site Primario como “hijo”
se realiza como parte de la instalación del mismo.


b)  “Primary Site”
------------------

La funcionalidad del Site con respecto a la versión anterior cambian
también.

Pensando en que para 2007, no existía una administración centralizada
real, ahora el site primario, puede cumplir el rol esperado y lógico
dentro de la estructura: “administrar a sus clientes”.

El Site Primario se encarga de:

- Brindar escalabilidad, para soportar mayor cantidad de clientes.

- Maneja los clientes que tiene asignados y procesa sus datos.



No puede asociarte a otro site primario en una relación padre-hijo, como
antes.

Solo puede contener Sites Secundarios dentro de su jerarquía.  Soporta
hasta 250 sites Secundarios.

Si se usa un SQL instalado local, soporta hasta 50.000 clientes.
Si se usa un SQL Remoto, soporta hasta 100.000 clientes.

Se puede instalar como un Site Stand-Alone o como parte de una jerarquía
central. La decisión es parte de la instalación y un cambio de
jerarquía, implica reinstalar.

c)   “Secondary Site” 
----------------------

La funcionalidad del Site con respecto a la versión anterior cambian
también. ¡Ahora tiene base!

El site Secundario se utiliza básicamente para controlar el flujo de
datos de los clientes hacia arriba en la jerarquía.

Con menos de 500 clientes, se debería considerar un Distribution Point
en vez de un Site Secundario.
Soporta hasta 5.000 clientes.

El Site Secundario se encarga de:
---------------------------------

- Utiliza SQL Express instalado localmente en el site server.

- Participa de la replicación de Base de Datos con su Site Primario.

- Debe ser hijo de un Site Primario

- Soporta el ruteo de contenido (File transfer) a otros Sites Secundarios.




