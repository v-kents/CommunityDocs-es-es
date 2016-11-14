---
title: Servicio WebMail ASP.NET
description: Servicio WebMail ASP.NET
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Servicio WebMail ASP.NET


©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  



Obtener *feedback* desde nuestros foros Web en forma de correo
electrónico puede ser una pieza clave en muchas ocasiones. Veremos que
implementarlo mediante ASP.NET es una tarea sencilla y muy potente.

En el artículo trataremos:

El API de desarrollo de *WebMail* mediante ASP.NET

El desarrollo de un ejemplo simple mediante *Visual Studio 2012*

Las modificaciones posiblemente necesarias en el archivo *config.sys*

Cómo controlar los errores y excepciones durante la ejecución de la
aplicación

Cómo mejorar la interactividad de nuestro primer ejemplo


    Un ejemplo completo, con todas las opciones de interactividad de un correo electrónico *WebMail*

Entornos de desarrollo recomendados:

- Microsoft Visual Studio 2012* –válido Express para la Web-

- Microsoft WebMatrix 3.0*



En el presente trabajo hemos utilizado *Visual Studio 2012* y con él
codificaremos los ejemplos del presente artículo.

###El API de desarrollo


En la tabla que sigue se recogen el conjunto de propiedades que
deberemos cumplimentar y el método final de llamada para el envío del
email:

  Propiedades y método   |Descripción
  ---------------------- |-----------------------------------------------------------------------------------------------------------------------------
  SmtpServer             |Dirección URL del servidor de correo SMTP –*Simple Mail Transfer Protocol*, protocolo para transferencia simple de correo-.                    
                         |Para el caso de *Outlook*, *Hotmail* y *Live*, el valor es: *smtp.live.com*
  SmtpPort               |Número del puerto de comunicaciones utilizado por el protocolo SMTP.
                         |Para el caso de *Outlook*, *Hotmail* y *Live*, el valor es: *25*
  EnableSsl              |Conmutador de habilitación de seguridad SSL –*Secure Sockets Layer*, capa de conexión segura-.                       
                         |Para el caso de *Outlook*, *Hotmail* y *Live*, el valor es: *true*
  UserName               |Para el caso de *Outlook*, *Hotmail* y *Live*, el valor es la dirección de correo electrónico del emisor
  From                   |La dirección de correo electrónico del emisor
  Password               |La contraseña del emisor del correo electrónico
  Send                   |Se trata del método que se ha de llamar para el envío del email, tiene la sintaxis: *Send(destinatario, cabecera, contenido \[, adjuntos\])*
  
Por ejemplo, en su forma más simple, una rutina de *WebMail* podría
tener el aspecto de la siguiente porción de código:


```
    WebMail.SmtpServer = "smtp.live.com";

    WebMail.SmtpPort = 25;

    WebMail.EnableSsl = true;

    WebMail.UserName = "minombre@outlook.com";

    WebMail.From = "minombre@outlook.com";

    WebMail.Password = "micontraseña";

    WebMail.Send(to: "destinatario@suservidor.com", subject: "asunto",
    body: "contenido");
```

No es muy funcional, dado que todo está preprogramado y no permite
interaccionar con los datos que se van a enviar. En los ejemplos que
siguen veremos cómo hacerlo.

###Nuestro ejemplo base


Para comenzar programaremos un simple ejemplo de envío de un mensaje de
correo electrónico desde una cuenta de correo fija a otra cuenta de
correo también predeterminada, los únicos parámetros de entrada serán el
asunto y el contenido del mensaje. Con posterioridad completaremos
ampliamente todas éstas capacidades.

Seguiremos los siguientes pasos:

1\. Abriremos el entorno de desarrollo de Visual Studio 2012

2\. En el área **Iniciar** seleccionamos **Nuevo proyecto…**

3\. Se abrirá la caja de diálogo de **Nuevo proyecto**, en ella escogemos
en el panel de la izquierda **Plantilla** y dentro de ella **Web** –bien
en el apartado **C\#**, bien en el de **Visual Basic**-

4\. Ahora en el panel de la derecha seleccionamos **Aplicación Web vacía
de ASP.NET**

5\. Le damos un **Nombre** significativo, en nuestro caso *WebMail*

6\. Finalizamos haciendo clic sobre el botón **Aceptar**

![] (./img/Servicio-WebMail-ASP-NET/image1.png)

7\. Ahora nos encontraremos en el entorno de desarrollo de *Visual
Studio*, fijémonos en el **Explorador de soluciones**

![] (./img/Servicio-WebMail-ASP-NET/image2.png)

8\. Hacemos clic con el botón derecho del ratón sobre el título del
proyecto –*WebMail*- y seleccionamos la opción del menú emergente
**Agregar\\Nuevo elemento…**

9\. Se desplegará la caja de diálogo **Agregar nuevo elemento –
WebMail**, en ella:

En el panel de la derecha desplegamos la lista **Visual C\#** -o en su
caso **Visual Basic**- y seleccionamos tipo **Web**

En la lista de nuevos elementos en el panel central- escogeremos
**Página HTML**

En el apartado **Nombre** le ponemos *Default* y –muy importante- con la
extensión *cshtml*

Salimos haciendo clic en el botón **Agregar**


![] (./img/Servicio-WebMail-ASP-NET/image3.png)

10\. Ya de vuelta en el entorno de desarrollo de *Visual Studio 2012*,
iremos al panel de edición del código del documento *Default.cshtml*

![] (./img/Servicio-WebMail-ASP-NET/image4.png)

11\. Seleccionamos todo el contenido y lo sustituimos por el código
recogido en el Listado 1.

**Listado 1: Ejemplo base de servicio de mensajes WebMail**

```
    @{

    var eMailSent = false;

    if (IsPost)

    {

    eMailSent = true;

    var eMailSubject = Request\["subject"\];

    if (eMailSubject == null)

    {

    eMailSubject = "Asunto vacío";

    }

    var eMailMessage = Request\["message"\];

    if (eMailMessage == null)

    {

    eMailMessage = "Mensaje vacío";

    }

    WebMail.SmtpServer = "smtp.live.com";

    WebMail.SmtpPort = 25;

    WebMail.EnableSsl = true;

    WebMail.UserName = "minombre@outlook.com";

    WebMail.From = "minombre@outlook.com";

    WebMail.Password = "micontraseña";

    WebMail.Send(to: "destinatario@suservidor.com", subject:
    eMailSubject, body: eMailMessage);

    }

    }

    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;title&gt;Servicio WebMail&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;form method="POST"&gt;

    &lt;p&gt;Asunto&lt;/p&gt;

    &lt;input type="text" name="subject" value="Motivo del mensaje"
    /&gt;&lt;br /&gt;

    &lt;p&gt;Mensaje&lt;/p&gt;

    &lt;textarea rows="6" cols="40" name="message"&gt;Escriba su mensaje
    aquí&lt;/textarea&gt;&lt;br /&gt;

    &lt;input type="submit" value="Enviar" /&gt;

    &lt;/form&gt;

    @{if (eMailSent)

    {

    &lt;p&gt;Mensaje enviado&lt;/p&gt;

    }

    }

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Servicio-WebMail-ASP-NET/image5.png)

12\. En un área libre del editor hacemos clic con el botón derecho del
ratón y, en el menú emergente, escogemos **Ver en el Explorador
(Internet Explorer)**

![] (./img/Servicio-WebMail-ASP-NET/image6.png)

Se mostrará en una ventana de *Internet Explorer* como se aprecia en la
figura adjunta.

![] (./img/Servicio-WebMail-ASP-NET/image7.png)

Por el momento, si hacemos clic sobre **Enviar** se mostrará la pantalla
de error que se recoge seguidamente.

![] (./img/Servicio-WebMail-ASP-NET/image8.png)

Puede ser debido a numerosos motivos, todos derivados de un error en el
envío del mensaje.

Ya por lo de pronto, si no se han modificado los campos de direcciones
de correo de usuario, nombre de usuario –que en *Outlook*, *Hotmail* y
*Live* son el mismo- y contraseña, los del Listado 1 son ficticios; como
lo es también el del destinatario.

Podría ser que siendo correctos fallase la conexión o los parámetros de
SMTP. Veremos cómo atajar de forma más elegante éstos errores.

El código del Listado 1 esencialmente se reduce a:

1\. Se fijan los parámetros de SMTP del servicio de mensajería, para
Outlook, Live y Hotmail son:


```
    WebMail.SmtpServer = "smtp.live.com";

    WebMail.SmtpPort = 25;

    WebMail.EnableSsl = true;
```

2\. Se recogen las entradas del formulario de los parámetros de asunto y
cuerpo del mensaje –véase el punto 5-:


```
    var eMailSubject = Request\["subject"\];

    var eMailMessage = Request\["message"\];
```

3\. Se establecen los valores de nombre de usuario, contraseña y
dirección de email desde donde se envía el correo electrónico –en el
caso de Outlook, Live y Hotmail, coincide con el nombre de usuario-:


```
    WebMail.UserName = "minombre@outlook.com";

    WebMail.From = "minombre@outlook.com";

    WebMail.Password = "micontraseña";
```

4\. Se procede a llamar a la función de envío, con los parámetros de
dirección del destinatario, asunto y cuerpo del mensaje:

C\#

```
    WebMail.Send(to: "destinatario@suservidor.com", subject:
    eMailSubject, body: eMailMessage);

    5\. En el área del documento HTML, se codifica el formulario para la
    entrada de datos de usuario –véase el punto 2-

    &lt;form method="POST"&gt;

    …

    &lt;/form&gt;
```

###El archivo config.sys


Si al ejecutar la aplicación resulta un error puede que deba modificar
su archivo *config.sys*, de manera que se especifique una entrada
*appSettings*, de forma similar a lo mostrado en el Listado 2.

![] (./img/Servicio-WebMail-ASP-NET/image9.png)


**Listado 2: Archivo config.sys modificado, con el apartado
    appSettings**

```
    &lt;?xml version="1.0" encoding="utf-8"?&gt;

    &lt;!--

    Para obtener más información sobre cómo configurar la aplicación de
    ASP.NET, visite

    http://go.microsoft.com/fwlink/?LinkId=169433

    --&gt;

    &lt;configuration&gt;

    &lt;system.web&gt;

    &lt;compilation debug="true" targetFramework="4.5" /&gt;

    &lt;httpRuntime targetFramework="4.5" /&gt;

    &lt;/system.web&gt;

    &lt;appSettings&gt;

    &lt;add key="webPages:Version" value="2.0"/&gt;

    &lt;/appSettings&gt;

    &lt;/configuration&gt;
```

###Control de errores


La captura de errores y su información al usuario se hará en dos etapas,
una primera, se encargará de mantener la ejecución controlada del código
y la segunda de la información de lo acontecido.

El núcleo básico de tratamiento de errores es la captura de excepciones
producidas en la llamada al proceso de envío del correo, encapsulándolo
en un capturador del tipo *try … catch*


```
    try {

    // código a ejecutar

    }

    catch (Exception ex) {

    // código a ejecutar si se produce alguna excepción

    }
```

Dentro de *catch* se pone a valor *false* el *flag* de mensaje enviado y
se recoge el tipo de error producido, por si deseásemos un informe de
errores detallado –algo que obviamos en este sencillo ejemplo-.

Adicionalmente, al final del código del Listado 3 podrá observar como al
poner el *flag* de envío del mensaje a *false* no se mostrará la
notificación de *Mensaje enviado* y por contra se activará la secuencia
de órdenes dentro de:

    *if(errorMessage != "")*

Con lo cual se mostrará una alerta al usuario. Aquí podríamos ser más
explícitos con el tipo de error producido, pero nos hemos conformado con
informar de que el mensaje no ha sido enviado.

**Listado 3: Idéntico ejemplo del Listado 1 con control e informe de
    errores**

```
    @{

    var eMailSent = false;

    var errorMessage = "";

    if (IsPost)

    {

    eMailSent = true;

    var eMailSubject = Request\["subject"\];

    if (eMailSubject == null)

    {

    eMailSubject = "Asunto vacío";

    }

    var eMailMessage = Request\["message"\];

    if (eMailMessage == null)

    {

    eMailMessage = "Mensaje vacío";

    }

    try {

    WebMail.SmtpServer = "smtp.live.com";

    WebMail.SmtpPort = 25;

    WebMail.EnableSsl = true;

    WebMail.UserName = "minombre@outlook.com";

    WebMail.From = "minombre@outlook.com";

    WebMail.Password = "micontraseña";

    WebMail.Send(to: "destinatario@suservidor.com", subject:
    eMailSubject, body: eMailMessage);

    }

    catch (Exception ex) {

    eMailSent = false;

    errorMessage = ex.Message;

    }

    }

    }

    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;title&gt;Servicio WebMail&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;form method="POST"&gt;

    &lt;p&gt;Asunto&lt;/p&gt;

    &lt;input type="text" name="subject" value="Motivo del mensaje"
    /&gt;&lt;br /&gt;

    &lt;p&gt;Mensaje&lt;/p&gt;

    &lt;textarea rows="6" cols="40" name="message"&gt;Escriba su mensaje
    aquí&lt;/textarea&gt;&lt;br /&gt;

    &lt;input type="submit" value="Enviar" /&gt;

    &lt;/form&gt;

    @{if (eMailSent)

    {

    &lt;p&gt;Mensaje enviado&lt;/p&gt;

    }

    }

    @if(errorMessage != ""){

    @Html.Raw("&lt;script&gt;alert('ERROR\\\\nNo se ha podido enviar
    el mensaje');&lt;/script&gt;")

    }

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Servicio-WebMail-ASP-NET/image10.png)

###Una modificación importante


En el aspecto de la interacción con el usuario, vamos a dar un paso
importante, al incluir el código necesario para que la dirección email
del destinatario –o destinatarios- no esté preprogramada, sino que
seamos nosotros los que escribamos aquella a la que deseamos sea enviado
el mensaje.

Comenzaremos modificando el formulario, insertando un control *input* de
tipo *text*, en el que podremos escribirlo:


```
    &lt;p&gt;E-mail del destinatario&lt;p/&gt;

    &lt;input type="text" name="toemail" /&gt;&lt;br /&gt;
```

Podríamos haber utilizado un tipo *email*, que controlaría la sintaxis
apropiada, pero puede tener sus inconvenientes que deberemos evaluar,
dado que sería válido para una única dirección de correo electrónico –si
es así, use el tipo *email*-, pero no para diversos destinatarios
separados por punto y coma.

Seguidamente tomaremos la dirección email del destinatario de la entrada
del formulario en el apartado *Razor* de nuestro código, de la forma:

```
    try {

    WebMail.SmtpServer = "smtp.live.com";

    WebMail.SmtpPort = 25;

    WebMail.EnableSsl = true;

    WebMail.UserName = "minombre@outlook.com";

    WebMail.From = "minombre@outlook.com";

    WebMail.Password = "micontraseña";

    WebMail.Send(to: Request\["toemail"\], subject: eMailSubject, body:
    eMailMessage);

    }

    catch (Exception ex) {

    eMailSent = false;

    errorMessage = ex.Message;

    }

```

![] (./img/Servicio-WebMail-ASP-NET/image11.png)

###El ejemplo más completo


A modo de resumen de utilización de todas las capacidades de
interactividad, las referimos en lo recogido en el Listado 4.

Las opciones nuevas introducidas se pueden apreciar en la figura adjunta
y se refieren a la programación de un nuevo formulario y su
correspondiente código *Razor* con todos los apartados posibles de un
correo electrónico *WebMail*.

**Listado 4: Ejemplo completo, con todas las opciones de
    interactividad de un WebMail**


```
    @{

    var eMailSent = false;

    var errorMessage = "";

    var fileAttachment = Request\["fileAttachment"\];

    if (IsPost)

    {

    eMailSent = true;

    var eMailSubject = Request\["subject"\];

    if (eMailSubject == null)

    {

    eMailSubject = "Cabecera vacía";

    }

    var eMailMessage = Request\["message"\];

    if (eMailMessage == null)

    {

    eMailMessage = "Mensaje vacío";

    }

    try

    {

    WebMail.SmtpServer = "smtp.live.com";

    WebMail.SmtpPort = 25;

    WebMail.EnableSsl = true;

    WebMail.UserName = Request\["email"\];

    WebMail.From = Request\["email"\];

    WebMail.Password = Request\["password"\];

    var files = new string\[\] { fileAttachment };

    if (fileAttachment == "")

    {

    WebMail.Send(to: Request\["toemail"\],

    cc: Request\["ccemail"\],

    subject: eMailSubject,

    body: eMailMessage);

    }

    else

    {

    WebMail.Send(to: Request\["toemail"\],

    cc: Request\["ccemail"\],

    subject: eMailSubject,

    body: eMailMessage,

    filesToAttach: files);

    }

    }

    catch (Exception ex)

    {

    eMailSent = false;

    errorMessage = ex.Message;

    }

    }

    }

    &lt;!DOCTYPE html&gt;

    &lt;html&gt;

    &lt;head&gt;

    &lt;title&gt;&lt;/title&gt;

    &lt;/head&gt;

    &lt;body&gt;

    &lt;h1&gt;Mensajes Hotmail/Outlook/Live&lt;/h1&gt;

    &lt;h3&gt;Los campos con \* son obligatorios&lt;/h3&gt;

    &lt;form method="POST"&gt;

    E-mail de envío (\*)&lt;br /&gt;

    &lt;input type="email" name="email" /&gt;&lt;br /&gt;

    Contraseña (\*)&lt;br /&gt;

    &lt;input type="password" name="password" /&gt;&lt;br /&gt;

    E-mail del destinatario (\*)&lt;br /&gt;

    &lt;input type="text" name="toemail" /&gt;&lt;br /&gt;

    CC E-mail (\*)&lt;br /&gt;

    &lt;input type="text" name="ccemail" /&gt;&lt;br /&gt;

    Cabecera&lt;br /&gt;

    &lt;input type="text" name="subject" value="" /&gt;&lt;br /&gt;

    Cuerpo del mensaje&lt;br /&gt;

    &lt;textarea rows="6" cols="40"
    name="message"&gt;&lt;/textarea&gt;&lt;br /&gt;

    Archivo(s) adjunto(s)&lt;br /&gt;

    &lt;input type="file" name="fileAttachment" /&gt;&lt;br /&gt;

    &lt;br /&gt;

    &lt;input type="submit" value="Enviar e-mail" /&gt;

    &lt;/form&gt;

    @{if (eMailSent)

    {

    @Html.Raw("&lt;script&gt;alert('CORRECTO\\\\nMensaje enviado');&lt;/script&gt;")

    }

    }

    @if (errorMessage != "")

    {

    @Html.Raw("&lt;script&gt;alert('ERROR\\\\nRevisar todos los
    campos obligatorios');&lt;/script&gt;")

    }

    &lt;/body&gt;

    &lt;/html&gt;

```

![] (./img/Servicio-WebMail-ASP-NET/image12.png)

**NOTA:** Por razones de simplificación del código se ha forzado que sea
preciso rellenar el campo de envío de un destinatario de copia de
cortesía.

Es poco lógico hacerlo así y debería obviarse con condicionales al
estilo *if … else*, que proponemos sea realizado, como se ha hecho para
los archivos adjuntos.

###Conclusiones


A lo largo de este artículo hemos ido desarrollando un ejemplo cada vez
más completo de *WebMail*, hasta llegar a contemplar todas las posibles
opciones de envío de un correo electrónico y su modo de control de
errores y excepciones en tiempo de ejecución.

Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y
no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la
próxima, tengan unas provechosas sesiones de programación.

**©Jaime Peña Tresancos, 2013**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




