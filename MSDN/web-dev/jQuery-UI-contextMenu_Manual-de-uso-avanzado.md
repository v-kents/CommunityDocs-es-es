<properties
	pageTitle="jQuery UI contextMenu. Manual de uso avanzado"
	description="Dedicado al complemento contextMenu y agrega información "
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



#jQuery UI contextMenu. Manual de uso avanzado

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  



Este artículo está dedicado al complemento *contextMenu* y agrega
información a la dada en nuestro anterior trabajo:

[**jQuery UI contextMenu. Manual de uso
básico.**](https://msdn.microsoft.com/es-es/library/dn932544.aspx)

En el presente artículo hablaremos de:

Inclusión de iconos decorativos en las opciones del menú.

Cómo desplegar automáticamente el menú contextual, al pasar sobre cierta
área del documento HTML.

Cómo, de manera inversa, plegarlo al abandonarla.

La posibilidad de deshabilitar y rehabilitar el menú contextual.

Utilizar botones radiales –en grupos- para selección de opciones
autoexcluyentes.

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

![] (./img/jQuery-UI-contextMenu_Manual-de-uso-avanzado/image1.png)

Las capacidades que nos proporcionará las iremos desgranando en los
sucesivos epígrafes y en el anterior artículo citado, a vuelapluma son:

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

###Inclusión de iconos en las opciones


Además de acompañarse de atajos de teclado –algo de interés funcional-
es bastante habitual que las entradas de menú se vean adornadas por
iconos alusivos a su función – algo de interés visual-. Eso es factible
de hacerse en los menús contextuales con los que hemos estado trabajando
y seguiremos haciéndolo en el presente artículo.

Se trata de una cuestión de estilos, asignando las propiedades
correspondientes en la etiqueta &lt;style&gt; del documento HTML. Además
hemos de especificar la existencia de iconos durante la creación del
menú contextual.

Se han utilizado para los iconos archivos PNG de 16x16 pixeles. Ese es
un tamaño ideal para cualquier icono que deseemos incluir, pero podrían
probarse tamaños similares y ver su aspecto en pantalla.

A la vista del código contenido en el Listado 1, con respecto a los
menús contextuales básicos se diferencia en:

Definimos los estilos correspondientes a los diversos iconos. Nótese la
sintaxis de los nombres de los estilos que definen los iconos y el modo
de referenciar el archivo que los contiene.

En el constructor del menú tenemos una nueva propiedad **icon** en el
apartado **ítems**. Allí referenciamos el icono correspondiente a cada
opción que lleve uno asociado.

Obsérvese que el nombre de la propiedad coincide con la última porción
del nombre del estilo definido, para el icono, en el apartado de estilos
del documento HTML.

**Listado 1: Inclusión de iconos en las opciones del menú contextual**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú básico con teclas de acceso
    rápido, título e iconos&lt;/title&gt;

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

    .context-menu-item.icon-blanco { background-image:
    url(images/blanco.png); }

    .context-menu-item.icon-rojo { background-image:
    url(images/rojo.png); }

    .context-menu-item.icon-verde { background-image:
    url(images/verde.png); }

    .context-menu-item.icon-azul { background-image:
    url(images/azul.png); }

    .context-menu-item.icon-negro { background-image:
    url(images/negro.png); }

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

    "blanco": { name: "Blanco", accesskey: "b", icon: "blanco" },

    "rojo": { name: "Rojo", accesskey: "r", icon: "rojo" },

    "verde": { name: "Verde", accesskey: "v", icon: "verde" },

    "azul": { name: "Azul", accesskey: "a", icon: "azul" },

    "negro": { name: "Negro", accesskey: "n", icon: "negro" },

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

![] (./img/jQuery-UI-contextMenu_Manual-de-uso-avanzado/image2.png)

###Menú Hover activated


Cuando nos interese podremos forzar la apertura automática del menú
emergente, es lo que se denomina un menú *hover activated*. Se activará
al pasar el puntero del ratón sobre un área específica del documento
HTML, desplegándose.

En nuestro siguiente ejemplo, por tanto, modificaremos el modo de
apertura de anteriores ejemplos, de manera que se producirá no al pulsar
el botón derecho del ratón sobre el área activa, sino que se abrirá al
pasar el puntero del ratón sobre ella.

Si nos fijamos en el Listado 2, con respecto a los menús contextuales
básicos, el código se diferencia en:

Simplemente hay que definir el menú contextual como *hover activated*.

Hemos de incluir en la creación del menú el apartado **trigger** y
asignarle el valor **hover**.

Adicionalmente incluimos el apartado **delay** y le asignamos un valor
en milisegundos, para asegurarnos que la entrada en el área activa y la
apertura tienen un cierto retraso y no se producirá en el mismo borde.

**Listado 2: Menú contextual hover activated –desplegado automáticamente sobre un área del documento HTML**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú 'Hover
    activated'&lt;/title&gt;

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

    trigger: 'hover',

    delay: 500,

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

###Cierre automático del menú Hover activated (autoocultación)


Seguiremos con el caso de un menú emergente, que se autoactivará al
entrar el puntero del ratón en una región dada del documento HTML, como
antes. En esta oportunidad, además, se ocultará, también
automáticamente, cuando el puntero del ratón abandone esa área
especificada para el despliegue del menú contextual.

Si lo comparamos con el código del ejemplo anterior, el Listado 3 se
diferencia exclusivamente en que:

En la creación, incluimos el apartado **autoHide** y lo fijamos en
**true**.

**Listado 3: Apertura y cierre automático hover activated**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú 'Hover activated' con
    autoocultación&lt;/title&gt;

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

    trigger: 'hover',

    delay: 500,

    autoHide: true,

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

Deshabilitaciones del menú
--------------------------

En ocasiones necesitaremos habilitar y deshabilitar el menú emergente a
demanda, de modo que sólo se despliegue cuando lo deseemos. Se trata sin
más de crear una función que actúe de permutador de la propiedad
correspondiente al, por ejemplo, pulsar un botón o cualquier otro suceso
de nuestra elección.

Lo codificado para ello se recoge en el ejemplo del Listado 4, que en
resumen consta de:

Programamos un menú contextual estándar con su título, opciones y
función de respuesta correspondiente.

Insertamos en el documento HTML un botón de comando que nos permite
habilitar el menú contextual.

A la par, en el área de activación del menú contextual, si deseamos que
inicialmente éste se encuentre deshabilitado, se asignamos la clase
*context-menu-disabled*.

Programamos la función de respuesta a hacer clic sobre el botón de
comando, de manera que permute la habilitación del menú contextual y el
texto mostrado en su etiqueta. Así el botón de comando pasará a tener la
capacidad de deshabilitarlo y así sucesivamente.

**Listado 4: Deshabilitar y rehabilitar el menú a demanda**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú con habilitación y
    deshabilitación&lt;/title&gt;

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

    \$('\#toggle-disabled').on('click', function (e) {

    e.preventDefault();

    var \$this = \$(this),

    \$trigger = \$('.context-menu');

    if (\$trigger.hasClass('context-menu-disabled')) {

    \$this.text("Disable Menu");

    \$trigger.contextMenu(true);

    } else {

    \$this.text("Enable Menu");

    \$trigger.contextMenu(false);

    }

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu context-menu-disabled"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;button id="toggle-disabled" type="button"&gt;Enable
    Menu&lt;/button&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-contextMenu_Manual-de-uso-avanzado/image3.png)

![] (./img/jQuery-UI-contextMenu_Manual-de-uso-avanzado/image4.png)

###Menú con botones radiales


En ocasiones nos interesará hacer explícitas las opciones de entrada en
formato de botones radiales –en grupos autoexcluyentes-. Nuestro ejemplo
se trata de eso, aunque corto y no del todo completo, ya que no recuerda
la opción elegida en sucesivas aperturas del menú, por motivos de
claridad y simplicidad del código.

También es posible que en vez de botones radiales sean casillas de
verificación, sin más que especificar *checkbox* en vez de *radio* en el
apartado *type*. No hemos desarrollado el ejemplo de menú con casillas
de verificación, dado que las opciones que programamos son excluyentes y
eso se adapta a botones radiales.

Para ver otros tipos de entradas posibles, además de botones radiales,
como las casillas de verificación, puede observar un ejemplo y su código
en:

[**http://medialize.github.io/jQuery-contextMenu/demo/input.html**](http://medialize.github.io/jQuery-contextMenu/demo/input.html)

Lo codificado para nuestro caso se recoge en el ejemplo del Listado 5,
que en resumen consta de:

Programamos un menú contextual estándar con opciones en forma de botones
radiales y entradas normales y función de respuesta correspondiente,
pero en esta ocasión ejecutada como una opción de menú y particularizada
para la selección anterior de un botón radial.

Cada entrada de botón radial se define con cuatro propiedades:

*name*: Nombre a mostrar en la entrada de opción de menú.

*type*: Tipo de entrada, en nuestro caso un botón radial –radio-.

*radio*: Grupo de botones radiales de pertenencia –agrupación de botones
que actúan de forma conjunta y autoexcluyente-.

*value*: Valor asociado a dicho botón radial; en nuestro caso se tratará
de un valor de color de fondo.

La entrada de menú **Aplicar** repasará si hay algún botón radial
seleccionado y recabará cuál es su propiedad valor –*value*-, de manera
que establecerá el color de fondo del documento con dicho valor.

La entrada de menú **Salir**, sin más, abandona el menú contextual y lo
cierra.

**Listado 5: Menú con selección de opciones que contienen botones radiales**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú con botones
    radiales&lt;/title&gt;

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

    items: {

    // &lt;input type="radio"&gt;

    "radio1": {

    name: "Blanco",

    type: 'radio',

    radio: 'radio',

    value: '\#ffffff',

    },

    "radio2": {

    name: "Rojo",

    type: 'radio',

    radio: 'radio',

    value: '\#ff0000',

    },

    "radio3": {

    name: "Verde",

    type: 'radio',

    radio: 'radio',

    value: '\#00ff00',

    selected: true

    },

    "radio4": {

    name: "Azul",

    type: 'radio',

    radio: 'radio',

    value: '\#0000ff'

    },

    "radio5": {

    name: "Negro",

    type: 'radio',

    radio: 'radio',

    value: '\#000000'

    },

    "sep1": "---------",

    "Aplicar": {

    name: "Aplicar",

    callback: function (key, opt) {

    \$.each(opt.inputs, function (key, item) {

    switch (item.type) {

    case 'select':

    case 'radio':

    if (item.\$input.prop('checked')) { document.bgColor = item.value; }

    break;

    }

    });

    return true;

    }

    },

    "sep2": "--------",

    "Salir": {

    name: "Salir",

    callback: function () { return true;}

    }

    },

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

![] (./img/jQuery-UI-contextMenu_Manual-de-uso-avanzado/image5.png)

###Conclusiones


En el presente artículo hemos repasado funcionalidades más avanzadas del
componente *jQuery User Interface contextMenu*. Con ellas creemos se
está en condiciones de implementar mejoras tanto en su comportamiento,
como en su apariencia de interfaz de usuario; todo ello, con un mínimo
de codificación.

Esperamos que todo lo expuesto les haya servido de ayuda. Hasta nuestro
próximo artículo, felices horas de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
