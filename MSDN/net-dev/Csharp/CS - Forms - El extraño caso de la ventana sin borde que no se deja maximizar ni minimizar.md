---
title: C# - Forms - El extraño caso de la ventana sin borde que no se deja maximizar ni minimizar
description: C# - Forms - El extraño caso de la ventana sin borde que no se deja maximizar ni minimizar
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: net-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

# C\# - Forms - El extraño caso de la ventana sin borde que no se deja maximizar ni minimizar

![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io


En algunas aplicaciones llega a ser necesario tener una ventana sin
borde en algún momento, una ventana sin borde se logra estableciendo la
propiedad FormBorderStyle = None en el diseñador de **Windows Forms** o
a través de código:

    this.FormBorderStyle = FormBorderStyle.None;

Hasta ahí todo está bien y no hay ningún problema al respecto, hasta que
nos damos cuenta que **una ventana sin borde no se deja maximizar ni
minimizar** ni siquiera por programación.

De esto tratare en este artículo, el porqué de esta situación y como
solucionarlo.

¿Cómo sabe una ventana que se debe maximizar o minimizar?
---------------------------------------------------------

#### El bucle de mensajes

Las ventanas – y los demás controles – funcionan gracias a un bucle de
mensajes, todo lo que manejamos nosotros como eventos:\
\* click del mouse \* mover \* cerrar \* cambiar tamaño \* maximizar etc

Realmente es controlado por un bucle en donde se envían diferentes
mensajes a la ventana, esta a su vez tiene un procedimiento que recibe
estos mensajes y con base a los mensajes recibidos puede hacer una u
otra cosa según se programe.

Si, para algunos esto ya debe estar sonando a cuento, pero las cosas son
así por debajo de lo que usamos tradicionalmente.

El tema del artículo no es explicar como funciona un ciclo de mensajes
así que por el momento lo dejaremos hasta allí y quien quiera
profundizar puede consultar esta fuente en internet
http://www.winprog.org/tutorial/message\_loop.html

Por el momento lo que si nos interesa del bucle de mensajes es que
algunos de esos mensajes se utilizan para maximizar y minimizar las
ventanas, es decir cuando uno utiliza alguna funcionalidad para
minimizar una ventana, lo que ocurre realmente es que se envía el
mensaje que dice: hey! minimízate y ya el manejador de la ventana hará
lo necesario para minimizarse.

#### El problema de la ventana sin borde.

Resulta que cuando se crea una ventana el sistema de ventanas se encarga
de asignar ciertas características de acuerdo a sus parámetros de
creación, una de esas características es incluir llamados a las
funciones internas de Windows Forms que minimizan y maximizan ventanas,
pero cuando se esta creando una ventana sin borde, al no tener esta los
botones de minimizar o maximizar, simplemente se pasa por alto la
necesidad de incluir llamados a esas funciones.

Tan es así que las ventanas sin borde ni siquiera reciben mensajes
relacionados con maximizar y minimizar desde la barra de tareas de
Windows, esto lo podemos verificar así:

* Crear una ventana con borde en el diseñador

* Sobre escribir el método WndProc (que es el que procesa la cadena de
mensajes enviados a la ventana)

* Interceptar el mensaje de minimizar la ventana y lanzar un MessageBox

Lo que sucederá es que el mensaje se mostrará, pero si creamos desde un
comienzo la ventana como ventana sin borde nos daremos cuenta que el
mensaje nunca se lanza puesto que la ventana nunca recibe el mensaje
indicando que se minimize, y aunque lo recibiera no haría nada.

Este es el código de como se debe dejar el WndProc para hacer **la
prueba** con y sin borde.



    const int WM_SYSCOMMAND = 0x112;
    const int SC_MINIMIZE = 0xF020;

    protected override void WndProc(ref Message m)
    {
        if (m.Msg == WM_SYSCOMMAND)
        {
            if (m.WParam == (IntPtr)SC_MINIMIZE)
                MessageBox.Show"Hacer lo que quieras en vez de minimizar");
            base.WndProc(ref m);
        }
        else
            base.WndProc(ref m);
    }

Esto se convierte en un problema, ¿pero como hacer para solucionarlo?

Cambiar el comportamiento de la ventana
---------------------------------------

¿Cómo deshacernos de este problema y poder minimizar la ventana sin
borde?

La respuesta esta escondida en mis líneas anteriores:

**Resulta que cuando se crea una ventana el sistema de ventanas se encarga
de asignar ciertas características de acuerdo a sus parámetros de
creación**

Técnicamente hablando podríamos crear una ventana con borde y una vez
inicializada cambiarle el estilo para que ahora estando sin borde se
deje minimizar…

**ERROR** eso no es posible porque apenas cambiamos el estilo de la
ventana se llama una rutina que inicializa toda su estructura
nuevamente… y al hacerlo elimina de nuevo la funcionalidad de minimizar
y maximizar. :(

Para lograr hacerlo hay que hallar la forma de 'engañar' al sistema de
ventanas del Windows Forms y hacerle creer que tiene una ventana con
borde pero que realmente sea sin borde.

Es decir debemos desde el comienzo crear una ventana con borde y luego
volverla sin borde, PERO haciendo que el sistema de ventanas de Windows
Forms no se entere.

Podemos hacerlos con nuestra amiga la API de Windows haciendo llamados
directamente al manejador de ventanas del sistema operativo sin pasar
por Windows Forms.

Cuando una forma en Windows Forms es creada, esta inicializa todas sus
estructuras de acuerdo a las propiedades establecidas y esto lo hace en
un método llamado **CreateParams** que es el que internamente esta
haciendo llamados a la API, bueno realmente es una propiedad, así que si
reemplazamos esta propiedad podemos hacer creer a Windows Forms que esta
creando una ventana con bordes pero ya nos hemos encargado de quitarle
dichos bordes "a la mala".\
Los pasos a seguir son los siguientes:

* Crear la forma con el estilo normal que incluye los botones minimizar y
maximizar

* Sobre Escribir el método CreateParams

* Introducir modificaciones al estilo de la ventana pero no utilizando las
propiedades de Windows Forms sino modificando los parámetros con los
cuales Windows Forms le pedirá al sistema operativo que cree la nueva
ventana.

Todos los pasos son fáciles, el que es un poco críptico es el paso 3,
así que lo analizare en más detalle.

CreateParams
------------

Esta propiedad tiene a su vez su propia estructura, y parte de esa
estructura es el campo Style de tipo int, cuando Windows esta
inicializando la forma se revisa ese campo para determinar el estilo de
la ventana, y de hecho cada vez que modificamos el estilo de la ventana
esta recrea su apariencia modificando no solo el valor de Style sino
también modificando comportamientos como ya lo hemos visto
anteriormente.

Sin embargo desde el propio manejador de ventanas de Windows cambiar el
estilo no implica cambiar de una vez el comportamiento – como ya vimos
que si sucede en Windows Forms – así que podemos cambiar el valor de
Style sin necesidad de cambiar nada más.

Como nuestra forma justo antes de comenzar el paso 3 ya esta lista para
minimizarse y maximizarse, lo que haremos en el paso 3 será modificar la
propiedad Style de CreateParams para suprimirle 'la caja de titulo' y
'el borde de cambiar tamaño', Cómo hacemos esto si Style es un tipo int?

Pues lo haremos a través de mascaras como si fuera una enum en Windows
Forms.

He definido WS\_THICKFRAME nada más para preservar la definición inicial
que se da en la API de Windows. El código quedaría así:


    const int WS_CAPTION = 0xC00000;
    const int WS_THICKFRAME = 0x00040000;
    const int WS_SIZEBOX = WS_THICKFRAME;

    protected override CreateParams
    {
        get
        {
            CreateParams p = base.CreateParams;
            p.Style &= ~(WS_CAPTION | WS_SIZEBOX);
            return p;
        }
    }

Simplemente estamos tomando los valores originales de CreateParams los
cuales incluyen una ventana con bordes, pero reasignamos la propiedad
Style para dejarla como estaba, quitándole el borde de Resize y la barra
de titulo.

**¡Y Listo!!!**

Eso es todo, ahora la ventana no tiene bordes y adicionalmente recibe el
mensaje de minimizar, es más podemos combinar este código con el que
veíamos en la primera parte y veremos como ahora si podemos interceptar
el mensaje de minimizar ;)

Artículos relacionados
----------------------

[C\# - Cómo modificar el comportamiento del botón minimizar, maximizar,
etc.](http://juank.io/csharp-c-como-modificar-comportamiento-boton-minimizar-maximizar/)

[C\# - Forms – El extraño caso de la ventana sin borde que no se deja
cambiar de tamaño](C# - Forms – El extraño caso de la ventana sin borde que no se deja cambiar de tamaño.md)

Happy Learning!




