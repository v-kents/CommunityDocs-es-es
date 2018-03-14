---
redirect_url: https://docs.microsoft.com/
title: Cliente Lync- Error de llamada por problemas de redP
description: Cliente Lync- Error de llamada por problemas de red
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: server
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Cliente Lync: Error de llamada por problemas de red

Por **Peter Diaz**


LinkedIn: <http://www.linkedin.com/pub/peter-diaz/8/61b/a72>



Al intentar llamar a un cliente federado en Lync nos retorna el
siguiente error “Error de llamada por problemas de red”.

**Comportamiento:** Cuando se realiza una llamada a un cliente federado
se puede escuchar el ring de la llamada y se establece la sesión de
comunicación a nivel SIP pero no hay conectividad haciendo que la
llamada se corte y finalice en error **“Error de llamada por problemas
de red”.**

![] (./img/Error-de-llamada-problemas-de-red/image1.png)

**Diagnóstico:** Este tipo de errores es poco probable que lo resolvamos
a simple vista pero debemos de realizar los respectivos chequeos de
rutina para certificar que nuestra plataforma esta optima:

1.  Revisar  los puertos y reglas en el firewall
    [*http://technet.microsoft.com/en-us/library/gg425882.aspx*](http://technet.microsoft.com/en-us/library/gg425882.aspx)

2.  Chequear que todos nuestros SIP SRV Records estén creados
    correctamente y operativos
    [*https://www.testocsconnectivity.com/*](https://www.testocsconnectivity.com/)

3.  Revisar la configuración de la electrónica de red (VLANS-Rutas
    estáticas-Listas de Acceso)

4.  Si todo esto está bien como fue en mi caso el siguiente paso es
    diagnosticar el error utilizando herramientas especializadas como el
    **Snooper.exe** que viene dentro del [*Lync Resources Kit
    Tools*](http://www.microsoft.com/download/en/details.aspx?id=21165):

Lo primero que hay que hacer es habilitar en el cliente Lync los logs
para capturar la información, para ello nos vamos a **herramientas –&gt;
opciones –&gt; general**:

![] (./img/Error-de-llamada-problemas-de-red/image2.png)

Figura 1. Habilitar registro de logs en cliente Lync

Luego cerramos el cliente Link y hacemos sesión nuevamente, procedemos a
dar clic al Snooper.exe que se encuentra en la siguiente ruta:

C:\\Program Files\\Microsoft Lync Server 2010\\ResKit\\Tracing

![] (./img/Error-de-llamada-problemas-de-red/image3.png)

Figura 2. Ruta donde se encuentra el Snooper.exe

Inmediatamente reproducimos el error que nos da al realizar la llamada
desde el cliente Lync (hacemos una llamada a un federado y esperamos que
nos del error), luego abrimos el Snooper.exe File –&gt; Open File
buscamos la ruta del siguiente fichero (archivo) donde se guardan los
logs del cliente Lync:

C:\\Users\\Administrator\\Tracing\\Communicator-uccapi-0.uccapilog

![] (./img/Error-de-llamada-problemas-de-red/image4.png)

Figura 3. Trazas estudiadas con el Snooper.exe

Via: SIP/2.0/TLS
192.168.0.0:49176;received=62.0.0.0;ms-received-port=49176;ms-received-cid=1F7F00\
ms-diagnostics: 1027;reason=”Cannot route this type of SIP request to or
from federated partners”;source=”nxac.pdiaz.com”\
Server: RTC/4.0\
Content-Length: 0

01/15/2012|11:30:10.163

Este error nos está diciendo que no se puedo enrutar la llamada desde
los clientes federados hacia nuestro Edge Server, es decir que el
servidor Edge de Lync no está haciendo conectividad con el SIP ACCESS
del Front End nxac.pdiaz.com

![] (./img/Error-de-llamada-problemas-de-red/image5.png)

Figura 4. Front End de Lync Server – Topology Builder

Solución: Para solucionar el problema se debe crear un registro CNAME en
el DNS que apunte desde el SIP ACCESS nxac.pdiaz.com hacia el Front End
de Lync:

![] (./img/Error-de-llamada-problemas-de-red/image6.png)

Figura 5. Creación del CNAME en el DNS Interno

>**Nota** : Es importante también tener creado dentro del servidor Edge de
Lync las rutas estáticas que apunten al Front End de Lync así como
agregar de ser posible en el fichero (archivo) Host las rutas que
apunten al Front End.




