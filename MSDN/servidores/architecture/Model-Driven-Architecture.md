<properties
	pageTitle="Model Driven Architecture (MDA)"
	description="Model Driven Architecture (MDA)"
	services="windows"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="windows"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>

#Model Driven Architecture (MDA)

Por **Mike Armas**                                                                                                                                                       Junio 2012

[Blog](http://www.sg.com.mx/)
 
Una de las iniciativas de mayor importancia en el Object Management
Group (OMG) es la arquitectura dirigida por modelos (Model Driven
Architecture o MDA), que es un marco de trabajo de arquitecturas para
desarrollo de software, con tres metas principales: portabilidad,
interoperabilidad y reusabilidad. Un aspecto fundamental de MDA es su
habilidad para contemplar el ciclo completo de desarrollo, cubriendo
análisis, diseño, programación, pruebas, despliegue y mantenimiento.

MDA resuelve los retos de los sistemas actuales altamente conectados y
constantemente cambiantes, tanto en reglas de negocio como en tecnología
proponiendo un marco de trabajo para una arquitectura que asegura:

- Portabilidad, aumentando el re-uso de las aplicaciones y reduciendo
    el costo y complejidad del desarrollo y administración de
    las aplicaciones.

- Interoperabilidad entre plataformas, usando métodos rigurosos para
    garantizar que los estándares basados en implementaciones de
    tecnologías múltiples tengan todos idénticas reglas de negocio.

- Independencia de plataforma, reduciendo el tiempo, costo y
    complejidad asociada con aplicaciones desplegadas en
    diferentes tecnologías.

- Especificidad del dominio, a través de modelos específicos del
    dominio, que permiten implementaciones rápidas de aplicaciones
    nuevas, en una industria específica sobre diversas plataformas.

- Productividad, permitiendo a los desarrolladores, diseñadores y
    administradores de sistemas usar lenguajes y conceptos con los que
    se sienten cómodos, facilitando la comunicación e integración
    transparente entre los equipos de trabajo.Conceptos básicos de MDA

- Puntos de vista del sistema. MDA especifica tres puntos de vista en
    un sistema: independiente de cómputo, independiente de plataforma y
    específico de plataforma. El punto de vista independiente de cómputo
    se enfoca en el contexto y los requisitos del sistema, sin
    considerar su estructura o procesamiento. El punto de vista
    independiente de plataforma se enfoca en las capacidades
    operacionales del sistema fuera del contexto de una plataforma
    específica, mostrando sólo aquellas partes de la especificación
    completa que pueden ser abstraídas de la plataforma. El punto de
    vista dependiente de plataforma agrega al punto de vista
    independiente los detalles relacionados con la
    plataforma específica. Una plataforma es un conjunto de subsistemas
    y tecnologías que proveen un conjunto coherente de funcionalidad por
    medio de interfaces y patrones de uso. Los clientes de una
    plataforma hacen uso de ella sin importarles los detalles
    de implementación. Estas plataformas pueden ser sistemas operativos,
    lenguajes de programación, bases de datos, interfaces de usuario,
    soluciones de middleware, etc.

- Independencia de Plataforma. Cualidad que un modelo puede exhibir
    cuando es expresado independientemente de las características de
    otra plataforma.

- Modelo de Plataforma. Describe un conjunto de conceptos técnicos de
    una plataforma, representando sus elementos y los servicios
    que provee. También especifica las restricciones en el uso de estos
    elementos y servicios por otras partes del sistema.

- Transformación de Modelos. Proceso de convertir un modelo a otro
    dentro del mismo sistema. Una transformación combina el modelo
    independiente de plataforma con una definición de otra plataforma,
    para producir un modelo específico a una plataforma correspondiente
    a un punto de vista del sistema, como interfaz de usuario,
    información, ingeniería, arquitectura, etc.

###Elementos de MDA


La clave para una integración e interoperabilidad exitosa reside en el
uso y administración inteligente de los metadatos en todas las
aplicaciones, plataformas, herramientas y bases de datos. Para todos
estos el concepto de negocio de un cliente es el mismo, la definición
del cliente no cambia sin importar la plataforma, aplicación o
herramienta. Los estándares principales de MDA (UML, MOF, XMI y CMW) son
la base para construir esquemas coherentes para crear, publicar y
administrar modelos en una\
arquitectura dirigida por modelos, sin importar el tipo de sistema que
se va a construir. La figura 1 ilustra la arquitectura de MDA. (Ver
Figura 1)

Arquitectura de MDA

![] (./img/Model-Driven-Architecture/image1.png)


- Meta Object Facility (MOF). MOF es un lenguaje común y abstracto
    para la especificación de meta-modelos, que sirve como un modelo
    común para UML y CMW. MOF es una arquitectura de metamodelos de
    cuatro capas. La especificación de MOF provee: i) Un modelo
    abstracto de los objetos y sus relaciones; ii) un conjunto de reglas
    para mapear un metamodelo a interfaces independientes del\
    lenguaje; iii) reglas definiendo el ciclo de vida, composición y
    semántica de los modelos basados en MOF; iv) una jerarquía de
    interfaces reflexivas definiendo operaciones genéricas para
    descubrir y manipular las propiedades de los meta-modelos basados
    en MOF.

- Common Warehouse Metamodel (CWM). Es un meta-modelo que especifica
    interfaces que pueden ser usadas para habilitar el intercambio de
    metadatos de almacenes de datos e inteligencia de negocio, entre
    distintas herramientas, plataformas y metadatos en ambientes
    heterogéneos y distribuidos de almacenes de datos. CMW se basa en
    tres estándares: MOF, UML y XMI. Los modelos CMW permiten a los
    usuarios rastrear el linaje de los datos, mediante objetos que
    describen de donde vienen los datos y cuándo y cómo se crearon
    los datos.

- Unified Modeling Language (UML). El Lenguaje de Unificado (UML)
    sirve como notación base para la definición de CMW. Dado que UML
    utiliza una definición precisa, a partir de sus modelos visuales se
    pueden realizar traducciones automáticas a otros lenguajes formales.

- XML Metadata Interchange (XMI). Estándar que mapea el MOF al
    estándar de XML del World Wide Web Consortium. XMI define como los
    tags de XML se usan para representar en XML modelos serializados que
    cumplan con el estándar de MOF. Esto facilita el intercambio\
    de modelos entre diversos modelos y herramientas.

###Modelos MDA


MDA especifica tres modelos básicos de un sistema, correspondientes a
los puntos de vista expresados anteriormente. Estos modelos pueden verse
como niveles de abstracción donde en cada nivel pueden\
construirse varios modelos

- Modelo Independiente de Cómputo. Al modelo independiente de cómputo
    (Computation Independent Model o CIM) se le conoce como el modelo
    del dominio o del negocio, por que se modela en términos\
    familiares a los expertos del negocio, representa exactamente lo que
    se espera del sistema, sin contemplar toda la información
    relacionada con la tecnología con el objetivo de mantenerse
    independiente de cómo será implementado el sistema. Este modelo
    salva el abismo existente entre los expertos del negocio y los
    responsables de las tecnologías de información. En una
    especificación MDA el modelo CIM debe ser rastreable a las
    construcciones que lo implementan yasean independientes o
    específicas a una plataforma.

- Modelo Independiente de Plataforma. El modelo independiente de
    plataforma (Platform Independent Model o PIM) exhibe un grado de
    independencia tal permite mapearlo a una o varias\
    plataformas, Esto se logra definiendo una serie de servicios
    abstrayéndolos de los detalles técnicos para que otros modelos
    especifiquen cómo será la implementación.

    Modelo Específico de Plataforma. El modelo específico de plataforma
    combina la especificación de un PIM con los detalles paraindicar
    como el sistema usa una plataforma en particular.

###El Proceso MDA


Un sistema complejo puede incluir varios modelos relacionados entre sí,
organizados a través de varios niveles de abstracción, con mapeos
definidos de un conjunto de modelos hacia otro y que pueden incluir:

- Un CIM que contenga todas las reglas del negocio definidas en el
    modelo del proceso de negocio.

- Un PIM que defina el modelo conceptual completo con todas
    sus relaciones.

- Uno o varios PSM para generar componentes de ejecución y pruebas
    del sistema.

La idea básica de MDA, más allá de los modelos CIM/PIM/PSM, es utilizar
los dos conceptos clave: Modelo y Transformación. El primer paso es
construir un modelo conceptual (PIM) expresado en UML, el cual será
transformado hacia varios PSM. Las figuras 2 a 6 muestran el ejemplo de
cómo un PIM se transforma en varios PSM, uno para el modelo de datos,
otro para las interfaces distribuidas y otro para las clases de
implementación. Estas transformaciones de un PIM en varios PSM pueden
realizarse las veces que se requiera. Si se hacen cambios al modelo
conceptual se pueden regenerar los PSM automáticamente. En el sitio web
de MDA ([*www.omg.org/mda*](http://www.omg.org/mda)) se puede encontrar
una lista de\
herramientas capaces de realizar estas transformaciones.

**Modelo Conceptual**

![] (./img/Model-Driven-Architecture/image2.png)



- Transformaciones MDA

![] (./img/Model-Driven-Architecture/image3.png)


**Capa de Descripción de Datos**

![] (./img/Model-Driven-Architecture/image4.png)


###Pensando en la Transición


Moverse de un enfoque tradicional de desarrollo de software a uno
dirigido por modelos no es sencillo, requiere de un proyecto formal con
planeación, patrocinadores y recursos. El esfuerzo es importante, pero
las ventajas son muchísimas. La promesa de la arquitectura dirigida por
modelos es facilitar la creación de modelos y transformaciones
automáticas, buscando flexibilidad a largo plazo en términos de:

Obsolescencia tecnológica: Nueva infraestructura puede ser incorporada y
soportada fácilmente por los diseños existentes.\
Portabilidad: Funcionalidad existente se puede migrar a nuevos ambientes
y plataformas\
Productividad: La generación automática de los PSM acelera el
desarrollo\
Integración: Los puentes de integración entre sistemas pueden realizarse
usando modelos y transformaciones.\
Calidad: Existen modelos ejecutables de UML, con los cuales los modelos
pueden probarse antes de la implementación. Lockheed Martin Aeronautics
realizó este tipo de pruebas con el software de misión del F16.

**Modelo Session Bean**

![] (./img/Model-Driven-Architecture/image5.png)

**odelo C\#**

![] (./img/Model-Driven-Architecture/image6.png)


