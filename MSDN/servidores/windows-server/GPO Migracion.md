---
title: Migración del Group Policy Object
description: Migración del Group Policy Object
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: servers
ms.custom: CommunityDocs
---







#Migración del Group Policy Object


Por [Juan José Diaz
Antuña](http://mvp.microsoft.com/en-us/mvp/Juan%20Jose%20Diaz%20Antu%c3%b1a-5000260),
[@diazantuna ](https://twitter.com/diazantunahttps:/twitter.com/diazantuna)


Windows Expert-IT Pro

En este artículo vamos a ver cómo llevar GPO’s de un dominio de pruebas
a un dominio de producción, o como migrar GPO´s de un dominio a otro.
Esta operación es bastante habitual, ya que normalmente probamos las
configuraciones (settings) de nuestras GPO’s previamente.

Vamos a ver un paso a paso de cómo hacerlo. Para ello solo voy a
utilizar la consola de Administración de Directivas de Grupo o GPMC. En
mi laboratorio tengo dos dominios con un controlador cada uno de ellos.

Dominio origen – Controlador de dominio Origen
----------------------------------------------

Lo primero que hacemos es un backup de las GPO’s a migrar en un
controlador de dominio del dominio origen.

![](./img/GPO Migracion/image1.png)

Esto lo que hace es una copia de todas las directivas de SYSVOL, o lo
que es lo mismo, de mi dominio. Indico el path donde dejar la copia.

![](./img/GPO Migracion/image2.png)

Progreso del backup

![](./img/GPO Migracion/image3.png)

![](./img/GPO Migracion/image4.png)

Compruebo que el backup se ha hecho en la ubicación indicada

![](./img/GPO Migracion/image5.png)

Una vez hecho el backup debo de ir al dominio de destino, a uno de sus
controladores de dominio y acceder a la consola de GPMC

En el menú Action, selecciono Open Migration Table Editor

![](./img/GPO Migracion/image6.png)

En la ventana de Migration Table Editor, en el menú selecciono Tools y
dentro Populate from Backup

![](./img/GPO Migracion/image7.png)

Busco en la ubicación donde he dejado el backup

![](./img/GPO Migracion/image8.png)

Se nos muestra objetos principales específicos del dominio de origen y
que deberíamos de cambiar y sustituirlos por los del dominio de destino.

![](./img/GPO Migracion/image9.png)

Para hacerlo hago botón derecho sobre el objeto de origen y selecciono
Browse

![](./img/GPO Migracion/image10.png)

![](./img/GPO Migracion/image11.png)

Una vez encontrados todos los objetos y sustituirlos por los del dominio
de destino debo de guardar la tabla de migración. Para ello voy a File –
Save As

![](./img/GPO Migracion/image12.png)

![](./img/GPO Migracion/image13.png)

Una vez guardada la tabla debo de recrear las GPO en el dominio de
destino. Para ello voy a Group Policy Objects y selección New

![](./img/GPO Migracion/image14.png)

Y creo una GPO

![](./img/GPO Migracion/image15.png)

Ahora vamos a importar los Settings. Para ello hago botón derecho sobre
la GPO y selección Import Settings

![](./img/GPO Migracion/image16.png)

Se nos muestra el asistente

![](./img/GPO Migracion/image17.png)

Puedo hacer un backup previo de la GPO antes de importar los nuevos
settings. En nuestro caso la GPO no tiene nada configurado con lo que no
voy a hacer el backup

![](./img/GPO Migracion/image18.png)

Busco el directorio del backup

![](./img/GPO Migracion/image19.png)

Selecciono la directiva del backup

![](./img/GPO Migracion/image20.png)

Ahora selecciono la tabla de migración que cree antes

![](./img/GPO Migracion/image21.png)

Y finalizo

![](./img/GPO Migracion/image22.png)




