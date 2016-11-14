---
title: Maestro detalles con Entity Framework en Windows Forms
description: Maestro detalles con Entity Framework en Windows Forms
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Maestro detalles con Entity Framework en Windows Forms
  
Por Jorge Pedraza
 
MCT | MCPD | MCTS | MCP | MVP | DCE Platino Plus | MVA Platino

[Blog](http://jorgepedraza.wordpress.com/)



Hola, el presente articulo tiene como intención resaltar una forma
rápida y sencilla de trabajar con la tecnología **Entity Framework**
bajo el ambiente de Windows Forms Application. Para esto se muestra las
secuencias clave del desarrollo de una solución basada en un formulario
Windows, el cual a través de **Entity Framework** se gestionará
determinada Base de datos, tal es el caso de SQL server 2008 R2 Express.

**Requisitos**:

- Microsoft Visual Studio 2010 SP1

- Microsoft SQL Server 2008 R2 o Superior

- Experiencia en desarrollo con Base de Datos

- Conocimiento sobre Entity Framework

- Microsoft Windows 7 o superior

###Contenido Clave:


Para iniciar el desarrollo de la **solución base**, se debe iniciar una
instancia de **Visual Studio 2010 SP1** donde se crea nuevo proyecto del
tipo *Windows Forms Application*, con un nombre especifico, por ejemplo
*WindowsApplicationEF*. Ahora a continuación se procede con las
siguientes indicaciones:

- Agregar archivo demoEF.mdf

![] (./img/Maestro-detalles-con-Entity-Framework/image1.png)

<!-- -->

- Establecer estructura demoEF.mdf

![] (./img/Maestro-detalles-con-Entity-Framework/image2.png)


- Establecer diagrama de demoEF.mdf

![] (./img/Maestro-detalles-con-Entity-Framework/image3.png)



- Agregar ModeldemoEF.edmx

![] (./img/Maestro-detalles-con-Entity-Framework/image4.png)



- Establecer archivo demoEF.mdf

![] (./img/Maestro-detalles-con-Entity-Framework/image5.png)


- Seleccionar tablas especificas

![] (./img/Maestro-detalles-con-Entity-Framework/image6.png)
<!-- -->

- Verificar entidades creadas

![] (./img/Maestro-detalles-con-Entity-Framework/image7.png)



- Establecer SubTotal para DetOrden

![] (./img/Maestro-detalles-con-Entity-Framework/image8.png)



- Calcular MontoBruto para EncOrden

![] (./img/Maestro-detalles-con-Entity-Framework/image9.png)



- Seleccionar Form1

![] (./img/Maestro-detalles-con-Entity-Framework/image10.png)



- Agregar DataGridViews y botones

![] (./img/Maestro-detalles-con-Entity-Framework/image11.png)



- Parametrizar DataGridView1 EncOrden

![] (./img/Maestro-detalles-con-Entity-Framework/image12.png)



- Parametrizar DataGridView2 DetOrden

![] (./img/Maestro-detalles-con-Entity-Framework/image13.png)



- Verificar interfaz de Usuario

![] (./img/Maestro-detalles-con-Entity-Framework/image14.png)



- Establecer código de desarrollo

![] (./img/Maestro-detalles-con-Entity-Framework/image15.png)



- Realizar prueba de ejecución

![] (./img/Maestro-detalles-con-Entity-Framework/image16.png)

**Nota Importante:** Esta solución no incluye más opciones ni
validaciones de usuario, ya que la intención principal de la misma es
representar una *alternativa base* para crear soluciones futuras de
mayor grado de complejidad a través de una vía solida y precisa.

**Código Fuentes**:

[*WindowsApplicationEF*](https://skydrive.live.com/embed?cid=180D91520E7E6619&resid=180D91520E7E6619%21825&authkey=ALaXWufQH0Hu_9c)
(Visual Basic 2010, Windows Forms Application, SQL Server 2008 R2
Express, Entity Framework)

**En Resumen:**

Una vez más se puede apreciar una alternativa simple y productiva de
crear soluciones Windows con base de datos a través de tecnologías
actuales y de proyección futura dentro de la plataforma .NET, como es
*Entity Framework*.




