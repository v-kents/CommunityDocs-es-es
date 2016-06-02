<properties
	pageTitle="Cómo funciona DNS – Parte 2"
	description="Cómo funciona DNS – Parte 2"
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
  
  
  
  
#Cómo funciona DNS – Parte 2
  
Por **Guillermo Delprato**
[Blog](http://windowserver.wordpress.com/)

En la [*primera parte de este
tema*](https://windowserver.wordpress.com/2011/05/07/cmo-funciona-dns-parte-1-2/)
vimos el funcionamiento básico del servicio DNS, en esta vamos a seguir
introduciendo los conceptos del funcionamiento.

### DNSs Primarios, Secundarios y Master

Una de los primeros y aún vigente requerimientos en Internet es que hay
que soportar tolerancia a fallas, y por lo tanto para resolver los
nombres de un dominio hay que poner por lo menos dos servidores DNS, no
importa si el Dominio es chico o va a recibir muy pocos pedidos de
resolución

¿Se imaginan el trabajo de tener que mantener no sólo los registros
creados y modificados manualmente en un servidor sino en por lo menos
dos?\
Bueno, esto se solucionó, hay un servidor que mantiene una base (la
Zona) con privilegios de Lectura y Escritura, y periódicamente le
transfiere los datos (transferencia de Zona) a uno o más servidores DNS.
Estos últimos sólo tienen permiso de Lectura sobre la Zona.\
De esta forma cualquiera tiene los datos para responder, pero los
cambios se realizan sólo una vez.

Cuando un servidor DNS contiene una Zona sobre la que puede no sólo Leer
sino además Escribir, se dice que es el **“Servidor Primario para dicha
Zona”.**\
Los otros servidores de DNS que reciben una copia de sólo lectura, son
**“Servidores Secundarios para dicha Zona”**.\
Cuando un servidor obtiene su Zona por transferencia desde otro, a ese
otro se lo llama el **“Master Server**”.\
Un DNS que mantenga una Zona Secundaria, puede obtenerla tanto desde el
que tiene la Zona Primaria, como además desde otro que contenga una Zona
Secundaria.\
La operación de copiar la zona desde un DNS a otro se llama
**“Transferencia de Zona”**.

### Tipos de Registros

Un Registro en una Zona DNS, corresponde a una entrada, un renglón, en
la Zona, pero no es tan fácil como muchos piensan, sólo un nombre
(hostname) y su correspondiente IP. Hay varios tipos de registros,
veamos los más importantes:

- **SOA** (Start of Authority – Principio de Autoridad)\
    El SOA indica cuál es el servidor que mantiene la Zona Primaria\
    El SOA sólo indica el FQDN del servidor, no indica su dirección IP\
    Sólo puede haber un SOA por Zona\
    Por ser el SOA, es siempre el primer registro

- **NS** (Name Server – Servidor de Nombres)\
    Existen tantos registros NS como servidores DNS tengan copia de la
    Zona, ya sea esta primaria o no\
    El NS sólo indica el FQDN del servidor, no indica su dirección IP

- **A** (Host)\
    Este es el tipo de registro que justamente todos esperamos, contiene
    un Hostname (nombre de equipo) y su correspondiente dirección IP

- **CNAME** (Canonical Name o Alias)\
    Es justamente eso, un alias. En la práctica nunca un servidor web se
    llama “www”, o un servidor de correo se llama “mail”, etc.\
    Un ejemplo de uso: se necesita cambiar el servidor que da el
    servicio de web, por otro: simplemente cambio el CNAME para que
    apunte al nuevo, y para los que acceden es totalmente tansparente.
    Otro caso, una pequeña empresa donde se usa el mismo servidor para
    www, correo, etc. Hay varios CNAMEs pero todos apuntan al
    mismo FQDN. Desde afuera nadie sabe que están accediendo al único
    servidor disponible

- **MX** (Mail Exchanger)\
    Cuando enviamos un correo electrónico, nuestro cliente de correo lo
    que hace es enviar el mensaje a nuestro servidor de correo; nuestro
    servidor de correo debe averiguar quién es el servidor de correo del
    dominio de destino. Esto es lo que permite este registro MX

- **SRV** (Service Locator)\
    Este registro permite a los clientes encontrar servicios de red. Por
    ejemplo los clientes de Active Directory usan este registro para
    encontrar a los Controladores de Dominio. Preguntan por quién provee
    el servicio LDAP

- **PTR** (Pointer)\
    El registro PTR, se utiliza sólo en las “Zonas Inversas” que veremos
    en una futura nota. La Zona Inversa o también conocida como Zona
    Reversa, lo que permite es resolver un nombre a partir de una
    dirección IP.\
    El A permite dado el nombre conocer la IP. El PTR permite dada la IP
    conocer el nombre.

Hay varios tipos más de registros en DNS, pero por ahora dejemos todo
acá.
