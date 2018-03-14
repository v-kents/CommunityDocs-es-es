---
redirect_url: https://docs.microsoft.com/
title: ¿Qué es el bucle de mensajes, message loop o WndProc?
description: ¿Qué es el bucle de mensajes, message loop o WndProc?
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#¿Qué es el bucle de mensajes, message loop o WndProc?

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io

Las ventanas – y los demás controles – funcionan gracias a un bucle de
mensajes, todo lo que manejamos nosotros como eventos: click del mouse,
mover, cerrar, cambiar tamaño, maximizar etc, realmente es controlado
por un bucle en donde se envían diferentes mensajes a la ventana, esta a
su vez tiene un procedimiento que recibe estos mensajes y con base a los
mensajes recibidos puede hacer una u otra cosa según se programe.

Los mensajes no son sino números, cada número representa un mensaje
diferente, en la API de Windows solemos encontrarnos cosas cómo:

    \#define WM\_INITDIALOG 0x0110 
    \#define WM\_COMMAND 0x0111 
    \#defineWM\_LBUTTONDOWN 0x0201

En C\# escribiriamos algo así

    public enum NotifyType { 
      NOTIFY\_FOR\_THIS\_SESSION = 0, NOTIFY\_FOR\_ALL\_SESSIONS = 1 
    }

Ese gran bucle en Windows es llamado **WndProc**, todo sistema de
ventanas en cualquier sistema operativo funciona de forma similar, con
otro nombre o estilo desde luego, pero su propósito es el mismo.

Si, para algunos esto ya debe estar sonando a cuento, pero las cosas son
así por debajo de lo que usamos tradicionalmente. El tema del artículo
no es explicar cómo funciona un ciclo de mensajes así que por el momento
lo dejaremos hasta allí y quien quiera profundizar puede consultar esta
fuente en internet:

<http://www.winprog.org/tutorial/message_loop.html>




