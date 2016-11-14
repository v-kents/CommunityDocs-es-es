---
title: Visual Studio 2013- Trabajando con versiones múltiples del .NET FrameworkP
description: Visual Studio 2013- Trabajando con versiones múltiples del .NET Framework
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Visual Studio 2013: Trabajando con versiones múltiples del .NET Framework

Por **Andy Gonzalez, SSM – Microsoft**



###En Visual Studio 2013, puede especificar la versión de .NET Framework necesaria para la aplicación. 

![] (./img/Versiones-múltiple-del-NET-Framework/image1.png)

Por tanto, si desea usar Visual Studio 2013 para continuar
   desarrollando un proyecto que empezó en una versión anterior, no
   tiene que cambiar la versión del .NET Framework.

También podría crear una solución que contiene proyectos que se
   dirigen a diferentes versiones del .NET Framework.

La versión del .NET Framework  que tiene como destino también
   garantiza que la aplicación utilice solo la funcionalidad disponible
   en la versión especificada del .NET Framework.



**Nota**: Las plantillas de proyecto pueden cambiar de versión a versión
del .NET Framework ya que hay dependencias de compatibilidad entre
versiones.

###Ejemplo: Proyecto de Windows

**.NET Framework 2.0**

![] (./img/Versiones-múltiple-del-NET-Framework/image2.png)

**.NET Framework 4.51**

![] (./img/Versiones-múltiple-del-NET-Framework/image3.png)

###El establecimiento de destinos del .NET Framework incluye las siguientes características: 


Al abrir un proyecto destinado a una versión anterior de .NET Framework,
Visual Studio automáticamente puede actualizarlo o dejar el destino como
está.

Al crear un proyecto, puede especificar la versión de .NET Framework a
la que desea destinarlo.

Puede cambiar la versión de .NET Framework a la que está destinado un
proyecto existente.

Bajo el menú de Debug (Depurar), seleccione Propiedades del proyecto.


![] (./img/Versiones-múltiple-del-NET-Framework/image4.png)

Puede establecer como destino una versión distinta de .NET Framework
   en cada proyecto de la misma solución.

Cuando se cambia la versión de .NET Framework que un proyecto usa
   como destino, Visual Studio realiza los cambios necesarios en las
   referencias y los archivos de configuración.



![] (./img/Versiones-múltiple-del-NET-Framework/image5.png)

![] (./img/Versiones-múltiple-del-NET-Framework/image6.png)


###Cuando trabaje en un proyecto destinado a una versión anterior de .NET Framework, Visual Studio realiza dinámicamente modificaciones en el entorno de desarrollo, como se indica a continuación: 

Filtrará los elementos de los cuadros de diálogo Nuevo proyecto, Agregar
nuevo elemento, Agregar nueva referencia y Agregar referencia de
servicio para omitir las opciones que no están disponibles en la versión
de destino.

Filtrará los controles personalizados del Cuadro de herramientas para
quitar aquellos que no están disponibles en la versión de destino y para
mostrar solo los controles más actualizados cuando hay varios controles
disponibles.

Filtra IntelliSense para omitir características de lenguaje que no están
disponibles en la versión de destino.

Filtrará las propiedades de la ventana Propiedades para omitir las que
no están disponibles en la versión de destino.

Filtrará las opciones de menú para omitir las que no están disponibles
en la versión de destino.

Para las compilaciones, se utiliza la versión del compilador y las
opciones del compilador que son adecuadas para la versión de destino.


Debe comprobar sus aplicaciones y componentes de .NET Framework para
asegurarse de que son compatibles con otras versiones de .NET Framework.
Para asegurarse de que una aplicación o componente se ejecuta
correctamente en .NET Framework 4.5, vea .NET Framework 4 Application
Compatibility Walkthrough. Siga los mismos pasos, pero el sustituya .NET
Framework 4.5 por .NET Framework 4.

####Para las aplicaciones de .NET Framework 2.0, 3.0, 3.5 y 4:

Consulte [*Problemas de migración de .NET Framework
4*](http://go.microsoft.com/fwlink/p/?LinkId=248212) y [*Compatibilidad
de aplicaciones en .NET Framework
4.5*](http://msdn.microsoft.com/es-es/library/hh367887.aspx) para los
cambios que puedan afectar a la aplicación y use la alternativa
descrita.

Si está recompilando código fuente existente para ejecutarlo en .NET
Framework 4.5 o está desarrollado una nueva versión de una aplicación o
componente que tiene como destino .NET Framework 4.5 a partir de una
base de código fuente existente, consulte en [*Lo obsoleto en la
biblioteca de clases de .NET
Framework*](http://msdn.microsoft.com/es-es/library/ee461502.aspx) los
miembros y tipos obsoletos y aplique las soluciones descritas. (El
código compilado previamente seguirá ejecutándose con los tipos y
miembros que se han marcado como obsoletos).

####Para las aplicaciones de .NET Framework 1.1:

Consulte [*Problemas de migración de .NET Framework
4*](http://go.microsoft.com/fwlink/p/?LinkId=248212) y [*Compatibilidad
de aplicaciones en .NET Framework
4.5*](http://msdn.microsoft.com/es-es/library/hh367887.aspx) para los
cambios que puedan afectar a la aplicación y use la alternativa
descrita.

Compruebe [*Cambios en .NET Framework 3.5
SP1*](http://go.microsoft.com/fwlink/?LinkId=186989) y [*Cambios en .NET
Framework 2.0*](http://go.microsoft.com/fwlink/?LinkID=125263) para
obtener información sobre los cambios realizados en dichas versiones.

Si está recompilando código fuente existente para ejecutarlo en .NET
Framework 4.5 o está desarrollado una nueva versión de una aplicación o
componente que tiene como destino .NET Framework 4.5 a partir de una
base de código fuente existente, consulte en [*Lo obsoleto en la
biblioteca de clases de .NET
Framework*](http://msdn.microsoft.com/es-es/library/ee461502.aspx) los
miembros y tipos obsoletos y aplique las soluciones descritas. (El
código compilado previamente seguirá ejecutándose con los tipos y
miembros que se han marcado como obsoletos).




