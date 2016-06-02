<properties
	pageTitle="Controladores de Dominio: Tolerancia a Fallas"
	description="Controladores de Dominio: Tolerancia a Fallas"
	services="windows"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="indows"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>


#Controladores de Dominio: Tolerancia a Fallas

Por **Guillermo Delprato**

[Blog](http://windowserver.wordpress.com/)

En esta nota veremos cómo tener tolerancia a fallas de nuestros
Controladores de Dominio usando el método más adecuado y además
económico.

En varias ocasiones he visto a quien se ha planteado montar los
Controladores de Dominio sobre un Failover Cluster. Esta no es una
solución recomendada por varios motivos, además de los costos
asociados.\
Puede verse información sobre los por qué no es aconsejable en:

**Windows 2000, Windows Server 2003, and Windows Server 2008 cluster
nodes as domain controllers:**

[*http://support.microsoft.com/kb/281662*](http://support.microsoft.com/kb/281662)

**Domain Controllers as Cluster Nodes – Bad Idea – Cluster Help:**

[*http://msmvps.com/blogs/clusterhelp/archive/2008/02/12/domain-controllers-as-cluster-nodes-bad-idea.aspx*](http://msmvps.com/blogs/clusterhelp/archive/2008/02/12/domain-controllers-as-cluster-nodes-bad-idea.aspx)

Siendo que la función principal de los Controladores de Dominio es
autenticar las cuentas, lo primero que debemos plantearnos es cuáles son
los servicios necesarios para autenticar cuentas.

Son 4 los requeridos:

- Un Controlador de Dominio, ya que es el que hará la autenticación

- Un servidor DNS, que es el que permitirá que los clientes encuentren
   al anterior

- Un Controlador de Dominio que sea Catálogo Global. Esto no es algo
   realmente conocido por todos, pero debemos tener en cuenta, que la
   función Catálogo Global es la que provee la membresía en los grupos
   Universales, y además en algunos casos es quien resuelve el UPN
   (User Principal Name)\

**NOTA**: un Controlador de Dominio es lo “uficientemente tonto” para no
   darse cuenta que es Catálogo Global, si no le pregunta a un DNS

Los equipos clientes deben tener configurados a por lo menos dos
   servidores DNS en sus propiedades de TCP/IP

Entonces, enfocándonos en la parte práctica, como mínimo necesitaremos:

- Dos Controladores de Dominio por Dominio (aunque sea un
   Dominio pequeño)

- Que ambos sean servidores DNS del Dominio

- Que ambos cumplan la función Catálogo Global

- Que todos los equipos clientes tengan configurados para usar como
    DNS a ambos Controladores de Dominio

### Nota Aclaratoria

Debemos aclarar qué sucede si no tuviéramos tolerancia a fallas sobre
nuestros Controladores de Dominio, y no hubiera ninguno disponible, ya
que el comportamiento de los clientes Windows puede llegar a desorientar
a un administrador que no conoce exactamente cómo funciona la
autenticación.

Por omisión, en un cliente de Dominio, cuando un usuario inicia sesión,
trata siempre de usar “credenciales cacheadas”. Esto es, si el usuario
anteriormente inició sesión en dicho equipo, dentro de su perfil está su
contraseña (por supuesto cifrada, y con otras medidas de seguridad), y
por lo tanto podrá iniciar sesión en el equipo aunque no hubiera
Controlador de Dominio disponible.

Lo que no podrá hacer es conectarse a un recurso en otro equipo, porque
para esto debería poder obtener el correspondiente “Ticket Kerberos”

### Recomendaciones

**El problema del presupuesto:** A veces en las empresas pequeñas, los
presupuestos son limitados, y conseguir la aprobación de compra de un
segundo hardware de tipo servidor es difícil.

Si este fuera el caso, no lo duden, como segundo Controlador de Dominio,
pongan aunque sea una máquina de tipo escritorio “bien armada”

No hay problemas ya que ellas se repartirán adecuadamente la tarea de
autenticar usuarios de acuerdo a su capacidad

**El problema de los recursos:** Es altamente recomendable que los
Controladores de Dominio sean solamente eso, y no que cumplan funciones
adicionales. Por supuesto que además deben servidores DNS por su integración en
Active Directory. 

Podrían llegar a tener quizás algún servicio “liviano” como ser DHCP o
WINS. Para nada recomendable es que además sean servidores de archivos o
impresión. Mucho peor si además fueran servidores de aplicaciones (SQL, Exchange,
etc.)

Y nunca nunca nunca, los que compartan o tengan conexión directa a
Internet. Un Controlador de Dominio contiene la información más valiosa
de la red (Usuarios y Contraseñas), jamás debe ser la más expuesta a
problemas de seguridad.
