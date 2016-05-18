
<properties
	pageTitle="jQuery UI contextMenu. Manual de uso básico"
	description="jQuery User Interface contiene una gran cantidad de componentes y
complementos"
	services="web-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="web-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>



#jQuery UI contextMenu. Manual de uso básico

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


El *jQuery User Interface* contiene una gran cantidad de componentes y
complementos –*plug-ins*- que nos acercan a la programación de las
interfaces de usuario –menús, diálogos, calendarios, paneles, …-.

El complemento *contextMenu* es el objeto de este artículo
introductorio.

Posteriormente, continuaremos con su estudio en nuestro artículo:

**jQuery UI contextMenu. Manual de uso avanzado.**

En resumen, hablaremos de:

Qué es y qué proporciona el jQuery User Interface contextMenu.

Los componentes esenciales para su implementación en una página Web.

Un menú contextual básico asociado a un área o sección de documento
HTML.

Asignación de teclas aceleradoras –atajos del teclado-.

Establecimiento de un título para el menú emergente.

Menús con submenús.

Funciones callback, de respuesta a la selección de opciones,
personalizadas.

###¿Qué es el jQuery User Interface contextMenu?


Dentro del *jQuery User Interface* encontramos toda una serie de
elementos de programación de la interface de usuario preprogramados y
listos para ser integrados en nuestros proyectos HTML. Se trata de una
amplia biblioteca *JavaScript* que abarca desde efectos dinámicos, hasta
menús, calendarios, diálogos, etc.

El lugar de Internet de referencia y descarga del componente
*contextMenu*, que es de lo que trataremos, es:

[**http://medialize.github.io/jQuery-contextMenu/index.html**](http://medialize.github.io/jQuery-contextMenu/index.html)

[**https://github.com/medialize/jQuery-contextMenu**](https://github.com/medialize/jQuery-contextMenu)

![] (./img/jQuery-UI-contextMenu-Manual-de-uso-basico/image1.png)

Las capacidades que nos proporcionará las iremos desgranando en los
sucesivos epígrafes y artículo, a vuelapluma son:

Menú contextual asociado a un área o sección de documento HTML.

Opciones dotadas de teclas de acceso rápido –atajos de teclado-.

Menús con títulos definidos mediante estilos.

Menús con entradas de submenús en cascada.

Funciones *callback* –de respuesta- particulares para cada opción de
menú.

Entradas de menú con iconos asociados.

Apertura de menú por pase del ratón sobre ciertas zonas.

Cierre automático del menú al abandonar ciertas zonas activas.

Posibilidad de deshabilitaciones temporales.

Uso de botones radiales y casillas de verificación.

Menús definidos al estilo HTML 5.

Uso de estilos personalizados en su apariencia.

###Un primer menú contextual


Nuestro primer ejemplo no será muy ambicioso, se trata de ilustrar un
simple menú contextual, sin ninguna funcionalidad adicional.

En el Listado 1, recogemos lo que sigue:

En nuestro ejemplo se desplegará el menú al hacer clic con el botón
derecho del ratón sobre un área coloreada de fondo amarillo, que es
definida y acotada como una etiqueta &lt;div&gt; con el estilo
*context.menu*.

El selector fija el elemento –área &lt;div&gt; en nuestro caso- al que
se asociará el menú emergente.

La función *callback* es la llamada cuando se elige una opción del menú
emergente. Obsérvese que tiene dos parámetros, de especial interés es el
primero –*key*- que tiene de valor el nombre del elemento de menú
seleccionado.

Los *items* contienen las entradas de menú disponibles, en principio con
el nombre de la opción de menú –lo mismo que se pasará en *key* en la
función *callback*- y la etiqueta que se mostrará en la lista de
entradas del menú.

**Listado 1: Menú contextual básico.**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú básico&lt;/title&gt;

    &lt;link rel="stylesheet" href="jquery.contextMenu.css" /&gt;

    &lt;script
    src="http://code.jquery.com/jquery-1.9.1.js"&gt;&lt;/script&gt;

    &lt;script src="jquery.contextMenu.js"&gt;&lt;/script&gt;

    &lt;style&gt;

    .context-menu {

    width: 300px;

    height: 300px;

    background: \#ffd800;

    }

    &lt;/style&gt;

    &lt;script&gt;

    \$(function () {

    \$.contextMenu({

    selector: '.context-menu',

    callback: function (key, options) {

    var m = "Seleccionado: " + key;

    alert(m);

    },

    items: {

    "blanco": { name: "Blanco" },

    "rojo": { name: "Rojo" },

    "verde": { name: "Verde" },

    "azul": { name: "Azul" },

    "negro": { name: "Negro" },

    "sep1": "---------",

    "salir": { name: "Salir" }

    }

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-contextMenu-Manual-de-uso-basico/image2.png)

![] (./img/jQuery-UI-contextMenu-Manual-de-uso-basico/image3.png)

###Menú con teclas de acceso rápido


Es muy simple asignar teclas de acceso rápido a las opciones del menú
emergente, que serán visualizadas –como es habitual- con un subrayado.
Véase la figura adjunta.

En el Listado 2, tenemos:

El mismo menú emergente descrito en el Listado 1, que tomamos de base.

En los *items* se añade una nueva opción –denominada *accesskey*- que
son caracteres que activarán las opciones asociadas al ser pulsados.

Las teclas de acceso rápido deben ser caracteres únicos, no pueden ser
repetidos en el menú, ni siquiera en los submenús.

**Listado 2: Menú contextual con teclas de acceso rápido.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú básico con teclas de acceso
    rápido&lt;/title&gt;

    &lt;link rel="stylesheet" href="jquery.contextMenu.css" /&gt;

    &lt;script
    src="http://code.jquery.com/jquery-1.9.1.js"&gt;&lt;/script&gt;

    &lt;script src="jquery.contextMenu.js"&gt;&lt;/script&gt;

    &lt;style&gt;

    .context-menu {

    width: 300px;

    height: 300px;

    background: \#ffd800;

    }

    &lt;/style&gt;

    &lt;script&gt;

    \$(function () {

    \$.contextMenu({

    selector: '.context-menu',

    callback: function (key, options) {

    var m = "Seleccionado: " + key;

    alert(m);

    },

    items: {

    "blanco": { name: "Blanco", accesskey: "b" },

    "rojo": { name: "Rojo", accesskey: "r" },

    "verde": { name: "Verde", accesskey: "v" },

    "azul": { name: "Azul", accesskey: "a" },

    "negro": { name: "Negro", accesskey: "n" },

    "sep1": "---------",

    "salir": { name: "Salir", accesskey: "s" }

    }

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-contextMenu-Manual-de-uso-basico/image4.png)

###Adición de un título


Si nos fijamos en las figuras anteriores en la figura que sigue,
observamos una diferencia de importancia, la aparición de un título para
el menú emergente. Ese título tiene unas características definidas
mediante estilos y posteriormente registrado como tal, veamos cómo es
todo ello.

En el Listado 3, tenemos:

El mismo menú emergente descrito en el Listado 2, que tomamos de base.

Obsérvese la definición de estilos necesarios para el título de cabecera
del menú:

*data-title:before*

*data-title:first-child*

Hemos de adjuntar y registrar el título, mediante el atributo
*data-menutitle*, véase hacia el final del &lt;script&gt;.

**Listado 3: Adición de un título al menú contextual.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú básico con teclas de acceso
    rápido y título&lt;/title&gt;

    &lt;link rel="stylesheet" href="jquery.contextMenu.css" /&gt;

    &lt;script
    src="http://code.jquery.com/jquery-1.9.1.js"&gt;&lt;/script&gt;

    &lt;script src="jquery.contextMenu.js"&gt;&lt;/script&gt;

    &lt;style&gt;

    .context-menu {

    width: 300px;

    height: 300px;

    background: \#ffd800;

    }

    .data-title:before {

    content: attr(data-menutitle);

    display: block;

    position: absolute;

    top: 0;

    right: 0;

    left: 0;

    background: \#DDD;

    padding: 2px;

    font-family: Verdana, Arial, Helvetica, sans-serif;

    font-size: 11px;

    font-weight: bold;

    }

    .data-title :first-child {

    margin-top: 20px;

    }

    &lt;/style&gt;

    &lt;script&gt;

    \$(function () {

    \$.contextMenu({

    selector: '.context-menu',

    className: 'data-title',

    callback: function (key, options) {

    var m = "Seleccionado: " + key;

    alert(m);

    },

    items: {

    "blanco": { name: "Blanco", accesskey: "b" },

    "rojo": { name: "Rojo", accesskey: "r" },

    "verde": { name: "Verde", accesskey: "v" },

    "azul": { name: "Azul", accesskey: "a" },

    "negro": { name: "Negro", accesskey: "n" },

    "sep1": "---------",

    "salir": { name: "Salir", accesskey: "s" }

    }

    });

    // Registro del título

    \$('.data-title').attr('data-menutitle', "Selección de color");

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

![] (./img/jQuery-UI-contextMenu-Manual-de-uso-basico/image5.png)

###Menú contextual con submenús


La organización en submenús es una simple labor de anidamiento de
*ítems*, tal como se muestra en el Listado 4 –véase el comportamiento en
la figura que sigue-, el código en concreto es:

Un menú emergente similar al descrito en el Listado 1, que tomamos de
base.

Observe que para crear un submenú se parte de una opción de menú normal,
en la que se define su nombre y un nuevo grupo de *ítems*.

El cierre de un submenú es simplemente el cierre de la opción de la
secuencia de *ítems*.

**Listado 4: Menú contextual con submenús.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú básico con
    submenús&lt;/title&gt;

    &lt;link rel="stylesheet" href="jquery.contextMenu.css" /&gt;

    &lt;script
    src="http://code.jquery.com/jquery-1.9.1.js"&gt;&lt;/script&gt;

    &lt;script src="jquery.contextMenu.js"&gt;&lt;/script&gt;

    &lt;style&gt;

    .context-menu {

    width: 300px;

    height: 300px;

    background: \#ffd800;

    }

    &lt;/style&gt;

    &lt;script&gt;

    \$(function () {

    \$.contextMenu({

    selector: '.context-menu',

    callback: function (key, options) {

    var m = "Seleccionado: " + key;

    alert(m);

    },

    items: {

    "blanco": { name: "Blanco" },

    "sub1": {

    name: "RGB",

    items: {

    "rojo": { name: "Rojo" },

    "verde": { name: "Verde" },

    "azul": { name: "Azul" }

    }

    },

    "negro": { name: "Negro" },

    "sep1": "---------",

    "salir": { name: "Salir" }

    }

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-contextMenu-Manual-de-uso-basico/image6.png)

###Menú con funciones callback particularizadas


Hasta el presente –recuérdese lo comentado al respecto del Listado 1-,
teníamos una única función *callback* de respuesta, que se ejecutaba al
seleccionar cualquiera de las opciones de menú. En ella, mediante el
parámetro *key*, podíamos saber cuál de ellas había sido elegida y
actuar en consonancia.

Pero es más simple y claro poder asociar funciones *callback*
particulares para cada opción de menú y así codificar respuestas de
manera más sencilla y directa. Eso es lo que hemos implementado en
nuestro siguiente ejemplo.

En el Listado 5, tenemos:

El mismo menú emergente descrito en el Listado 3, que tomamos de base.

Cada opción de menú –cada *ítem*- consta de una además de su nombre y su
tecla de acceso rápido de una tercera entrada, la función *callback*.

Nótese que a diferencia de la función *callback* general –véase el
Listado 1 y posteriores hasta el presente- no contiene parámetros.

Aquí incluiremos la respuesta al evento de selección de la opción
actual, en nuestro caso, cambiar el color de fondo de la ventana del
explorador. Excepto la función asociada a la opción *Salir*, que
devuelve *true*, sin más.

**Listado 5: Menú con título, teclas de acceso rápido y funciones
    callback particularizadas**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú básico con teclas de acceso
    rápido, título y callback particularizado&lt;/title&gt;

    &lt;link rel="stylesheet" href="jquery.contextMenu.css" /&gt;

    &lt;script
    src="http://code.jquery.com/jquery-1.9.1.js"&gt;&lt;/script&gt;

    &lt;script src="jquery.contextMenu.js"&gt;&lt;/script&gt;

    &lt;style&gt;

    .context-menu {

    width: 300px;

    height: 300px;

    background: \#ffd800;

    }

    .data-title:before {

    content: attr(data-menutitle);

    display: block;

    position: absolute;

    top: 0;

    right: 0;

    left: 0;

    background: \#DDD;

    padding: 2px;

    font-family: Verdana, Arial, Helvetica, sans-serif;

    font-size: 11px;

    font-weight: bold;

    }

    .data-title :first-child {

    margin-top: 20px;

    }

    &lt;/style&gt;

    &lt;script&gt;

    \$(function () {

    \$.contextMenu({

    selector: '.context-menu',

    className: 'data-title',

    items: {

    "blanco": {

    name: "Blanco", accesskey: "b",

    callback: function () {

    document.bgColor = "\#ffffff";

    }

    },

    "rojo": {

    name: "Rojo", accesskey: "r",

    callback: function () {

    document.bgColor = "\#ff0000";

    }

    },

    "verde": {

    name: "Verde", accesskey: "v",

    callback: function () {

    document.bgColor = "\#00ff00";

    }

    },

    "azul": {

    name: "Azul", accesskey: "a",

    callback: function () {

    document.bgColor = "\#0000ff";

    }

    },

    "negro": {

    name: "Negro", accesskey: "n",

    callback: function () {

    document.bgColor = "\#000000";

    }

    },

    "sep1": "---------",

    "salir": {

    name: "Salir", accesskey: "s",

    callback: function () {

    return true;

    }

    }

    }

    });

    // Registro del título

    \$('.data-title').attr('data-menutitle', "Selección de color");

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-contextMenu-Manual-de-uso-basico/image7.png)

###Conclusiones


En el presente artículo hemos repasado muchas de las funcionalidades del
componente *jQuery User Interface contextMenu*. Con ellas creemos se
está en condiciones de implementar un sistema de menú contextual
completo, con atajos de teclado y funciones de respuesta complejas, con
un mínimo de codificación.

Esperamos que todo lo expuesto les haya servido de ayuda. Hasta nuestro
próximo artículo, felices horas de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
