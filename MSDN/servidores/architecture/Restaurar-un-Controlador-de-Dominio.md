---
redirect_url: https://docs.microsoft.com/
title: Restaurar un Controlador de Dominio Desde una Instantánea
description: Restaurar un Controlador de Dominio Desde una Instantánea
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: windows
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Windows Server: Restaurar un Controlador de Dominio Desde una Instantánea
  
Por **Guillermo Delprato**

[Blog](http://windowserver.wordpress.com/)

Continuando la serie de notas sobre las mejores novedades de Active
Directory con Windows Server 2012 (Release Candidate por ahora) en esta
ocasión vamos a demostrar, la nueva posibilidad de restaurar un
Controlador desde una Instantánea (Snapshot).

Es importante recordar que esto no lo debemos hacer con Controladores de
Dominio con sistemas operativos anteriores pues es conocido que luego se
suelen provocar problemas en la replicación que normalmente dan trabajo
resolver

Para la demostración seguiremos utilizando la infraestructura montada
para las demostraciones anteriores, que recuerdo son tres Controladores
de Dominio en un Dominio: DC1, DC3 y DC4-CLONED en el Dominio
“corp.guillermod.com.ar”

Para la demostración lo que haremos serán los siguientes pasos:

- Verificaremos que todos los Controladores de Dominio tiene
    actualizados todos sus datos replicados

- Crearemos un “snapshot” sobre DC2

- Haremos una modificación, cualquiera serviría, pero elegiremos crear
    una GPO para asegurarnos que no sólo no tendremos problemas con la
    replicación de NTDS.DIT sino que tampoco sobre el SYSVOL

- Aplicaremos sobre DC2 el “snapshot” provocando el “atraso” del mismo

- Verificaremos que nuevamente los Controladores de Dominio han
    actualizado todos los datos replicados, sin manifestar ningún
    problema

Lo primero que haremos es asegurarnos que los tres Controladores de
Dominio están replicando correctamente y están actualizados los datos

Para esto utilizaremos una de las nuevas características que tenemos en
la herramienta Group Policy Management. Teniendo el foco en el Dominio,
en la ficha Status tenemos el botón “Detect now”

![] (./img/Restaurar-un-Controlador-de-Dominio/image1.png)

Y como podemos observar en la siguiente pantalla, todo está en orden

![] (./img/Restaurar-un-Controlador-de-Dominio/image2.png)

Ahora crearemos un “Snapshot” sobre uno de los Controladores de Dominio

![] (./img/Restaurar-un-Controlador-de-Dominio/image3.png)

![] (./img/Restaurar-un-Controlador-de-Dominio/image4.png)

Creamos una nueva GPO

![] (./img/Restaurar-un-Controlador-de-Dominio/image5.png)

![] (./img/Restaurar-un-Controlador-de-Dominio/image6.png)


Una vez que esta nueva GPO se ha replicado, aplicaremos el “snapshot”
que hemos tomado anteriormente sobre DC2, enviándolo de esta manera
hacia “atrás” en el tiempo

![] (./img/Restaurar-un-Controlador-de-Dominio/image7.png)

![] (./img/Restaurar-un-Controlador-de-Dominio/image8.png)


Dejemos pasar un minuto para que la información sea convergente en todos
los Controladores de Dominio, y controlemos nuevamente el estado de la
replicación. Veremos que todo se ha vuelto a sincronizar sin problemas

![] (./img/Restaurar-un-Controlador-de-Dominio/image9.png)

Y para estar seguros podemos ver las entradas correspondientes en el
Visor de Eventos

![] (./img/Restaurar-un-Controlador-de-Dominio/image10.png)

![] (./img/Restaurar-un-Controlador-de-Dominio/image11.png)

![] (./img/Restaurar-un-Controlador-de-Dominio/image12.png)

Como hemos podido comprobar, ya tenemos una nueva posibilidad con
Windows Server 2012 como es poder recuperar el estado de un Controlador
de Dominio hecho hace un tiempo, y el sistema se recupera perfectamente
sin mostrar ningún error, como sucedía hasta Windows Server 2008 R2




