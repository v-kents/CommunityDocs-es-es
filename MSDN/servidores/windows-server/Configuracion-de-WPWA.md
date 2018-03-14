---
redirect_url: https://docs.microsoft.com/
title: Windows Server 2012 – Configuración de Windows PowerShell Web Access
description: Windows Server 2012 – Configuración de Windows PowerShell Web Access
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: windows
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Windows Server 2012 – Configuración de Windows PowerShell Web Access

Por **Jair Gomez Arias**
  
[Blog](http://blogs.itpro.es/jairgomez/)

Muy bien, en el anterior articulo conocimos las dos formas con las
cuales podemos instalar **Windows PowerShell Web Access** en **Windows
Server 2012**, pero con esto no tenemos el servicio de acceso vía Web a
PowerShell para la administración remota, por lo cual debemos configurar
el servicio.

Quedamos en que cuando terminamos el asistente de instalación de la
característica, este nos da una recomendación de que miremos un archivo
de ayuda para la configuración el cual se encuentra en:
**C:\\Windows\\Web\\PowerShellWebAccess\\wwwroot\\README.txt**

![] (./img/Configuracion-de-WPWA/image1.png)

Este archivo contiene los 3 pasos para la configuración recomendada.

![] (./img/Configuracion-de-WPWA/image2.png)

Lo siguiente es abrir una consola de PowerShell como administrador.

![] (./img/Configuracion-de-WPWA/image3.png)

Estando en PowerShell realizaremos los siguientes 3 pasos:

### 1) Import-Module PowerShellWebAccess

Con este Importamos el modulo correspondiente a la característica para
su posterior configuración y puesta en marcha.

### 2) Install-PswaWebApplication -Usetestcertificate

Install-PswaWebApplication es el cmdlet para la instalación de WPWA,
como Windows PowerShell Web Access trabaja vía estándares Web los mas
seguro es que use un certificado para su autenticación, podemos agregar
–Usetestcertificate para la instalación de ese certificado SSL
autofirmado en un entorno de pruebas, esto para un entorno productivo no
es nada seguro, por lo cual debemos utilizar siempre un certificado SSl
valido firmado por un CA sea propia o comprada a una entidad prestadora
de certificados ej.: VeriSing.

Si no tenemos ese certificado comprado y realizamos la configuración con
uno de pruebas, los administradores podemos cambiar este Certificado
Test por uno que este firmado en cualquier momento desde el
Administrador de IIS.

En el Warning que veremos en la imagen en el paso 2 nos informa de lo
anterior, y que ese certificado solo será valido por un periodo de 90
días, también se crea un sitio Web en IIS llamado pswa.

### 3) Add-PswaAuthorizationRule 

Una vez instalado Windows PowerShell Web Access y configurada la puerta
de enlace el siguiente paso es definir que usuarios podrán abrir la
pagina de inicio de sesión en el explorador y tener acceso a la consola
Web de PowerShell, hasta que el administrador no les conceda acceso los
usuarios por ningún motivo pueden realizar la autenticación, para este
proceso no existe ninguna GUI para autorizar los usuarios debemos
realizarlo por una serie de cmdlets.

Los administradores pueden definir entre 0 y n reglas de autenticación
para Windows PowerShell Web Access. La seguridad predeterminada es
restrictiva más que permisiva; si no se define ninguna regla de
autenticación, ningún usuario tendrá acceso a ningún sitio.

En el entorno de pruebas que tengo utilice Add-PswaAuthorizationRule
\*\*\* con esto le estamos dando ordenes al servicio de que nos cree una
regla de autorización a todos (\*\*\*) los usuarios en el dominio para
que tengan acceso a la consola Web.

![] (./img/Configuracion-de-WPWA/image4.png)

**Nota de Seguridad (TechNet)**

Un usuario solo necesita que una regla sea verdadera para obtener el
acceso. Si a un usuario se le concede acceso a un equipo con acceso de
lenguaje completo o acceso únicamente a los cmdlets de administración
remota de Windows PowerShell, desde la consola basada en web, el usuario
puede iniciar sesión (o saltar) en otros equipos conectados al primer
equipo de destino. El modo más seguro de configurar Windows PowerShell
Web Access consiste en permitir a los usuarios acceder únicamente a
configuraciones de sesión restringidas (también denominadas extremos o
espacios de ejecución) que les permitan llevar a cabo tareas específicas
que, por lo general, deben realizar de forma remota.

Para una personalización de los usuarios tenemos los siguientes cmdlets
y parámetros:

### Add-PswaAuthorizationRule

Agrega una nueva regla de autorización al conjunto de reglas de
autorización de Windows PowerShell Web Access.

Parámetros:

ComputerGroupName

    ComputerName

    ConfigurationName

    RuleName

    UserGroupName

    UserName

    **Remove-PswaAuthorizationRule**

Quita una regla de autorización especificada de Windows PowerShell Web
Access.

Parámetros:

    Id

    RuleName

    **Get-PswaAuthorizationRule**

Devuelve un conjunto de reglas de autorización de Windows PowerShell Web
Access. Cuando se usa sin parámetros, el cmdlet devuelve todas las
reglas.

Parámetros:

    Id

    RuleName

    **Test-PswaAuthorizationRule**

Evalúa las reglas de autorización para determinar si una solicitud de
acceso de usuario, equipo o configuración de sesión específica tiene
autorización. De manera predeterminada, si no se agrega ningún
parámetro, el cmdlet evalúa todas las reglas de autorización. Mediante
la adición de parámetros, los administradores pueden especificar que se
pruebe una regla de autorización o un subconjunto de reglas.

Parámetros:

    ComputerName

    ConfigurationName

    RuleName

    UserName

    Un ejemplo de todo lo anterior seria.

Add-PswaAuthorizationRule –UserName &lt;domain\\user |
computer\\user&gt; -ComputerName &lt;nombre\_equipo&gt;
-ConfigurationName &lt;nombre\_configuración\_sesión&gt;

En mi entorno tengo todo listo para ver como funciona el servicio,
entonces nos vamos a Internet Explorer, recordemos que podemos acceder
por diferentes navegadores y dispositivos soportados.

![] (./img/Configuracion-de-WPWA/image5.png)

La URL es: **https://*&lt;nombre servidor&gt;*/pswa** Como estoy
utilizando el Certificado Test veremos el error de que este sitio Web no
es seguro, si queremos realizar un entorno de pruebas mas completo
podemos crear un CA local en nuestro Dominio.

![] (./img/Configuracion-de-WPWA/image6.png)

Agregamos al sitio como seguro.

![] (./img/Configuracion-de-WPWA/image7.png)

Esta es la pagina de Login de Windows PowerShell Web Access en las
cuales nos pide nuestras credenciales de Dominio con la previa regla de
autorización para el ingreso, necesitamos el **User Name, Password,
Connection type, Computer Name** al cual nos conectaremos y
administraremos remotamente desde PowerShell.

![] (./img/Configuracion-de-WPWA/image8.png)

Vemos la consola de comandos la cual al lado derecho veremos el servidor
al cual estamos conectados y el botón para cerrar sesión, en el lado
izquierdo el botón Submit con el cual lanzaremos los comandos escrito en
la consola o el botón Cancelar y un Historial de los comandos.

![] (./img/Configuracion-de-WPWA/image9.png)

Para ver una prueba del servicio:

![] (./img/Configuracion-de-WPWA/image10.png)

Con esto tenemos ya listo nuestro entorno de pruebas para Windows
PowerShell Web Access, en cuanto a producción solo debemos tener nuestro
certificado firmado, el cual podemos remplazar en cualquier momento.

También es bueno saber algo sobre la seguridad para lo cual les comparto
lo mencionado en el sitio de Technet Library respecto a la
característica y poder tener mucha mas documentación, la idea de todos
estos artículos es conocer las cosas nuevas incorporadas en Windows
Server 2012 e investigar mas sobre ellas.

**Seguridad**

*El modelo de seguridad de Windows PowerShell Web Access tiene cuatro
niveles entre un usuario final de la consola basada en web y un equipo
de destino. Los administradores de Windows PowerShell Web Access pueden
agregar niveles de seguridad mediante configuración adicional en la
consola del Administrador de IIS. Para obtener más información acerca de
la protección de sitios web en la consola del Administrador de IIS, vea
el tema sobre cómo [configurar la seguridad de Servidor web (IIS
7)](http://technet.microsoft.com/en-us/library/cc731278%28v=WS.10%29.aspx).
Para obtener más información acerca de los procedimientos recomendados
de IIS y la prevención de ataques por denegación de servicio, vea el
tema sobre los [procedimientos recomendados para prevenir ataques por
denegación de servicio
(DoS)](http://technet.microsoft.com/en-us/library/cc750213.aspx). Los
administradores también pueden comprar e instalar software de
autenticación de venta minorista adicional.*

Con esto es todo espero puedan tener esta posibilidad de administración
remota si en sus empresas puedan necesitarlo algún día y tener en este
articulo una forma rápida de ver su instalación, configuración y prueba.




