<properties
	pageTitle="jQuery UI contextMenu. Apéndice HTML 5. Personalización"
	description="Este artículo está dedicado al complemento contextMenu y agrega
información"
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


#jQuery UI contextMenu. Apéndice HTML 5. Personalización

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:** <span id="webProfileURL"
class="anchor"></span>***es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*
**

Este artículo está dedicado al complemento *contextMenu* y agrega
información a la dada en nuestros anteriores trabajos:

[**jQuery UI contextMenu. Manual de uso
básico.**](https://msdn.microsoft.com/es-es/library/dn932544.aspx)

[**jQuery UI contextMenu. Manual de uso
avanzado.**](https://msdn.microsoft.com/es-es/library/dn954227.aspx)

En el presente artículo hablaremos de:

Menú básico definido al estilo HTML 5*.*

Menú básico con submenús definido al estilo HTML 5*.*

Menú definido al estilo HTML 5 con título*.*

Aplicación de apertura automática al pasar sobre una zona activa –*Hover
activated*-.

Aplicación de cierre automático –autoocultación-.

Aplicación de estilos personalizados.

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

![] (./img/jQuery-UI-contextMenu_Personalizaci-n/image1.png)

Las capacidades que nos proporcionará las iremos desgranando en los
sucesivos epígrafes y en los anteriores artículos citados, a vuelapluma
son:

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

###Menú definido al estilo HTML 5

En el Listado 1 recogemos lo que sigue:

En nuestro ejemplo se desplegará el menú al hacer clic con el botón
derecho del ratón sobre un área coloreada de fondo amarillo, que es
definida y acotada como una etiqueta &lt;div&gt; con el estilo
*context-menu*.

El selector fija el elemento –área &lt;div&gt; en nuestro caso- al que
se asociará el menú emergente.

Los *items* contienen las entradas de menú disponibles, en principio con
el nombre de la etiqueta que se mostrará en la lista de entradas del
menú.

Obsérvese la definición del menú, mediante etiquetas &lt;command&gt;
para las opciones, con su función de respuesta al hacer clic sobre cada
una de ellas.

El propio menú HTML5 es definido del tipo *context* y se dija un estilo
de *display* igual a *none*.

**Listado 1: Menú ejemplo definido al estilo HTML 5, con funciones de
    respuesta para cada opción.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú definido al estilo
    HTML5&lt;/title&gt;

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

    items: \$.contextMenu.fromMenu(\$('\#html5menu'))

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;menu class="showcase" id="html5menu" type="context"
    style="display: none;"&gt;

    &lt;command onclick="document.bgColor = '\#ffffff'" label="Blanco"
    /&gt;

    &lt;command onclick="document.bgColor = '\#ff0000'" label="Rojo"
    /&gt;

    &lt;command onclick="document.bgColor = '\#00ff00'" label="Verde"
    /&gt;

    &lt;command onclick="document.bgColor = '\#0000ff'" label="Azul"
    /&gt;

    &lt;command onclick="document.bgColor = '\#000000'" label="Negro"
    /&gt;

    &lt;hr /&gt;

    &lt;command onclick="return = true" label="Salir" /&gt;

    &lt;/menu&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-contextMenu_Personalizaci-n/image2.png)

###Menú definido al estilo HTML 5 con submenús


Para definir submenús sólo hemos de modificar el apartado *ítems*, de la
forma que se muestra en el Listado 2:

Se tratará de emular el mismo código, paso por paso.

Para definir un submenú, se define un menú dentro del principal,
anidándolo como se observa y sin definirle propiedades particulares,
salvo *label*.

**Listado 2: Ejemplo anterior –véase el Listado 1- organizado
    en submenús.**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú definido al estilo
    HTML5&lt;/title&gt;

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

    items: \$.contextMenu.fromMenu(\$('\#html5menu'))

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;menu class="showcase" id="html5menu" type="context"
    style="display: none;"&gt;

    &lt;command onclick="document.bgColor = '\#ffffff'" label="Blanco"
    /&gt;

    &lt;menu label="RGB"&gt;

    &lt;command onclick="document.bgColor = '\#ff0000'" label="Rojo"
    /&gt;

    &lt;command onclick="document.bgColor = '\#00ff00'" label="Verde"
    /&gt;

    &lt;command onclick="document.bgColor = '\#0000ff'" label="Azul"
    /&gt;

    &lt;/menu&gt;

    &lt;command onclick="document.bgColor = '\#000000'" label="Negro"
    /&gt;

    &lt;hr /&gt;

    &lt;command onclick="return = true" label="Salir" /&gt;

    &lt;/menu&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-contextMenu_Personalizaci-n/image3.png)

###Menú definido al estilo HTML 5 con título


La presencia del título es totalmente aparte de que el menú sea definido
al estilo HTML 5 o no.

Recordamos aquí simplemente que es una cuestión de definir los estilos
pertinentes y definir y registrar el título. Para más información nos
remitimos al primero de los artículos referenciados al comienzo del
presente.

**Listado 3: Menú definido al estilo HTML 5 y con un título.**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Menú definido al estilo
    HTML5&lt;/title&gt;

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

    items: \$.contextMenu.fromMenu(\$('\#html5menu'))

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

    &lt;menu class="showcase" id="html5menu" type="context"
    style="display: none;"&gt;

    &lt;command onclick="document.bgColor = '\#ffffff'" label="Blanco"
    /&gt;

    &lt;command onclick="document.bgColor = '\#ff0000'" label="Rojo"
    /&gt;

    &lt;command onclick="document.bgColor = '\#00ff00'" label="Verde"
    /&gt;

    &lt;command onclick="document.bgColor = '\#0000ff'" label="Azul"
    /&gt;

    &lt;command onclick="document.bgColor = '\#000000'" label="Negro"
    /&gt;

    &lt;hr /&gt;

    &lt;command onclick="return = true" label="Salir" /&gt;

    &lt;/menu&gt;

    &lt;/body&gt;

    &lt;/html&gt;
```

![] (./img/jQuery-UI-contextMenu_Personalizaci-n/image4.png)

###Menú definido al estilo HTML 5 con apertura y cierre automático


Se trata de crear un menú que se despliegue –*Hover Activated*- y con
cierre automático cuando se pase el puntero del ratón sobre cierta área
activa del documento HTML. Esto también es compatible con la definición
del menú al estilo HTML 5.

Para más información nos remitimos al segundo de los artículos
referenciados al comienzo del presente.

En el Listado 4 mostramos las modificaciones precisas, con respecto al
Listado 3, para dotar a la aplicación de dichas funcionalidades.

**Listado 4: Modificaciones precisas sobre el Listado 3, en la función
    de creación, para dotar al menú con apertura y cierre automatizado.**

```
    &lt;script&gt;

    \$(function () {

    \$.contextMenu({

    selector: '.context-menu',

    className: 'data-title',

    trigger: 'hover',

    delay: 500,

    autoHide: true,

    items: \$.contextMenu.fromMenu(\$('\#html5menu'))

    });

    // Registro del título

    \$('.data-title').attr('data-menutitle', "Selección de color");

    });

    &lt;/script&gt;
```

###Aplicación de estilos personalizados


La aplicación de estilos personalizados conlleva el conocimiento algo
más profundo del conjunto de estilos del *jQuery User Interface
contextMenu* –véase el apartado correspondiente al comienzo del presente
artículo, para saber dónde obtenerlo-.

Hemos de conocer que estilos alterar y para ello hemos de documentarnos
convenientemente en el contenido del archivo *jquery.contextMenu.css*.

A modo de ejemplo, en el Listado 5 recogemos las personalizaciones
siguientes:

Color de fondo del menú contextual (*context-menu-item*)

Color de texto de las opciones del menú contextual (*context-menu-item*)

Tamaño de la fuente (*context-menu-list*)

Estilo de la fuente (*context-menu-list*)

**Listado 5: Ejemplo de menú con algunos estilos personalizados.**


```
    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;jQuery ContextMenu - Aplicación de estilos
    personalizados&lt;/title&gt;

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

    .context-menu-item {

    background-color: \#ffd8d8;

    color: \#0026ff;

    }

    .context-menu-list {

    font-size: 13px;

    font-style: italic;

    }

    &lt;/style&gt;

    &lt;script&gt;

    \$(function () {

    \$.contextMenu({

    selector: '.context-menu',

    trigger: 'hover',

    delay: 500,

    autoHide: true,

    items: \$.contextMenu.fromMenu(\$('\#html5menu'))

    });

    });

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;div class="context-menu"&gt;

    Menú contextual.

    &lt;/div&gt;

    &lt;menu class="showcase" id="html5menu" type="context"
    style="display: none;"&gt;

    &lt;command onclick="document.bgColor = '\#ffffff'" label="Blanco"
    /&gt;

    &lt;command onclick="document.bgColor = '\#ff0000'" label="Rojo"
    /&gt;

    &lt;command onclick="document.bgColor = '\#00ff00'" label="Verde"
    /&gt;

    &lt;command onclick="document.bgColor = '\#0000ff'" label="Azul"
    /&gt;

    &lt;command onclick="document.bgColor = '\#000000'" label="Negro"
    /&gt;

    &lt;hr /&gt;

    &lt;command onclick="return = true" label="Salir" /&gt;

    &lt;/menu&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/jQuery-UI-contextMenu_Personalizaci-n/image5.png)

###Conclusiones


En el presente artículo hemos repasado funcionalidades complementarias
del componente *jQuery User Interface contextMenu*. Con ellas creemos se
está en condiciones de implementar menús definidos al estilo HTML 5 y
tener pistas de cómo personalizar parcialmente las apariencia; con una
codificación sencilla y clara como la que nos permite dicho componente.

Esperamos que todo lo expuesto les haya servido de ayuda. Hasta nuestro
próximo artículo, felices horas de programación.

**©Jaime Peña Tresancos, 2015**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
