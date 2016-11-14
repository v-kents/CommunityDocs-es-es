---
title: Cómo funciona DNS – Parte 1
description: Cómo funciona DNS – Parte 1
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: windows
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Cómo funciona DNS – Parte 1

Por **Guillermo Delprato**
[Blog](http://windowserver.wordpress.com/)

En una red con Windows y TCP/IP, cada máquina tiene en realidad dos
nombres: uno llamado “Nombre NetBIOS” y otro llamado “Hostname”. Estos
nombres son asignados a los equipos durante la instalación, y son usados
tanto por las aplicaciones como por los que usamos los equipos y
recursos de la red.

En sistemas Pre-Windows 2000, el nombre que se le asigna a una máquina
durante la instalación es el “Nombre NetBIOS”, este tiene una longitud
máxima de 16 caracteres, aunque sólo son utilizables 15, pues el
dieciseisavo tiene uso reservado. Admite algunos símbolos (por ejemplo
“\_”). Pero si vamos a las propiedades de TCP/IP vemos que también tiene
asignado un “hostname” que por omisión el sistema trata que sea igual al
“Nombre NetBIOS”.

A partir de Windows 2000, en cambio, el nombre asignado durante la
instalación es el “hostname” que puede tener hasta 255 caracteres
(Microsoft soporta hasta 24), pero que es mucho más restrictivo ya que
sólo puede contener letras, números y el signo “-”. En estos sistemas si
miramos en el lugar donde se cambia el nombre, notaremos que también
existe un “Nombre NetBIOS” pero que no lo podemos cambiar separadamente
del “hostname”.

De cualquier forma, y esto es importante, en una red TCP/IP siempre que
nos referimos a un equipo usando alguno de estos nombres, el sistema
necesita obtener qué dirección IP corresponde a dicho nombre. A este
proceso se lo llama Resolución de Nombres.

Existen métodos para resolver “Nombre NetBIOS” y métodos diferentes para
resolver “hostnames”. Si no tiene muy claro el concepto es interesante
que vea [Resolución de Nombres de
Máquina](http://windowserver.wordpress.com/2011/03/18/resolucin-de-nombres-de-mquina-dns-wins-etc/)
(DNS, WINS, HOSTS, LMHOSTS, y etcéteras)

En esta nota trataré de ver con cierto nivel de detalle la resolución de
“hostname” lo cual nos lleva indefectiblemente a cómo trabaja el
servicio DNS.

¿Lo hacemos como un cuento para que sea más ameno? Bien, si nadie dice
nada lo haré así. Había una vez… un grupo de gente muy estudiosa
trabajando con las primeras redes TCP/IP que cuando necesitaban acceder
a otro equipo lo identificaban directamente escribiendo la
correspondiente dirección IP, y eso funcionaba perfectamente.

Si, funcionó perfectamente hasta que se fueron agregando más y más
máquinas y ya era difícil recordar esos números (dirección IP) para cada
uno de los equipos. A partir de eso se buscó algo que fuera más fácil de
recordar: un “alias” o “apodo” para cada máquina ya que eso es mucho más
fácil para que un humano lo recuerde. Y así nació el hostname

Luego en cada máquina se debía tener un archivo de texto que
especificara qué dirección IP correspondía a cada alias (hostname). Esto
es el archivo HOSTS. Este es un método muy eficiente para resolver
nombres, pero tiene el inconveniente que hay que tenerlo y actualizarlo
en cada máquina.

Mientras Internet, o en ese entonces Arpanet, eran pocos equipos y con
muy poca variación esto fue una solución. Según se cuenta, en el MIT
(Massachusetts Institute of Technology) se mantenía el archivo HOSTS
central. Bastaba que cuando se agregaba o cambiaba un equipo se avisara,
y que periódicamente uno se trajera una copia actualizada y la
distribuyera entre sus equipos. Supongo que a esa altura la NASA debía
tener como cinco computadoras

Esto era muy bueno, pero a medida que siguió creciendo, se fue poniendo
cada vez más difícil el mantenimiento del HOSTS central por su tamaño, y
como si fuera poco comenzaron los problemas por la colisión de nombres,
no podía haber dos máquinas con el mismo hostname.

Cómo se solucionó esto. La solución pasó por dos puntos fundamentales:

Descentralizar la administración

Armar una estructura jerárquica que solucionara las colisiones de
nombres

Así nació DNS (Domain Name System o Domain Name Server)

En ese momento ya habían varias empresas comerciales incorporadas, como
así también agencias gubernamentales, universidades, etc. Por lo tanto
se convino en que cada una de ellas debía mantener un servidor de
nombres (Name Server) que “resolviera” sus propios nombres.

Luego los clientes tenían configurado que cuando tuvieran que “resolver
un nombre” le preguntaran a su servidor de nombres (Name Server).
Mientras el administrador local se ocupara de mantener manualmente sus
propios “mapeos de nombre” todo funcionaba perfectamente dentro de la
propia organización . Esta base de datos donde se anotan los nombres y
su correspondiente dirección IP, se llama ZONA.

Hasta acá todo bien, pero sólo se resuelve dentro de la propia
organización, entonces ¿cómo se hace cuando se quiere acceder a un
equipo que esté en otra empresa u organización? Bien, para resolver esto
se dispuso poner un servidor de nombres que se encargara de resolver
\*solamente\* los servidores de nombres de cada organización. Y estos
últimos debían conocer a este “servidor de nombres padre”.

Entonces funcionaría de esta forma, cuando un cliente tiene que resolver
un nombre, se lo pregunta a su servidor de nombres, si éste lo puede
resolver utilizando su propia ZONA, responde según se dice en forma
Autoritaria o Autoritativa, pues tiene los datos localmente. Pero si no
tuviera los datos localmente entonces le preguntará al “servidor de
nombres padre” para saber qué servidor de nombres en particular le puede
dar la respuesta.\
Este “servidor de nombres padre” le indicará al “servidor de nombres
local” a qué “servidor de nombres” debe preguntarle para obtener la
respuesta final.

Así como está planteado hasta ahora, todo funcionaría, pero por variadas
razones se hizo un poco más complejo, no mucho no asustarse. En lugar
que todo el mundo tuviera un único “servidor padre” se agruparon por
rubro. Es de decir el que resolvía los que eran nombres comerciales se
agruparon en uno, los gubernamentales en otro, los educativos en otro,
etc. etc. Arriba de todos estos, si había un “único padre”.

Con un poco de imaginación vemos que estamos construyendo un árbol, o
más precisamente las raíces de un árbol. Todos las organizaciones
comerciales “colgando” de un servidor de nombres que “maneja los
COMerciales”, y otras organizaciones gubernamentales”colgando” del que
“maneja los GOVernamentales”, y educativas “colgando” del que “maneja
los EDUcativos”, etc. Y por arriba de todo, o sea el que conoce quienes
son los que manejan a los COMerciales, GOVernamentales, EDUcativos, etc.
hay un servidor de nombres que sabe quiénes son estos últimos.

![] (./img/Como-funciona-DNS1/image1.png)

Bueno, a esta altura paremos con los cuentos y vamos a cosas más reales.
Cada “nudo” de este árbol invertido que estamos haciendo se llama
Dominio de DNS o Dominio de Internet. Más adelante daremos una mejor
definición.

En la parte inferior tenemos los dominios, por ejemplo: hp, microsoft,
ibm, etc. que “cuelgan” del dominio “com”; nasa, whitehouse, etc. que
“cuelgan” del “gov”; purdue, mit, etc. que “cuelgan” de “edu”; y podemos
seguir con los diferentes grupos, que cada uno ya se imagina: org,
net,mil y el que cada país tiene a este nivel (ar, es, mx, etc.)

Arriba de cada uno de esos dominios de primer nivel hay otro servidor de
nombres que sólo conoce quienes son los servidores de com, gov, edu,
etc.

Lo que tuvieron problemas es para designar el nombre de este dominio
raíz, no hubo forma de ponerse de acuerdo, por lo que quedó sin nombre
(un poco de humor). Es verdad se llama con el carácter nulo, pero como
los humanos no lo podemos representar y no lo podemos ver se lo
representa por un punto (.)

Como cada organización es responsable y debe mantener la resolución de
nombres de su dominio, entonces cumplimos el primer objetivo que es
distribuir el mantenimiento

Vamos ahora a ver cómo se evitan las colisiones de nombres.

Cada máquina (usemos la palabra host para ser más técnicos) necesita
identificarse dentro de este árbol en una forma única (unívoca). Y esto
se logra mediante el “camino” que va desde el propio host hasta el
dominio raíz. Así por ejemplo un host que está en el sitio de hp y tiene
hostname “server1” se identifica como: “server1.hp.com.” (si, con punto
al final) y otro que también se llame server1 pero que esté en el MIT,
se llamará “server1.mit.edu. “.

Este nombre que identifica unívocamente cada host en el árbol se llama
FQDN (Fully Qualified Domain Name) que todos los usamos cuando
escribimos un URL de Internet, aunque no sepamos que esa parte se llame
así.

Aunque nadie pone el punto final de un FQDN, todas las aplicaciones lo
dan por descartado y funcionan bien. Más, cuando más adelante veamos el
contenido de una Zona, veremos que el sistema agrega el “.” aunque no lo
escribiéramos.

Llegó el momento de poner las cosas en su lugar y ver cómo funciona
esto. Vamos a suponer que en este momento se pone todo en
funcionamiento, o sea que no hay ninguna información almacenada en
memoria de ningún equipo, solamente lo que tenga en su propia zona.

Cada servidor de una organización conoce solamente los nombres de su
propia organización, y la dirección IP del (los en realidad) servidores
del dominio raíz.\
El (los) servidor del domino raíz conoce sólo los DNS que tiene justo
“abajo”, o sea primer nivel (.com, .edu, .mil, .ar, .mx, etc.)\
Y los servidores de primer nivel sólo conocen a los DNS de cada
organización.

En la situación anterior, un usuario en, supongamos, hp quiere acceder a
**server1.microsoft.com**. Por lo tanto en el equipo cliente un
componente software llamado Resolver se encarga de preguntar al DNS que
tenga configurado para que le diga qué dirección IP tiene dicho host.
Los Resolvers suelen ser de mal carácter (humor) así que la pregunta es
algo así como: “dime que IP tiene server1.microsoft.com o dime que no
sabes, no acepto referencias o medias respuestas) A esto tipo de
pregunta se la llama **Recursive Query**, exige respuesta concreta por
sí o por no.

Como el servidor DNS de hp no tiene localmente en su propia zona nada de
microsoft.com sale a buscar al único DNS externo que conoce, el DNS del
dominio raíz. Las preguntas que hacen los servidores DNS a otros DNS
generalmente son de tipo **Iterative Query** (Dime lo más que puedas,
acepto referencias).Este le va a responder con una referencia, que es lo
más que puede; algo así como “pregúntale al servidor de com”, por lo
tanto el servidor DNS de hp ahora le pregunta al de “com” quien le dirá
que pregunte al de microsoft que finalmente dará la respuesta
solicitada, al servidor DNS de hp, que devolverá el dato correspondiente
al cliente que originó todo, y que finalmente podrá hacer la conexión
correspondiente.

Cada pregunta que hizo el servidor DNS para resolver el pedido del
cliente, recibió conjuntamente con la respuesta, un parámetro denominado
TTL (Time To Live) que corresponde a cuánto tiempo puede tener la
información en memoria y considerarla válida (cachear que le decimos)

Dentro del tiempo de los TTLs, si otro cliente repite la pregunta, el
DNS devolverá la información correcta sin necesidad de ir a buscar
afuera. O inclusive si le preguntaran por serve1.microsoft.com podría
preguntar directamente al DNS de microsoft.com. O inclusive si le
preguntaran por server.ibm.com no comenzaría por el raíz, sino
directamente por el DNS de com.

Esto ya está demasiado largo, así que quedará para otra nota, un poco
más de DNS, específicamente los temas de zonas primarias y secundarias,
tipos de registros SOA, NS, A, etc. y supongo que para una tercera
parte, la integración de DNS con Active Directory.




