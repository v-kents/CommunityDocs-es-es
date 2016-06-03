<properties
	pageTitle="Windows Server 2012 – Papelera de Reciclaje de Active Directory"
	description="Windows Server 2012 – Papelera de Reciclaje de Active Directory"
	services="windows"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="windows"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>

#Windows Server 2012 – Papelera de Reciclaje de Active Directory

Por **Guillermo Delprato**

[Blog](http://windowserver.wordpress.com/)

Desde Windows Server 2008-R2 tenemos la posibilidad de recuperar en
forma completa objetos borrados en nuestro Dominio Active Directory.

Sólo que hasta la salida de Windows Server 2012, debíamos habilitar la
opción exclusivamente por PowerShell por lo cual no era muy conocida

A partir de Windows Server 2012 lo podremos hacer con la interfaz
gráfica usando el Active Directory Administrative Center

Para esta demostración tengo una infraestructura muy sencilla, un
Dominio con dos Unidades Organizativas: una llamada “Test Grupos” donde
está creado un grupo “Grupo-1”, y otra Unidad Organizativa llamada “Test
Usuarios” que contiene una cuenta “User One” que pertenece al grupo
“Grupo-1”

El motivo de hacerlo de esta forma es para asegurarme que cuando
recupere a “User One” se recupere también la membresía de grupo,
independientemente de la Unidad Organizativa (y así fue)

![] (./img/Papelera-de-Reciclaje-de-AD/image2.png)

![] (./img/Papelera-de-Reciclaje-de-AD/image3.png)

Primero debemos habilitar el “Active Directory Recycle Bin”, así que
abrimos el “Active Directory Administrative Center” y elegimos “Enable
Recycle Bin …”

![] (./img/Papelera-de-Reciclaje-de-AD/image4.png)

Confirmamos

![] (./img/Papelera-de-Reciclaje-de-AD/image5.png)

Nos notificamos que hay que replicar a todos los Controladores de
Dominio

![] (./img/Papelera-de-Reciclaje-de-AD/image6.png)

Debemos hacer un refresco para que aparezca “Deleted Objects” (no se ve
todavía en la captura)

![] (./img/Papelera-de-Reciclaje-de-AD/image7.png)

Ahora buscamos a nuestro usuario de prueba, lo borramos y confirmamos la
operación

![] (./img/Papelera-de-Reciclaje-de-AD/image8.png)

![] (./img/Papelera-de-Reciclaje-de-AD/image9.png)

Luego entramos a “Deleted Objects” y veremos a la cuenta borrada

![] (./img/Papelera-de-Reciclaje-de-AD/image10.png)

Sobre la cuenta a recuperar, elegimos con botón derecho la opción
“Restore”.\
Observen que además lo podríamos recuperar sobre otra Unidad
Organizativa. Esto es útil si por ejemplo hubiéramos eliminado la Unidad
Organizativa con todo su contenido y quisiéramos recuperar sólo algunas
cuentas

![] (./img/Papelera-de-Reciclaje-de-AD/image11.png)

Podemos observar en las Propiedades de la cuenta restaurada que se
recuperan todas las propiedades de la misma incluyendo la pertenencia a
grupos

![] (./img/Papelera-de-Reciclaje-de-AD/image12.png)

Siguiendo un procedimiento análogo podemos recuperar no sólo cuentas de
usuario sino además Grupos y Unidades Organizativas

Una observación a tener en cuenta es que una vez que se ha activado
“Active Directory Recycle Bin” no es posible desactivarla

Una operación, que aunque no conocida por muchos en Windows Server
2008-R2, ahora está mucho más visible y de fácil configuración
