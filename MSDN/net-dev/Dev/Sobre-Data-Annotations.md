---
redirect_url: https://docs.microsoft.com/
title: Entity Framework Sobre Data Annotations
description: Entity Framework Sobre Data Annotations
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#[Entity Framework] Sobre Data Annotations
  
Por **Nicolás Herrera**                                                                            Julio 2012
                                                                                              
MVP, miembro Gold del grupo de Microsoft Community Specialist Colombia, blogger y speaker   
  
[Blog](http://nicolocodev.wordpress.com/)
  
Hola, ya llevaba tiempo sin escribir en esta serie en la que intento
cubrir aspectos sobre todas la versiones de este potente *ORM*. En el
último post que alcance escribir aun tocaba el tema de las convenciones
que debemos respetar para que el Entity Framework nos entienda lo que
queremos hacer, pero si dado el caso no queremos extender uno de estos
comportamientos ¿como lo logramos? Pues bien, para eso llegaron los Data
Annotations. Estos son atributos que podemos usar para definir
información adicional a nuestras clases de entidad, con estas podemos
sobrescribir el comportamiento por defecto de las convenciones de entity
framework.

Para poder usar Data Annotations referenciamos la librería
*System.ComponentModel.DataAnnotations *

###Ejemplos
--------

### Llave primaria

Como vimos en el primer post sobre codefirst vimos que Entity Framework
tomara como llave primaria aquella propiedad que lleve como nombre o que
en su nombre tenga el sufijo “Id” o “ID”, y es muy conveniente, pues no
se me ocurriría una llave primaria sin esta convención, pero dado el
caso yo quisiera que mi tabla Pais, su llave primaria llevara otro
nombre, como por ejemplo *PaisLlavePrimaria* solo debemos usar el
Atributo *\[Key\],* así:

>C\#

```
    public class Pais

    {

    \[Key\]

    public int PaisLlavePrimaria { get; set; }

    public string Nombre { get; set; }

    }
```

### Configurando tipo Identity de los tipos numéricos

Por defecto cuando Entity Framework nos genera una llave primaria la
deja como Identity incremento uno. Para sobrescribir este comportamiento
basta con usar el atributo *DatabaseGenerated* y seleccionar una de las
opciones del enumerador
**[DatabaseGeneratedOption](http://msdn.microsoft.com/es-es/library/system.componentmodel.dataannotations.databasegeneratedoption(v=vs.103).aspx),**
así:

>C\#

```

    public class Pais

    {

    \[DatabaseGenerated(DatabaseGeneratedOption.None)\]

    public int Id { get; set; }

    public string Nombre { get; set; }

    }

```

### Campo obligatorio

Basta con decorarlo con *Required,* así:

>C\#

```

    public class Pais

    {

    public int Id { get; set; }

    \[Required\]

    public string Nombre { get; set; }

    }

```

### Longitud del campo.

Para definir la longitud de un campo basta con decorarlo con el atributo
*MaxLength,* así:

>C\#


```
    public class Pais

    {

    public int Id { get; set; }

    \[MaxLength(30)\]

    public string Nombre { get; set; }

    }

```

### Ignorar una propiedad

Si tenemos una propiedad que no deseamos que se envie como columna la
base de datos, basta con decorarla con el atributo *NotMapped,* así:

>C\#

```

    public class Pais

    {

    public int Id { get; set; }

    public string Nombre { get; set; }

    \[NotMapped\]

    public int Poblacion { get; set; }

    }

```


### Mapear una propiedad a una columna con distinto nombre

Si en nuestro modelo conceptual trabajamos nombres que no nos gustaría
enviar de esa forma a la base de datos, basta con emplear el atributo
*Column* y especificar el nombre, este nombre será con el que quede
nuestra columna en la base de datos, así:

>C\#

```

    public class Pais

    {

    public int Id { get; set; }

    \[Column("NombrePais")\]

    public string Nombre { get; set; }

    }

```
Bien, estos son algunos de los atributos de lo que podemos echar mano
cuando deseemos sobrescribir alguna de las convenciones que maneja por
defecto Entity Framework




