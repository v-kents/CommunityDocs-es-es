---
title: C# – Win32SessionChangesNotifier librería para recibir notificaciones de cambios de sesión
description: C# – Win32SessionChangesNotifier librería para recibir notificaciones de cambios de sesión
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: net-dev
ms.custom: CommunityDocs
---






# C\# – Win32SessionChangesNotifier librería para recibir notificaciones de cambios de sesión

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io


A veces necesitamos que nuestro software audite ciertos eventos
generados por el equipo, como por ejemplo cuando se abren o cierran
sesiones. Esto es importante por ejemplo para disparar procesos pesados
cuando el computador no esté en uso o para realizar procesos de
auditoria.

Lecturas recomendadas
---------------------

[WPF - Recibir notificaciones cuando hay cambios de sesión](http://juank.io/wpf-recibir-notificaciones-cuando-hay-cambios-de-sesion/)

[Forms - Recibir notificaciones cuando hay cambios de sesión](http://juank.io/forms-recibir-notificaciones-cuando-cambios-sesion/)

Como es de suponerse el .Net Framework no trae nada que nos apoye en esa
tarea ya que está profundamente relacionada con el sistema operativo y
ya que el CLR es multiplataforma este tipo de cosas no vienen
soportadas. Se debe hacer uso del Api de Windows.

En este artículo explicaré como he creado esta librería que permite ser
notificado cuando suceden estos eventos bien sea en la sesión actual o a
través de las diferentes sesiones iniciadas en el sistema.

La librería puede ser utilizada desde cualquier programa win32.

Preparación
-----------

Las cosas que necesitamos de la API de Windows para realizar esta labor
se describen a continuación

Funciones
---------

**WTSRegisterSessionNotification** : Registra una ventana para recibir
mensajes de cambios en la sesión

**WTSUnRegisterSessionNotification** : Elimina el registro de una
ventana para que deje de recibir mensajes de cambios en la sesión

Constantes para llamar a WTSRegisterSessionNotification
-------------------------------------------------------

**NOTIFY\_FOR\_THIS\_SESSION**: Notifica eventos de la sesión actual

**NOTIFY\_FOR\_ALL\_SESSIONS**: Notifica eventos de todas las sesiones
del sistema

Constantes relacionadas con las notificaciones
----------------------------------------------

**WM\_WTSSESSION\_CHANGE**: Mensaje generado cuando suceden los eventos
de cambios en la sesión

Parámetros:

*WTS\_CONSOLE\_CONNECT*: Una sesión se ha conectado por terminal de
consola.

*WTS\_CONSOLE\_DISCONNECT*: Una sesión se ha desconectado por terminal
de consola.

*WTS\_REMOTE\_CONNECT*: Una sesión se ha conectado por una terminal
remota.

*WTS\_REMOTE\_DISCONNECT*: Una sesión de terminal remota se ha
desconectado.

*WTS\_SESSION\_LOGON*: Un usuario se ha logueado en la sesión.

*WTS\_SESSION\_LOGOFF*: Un usuario se ha deslogueado de la sesión

*WTS\_SESSION\_LOCK*: Una sesión se ha bloqueado.

*WTS\_SESSION\_UNLOCK*: Una sesión se ha desbloqueado.

*WTS\_SESSION\_REMOTE\_CONTROL*: Una sesión ha cambiado su estado de
control remoto. Para determinar el estado se debe hacer uso de
**GetSystemMetrics** y revisar la métrica **SM\_REMOTECONTROL**.

LETS CODE!
----------

Creamos una clase para centralizar los llamados a la API, allí con ayuda
de **DllImport** importamos las funciones que requerimos y definimos
todas las constantes necesarias, de preferencia agrupadas en enums:



    /// <summary>;Notificaciones a recibir</summary>;
    public enum NotifyType
    {
        /// <summary>;Notificacion para la sesion
        actual</summary>;
        NOTIFY_FOR_THIS_SESSION = 0,
        /// <summary>;Notificacion para todas las sesiones del
        sistema</summary>;
        NOTIFY_FOR_ALL_SESSIONS = 1
    }

    /// <summary>;Tipo de notificacion recibida</summary>;
    public enum SessionNotificationMsg
    {
        /// <summary>;Una sesión se ha conectado por terminal de consola.</summary>;
        WTS_CONSOLE_CONNECT = 0x1,
        /// <summary>;Una sesión se ha desconectado por terminal de consola.</summary>;
        WTS_CONSOLE_DISCONNECT = 0x2,
        /// <summary>;Una sesión se ha conectado por una terminal remota.</summary>;
        WTS_REMOTE_CONNECT = 0x3,
        /// <summary>;Una sesión de terminal remota se ha desconectado.</summary>;
        WTS_REMOTE_DISCONNECT = 0x4,
        /// <summary>;Un usuario se ha logueado en la sesión.</summary>;
        WTS_SESSION_LOGON = 0x5,
        /// <summary>;Un usuario se ha deslogueado de la sesión.</summary>;
        WTS_SESSION_LOGOFF = 0x6,
        /// <summary>;Una sesión se ha bloqueado.</summary>;
        WTS_SESSION_LOCK = 0x7,
        /// <summary>;Una sesión se ha desbloqueado.</summary>;
        WTS_SESSION_UNLOCK = 0x8,
        /// <summary>;Una sesión ha cambiado su estado de
        control remoto. Par determinar el estado se debe hacer uso de GetSystemMetrics y revisar la métrica SM_REMOTECONTROL.</summary>;
        WTS_SESSION_REMOTE_CONTROL = 0x9
    }

Ahora la clase para manejar la W32API


    using System;
    using System.Runtime.InteropServices;
    public static class W32HandleSessionChanges
    {
        /// <summary>;
        /// Registra una ventana para recibir notificaciones de cambios en las sesiones
        /// </summary>;
        /// <param name="hWnd">;Manejador de la ventana</param>;
        /// <param name="dwFlags">;Modificadores
        /// <remarks>;NOTIFY_FOR_THIS_SESSION,
        NOTIFY_FOR_ALL_SESSIONS</remarks>;
        /// </param>;
        /// <returns>;</returns>;
        [DllImport("wtsapi32.dll", SetLastError = true)]
        public static extern bool WTSRegisterSessionNotification(IntPtr hWnd, NotifyType dwFlags);
        
        /// <summary>;
        /// Des Registra una ventana que recibe notificaciones de cambios en las sesiones
        /// </summary>;
        /// <param name="hWnd">;Manejador de la ventana</param>;
        /// <returns>;</returns>;
        [DllImport("wtsapi32.dll", SetLastError = true)]
        public static extern bool WTSUnRegisterSessionNotification(IntPtr hWnd);
        
        /// <summary>;Mensaje recibido cuando hay cambios en las
        sesiones</summary>;
        public const int WM_WTSSESSION_CHANGE = 0x2b1;
    }

Para usarla basta con hacer uso del método
**W32HandleSessionChanges.WTSRegisterSessionNotification**, el parámetro
**hWnd** es el manejador de la ventana donde queremos recibir la
notificaciones, esto nos permite registrar la ventana actual para
recibir este tipo de mensajes, así que una vez hecho esto se deben
interceptar los mensajes para hacer lo que necesitemos.

Una vez se valla a cerrar nuestro programa siempre es conveniente llamar
a **WTSUnRegisterSessionNotification**

La librería que he creado se puede usar en diferentes tipos de
aplicación para comenzar a recibir notificaciones de cambios de sesión.

Descárgalo
----------

Puedes descargar esta librería y de paso revisar un par de soluciones de
ejemplo para Windows Forms y WPF desde mi GitHub: Win32 Session Changes
Notifier


