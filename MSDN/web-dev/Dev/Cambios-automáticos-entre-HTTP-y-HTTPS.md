---
title: Cambios automáticos entre HTTP y HTTPS desde ASP.NET
description: Cambios automáticos entre HTTP y HTTPS desde ASP.NET
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Cambios automáticos entre HTTP y HTTPS desde ASP.NET
 
 Por Jorge Pedraza
 
 MCT | MCPD | MCTS | MCP | MVP | DCE Platino Plus | MVA Platino

[Blog](http://jorgepedraza.wordpress.com/)

[http://julitogtu.com](http://julitogtu.com/)



El presente artículo tiene como finalidad resaltar de formar rápida y
precisa el uso personalizado de la seguridad **SSL** dentro de una
solución de **ASP.NET**.

###Requisitos:


- Microsoft Visual Studio 2010 SP1 o superior.

- Microsoft Windows 7 o superior.

- Experiencia con autenticación por formulario de ASP.NET.

- Conocimiento en la gestión de certificados digitales.

- Conexión internet para instalar paquete **SecuritySwitch**.

###Índices:


**Conceptos Claves**

- Implementar SecuritySwitch en ASP.NET.

- Archivos de SecuritySwitch generado dentro de solución ASP.NET.

- Configuración SecuritySwitch en archivo Web.Config.

- Solución ASP.NET con SecuritySwitch desde Visual Studio 2010 SP1.

- Implementación Solución ASP.NET con securitySwitch en IIS 7.x
   o superior.

- Recomendación en IIS con SecuritySwitch.

- Código Fuentes.

- Enlaces de interés.

###Conceptos claves:
---------------------

**Certificado**: Es una declaración firmada digitalmente que enlaza el
valor de una clave pública con la identidad de la persona, dispositivo o
servicio que posee la clave privada correspondiente. La mayoría de los
certificados de uso común se basa en el **X.509 v3** certificado
estándar. Normalmente, los certificados contienen la siguiente
información: **1)** Valor de clave pública del sujeto, **2)**
Información del identificador del sujeto, tales como el nombre y correo
electrónico, **3)** El período de validez, **4)** información de
identificador del emisor, **5)** La firma digital del emisor, que
certifica la validez del enlace entre la clave pública del sujeto y la
información del identificador del sujeto.

**SSL** *Secure Sockets Layer* (capa de conexión segura) y su sucesor
**TLS** *Transport Layer Security* (seguridad de la capa de transporte)
son protocolos criptográficos que proporcionan comunicaciones seguras
por una red, comúnmente *Internet*. **SSL** implica una serie de fases
básicas: **1)** Negociar entre las partes el algoritmo que se usará en
la comunicación, **2)** Intercambio de claves públicas y autenticación
basada en ***Certificados digitales***, **3)** Cifrado del tráfico
basado en cifrado simétrico.

**Certificados SSL:** se basan en un conjunto de claves públicas y
privadas que permiten establecer una conexión segura entre el ordenador
del usuario y el servidor del *sitio web*, así como comprobar si la
clave pública de un sitio web corresponde realmente a su propietario.
Sin embargo, dado que dicha clave pública está firmada con la *clave
privada* de la autoridad de certificación **CA**, su seguridad depende
de la fiabilidad de la CA que la protege.

**SecuritySwitch**: Son bibliotecas .NET que permiten a las aplicaciones
**ASP.NET** cambiar automáticamente las solicitudes para páginas y
recursos entre los protocolos **HTTP** y **HTTPS** sin necesidad de
escribir las URLs absolutas en el marcado HTML.

###Implementar SecuritySwitch en ASP.NET:


Para hacer uso de las bibliotecas *SecuritySwitch*, se debe instalar vía
NuGet: ( PM&gt; Install-Package SecuritySwitch ), sobre un proyecto
ASP.NET activo:


![] (./img/Cambios-automáticos-entre-HTTP-y-HTTPS/image1.png)

333Archivos de SecuritySwitch generado dentro de solución ASP.NET:

```
    Common.Logging.dll

    SecuritySwitch.dll

    packages.config

    SecuritySwitch-v4.xsd
```

###Configuración SecuritySwitch en archivo Web.Config:



![] (./img/Cambios-automáticos-entre-HTTP-y-HTTPS/image2.png)

###Solución ASP.NET con SecuritySwitch desde Visual Studio 2010 SP1:


Para probar una solución ASP.NET integrada con SecuritySwitch en Visual
Studio 2010:

- Verificar que por defecto el Servidor Web de trabajo sea **IIS
   Express,** parte de Visual Studio 2010 SP1.

- Verificar que la opción SSL habilitado (**SSL Enabled**) sea igual
   **True** en la caja de propiedad del proyecto ASP.NET seleccionado.

- Opcionalmente puede establecer el Modo de ejecución en la etiqueta
    &lt;securitySwitch mode=”LocalOnly”&gt; … &lt;/securitySwitch&gt;.
    Para un caso general simplemente no se establezca el modo, es decir
    quite el atributo ***mode*** junto a su valor.

- Verificar que la misma etiqueta de securitySwitch estén establecido
    adicionalmente dos atributos:
    **baseSecureUri**=”https://localhost:44301/”
    **baseInsecureUri**=”http://localhost:1112/” ,cuya **Uri** se pueden
    ubicar en la caja de propiedades del proyecto Web raíz de ASP.NET.

- En la sección &lt;paths&gt; … &lt;/paths&gt; ubicado dentro de la
    etiqueta &lt;securitySwitch&gt;…&lt;/securitySwitch&gt;, puede
    especificar que paginas o recursos que van actuar dentro la conexión
    segura **SSL**. para mayor detalle observe la imagen previa.

###Implementación Solución ASP.NET con securitySwitch en IIS 7.x o superior:


- Generar e instalar el sitio Web de solución ASP.NET en Visual Studio
    2010 SP1, por cualquiera de las vías conocidas de implementación
    en IIS.

- Instalar y configurar certificado digital de prueba o real (emitido
    por **CA**, como [VeriSign](http://www.verisign.es/)) en el del
    servidor Web IIS de destino.

- Realizar pequeños ajustes en archivo Web.config del sitio Web de
    ASP.NET: estableciendo o no el modo de ejecución de securitySwitch
    así como las Uri de seguridad en el proceso de trabajo.

###Configuración SSL en IIS 7.x



![] (./img/Cambios-automáticos-entre-HTTP-y-HTTPS/image3.png)

###Recomendación en IIS con SecuritySwitch:


Cuando implemente una solución ASP.NET con SecuritySwitch, ***No
marque*** la casilla de verificación requiera SSL (Require SSL) en IIS.


![] (./img/Cambios-automáticos-entre-HTTP-y-HTTPS/image4.png)






