---
redirect_url: https://docs.microsoft.com/
title: Tutorial WebMatrix. Tema 3 – 7. Web social. Sitio basado en Drupal
description: Tutorial WebMatrix. Tema 3 – 7. Web social. Sitio basado en Drupal
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Tutorial WebMatrix. Tema 3 – 7. Web social. Sitio basado en Drupal

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  


*Drupal* es un CMS (*Content Management System*, Sistema de gestión de
contenidos) basado y escrito en PHP, su versatilidad es muy grande,
abarcando desde blogs personales, hasta grandes aplicaciones
empresariales y gubernamentales, con infinidad de módulos
complementarios, temas prediseñados y todo tipo de personalizaciones. Su
primera versión vio la luz en enero de 2001, siendo esperada, en el
momento de escribir el artículo, su versión 8 final.

La distribución se basa en código abierto –libre- y es soportado por una
amplia comunidad de desarrolladores independientes. Su lugar de
referencia oficial es:

[***http://drupal.org***](http://drupal.org/)

![] (./img/Tutorial-WebMatrix-Tema-3–7/image1.png)

Algunos sitios de soporte de *Drupal* en español son:

[***http://drupal.org.es/***](http://drupal.org.es/)

[***http://asociaciondrupal.es/***](http://asociaciondrupal.es/)

En el presente artículo trataremos:

- Utilización de *WebMatrix* para crear un sitio *Drupal*

- Los diversos pasos para su descarga e instalación

- Las etapas de configuración

- Qué hacer para utilizar *Drupal* desde *WebMatrix*

 

###Creación de un sitio Drupal con WebMatrix


Para ello iniciamos un nuevo proyecto basándonos en la **Galería de
aplicaciones** (*App Gallery*) de *WebMatrix 3*, haciendo clic sobre el
icono correspondiente en la ventana de arranque de la aplicación,
ventana de **Inicio rápido**.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image2.png)

Se desplegará el asistente correspondiente, denominado **Sitio a partir
de Web Gallery**. En su panel de la izquierda hacemos clic sobre el
apartado **CMS**, para acotar la búsqueda correspondiente.

En la misma ventana del asistente **Sitio a partir de Web Gallery**,
buscaremos en el panel central el icono correspondiente a *Acquia
Drupal* y haremos clic sobre él para dejarlo seleccionado.

Como **Nombre del sitio**, ya se nos propone uno por defecto; podemos
dar otro que nos sea suficientemente significativo.

Finalizaremos haciendo clic sobre el botón **Siguiente**, en la parte
inferior derecha.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image3.png)

En la segunda ventana del asistente, se nos informa de las
características generales de *Acquia Drupal*, algo que seguramente ya
conoceremos si es que nos hemos decidido a crear un sitio con éste CMS.

Aun podremos cambiar el **Nombre del sitio** si nos parece adecuado y
finalmente seguiremos haciendo clic sobre el botón **Siguiente**, para
pasar a la tercera ventana del asistente.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image4.png)

Ya en la tercera ventana del asistente definiremos los **Requisitos
previos**:

- El tipo de base de datos que nos gustaría utilizar:

- MySQL

- SQL Server

En su caso, la contraseña del administrador de la base de batos

Proseguiremos haciendo clic sobre el botón **Siguiente**, en la parte
inferior derecha.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image5.png)

En la cuarta ventana del asistente se nos muestran las cláusulas de
aceptación de uso (CLUF, *Contrato de Licencia de Usuario Final*), que
hemos de leer detenidamente y de estar de acuerdo seguir haciendo clic
sobre el botón **Acepto**.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image6.png)

Con ello se pasa al apartado **Instalar**.

Primero se descargarán las aplicaciones necesarias y se instalarán
seguidamente.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image7.png)

![] (./img/Tutorial-WebMatrix-Tema-3–7/image8.png)

A la par se procederá a **Configurar** nuestra instalación particular.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image9.png)

Una vez finalizadas las etapas de instalación y configuración, se nos
muestra en pantalla el resultado del proceso, informándonos de si todo
ha ido correctamente.

Para concluir, hagamos clic sobre el botón **Aceptar**.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image10.png)

Se cerrará la ventana del asistente **Sitio a partir de Web Gallery** y
se nos abrirá una ventana del explorador de Internet, en el que vamos a
poner a punto nuestra instalación particular de *Acquia Drupal*.

Lo primero es una simple pantalla de bienvenida, sin más, haremos clic
sobre el hipervínculo **Click here to continue**.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image11.png)

Acto seguido, se procede a la instalación en local de *Acquia Drupal*
con todas las opciones de funcionamiento básicas, que no requerirán
mayor atención hasta llegar a la configuración del sitio.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image12.png)

En la configuración del sitio –**Configure site**-, se nos pedirá la
información detallada de los siguientes apartados:

###Site Information: 

- Site name (campo obligatorio): El nombre identificativo de nuestro
sitio.

- Site e-mail address (campo obligatorio): Será una dirección e-mail a la
que se le enviarán por ejemplo información de registro; se ha de cuidar
especialmente, así se nos advierte, de que no sea filtrada como *spam*
por nuestro servidor.

- Acquia subscription identifier: El identificador de nuestra **Acquia
Network subscription**, de disponer de ella.

- Acquia subscription key: La correspondiente llave de acceso.

###Site Maintenance Account: 

- Username (campo obligatorio): Nombre de usuario para acceder a las
labores de mantenimiento del sitio.

- E-mail address (campo obligatorio): Dirección e-mail de seguridad, a la
que se nos mandarán las informaciones caso de perder datos de acceso.

- Password (campo obligatorio): Contraseña de acceso, debe ser de un
mínimo de seguridad.

- Confirm password (campo obligatorio)

### Server Settings: 

- Default country

- Default timezone

###Update Notifications: 

- Check for updates automatically

- Receive e-mail notifications: Notificaciones de interés de *Drupal* a
nuestro correo electrónico y envío de información anónima de nuestro
sitio a *Drupal*.

- Una vez finalizado, deberemos hacer clic sobre el botón **Save and
continue**.

 

![] (./img/Tutorial-WebMatrix-Tema-3–7/image13.png)

El procedimiento de instalación en local y puesta a punto personalizada
ha finalizado.

Para tener acceso a nuestro sitio, haremos clic sobre el hipervínculo
**Visit your new site**.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image14.png)

Ahora ya nos encontraremos en la vista de entrada de nuestro sitio
*Drupal*.

Si deseamos realizar las pertinentes labores de mantenimiento, incluir
contenidos y demás, deberemos introducir nuestro identificador y nuestra
contraseña en el panel de la derecha y pasaremos a los que se observa en
la figura posterior.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image15.png)

 

![] (./img/Tutorial-WebMatrix-Tema-3–7/image16.png)

Para acceder en cualquier momento a nuestro sitio en local de *Drupal*,
cargaremos el proyecto en *WebMatrix* y ya en la ficha **Sitio** haremos
clic sobre la **Dirección URL**.

![] (./img/Tutorial-WebMatrix-Tema-3–7/image17.png)

 

###Conclusiones


Esperamos que el presente artículo les haya sido de utilidad y se animen
a crear su propio sitio *Drupal*.

El asistente de *WebMatrix* es una excelente guía de instalación, les
llevará un cierto tiempo realizarlo, pero ha sido uno de los más
detallados que nos hemos encontrado. Desafortunadamente desde
*WebMatrix* sólo se encuentra en inglés, un inconveniente que
desearíamos fuese solventado. Pero acudiendo al foro de *Drupal*
podremos encontrar la información pertinente para la localización del
software.

Les deseamos unas muy felices y provechosas horas de programación y
hasta la próxima reciban un cordial saludo.

 

 

 

**©Jaime Peña Tresancos & Ana Peña Vidal, 2014**

**Twitter: @jpt219**

**LinkedIn:**
[*es.linkedin.com/pub/jaime-peña-tresancos/28/677/696*](http://es.linkedin.com/pub/jaime-pe%C3%B1a-tresancos/28/677/696)




