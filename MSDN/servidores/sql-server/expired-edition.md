---
title: Qué hacer cuando la copia de evaluación de SQL Server expira
description: Qué hacer cuando la copia de evaluación de SQL Server expira
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: sqlserver
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#¿Qué hacer cuando la copia de evaluación de SQL Server expira o usted desea cambiar la clave de producto a una instancia?

Por [Alberto
Morillo](http://mvp.microsoft.com/en-us/mvp/Alberto%20Morillo-4015656)

<http://www.sqlcoffee.com>

###Introducción

En ocasiones usamos una copia de evaluación de SQL Server en proyectos
que requieren iniciar su ejecución y que aún no adquieren las licencias
contempladas para el proyecto, debido dilaciones en los procesos de
compra en las empresas.

En otras ocasiones se emplean llaves de productos ya usadas en previas
instancias de SQL Server, para hacer nuevas instalaciones, en lo que se
adquieren nuevas llaves de productos.

Una vez llegan las licencias y las llaves de productos que se esperaban,
a veces tan tarde que el periodo de evaluación ha expirado, nos
preguntamos si debemos desinstalar la instancia y volverla a instalar, o
si existe algún método que nos permita conservar la instancia instalada
con la configuración y la programación actual, así como con las bases de
datos y datos que tiene.

La respuesta a estos cuestionamientos es que sólo es necesario realizar
el procedimiento de actualización de la instancia a una edición
licenciada, conservando la configuración, programación y datos actuales
de la instancia. A continuación describimos el procedimiento para
realizar esta actualización, el cual debe realizarse con una cuenta de
Windows que tenga derechos administrativos en el servidor.

**\
Actualización de una instancia a una edición licenciada\
**\
Ejecute el programa de instalación de Microsoft SQL Server, y deberá
presentarse ante usted el Centro de Instalación de SQL Server (o SQL
Server Installation Center) tal como se muestra debajo./\
\
Una vez en el Centro de Instalación de SQL Server, realice un clic en
Mantenimiento (Maintenance), y a continuación, seleccione Actualización
de Edición (Edition Upgrade). Tome como referencia la imagen siguiente.

![] (./img/expired-edition/image1.png)

A continuación, el comprobador de configuración del sistema ejecutará
una serie de procesos de comprobación y, de cumplirse los
requerimientos, usted sólo necesita hacer un clic en Siguiente o en
Next, tal como se muestra a continuación.\
Insert Caption

![] (./img/expired-edition/image2.png)

En la siguiente página del programa de instalación nos aguardan más
    tareas de comprobación.

![] (./img/expired-edition/image3.png)

En la página de Clave de Producto (Product Key), introduzca la clave
    de producto que estará asociada a esta instancia. El algunos casos
    encontrará que la clave de producto ya está introducida, o
    esta preestablecida.

Si el objetivo de hacer esta actualización de edición al SQL Server
instalado en la instancia tenía como finalidad cambiar la clave de
producto, en esta página del programa de instalación lo podrá hacer.

La página de clave de producto se muestra a continuación.

![] (./img/expired-edition/image4.png)

En la página de Terminos de Licenciamiento (License Terms), lea el
contrato de licenciamiento, active la casilla “I accept the license
terms”, y luego haga clic en Siguiente (Next).

![] (./img/expired-edition/image5.png)

En la página “Seleccionar Instancia”, seleccione la instancia sobre la
que desee aplicar la actualización. Esta página se muestra debajo.

![] (./img/expired-edition/image6.png)

A continuación, se nos presenta una última página conteniendo
operaciones de comprobación y, de cumplirse los requerimientos, usted
sólo necesita hacer un clic en Siguiente o en Next, tal como se muestra
a continuación.

![] (./img/expired-edition/image7.png)

Finalmente, estaremos ante la página de “Listo para la actualización”
(Ready to upgrade edition), donde podemos visualizar de forma resumida
las opciones elegidas en las páginas previas del programa de instalación
de SQL Server. Para proceder con la actualización de edición, puede
hacer un clic en el botón de Actualizar (Upgrade).

![] (./img/expired-edition/image8.png)






