---
title: Internet Explorer 11- La consola de salida de texto
description: Internet Explorer 11- La consola de salida de texto
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Internet Explorer 11: La consola de salida de texto


©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  

Dentro de las herramientas de desarrollo –herramientas F12- de Internet
Explorer, la tradicionalmente más utilizada es la *Consola de salida de
texto*. En ella se exponen mensajes informativos de advertencia y error,
para el seguimiento más detallado de las aplicaciones y documentos. Esos
mensajes pueden ser emitidos por el explorador o programador por el
diseñador y toda la *Consola de salida de texto* está íntimamente ligada
a las restantes herramientas de desarrollo, siendo accesible en todo
momento.

En el presente artículo nos centraremos en:

- La *Consola de salida de texto* y los mensajes del explorador

- Mensajes del usuario, el *API de depuración de la consola*

- Uso de los métodos del *API de depuración de la consola*

- Las opciones –patrones de sustitución- de *console.log*

- Mensajes de advertencia y error y el Depurador integrado

###Acceso a las herramientas F12


Para acceder a las herramientas de desarrollo, desde la ventana de
*Internet Explorer*, pulsaremos la tecla de función **F12** y en la
parte inferior de la ventana se abrirá el panel correspondiente a dichas
herramientas.

En concreto, las herramientas disponibles son las que se recogen en la
tabla que sigue:

  Herramienta                         |Descripción                                                                                                          Teclas
  ----------------------------------- |-------------------------------------------------------------------------------------------------------------------- --------
  *Explorador del DOM*                |Para diagnosticar y corregir problemas de diseño referentes al DOM –*Document Object Model*-                         Ctrl+1
  *Consola de salida de texto*        |En ella se mostrará posibles mensajes de error y los correspondientes a los comandos *console.log* de *JavaScript*   Ctrl+2
  *Depurador*                         |Para inspeccionar la ejecución de código *JavaScript* en modo paso a paso y depuración avanzada                      Ctrl+3
  *Explorador de red*                 |Analiza el uso del tráfico de red de las páginas Web y del propio explorador                                         Ctrl+4
  *Capacidad de respuesta de la IU*   |Crea un perfil de respuesta de la interfaz de usuario de la página Web                                               Ctrl+5
  *Generador de perfiles*             |Crear un perfil de rendimiento del código *JavaScript*                                                               Ctrl+6
  *Memoria*                           |Diagnostica los problemas de uso de la memoria de las páginas Web                                                    Ctrl+7
  *Emulación*                         |Emulación del comportamiento en diferentes versiones y plataformas del explorador                                    Ctrl+8

###La consola de salida de texto


En ella se mostrarán las informaciones de sucesos, advertencias y
errores que el explorador emita, o bien que el usuario programador haya
previsto mostrar ante algún acontecimiento.

Con todo, como se verá, es mucho más que una mera salida de texto
informativo y forma parte esencial de un excelente entorno de depuración
personalizable.

La referencia oficial completa de Microsoft, la puede encontrar en la
siguiente dirección URL:

[**http://msdn.microsoft.com/es-es/library/ie/dn255006(v=vs.85).aspx**](http://msdn.microsoft.com/es-es/library/ie/dn255006(v=vs.85).aspx)

![] (./img/IE11-La-consola-de-salida-de-texto/image1.png)

Las características fundamentales de trabajo con la consola son:

La consola comenzará a recibir mensajes únicamente una vez abierta, de
forma general, no mientras esté oculta. Por tanto, después de abierta,
recargue la página.

Del propio explorador, recibe tres tipos de notificaciones:

1.  Informaciones: aquellas no críticas pero que resultará útil
    conocerlas, según patrones predeterminados.

2.  Advertencias: se mostrarán aquellos errores en la página Web que no
    sean críticos y que aunque puedan causar algún inconveniente no
    impidan ser mostrada satisfactoriamente.

3.  Errores: se indicarán aquellos fallos graves que impiden la
    ejecución de código o el mostrar la página de forma satisfactoria.


Mediante el *API de depuración de la consola*, el programador podrá
enviar mensajes personalizados; los métodos más utilizados son:

*console.log*: Mensaje de texto informativo, sin ningún tipo de
especificación adicional.

Notificaciones similares a las del explorador:

1.  *console.info*: Mensaje con el icono de información.

2.  *console.warn*: Mensaje con el icono de advertencia.

3.  *console.error*: Mensaje con el icono de error.


Otro punto muy importante es que tendremos acceso a ella, desde
cualquiera de las restantes herramientas de desarrollo, sin más que
hacer clic en el botón correspondiente de la barra de iconos horizontal
superior –botón denominado **Mostrar consola**- y se mostrará como un
panel complementario dentro de aquella otra herramienta.

###Detalles acerca del API de depuración de la consola
---------------------------------------------------

Los métodos disponibles en el *API de depuración de la consola* son los
que siguen:

  Método                 |Descripción
  ---------------------- |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *console.log*          |Es el método más comúnmente utilizado, toma como parámetro una cadena de caracteres y lo expone en la consola de salida de texto –más adelante veremos algunas de sus características adicionales-
  *console.info*         |Ídem que el anterior, pero al exponer la información, le antepone un icono de información, como en el correspondiente de información emitido por el propio explorador.
  *console.warn*         |Ídem que el anterior con un icono de advertencia.
  *console.error*        |Ídem que el anterior con un icono de error.
  *console.count*        |Inicializa e incrementa un determinado contador de sucesos, que nosotros identificaremos por el nombre que se le da como parámetro, en forma de cadena de texto.
  *console.countReset*   |Pone a cero el contador de sucesos. Si hay varios contadores, llamaremos a la función con el parámetro de cadena de texto con el nombre de aquel que deseamos finalizar.
  *console.time*         |Inicializa el contador de tiempo, que trabaja en milisegundos. Si precisamos más de un temporalizador, identificaremos cada uno por un nombre que se pasa como un parámetro de cadena de texto al llamar a la función.
  *console.timeEnd*      |Para y da el resultado del tiempo transcurrido en milisegundos. Si hay varios temporalizadores, llamaremos a la función con el parámetro de cadena de texto con el nombre de aquel que deseamos finalizar.
  *console.assert*       |Es un evaluador de aserciones, que caso de resultar falso emite un mensaje de error personalizado (el equivalente a *console.error*).
  *console.trace*        |Se iniciará y mostrará el seguimiento de la pila, se recomienda no utilizarlo simultáneamente con *console.profile*.
  *console.profile*      |Iniciará una sesión de generación de perfiles. Se le puede pasar un parámetro con un nombre distintivo para diferenciarla entre varias.                       
                         |No es recomendable mantener abiertas varias sesiones simultáneas de generación de perfiles.
  *console.profileEnd*   |Finalizará una sesión de generación de perfiles.
  *console.clear*        |Limpia el contenido de la consola de salida de texto
 
Para más detalles del *API de depuración de la consola*, puede acudirse
a la referencia en la siguiente dirección URL:

[**http://msdn.microsoft.com/es-es/library/ie/hh772173(v=vs.85).aspx**](http://msdn.microsoft.com/es-es/library/ie/hh772173(v=vs.85).aspx)

- Aclararemos algunos de los métodos que nos pueden ser de mayor utilidad
con ejemplificaciones de su uso en la Consola de texto.

Un primer ejemplo se refiere al modo de utilización de contadores de
sucesos. Veamos el Listado 1:

- Se inicializa el contador personal, mediante una llamada al método
*countReset*.

- Se incrementa el contador en cada ocasión requerida mediante el método
*count*.

Nótese que de parámetro, en ambos casos, se da un nombre de contador;
puede haber varios corriendo simultáneamente.

**Listado 1: Ejecución, en la Consola de salida texto, de rutinas en
    JavaScript que ponen a cero y activan el sistema de recuento del API
    de depuración de la consola**

```

    console.countReset('contador');

    for (var i = 0; i &lt; 10; i++){

    console.count('contador');

    }
```

Para ejecutar este código, deberemos escribirlo en el área
correspondiente de la Consola de texto de Internet Explorer, que se
encuentra en la parte inferior, y hacer clic sobre el botón **Ejecutar
script**, que se encuentra a su derecha, véase por ejemplo lo mostrado
en la figura que sigue.

Ejecución, en la Consola de salida texto, de rutinas en JavaScript
    que activan el sistema de recuento del API de depuración de la
    consola


![] (./img/IE11-La-consola-de-salida-de-texto/image2.png)

En segundo lugar veremos cómo utilizar el temporalizador, creando uno
específico, con su nombre particular, para evaluar el tiempo
transcurrido en ejecutarse el código anteriormente usado en el contador
de sucesos. Véase el Listado 2.

**Listado 2: Ejecución, en la Consola de salida texto, de rutinas en
    JavaScript que activan el temporalizador y el sistema de recuento
    del API de depuración de la consola**

```

    console.time();

    console.countReset('contador');

    for (var i = 0; i &lt; 10; i++){

    console.count('contador');

    }

    console.timeEnd();

```

Ejecución, en la Consola de salida texto, de rutinas en JavaScript
    que activan el temporalizador y el sistema de recuento del API de
    depuración de la consola y el Generador de perfiles, en el que
    podemos ver los resultados de la secuenciación de todas estas
    rutinas



![] (./img/IE11-La-consola-de-salida-de-texto/image3.png)}

En tercer lugar ilustramos cómo es posible iniciar una sesión del
Generador de perfiles desde la Consola de salida de texto, de igual
manera que si se hubiera comenzado pulsando el botón equivalente de
inicio desde aquella.

Por ejemplo, tomamos de base los ejemplos anteriores y nos fijamos en el
Listado 3, en que añadimos a mayores los métodos de inicio y
finalización de la sesión del Generador de perfiles –*profile* y
*profileEnd*-.

**Listado 3: Ejecución, desde la Consola de salida texto, de una
    sesión del Generador de perfiles**

```

    console.profile('pruebas');

    console.time();

    console.countReset('contador');

    for (var i = 0; i &lt; 10; i++){

    console.count('contador');

    }

    console.timeEnd();

    console.profileEnd();

```

![] (./img/IE11-La-consola-de-salida-de-texto/image4.png)

###Los modificadores de console.log


Dispone de modificadores para la inclusión de variables de diversos
tipos –patrones de sustitución- en las cadenas de texto, como se expone
seguidamente:

- %s: cadena de caracteres

- %d: entero doble

- %i: entero simple

- %f: valor de coma flotante

- %o: objeto de cualquier tipo

- %b: número binario

- %x: número hexadecimal

- %e: exponente numérico (*console.log("%e4", 5)* equivale a 5e+04)

Veamos como ejemplos un par de rutinas de exposición de la fecha actual.
En el Listado 4, simplemente mostraremos los datos numéricos –enteros
simples- del día, mes y año; en el Listado 5, mostraremos, además, la
cadena de caracteres con el nombre del día de la semana.

**Listado 4: Uso de patrones de sustitución para mostrar la fecha
    actual en la Consola de textos**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;console.log string date&lt;/title&gt;

    &lt;script&gt;

    function mostrar() {

    var d = new Date;

    var c = "Hoy es el %i del %i de %i";

    console.log(c, d.getDate(), d.getMonth()+1, d.getFullYear());

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A"&gt;Mostrar fecha en la consola de textos&lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="Mostrar" onclick="mostrar();" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/IE11-La-consola-de-salida-de-texto/image5.png)



**Listado 5: Uso de patrones de sustitución para mostrar el día de la
    semana y la fecha actual en la Consola de textos**

```

    &lt;!doctype html&gt;

    &lt;html&gt;

    &lt;head lang="es-es"&gt;

    &lt;meta charset="utf-8" /&gt;

    &lt;title&gt;console.log string date&lt;/title&gt;

    &lt;script&gt;

    function mostrar() {

    var d = new Date;

    var dia = \['domingo', 'lunes', 'martes', 'miércoles', 'jueves',
    'viernes', 'sábado'\];

    var c = "Hoy es %s (%i del %i de %i)";

    console.log(c, dia\[d.getDay()\], d.getDate(), d.getMonth()+1,
    d.getFullYear());

    }

    &lt;/script&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;p id="A"&gt;Mostrar fecha en la consola de textos&lt;/p&gt;

    &lt;hr /&gt;

    &lt;input type="button" value="Mostrar" onclick="mostrar();" /&gt;

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/IE11-La-consola-de-salida-de-texto/image6.png)

###Mensajes de advertencia y error y el Depurador integrado


Al hacer clic sobre cualquiera de los mensajes de advertencia o error,
se accederá automáticamente a la pestaña de depuración, posicionándonos
en el archivo de comandos y en su caso en la línea de código que ha
causado la advertencia o el error.

Si nos referimos a las dos figuras que siguen, por fijarnos en un caso,
en la primera de ellas se nos advierte que hay un problema en uno de los
archivos –*default.aspx*-. Al hacer clic sobre el hiperenlace
correspondiente que lo alude, se abrirá el Depurador con el archivo
correspondiente cargado y ya iniciada una sesión de depuración.

En los casos de errores, se nos mostraría la información del error
correspondiente en el propio Depurador.

![] (./img/IE11-La-consola-de-salida-de-texto/image7.png)

![] (./img/IE11-La-consola-de-salida-de-texto/image8.png)

###Conclusiones


En el presente artículo hemos visto las capacidades, desde las más
simples y obvias a las más avanzadas, de la *Consola de salida de texto*
de las herramientas de desarrollo de Internet Explorer.

Hemos de insistir que tendremos acceso a ella, desde cualquiera de
dichas herramientas, sin más que hacer clic en el botón correspondiente
de la barra de iconos horizontal superior y se mostrará como un panel
complementario dentro de ella.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




