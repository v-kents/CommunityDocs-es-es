---
title: Definir la base de datos del proyecto
description: Definir la base de datos del proyecto
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: win-dev
ms.custom: CommunityDocs
---

  



#Definir la base de datos del proyecto
  
  
Por **Nicolás Herrera**                                                                             Agosto 2012
                                                                                              
MVP, miembro Gold del grupo de Microsoft Community Specialist Colombia, blogger y speaker   
 
[Blog](http://nicolocodev.com/)
 
Hola, por defecto cuando trabajamos con CodeFirst este usa .\\
SQLEXPRESS para hospedar la base de datos, y la creara con el nombre
definido en nuestra clase de contexto. Pero si deseamos cambiar este
comportamiento ¿que debemos hacer? bien, en este post enseñare como usar
aun base de datos Existente, como crear una nueva y como usar dos Bases
de datos en “simultaneo”.

Dadas las entidades:

>C\#

```

    public class Pais

    {

    public int Id { get; set; }

    public string Nombre { get; set; }

    }

    public class Ciudad

    {

    public int Id { get; set; }

    public int PaisId { get; set; }

    public virtual ICollection Pais { get; set; }

    public string Nombre { get; set; }

    }

```

Y dado el contexto:



>C\#

```

    public class DemosCodeFirstEntities : DbContext

    {

    public DbSet Pais { get; set; }

    public DbSet Ciudad { get; set; }

    }

```  

### Como usar una base de datos existente.

Para emplear una base de datos existente, nos bastara con entender la
convención de connectionstring, que nos dice que se empleara la cadena
de conexión que use el mismo nombre del contexto. Entonces podemos
emplear una connectionstring de la forma:

>C\#

```

    connectionString="Data Source=.;Initial Catalog=EFDemo;Persist
    Security Info=True;User ID=sa;Password=\*\*\*\*\*"

    providerName="System.Data.SqlClient" /&gt;

    Si ejecutamos el siguente codigo:

    using (var context = new Contexto.DemosCodeFirstEntities())

    {

    context.Pais.Add(new Pais { Nombre = "Argelia" });

    context.SaveChanges();

    }

```

Veremos que CodeFirst ha empleado la base de datos que le hemos indicado
en el ConnectionString, solo por haber usado la convención de cadena de
conexión.

**– Como crear una nueva base de datos.**

Para crear una nueva base de datos, basta con reusar la cadena de
conexión del ejemplo anterior, pero en lugar de definir un catalogo
existente, vamos a emplear un catalogo nuevo, así:


```
    &lt;connectionStrings&gt;

    &lt;add name="DemosCodeFirstEntities"

    connectionString="Data Source=.;Initial Catalog=CreadoNuevo;Persist
    Security Info=True;User ID=sa;Password=\*\*\*\*"

    providerName="System.Data.SqlClient" /&gt;

    &lt;/connectionStrings&gt;

```

Al ejecutar y **usar el contexto** si revisamos, veremos que se ha
creado un nuevo catalogo con las tablas que hemos definido y una
adicional, la *EdmMetadata* este es empleado por EF para saber que el
modelo fue mapeado correctamente y es compatible con la base de datos.
Si modificáramos entonces el modelo agregando una tabla, obtendríamos
una excepción y deberíamos eliminar y crear nuevamente la base de datos.
Sobre como evitar este comportamiento, lo veremos en un post siguiente.

### Como usar dos bases de datos.

Para poder emplear dos bases de datos, una para test y otra para
producción por ejemplo, debemos usar dos connectionstring con distinto
nombre y agregar un constructor al contexto que nos permita usarlo, así:

App.Config:

>C\#

```

    DemosCodeFirstEntitiesTest"

    connectionString="Data Source=.;Initial Catalog=BaseTest;Persist
    Security Info=True;User ID=sa;Password=\*\*\*\*"

    providerName="System.Data.SqlClient" /&gt;

    El Conetxto:

    public class DemosCodeFirstEntities : DbContext

    {

    public DemosCodeFirstEntities(string connectionString)

    : base(connectionString)

    {

    }

    public DbSet Pais { get; set; }

    public DbSet Ciudad { get; set; }

    }

``` 

Si compilamos obtendremos un error, esto se debe a que este
comportamiento no pertenece al ensamblado *EntityFramework*, debemos
agregar una referencia a *System.Data.Entity*. Y del lado de quien lo
consume, pasamos el nombre de la cadena de conexión que deseamos usar:

>C\#

```

    using (var context =
    new Contexto.DemosCodeFirstEntities("DemosCodeFirstEntitiesTest"))

    {

    context.Pais.Add(new Pais { Nombre = "Italia" });

    context.SaveChanges();

    }

``` 

Como ven entendiendo y usando las convenciones que maneja code first
podemos trabajar de manera muy flexible.

Espero les sea de utilidad.

Hasta el próximo post.


