<properties
	pageTitle="WCF – xsd:import schemalocation que no puede ser interpretado desde clientes PHP"
	description="WCF – xsd:import schemalocation que no puede ser interpretado desde clientes PHP"
	services="win-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="win-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>



#WCF – El caso del WSDL con xsd:import schemalocation que no puede ser interpretado desde clientes PHP

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io

  
El caso del WSDL con referencias externas que no puede ser usado en PHP
Este caso está relacionado con el caso revisado en el artículo:

WCF – El caso del WSDL con referencias externas apuntando al servidor local

Por lo cual es otra anécdota de casos de consultoría.
Supongamos que creamos un servicio WCF en http://my.webpage.com.co , como ya sabemos cuándo creamos servicios con WCF el WSDL no muestra directamente los tipos de dato del servicio, sino que genera referencias a unos schemas XSD donde únicamente están estos detalles, ejemplo:


>XML

```
    <wsdl:types>
    <xsd:schema targetNamespace="http://tempuri.org/Imports">
    <xsd:import schemaLocation="http://my.webpage.com.co/MyService.svc?xsd=xsd2"
    namespace="http://tempuri.org/"/>
    <xsd:import schemaLocation="http://my.webpage.com.co/MyService.svc?xsd=xsd0"
    namespace="http://schemas.microsoft.com/2003/10/Serialization/"/>
    <xsd:import schemaLocation="http://my.webpage.com.co/MyService.svc?xsd=xsd1"
    namespace="http://schemas.datacontract.org/2004/07/MyService"/>
    </xsd:schema>
    </wsdl:types>
```
En otra oportunidad analizaremos el contenido de esas URL, pero no es nada complejo.
El problema reside en que muchos clientes SOAP, sobre todo de tecnologías como PHP, no son capaces de interpretar este tipo de schemas XSD dentro de un WSDL, por lo cual la tarea de consumir el servicio WCF en ocasiones complicada
Los clientes SOAP para PHP en su mayoría requieren que el WSDL incorpore TODAS las especificaciones dentro de sí, no soportan referencias externas, así que hay que 'aplanar' el WSDL para que todo quede en el mismo archivo.

Hay dos formas de solucionar este problema

- Forma fácil: Utiliza Framework 4.5, en el cual por defecto WCF incluye la opción de consultar el wsd así:http://my.webpage.com.co/MyService.svc?singlewsdl ,lo que es el mismo WSDL de siempre pero sin referencias externas, TODO EN UNO.
- Si no puedes pasarte a Framework 4.5, lo cual es muy probable en escenario empresarial, entonces continúa leyendo este artículo.

Esta tarea requiere realizar algunas modificaciones a nivel de behaviors y endpoints, de hecho debes crear nuevos behaviors, no es nada del otro mundo, pero como todo, requiere tiempo, aprendizaje, pruebas etc. y si estas de afán multiplica este efecto por cien.
Por suerte existen personas que les gusta compartir conocimiento y este caso no es la excepción, en CodePlex, encontramos un proyecto llamado:


###WCFExtras

Cuyo lema es: "WCF Soap Header support, Xml comments to WSDL annotation and more", a que te suena muy intereante! 
Bien, se los dejo como tema para revisar, este artículo no trata de conocer a fondo WCFExtras, tan solo una pequeña parte para solucionar nuestro lio.
Una de las funcionalidades de WCFExtras es "Single WSDL file", ¿les suena familiar? en efecto esta funcionalidad nos permite 'aplanar' el WSDL para que no tenga referencias externas sino todo incorporado de una vez en un mismo archivo, justo lo que necesitamos.

¿Cómo se soluciona?

Lo primero que debemos hacer es bajar WCFExtras y compilar la dll, la agregamos al proyecto donde creamos nuestro servicio.
Seguidamente editamos el archivo app.config y adicionamos la siguiente extensión de behaviors

>XML

```
    <system.serviceModel>
    <extensions>
    <behaviorExtensions>
    <add name="wsdlExtensions" type="WCFExtras.Wsdl.WsdlExtensionsConfig, WCFExtras, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"/>
    </behaviorExtensions>
    </extensions> 
    </system.serviceModel>
```
Esto ya nos garantiza que podemos acceder a los nuevos behaviors incorporados con WCFExtras. Así que ahora solo basta utilizarlos para nuestro caso puntual, esta es la forma más sencilla de generar un WSDL 'aplanado', simplemente agregamos un behavior en endpointBehaviors, el tipo del behavior es wsdlExtensions y le pasamos como parámetro singleFile=true

>XML

```
    <behaviors>
    <endpointBehaviors>
    <behavior>
    <wsdlExtensions singleFile="true"/>
    </behavior>
    </endpointBehaviors>
    <serviceBehaviors>
    </behaviors>
```
Eso es todo, hora de consultar el wsdl de nuevo y... ya no tenemos nada parecido a lo que vimos más arriba, en su lugar encontramos algo como esto inclusive para los tipos complejos: 

>XML

```
    <wsdl:types>
    <xs:schema attributeFormDefault="qualified"
    elementFormDefault="qualified"
    targetNamespace="http://schemas.microsoft.com/2003/10/Serialization/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tns="http://schemas.microsoft.com/2003/10/Serialization/">
    <xs:element name="anyType"
    nillable="true"
    type="xs:anyType"/>
    <xs:element name="anyURI"
    nillable="true"
    type="xs:anyURI"/>
    <xs:element name="boolean"
    nillable="true"
    type="xs:boolean"/>
    <xs:element name="byte"
    nillable="true"
    type="xs:byte"/>
    <xs:element name="dateTime"
    nillable="true"
    type="xs:dateTime"/>
    <!--Codigo recortado--> 
    </xs:schema>
    </wsdl:types>
```

TODA la información ha sido consolidada en el mismo WSDL.