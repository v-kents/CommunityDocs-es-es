


#Notificaciones a usuarios y miembros del Service Desk

Por **Juan Ignacio Oller Aznar**

https://twitter.com/jioller 

[Blog](http://blogs.itpro.es/jioller/)


###Justificación:

Para poder gestionar de manera más efectiva las incidencias y solicitudes de los usuarios de nuestra explotación, System Center sigue las recomendaciones de buenas prácticas de ITIL 2011 y de MOF 4.0. 
Estas buenas prácticas no solo se aplicarán a la necesidad de dar respuesta a las incidencias y solicitudes del usuario a la mayor brevedad posible y con la mejor solución disponible, sino que además se deberán documentar todos los pasos que se han dado hasta llegar a la solución. 
Además, se debe tener en cuenta al usuario, el usuario, por lo general, no podrá acceder a los registros del programa de gestión del Service Desk (SCSM) y solo recibirá la información que nosotros, desde el departamento de atención al usuario le facilitemos. 
Establecida la necesidad de comunicación del sistema de gestión de incidentes, solicitudes de servicio, cambios, etc. se ve necesario definir un sistema de notificaciones para facilitar la comunicación del departamento de TI y los distintos departamentos y usuarios. 
A continuación se define el sistema de notificaciones para las incidencias, así como todo el sistema de flujos de trabajo  relacionados con estas notificaciones y las plantillas de comunicación con los usuarios y miembros de TI.
Tomamos como referencia para este documento la gestión de incidentes pero se puede llevar a todos los apartados de Service Manager siguiendo estos pasos con ligeras modificaciones. 
Introducción:
La notificación de eventos relacionados con la gestión de incidencias, problemas, cambios, etc. Debe configurarse desde la sección de notificaciones de la consola de administración de Microsoft System Center Service Manager. 
Esta sección está dividida en tres apartados: 
- Canales
- Plantillas
- Subscripciones
	
Esta división hace que por un lado se tenga configurado el canal por el que se enviarán las notificaciones. Esto es, la información del servidor de envío de correo y una dirección de correo que se empleará para la notificación. 
A continuación se tendrán las plantillas que son los textos que se enviarán a los actores interesados o vinculados al evento relacionado. 
Por último se tendrán las subscripciones, estas son en realidad los condicionantes que hacen que se desencadene el envío de los correos a los actores, además de ser los nexos de unión entre la plantilla y los actores en sí. 

![] (./img/SCSM-Notificaciones-I/image1.png)

Configuración de los canales de notificación:
La configuración de los canales de notificación se realizan desde el menú “Administración > Administración > Notificaciones > Canales”. 

![] (./img/SCSM-Notificaciones-I/image2.png)

Se debe seleccionar la casilla “Habilitar notificaciones de correo electrónico y a continuación se debe cumplimentar la dirección de devolución de correo electrónico, marcar el tiempo de reintento principal tras fallo. 
Posteriormente se deberá agregar aquellos servidores que se quieran usar. 

![] (./img/SCSM-Notificaciones-I/image3.png)

En este caso se usa el servidor SMTP corporativo escribiendo su Fully Quallified Domain Name. Se pasa el número de puerto usado, que por defecto según el estándar SMTP es el puerto 25 y se configura el método de autenticación, que entre los métodos validados de “Autenticación de Windows” y “Anónimo” se ha optado por el segundo.  

![] (./img/SCSM-Notificaciones-I/image4.png)

Una vez configurado ha quedado de la siguiente manera.

![] (./img/SCSM-Notificaciones-I/image5.png)

La configuración de las plantillas se realiza desde el menú “Administración > Administración > Notificaciones > Plantillas”. 
Para crear una nueva plantilla se accederá al panel de tareas y se seleccionará “Crear plantilla de correo electrónico”. 

![] (./img/SCSM-Notificaciones-I/image7.png)

Dentro del asistente de creación de la plantilla habrá que facilitar un nombre y una descripción, que para facilitar el mantenimiento posterior a la implantación, se debe hacer de la manera más clara posible. 
En el presente proyecto se usará la notación de un nombre y descripción como nos mostrados en la imagen situada a los pies del presente párrafo. La recomendación es que siempre se incluya un nombre con la categoría, como por ejemplo “Cambio”, seguido de un guion para diferenciar el nombre del tipo “-“y a continuación un nombre descriptivo sobre la tarea de dicha plantilla, en el caso del ejemplo mostrado “Aviso de cambio completado”; quedando en este caso de la siguiente manera “Cambio - Aviso de cambio completado”.


![] (./img/SCSM-Notificaciones-I/image8.png)

También se debe dar la case de destino. Las clases se tratan en otro punto de Microsoft System Center Service Manager serán: 
- Incidentes
- Problemas
- Solicitudes de Cambios
- Solicitudes de Soporte 
- Revisiones

El último paso para configurar la plantilla es la creación de la misma. El proceso de creación de la misma se ha descrito de la misma manera en que se crea un mensaje de correo electrónico. Las plantillas se componen de dos secciones: 
- Asunto del mensaje
- Cuerpo del mensaje

En ambos casos se ha de introducir el texto a enviar a los actores que tengan relación con este comunicado. Además del texto se pueden insertar cadenas que harán que el sistema cumplimente partes del texto de manera automática. Posteriormente se describirán los campos usados así como las plantillas que se han considerado convenientes para una primera puesta en marcha de SCSM, pero se pueden ir añadiendo nuevas plantillas y notificaciones conforme se crea conveniente. 

![] (./img/SCSM-Notificaciones-I/image9.png)

Configuración de los canales de Suscripciones:
La configuración de los canales de notificación se realizan desde el menú “Administración > Administración > Notificaciones > Suscripciones”. 
Para crear una nueva plantilla se accederá al panel de tareas y se seleccionará “Crear suscripción”. 

![] (./img/SCSM-Notificaciones-I/image10.png)

Dentro del asistente habrá que facilitar un nombre y una descripción, que para facilitar, la entrega al cliente y el mantenimiento posterior, se debe hacer de la manera más clara posible. 
Se recomienda usar la notación de un nombre y descripción, realmente se recomienda usar esta notación en cualquier cambio o nuevo elemento que se haga en SCSM. Siempre se dará un nombre que incluya la categoría, como por ejemplo “incidencia”, seguido de un guion para diferenciar el nombre del tipo “-“y a continuación un nombre descriptivo. Un ejemplo de esto puede ser “incidencia – Notificación de nueva incidencia”. 
También se debe dar la clase de destino. El estudio de las clases queda fuera del alcance del presente documento pero basta con refrescar en este caso que las clases más importante serán: 

- Incidentes
- Problemas
- Solicitudes de Cambios 
- Solicitudes de Soporte
- Revisiones

![] (./img/SCSM-Notificaciones-I/image11.png)

Posteriormente se describen los criterios adicionales. Los criterios adicionales son los que hacen que se active todo el flujo de trabajo de envío de la notificación. Se trata de la validación de una o más condiciones que hacen que se desencadene el workflow. Esto puede ser por ejemplo “cuando el estado sea igual a…” o “cuando el tiempo sea superior a…”. 

![] (./img/SCSM-Notificaciones-I/image12.png)

Se selecciona la plantilla a aplica desde un listado en el que se muestran todas las plantillas disponibles en el sistema.

![] (./img/SCSM-Notificaciones-I/image13.png)

Se pueden proporcionar destinatarios fijos, como por ejemplo, enviar siempre una notificación al responsable del equipo de trabajo para que este esté al tanto de todo lo que sucede en su explotación. En nuestro caso se ha decidido que serán siempre destinatarios relacionados con el flujo y no envíos determinados. Entre todas las posibilidades, se ha decidido que se tendrán tres actores principales para este tipo de notificaciones: 
- Usuario afectado
- Usuario asignado
- Usuario propietario

La diferencia entre los tres es que el primero “usuario afectado “es el que necesita que se le de soporte desde TI. El “usuario asignado” es aquel que gestionará la incidencia, el que debe dar la solución al usuario afectado.  Por último tenemos el “usuario propietario” es aquel que en principio ha creado la incidencia, o también puede ser el supervisor que deberá validar la incidencia.

![] (./img/SCSM-Notificaciones-I/image14.png)

Flujo de trabajo de las notificaciones de SCSM:
Una vez configurados los canales, plantillas, y las subscripciones, cuando un usuario abra una incidencia o se genere un evento que desencadene el flujo de trabajo de notificaciones. Este flujo realizará la elección de la plantilla que se adapte a sus premisas, que puede ser ninguna,  una o varias y a continuación lanzará la plantilla pertinente hacia los subscriptores válidos para este evento. Una vez validados los subscriptores, generará un correo y lo enviará a través de la cuenta configurada en el canal de SCSM. 

![] (./img/SCSM-Notificaciones-I/image15.png)

Plantillas de contacto con Service Deck para SCSM:
Inicialmente se proponen las siguientes plantillas de respuesta a los usuarios para las Incidencias que reporten por algún medio: 
- Nuevo incidente
- Asignación al analista
- Paso a estado pendiente
- Resolución de Incidente
	
En el siguiente caso no se manda correo de notificación al usuario y solo se envía al servicio de TI:
Cierre de Incidente.
	

Inicialmente se establece que todos los mensajes que se envíen a los usuarios irán acompañados del siguiente pie de mensaje para así poder orientar a los usuarios que no estén conformes o tengan dudas. 
___
Común a todas las plantillas:
Si no está conforme con la solución presentada o tiene alguna otra consulta puede ponerse en contacto con el departamento de Sistemas a través del correo xxxxxxx@xxxxxx.xx o el teléfono XXXX. 

Que pase un buen día.
___

A continuación se muestran las plantillas iniciales. Estas plantillas en dos secciones: 
- Asunto del mensaje
- Cuerpo del mensaje
	
Esto se debe a que toda comunicación se realizará a través de correo electrónico para dejar constancia escrita de todo lo reportado por el servicio de Service Desk. 

___
Nota:

En los siguientes puntos se hablará de campos que se añaden mediante el botón “añadir” de la consola de SCSM. Se proporcionará la ruta completa ya que estos textos pueden ser pegados directamente en SCSM y funcionar, pero es recomendable insertarlos mediante el botón de la consola ya que en ocasiones puede generar efectos no deseados al añadirse espacios en blanco durante la operación de copia/pega que modifican el comportamiento e estos campos. 
Un ejemplo de sustitución de estos campos sería $Context/Property[Type='WorkItem!System.WorkItem']/Id$ que en realidad hace referencia al “Identificador”.
___

PLANTILLAS PARA INCIDENCIAS:
A continuación se incorporan algunos ejemplos de plantillas para distintas operaciones con los incidentes. Estas pueden modificarse a gusto del administrador y pueden añadirse nuevas o incluso quitar algunas de las aquí mostradas. 
Incidente – Plantilla de nuevo incidente:
Esta plantilla se utilizará cuando se cumplan las condiciones de creación de un nuevo incidente. 

___
Asunto del mensaje:
Se ha recibido una petición de soporte con identificador: $Context/Property[Type='WorkItem!System.WorkItem']/Id$
___

___
Estimado usuario,
Se ha recibido una petición de soporte a través del sistema de gestión con los siguientes detalles: 

Título: $Context/Property[Type='WorkItem!System.WorkItem']/Id$

Descripción: $Context/Property[Type='WorkItem!System.WorkItem']/Description$

Teniendo en cuenta la urgencia ($Context/Property[Type='WorkItem!System.WorkItem.TroubleTicket']/Urgency$) que ha proporcionado al hacer la solicitud se ha adjudicado una prioridad de: $Context/Property[Type='WorkItem!System.WorkItem.TroubleTicket']/Priority$

Esta petición de soporte va a ser revisada por un analista tan pronto como sea posible.
___

Incidentes - Plantilla de asignación al analista:
Esta plantilla se utilizará cuando se cumplan las condiciones de asignación de un incidente a un analista. 

___
Asunto del mensaje:
La incidencia con Identificador $Context/Property[Type='WorkItem!System.WorkItem']/Id$ ha sido asignada al analista.
___

___
Cuerpo del mensaje:
La petición con Identificador: 
$Context/Property[Type='WorkItem!System.WorkItem']/Id$ 
Con título: 
$Context/Property[Type='WorkItem!System.WorkItem']/Title$
Con fecha de creación: 
$Context/Property[Type='WorkItem!System.WorkItem']/CreatedDate$
y con descripción: 
$Context/Property[Type='WorkItem!System.WorkItem']/Description$

Ha sido asignada a un analista.
___

Incidentes – Plantilla de estado pendiente:
Esta plantilla se utilizará cuando se cumplan las condiciones de paso a estado pendiente de un incidente. 

___
Asunto del mensaje:
La incidencia con Identificador $Context/Property[Type='WorkItem!System.WorkItem']/Id$ ha pasado a estar pendiente.
___

___
Cuerpo del mensaje:
La petición con Identificador: 
$Context/Property[Type='WorkItem!System.WorkItem']/Id$ 
Con título: 
$Context/Property[Type='WorkItem!System.WorkItem']/Title$
Con fecha de creación: 
$Context/Property[Type='WorkItem!System.WorkItem']/CreatedDate$
y con descripción: 
$Context/Property[Type='WorkItem!System.WorkItem']/Description$

Ha pasado a estado PENDIENTE a la espera de algún evento relacionado.
___

Incidentes - Plantilla de resolución de Incidentes:
Esta plantilla se utilizará cuando se cumplan las condiciones de resolución de un incidente, o lo que es lo mismo, cuando se dé por resuelto un incidente por parte del personal de Service Desk. 

___
Asunto del mensaje:
La incidencia con Identificador $Context/Property[Type='WorkItem!System.WorkItem']/Id$ ha sido resuelta
___

___
Cuerpo del mensaje:
La petición con Identificador: 
$Context/Property[Type='WorkItem!System.WorkItem']/Id$ 
Con título: 
$Context/Property[Type='WorkItem!System.WorkItem']/Title$
Con fecha de creación: 
$Context/Property[Type='WorkItem!System.WorkItem']/CreatedDate$
y con descripción: 
$Context/Property[Type='WorkItem!System.WorkItem']/Description$

Ha sido resuelta con fecha y hora: 
$Context/Property[Type='WorkItem!System.WorkItem.TroubleTicket']/ResolvedDate$

El analista reporta la siguiente causa para la resolución: 
$Context/Property[Type='CoreIncident!System.WorkItem.Incident']/ResolutionDescription$
___

Incidente – Plantilla de cierre:
Este correo no se envía al usuario, tan solo se enviará al equipo de soporte. Esta plantilla se utilizará cuando se cumplan las condiciones de cierre de un incidente. O bien porque una vez resuelto se da por definitivamente cerrado o bien por qué se cree que no es necesario estudiar una solución para esta incidencia y se cierra para que no moleste.

___
Asunto del mensaje:
La incidencia con Identificador $Context/Property[Type='WorkItem!System.WorkItem']/Id$ ha sido cerrada por el analista
___

___
Cuerpo del mensaje:
La petición con Identificador: 
$Context/Property[Type='WorkItem!System.WorkItem']/Id$ 
Con título: 
$Context/Property[Type='WorkItem!System.WorkItem']/Title$
Con fecha de creación: 
$Context/Property[Type='WorkItem!System.WorkItem']/CreatedDate$
y con descripción: 
$Context/Property[Type='WorkItem!System.WorkItem']/Description$

Ha sido cerrada por el analista. 

Este correo solo se envía al personal de soporte y no se envía al usuario.
___

