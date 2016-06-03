<properties
	pageTitle="Windows Server 2012: Demostración Conectando Clientes a la Red por VPN"
	description="Windows Server 2012: Demostración Conectando Clientes a la Red por VPN"
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



#Windows Server 2012: Demostración Conectando Clientes a la Red por VPN

Por **Guillermo Delprato**

[Blog](http://windowserver.wordpress.com/)

En esta demostración veremos de manera sencilla cómo podemos configurar
un Windows Server 2012 para permitir el acceso remoto a nuestra red
usando VPNs (Virtual Private Network), con un cliente Windows 8

Utilizaré para la demostración la configuración más sencilla posible a
los efectos demostrativos, reutilizando la mayor parte posible de las
máquinas que venimos utilizando para estas demos. Sólo 3 máquinas según
se detalla a continuación:

### Controlador de Dominio: dc1.root.guillermod.com.ar

    Dirección IP/Máscara: 192.168.2.201/24

    Puerta de Enlace: 192.168.2.253

    Servidor DNS: 127.0.0.1

### Servidor VPN: vpn2.root.guillermod.com.ar

    Interfaz Interna:

    Dirección IP/Máscara: 192.168.2.253/24

    Puerta de Enalce: ninguna

    Servidor DNS: 192.168.2.201 (el DC)

    Interfaz Externa:

    Dirección IP/Máscara: 192.168.222.100/24

    Puerta de Enlace: ninguna

    Servidor DNS: ninguno y configurado para que no registre interfaz

    En las propiedades de la conexión: deshabilitar todo salvo TCP/IP v4

### Cliente: cl en grupo de trabajo

Dirección IP: Automática desde un DHCP externo a la demo

En la siguiente pantalla podemos ver la configuración del servidor VPN

![] (./img/Conectando-Clientes-por-VPN/image1.png)

De la misma forma que en las demostraciones anteriores en este caso
agregaremos la funcionalidad “Remote Access” siguiendo el asiste

![] (./img/Conectando-Clientes-por-VPN/image2.png)

![] (./img/Conectando-Clientes-por-VPN/image3.png)


Podemos observar en la pantalla anterior que entre los componentes
requeridos, figura el IIS. Esto es debido a que prevee la utilización
además de VPN de DirectAccess

![] (./img/Conectando-Clientes-por-VPN/image4.png)

![] (./img/Conectando-Clientes-por-VPN/image5.png)

![] (./img/Conectando-Clientes-por-VPN/image6.png)

![] (./img/Conectando-Clientes-por-VPN/image7.png)

![] (./img/Conectando-Clientes-por-VPN/image8.png)

![] (./img/Conectando-Clientes-por-VPN/image9.png)

![] (./img/Conectando-Clientes-por-VPN/image10.png)

Y comenzamos el asistente de configuración

![] (./img/Conectando-Clientes-por-VPN/image11.png)

En esta ocasión veremos solamente la implementación de VPN, sin
DirectAccess

![] (./img/Conectando-Clientes-por-VPN/image12.png)

De esta forma abrirá la conocida consola RRAS para que ejecutemos la
configuración del servidor

![] (./img/Conectando-Clientes-por-VPN/image13.png)

No ha modificaciones respecto a versiones anteriores

![] (./img/Conectando-Clientes-por-VPN/image14.png)

![] (./img/Conectando-Clientes-por-VPN/image15.png)

![] (./img/Conectando-Clientes-por-VPN/image16.png)

Prestemos atención a seleccionar la interfaz externa, pues configurará
filtrado de paquetes permitiendo solamente los puertos necesarios para
VPNs

![] (./img/Conectando-Clientes-por-VPN/image17.png)

Como en la infraestructura no estoy utilizando DHCP, utilizaré un rango
de red

![] (./img/Conectando-Clientes-por-VPN/image18.png)

![] (./img/Conectando-Clientes-por-VPN/image19.png)

![] (./img/Conectando-Clientes-por-VPN/image20.png)

![] (./img/Conectando-Clientes-por-VPN/image21.png)

![] (./img/Conectando-Clientes-por-VPN/image22.png)

![] (./img/Conectando-Clientes-por-VPN/imag23.png)

Y ya nos queda configurado el servidor VPN

![] (./img/Conectando-Clientes-por-VPN/image24.png)

Lo que haré ahora es autorizar a un usuario para que pueda ingresar por
VPN. En este caso y por simplicidad he elegido a la cuenta
Administrator, aunque podría haber sido la de cualquier usuario

En el Controlador de Dominio, en Active Directory Users and Computers,
sobre las propiedades de la cuenta, ficha “Dial-In”

![] (./img/Conectando-Clientes-por-VPN/image25.png)

Ahora debemos hacer la conexión de VPN desde el cliente (CL2), que
aunque es Windows 8, su configuración es muy similar a los sistemas
operativos anteriores

![] (./img/Conectando-Clientes-por-VPN/image26.png)

¿Por qué Microsoft siempre supone que las VPNs se hace sólo al “lugar de
trabajo”? :)

![] (./img/Conectando-Clientes-por-VPN/image27.png)

![] (./img/Conectando-Clientes-por-VPN/image28.png)

Debemos ingresar la dirección IP de la interfaz externa del servidor VPN

![] (./img/Conectando-Clientes-por-VPN/image29.png)

Cuando le digamos que vamos a conectarnos nos abre “algo” sobre el
margen derecho

![] (./img/Conectando-Clientes-por-VPN/image30.png)

Lo seleccionamos y aparecerá la opción para conectarse

![] (./img/Conectando-Clientes-por-VPN/image31.png)

Ingresamos las credenciales

![] (./img/Conectando-Clientes-por-VPN/image32.png)

Y en pocos segundos, nos dice que está conectada

![] (./img/Conectando-Clientes-por-VPN/image33.png)

![] (./img/Conectando-Clientes-por-VPN/image34.png)

Vemos la configuración que tenemos del lado del cliente

![] (./img/Conectando-Clientes-por-VPN/image35.png)

![] (./img/Conectando-Clientes-por-VPN/image36.png)

Interesante, observen la autenticación

![] (./img/Conectando-Clientes-por-VPN/image37.png)

Verifiquemos conectividad con otro equipo de la red, en este caso DC1

![] (./img/Conectando-Clientes-por-VPN/image38.png)

![] (./img/Conectando-Clientes-por-VPN/image39.png)

La conexión del cliente también la podemos verificar desde VPN2

![] (./img/Conectando-Clientes-por-VPN/image40.png)

Finalmente desconectamos desde el cliente

![] (./img/Conectando-Clientes-por-VPN/image41.png)

![] (./img/Conectando-Clientes-por-VPN/image42.png)

Con esto hemos demostrado, la conectividad por VPN desde un cliente
Windows 8 hacia un servidor VPN Windows Server 2012.\
Permitiendo de esta forma que un cliente remoto pueda acceder a los
recursos de la red interna desde cualquier equipo con conectividad a
Internet

Algo que debemos considerar si nuestro servidor VPN estuviera detrás de
un Router o Firewall es que debemos dejar pasar PPTP, para eso debemos
desbloquear o renviar el puerto TCP-1723, y el **Protocolo** GRE (47)
