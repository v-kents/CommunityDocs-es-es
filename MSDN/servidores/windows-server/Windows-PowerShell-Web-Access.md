<properties
	pageTitle="Windows Server 2012 – Windows PowerShell Web Access"
	description="Windows Server 2012 – Windows PowerShell Web Access"
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


#Windows Server 2012 – Windows PowerShell Web Access

Por **Jair Gomez Arias**

Hola a tod@s mis estimados lectores, seguimos maravillados por cada una
de las nuevas funcionalidades que hemos ido viendo sobre Windows Server
2012 y no es para nada pero este nuevo S.O servidor de Microsoft esta
súper Waooo!!.

Entonces, para seguir en este camino de conocer cada una de esas
características nuevas, continuaremos con una llamada Windows PowerShell
Web Access y en los siguientes artículos vamos a hablar de su
instalación y configuración.

Windows PowerShell Web Access es una característica nueva en Windows
Server 2012 que actúa como puerta de entrada a Windows PowerShell, esto
nos ofrece a nosotros los administradores un acceso en la gestión y
operatividad de nuestros servidores desde PowerShell pero desde una
consola Web, con esto podemos ejecutar comandos, scripts de PS desde un
navegador, sin que esté instalado PowerShell en el dispositivo en el
cual estamos.

Entre los dispositivos que podemos utilizar esta gran característica de
administración se encuentran ordenadores portátiles, Tablets,
ordenadores que no ejecutan S.O Windows y Celulares. Con esto los
profesionales de TI podemos realizar nuestras tareas criticas de
administración en servidores remotos basados en Windows desde
dispositivos que tienen conexión a internet y un navegador Web.

![] (./img/Windows-PowerShell-Web-Access/image1.png)

###Los Requisitos


### Servidor

Entre los requisitos para poder instalar y configurar Windows
- PowerShell Web Access se encuentran:
- Servidor Web IIS
- .Net Framework 4.5
- Windows PowerShell 3.0

Todas estas vienen nativas en Windows Server 2012

### Navegadores 

Windows PowerShell Web Access tiene soporte para los siguientes
navegadores Web, también como muchos navegadores web móviles no están
soportados, si pueden ejecutar perfectamente la consola Web debido a las
características que incorporan tales como la aceptación de Cookies,
ejecución de JavaScript y sitios seguros HTTPS

### Navegadores soportados en ordenadores de escritorio

Windows Internet Explorer de Microsoft Windows 8.0, 9.0 y 10.0

- Mozilla Firefox 10.0.2 Mozilla Firefox 10.0.2

- Google Chrome 17.0.963.56m for Windows Google Chrome para Windows
    17.0.963.56m

- Apple Safari 5.1.2 for Windows Apple Safari 5.1.2 para Windows

- Apple Safari 5.1.2 for Mac OS Apple Safari 5.1.2 para Mac OS

### Dispositivos y navegadores móviles

Windows Phone 7 y 7,5

- Google Android WebKit 3.1 Browser Android 2.2.1 (KeAndroid de Google
    Webkit Browser 3.1 para Android 2.2.1 (kernel 2.6)
- Apple Safari for iPhone operating system Apple Safari para el
    sistema operativo del iPhone 5.0.1
- Apple Safari for iPad 2 operating system 5 Apple Safari para el
    sistema operativo del iPad 2 5.0.1

### Instalación

La instalación esta soportada de dos formas: La instalación desde el
asistente de agregar roles y características en el Server Manager o
desde la instalación de la Feature desde cmdlets con PowerShell

### Configuración

Toda la configuración y puesta en marcha de la característica se realiza
mediante PowerShell tales como la creación de certificados Web, la
configuración de la Aplicación y la creación de permisos a los usuarios
que podrán acceder a la consola Web de PowerShell.

Todo esto lo estaremos realizando en el próximo post para poder explotar
esta característica y así conocer como Windows PowerShell Web Access es
una herramienta eficaz y cómoda a la hora de administrar servidores
remotos atreves de un navegador.

Espero les sea de mucha ayuda y nos leemos, Un Saludo
