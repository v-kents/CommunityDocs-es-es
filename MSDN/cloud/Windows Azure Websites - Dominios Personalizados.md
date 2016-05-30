
<properties
	pageTitle="Azure Websites: Dominios Personalizados"
	description="Azure Websites: Dominios Personalizados"
	services="cloud"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="cloud"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/13/2016"
	ms.author="andygonusa"/>

# Azure Websites: Dominios Personalizados

Por Walter Novoa, **Microsoft Developer Evangelist**

![](./img/Windows Azure Websites - Dominios Personalizados/image1.png)

Twitter: @warnov

Sitio personal: [http://warnov.com](http://warnov.com/)

En general los sitios de Azure Websites vienen con nombres del estilo:
[*http://warnov.azurewebsites.net*](http://warnov.azurewebsites.net/).

Afortunadamente Azure ofrece una metodología muy sencilla para asignar
un nombre de dominio personalizado para que tu sitio tenga por ejemplo
el nombre: [*http://warnov.com*](http://warnov.com/).

Básicamente lo que tenemos que hacer:

**Verificar que nuestro Azure WebSite esté en Shared o Reserved (los
free no pueden tener dominio propio)\
\
**

![](./img/Windows Azure Websites - Dominios Personalizados/image2.png)

**Configurar en el proveedor de dominio los nombre tipo A.**

Uno para el @ y otro para el \*

Ambos van con la IP que ofrece Azure:

![](./img/Windows Azure Websites - Dominios Personalizados/image3.png)

![](./img/Windows Azure Websites - Dominios Personalizados/image4.png)


**Configurar en el proveedor de dominio los CNAMEs:**

**awverify** debe corresponder con awverify.warnov.azurewebsites.net
(para acceder a [*warnov.com*](http://warnov.com/))

**awverify.www** debe corresponder con
[*www.awverify.warnov.azurewebsites.net*](http://www.awverify.warnov.azurewebsites.net/)
(para acceder a [*www.warnov.com*](http://www.warnov.com/))

**www** debe corresponder a
[*warnov.azurewebsites.net*](http://warnov.azurewebsites.net/)

![](./img/Windows Azure Websites - Dominios Personalizados/image5.png)
    

**Grabar los cambios en el proveedor y volver a** **Azure para agregar
los dominios recientemente configurados:**

[*warnov.com*](http://warnov.com/)

[*www.warnov.com*](http://www.warnov.com/)

![](./img/Windows Azure Websites - Dominios Personalizados/image6.png)


 

Los detalles de esta operación los podemos ver en este video de solo 6
minutos, usando como ejemplo a GoDaddy

Las instrucciones mostradas en este video, podrían aplicarse fácilmente
a la configuración en cualquier otro proveedor de dominios:

<http://www.youtube.com/watch?feature=player_embedded&v=bz6c96hBBbA#t=0>