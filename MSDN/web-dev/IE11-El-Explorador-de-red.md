<properties
	pageTitle="Internet Explorer 11: El Explorador de red"
	description="Internet Explorer 11: El Explorador de red"
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



#Internet Explorer 11: El Explorador de red


©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  

Dentro de las herramientas de desarrollo –herramientas F12- de Internet
Explorer, el *Explorador de red*, nos permite hacer un seguimiento
detallado del tráfico de red que se genera entre el servidor y el
cliente en la carga y ejecución de contenidos de una página Web.

En el presente artículo nos centraremos en:

- El *Explorador de red*. Su área de trabajo.

- Los diversos paneles y barras de herramientas.

- Una primera experiencia –ejecución paso a paso-.

- Paneles de **Vista resumen** y **Vista detalle**.

- Tipos de contenidos.

- Encabezados de solicitud y respuesta.

###Acceso a las herramientas F12


Para acceder a las herramientas de desarrollo, desde la ventana de
*Internet Explorer*, pulsaremos la tecla de función **F12** y en la
parte inferior de la ventana se abrirá el panel correspondiente a dichas
herramientas.

En concreto, las herramientas disponibles son las que se recogen en la
tabla que sigue:

  **Herramienta**                     |**Descripción**                                                                                                      **Teclas**
  ----------------------------------- |-------------------------------------------------------------------------------------------------------------------- ------------
  *Explorador DOM*                    |Para diagnosticar y corregir problemas de diseño referentes al DOM –*Document Object Model*-                         **Ctrl+1**
  *Consola de salida de texto*        |En ella se mostrará posibles mensajes de error y los correspondientes a los comandos *console.log* de *JavaScript*   **Ctrl+2**
  *Depurador*                         |Para inspeccionar la ejecución de código *JavaScript* en modo paso a paso y depuración avanzada                      **Ctrl+3**
  *Explorador de red*                 |Analiza el uso del tráfico de red de las páginas Web y del propio explorador                                         **Ctrl+4**
  *Capacidad de respuesta de la IU*   |Crea un perfil de respuesta de la interfaz de usuario de la página Web                                               **Ctrl+5**
  *Generador de perfiles*             |Crear un perfil de rendimiento del código *JavaScript*                                                               **Ctrl+6**
  *Memoria*                           |Diagnostica los problemas de uso de la memoria de las páginas Web                                                    **Ctrl+7**
  *Emulación*                         |Emulación del comportamiento en diferentes versiones y plataformas del explorador                                    **Ctrl+8**

###Explorador de red


Una vez accedido al *Explorador de red*, para ello véase lo comentado en
el apartado **Iniciar una sesión en el *Explorador de red*** –más
adelante-, nos encontraremos con una barra de herramientas y dos
entradas de menú que presentan dos paneles –**Resumen** y **Detalles**-.

La documentación oficial de Microsoft acerca del *Explorador de red* la
podrá encontrar en la siguiente dirección URL:

**http://msdn.microsoft.com/es-es/library/ie/dn255004(v=vs.85).aspx**


![] (./img/IE11-El-Explorador-de-red/image1.png)

**Ventana del Explorador de red de las Herramientas F12.**

En la Barra de herramientas encontramos los siguientes botones de
comando:

- **Habilitar/Deshabilitar la captura de tráfico de red**: Activa y
comienza o desactiva y detiene el registro del tráfico de red.

- **Exportar el tráfico capturado**: Nos permite guardar los datos del
registro de nuestra exploración en un documento XML o CSV.

- **Siempre actualizar desde el servidor**: Si está activado se
descargarán todos los datos pertinentes desde el servidor, ignorando la
caché local.

- **Borrar caché de exploración**: Útil para asegurarse una buena medición
del tráfico de red al cargar una página supuestamente nueva.

- **Borrar cookies para el dominio**: Ídem que lo anterior, en lo
referente a posibles cookies.

**Borrar entradas en la navegación**: Cuando está activado –opción por
defecto- las entradas de navegación se borran al pasar de una página a
otra en el explorador.

- **Eliminar todas las entradas**: Elimina todo el tráfico de red
actualmente registrado –comienza un nuevo registro-

- **Búsqueda de tráfico**: Para realizar búsquedas de cadenas de texto en
las entradas de tráfico registrado.

###Iniciar una sesión con el Explorador de red


Hemos de seguir los pasos:

1. Desplegar las Herramientas F12, pulsando la tecla de función
    **F12**.

2.  Ir al panel de *Explorador de red*, haciendo clic sobre el botón
    correspondiente –a la izquierda- o pulsando la combinación de teclas
    **Ctrl+4**.

3.  Si lo que deseamos es ver el tiempo de carga inicial de nuestra
    página desde el servidor, deberemos borrar la cache y las *cookies*
    –véase el apartado anterior-.

4.  Si queremos que todo sea accedido desde el servidor, en todo
    momento, deberemos activar **Siempre actualizar desde el servidor**.

5.  Finalmente, hacer clic sobre el botón de **Habilitar/Deshabilitar la
    captura de tráfico de red**.


![] (./img/IE11-El-Explorador-de-red/image2.png)

###Panel de Vista resumen


Una vez iniciada la sesión en el *Explorador de red*, se nos mostrarán
en el panel de **Vista resumen** un listado con las entradas de todas
las solicitudes de datos al servidor. Cada una de las solicitudes se
muestra en una fila, con las entradas:

- **Dirección URL**: De la solicitud de datos de respuesta.

- **Protocolo de red**: Habitualmente HTTP.

- **Verbo de método HTTP**: Habitualmente GET.

- **Código de respuesta HTTP**: Por ejemplo 202 –exitoso-, 404 –no
encontrado-, etc.

- **Tipo de contenido recibido**: Puede ser imagen, texto, aplicación, …

- **Total de datos recibidos**: En la respuesta a la solicitud, en bytes.

- **Tiempo total de respuesta**: En la respuesta a la solicitud, en
milisegundos.

- **Subsistema de Internet Explorer que inició la descarga (Iniciador)**:
Por ejemplo, actualizar la página, un hipervínculo, un script, una
imagen externa, …

- **Escala de tiempos de eventos de red (Intervalos)**: Muestra visual,
diagrama, de los tiempos de carga de las solicitudes.


![] (./img/IE11-El-Explorador-de-red/image3.png)

**Panel de Vista resumen del *Explorador de red*.**

###Tipos de contenidos


Los tipos que pueden ser encontrados son de los denominamos MIME –de
***Multipurpose Internet Mail Extensions***-; obsérvese que aunque se
hace referencia a transmisión por Internet de correo electrónico, el
formato para las transmisiones HTTP es el mismo dado que se realizan de
forma similar y utilizan los mismos tipos.

Para una ilustración básica de todo ello puede acudir a:

**http://es.wikipedia.org/wiki/Multipurpose\_Internet\_Mail\_Extensions**

Sobre los posibles contenidos MIME encontrará información en los dos
foros siguientes, siendo el segundo un listado de la totalidad de ellos
sin más descripción:

**http://sites.utoronto.ca/webdocs/HTMLdocs/Book/Book-3ed/appb/mimetype.html**

**http://www.sitepoint.com/web-foundations/mime-types-complete-list/**

Algunos ejemplos comunes son:

  Tipo                     |Contenido
  ------------------------ |-------------------------------------------
  text/html                |HTML text data (Documento HTML)
  text/plain               |Plain text (Documento de texto ASCII)
  image/png                |Portable Network Graphics (Imagen)
  video/mpeg               |MPEG Video (Secuencia de vídeo)
  application/pdf          |Adobe Acrobat PDF (Formato documento)
  application/x-gtar       |GNU tar format (Formato comprimido)
  application/javascript   |JavaScript program (Secuencia JavaScript)

###Panel de Vista detalles


Todo el tráfico de una página se gestiona a través de solicitudes y
respuestas hacia y desde el servidor, esencialmente, además de
almacenamientos locales de variables –datos diversos- en forma de las
denominadas *cookies*.

Por tanto, cada una de las entradas –filas- que vemos en el resumen del
tráfico de red puede ser expandida en sus detalles de los
correspondientes valores que contienen las solicitudes, respuestas,
*cookies*, lo que dio lugar a iniciarse la solicitud y el tiempo que se
tomó en la recepción de la respuesta.

Así, en la pestaña denominada **Detalles** nos encontramos con las
columnas siguientes para cada entrada de solicitud del **Resumen**:

- **Encabezados de solicitud**: Diversos datos acerca de qué se solicita,
qué tipo de dato se aceptará y en qué idioma, si se almacenarán o
accederá a alguna *cookie*, etc., véase el siguiente apartado.

- **Cuerpo de solicitud**: Datos enviados al servidor. En la mayoría de
los casos, estará en blanco.

- **Encabezados de respuesta**: Similar a los de solicitud, pero enviados
desde el servidor al cliente, véase el siguiente apartado.

- **Cuerpo de respuesta**: Puede ser un cuerpo de documento HTML,
secuencia JavaScript, una imagen, etc.

- **Cookies**: Los *cookies* que se leen o escriben en el proceso de
solicitud.

- **Iniciador**: Nos indica que suceso ha desencadenado la solicitud al
servidor, por ejemplo la actualización de la página, la carga de una
imagen, …

- **Intervalos**: Enumera los eventos y sus correspondientes tiempos que
son relevantes para la solicitud. La información de tiempo se muestra
como tabla y como escala de tiempo gráfica. Si se hace clic en un evento
en la tabla o la escala de tiempo, se resalta y muestra una explicación
del tipo de evento.


![] (./img/IE11-El-Explorador-de-red/image4.png)

**Vista de los intervalos de respuesta de una solicitud.**

###Encabezados de solicitud y respuesta HTTP


Los encabezados de solicitud y respuesta pueden contener abundante
información acerca de aspectos tan variados como el tipo de explorador,
de datos recabados, compresiones posibles, idiomas, etc.

Todos se tratan de parejas de clave/valor y de datos en bruto, por
ejemplo una secuencia de codificación, una dirección URL, una fecha y
demás. Para saber exactamente que puede contener un encabezado deberemos
remitirnos a cada uno en concreto y sus peculiaridades, en todo caso
serán datos del tipo estándar y en su caso también personalizado –eso
dependerá de cada solicitud y sistema- como los que se recogen en las
referencias que siguen.

Referencia de los encabezados de solicitud y respuesta HTTP:

[**http://msdn.microsoft.com/es-es/library/aa287673(v=vs.71).aspx**](http://msdn.microsoft.com/es-es/library/aa287673(v=vs.71).aspx)

[**http://en.wikipedia.org/wiki/List\_of\_HTTP\_header\_fields\#Request\_fields**](http://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Request_fields)

[**http://en.wikipedia.org/wiki/List\_of\_HTTP\_header\_fields\#Response\_fields**](http://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Response_fields)


![] (./img/IE11-El-Explorador-de-red/image5.png)
**Vista del *Encabezado de solicitud* de una llamada al servidor.**

###Conclusiones


En el presente artículo hemos visto como iniciar una sesión en el
*Explorador de red*, elucidar la salida de información global en el
**Panel de vista resumen** y conocer cada entrada concreta en el **Panel
de vista detalles**. También hemos tratado aspectos particulares como
los tipos de contenidos que se pueden recabar y los encabezados de las
solicitudes.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)
