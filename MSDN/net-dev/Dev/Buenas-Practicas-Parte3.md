---
redirect_url: https://docs.microsoft.com/
title: Buenas prácticas de codificación para capas de acceso a datos de aplicaciones (III)
description: Buenas prácticas de codificación para capas de acceso a datos de aplicaciones (III)
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Buenas prácticas de codificación para capas de acceso a datos de aplicaciones (III)

![] (./img/Buenas-Practicas-Parte3/image1.png)

<http://www.dnmplus.net>

Por **Enrique Catalá Bañuls y Enrique Puig Nouselles (SolidQ)**

En nuestras entregas anteriores, todo lo
que hemos visto ha sido un desarrollo manual de la capa de acceso a
datos. Decimos que es un modelo de desarrollo manual porque son los
desarrolladores los responsables de implementar todos los elementos que
componen esta capa. Ya bien decidamos utilizar consultas ad-hoc,
consultas parametrizadas o procedimientos almacenados, somos nosotros
quienes tenemos que diseñar dichos elementos y programar el código .NET
necesario para ejecutarlas y recoger los resultados. Este mes nos
centraremos en un modelo de desarrollo diferente: el basado en la
utilización de un sistema ORM (*Object-Relational Mapping*).

El desarrollo de capas de acceso a datos con ORM no es otra cosa que una
técnica de programación que mapea una base de datos relacional a una
serie de **objetos** que pueden ser manipulados desde los lenguajes de
programación orientados a objetos utilizados tradicionalmente hoy en día
para el desarrollo. Lo que se persigue con los ORM es facilitar y
automatizar el proceso de desarrollo manual que veíamos en nuestros
artículos anteriores.

###Motivación de los ORM


Cuando se trata de desarrollar aplicaciones de acceso a datos, hay que
tener en cuenta que intervienen dos elementos fundamentales para el
desarrollo de dicha aplicación (figura 1). El primero es **el
aplicativo**, todo lo que serían las líneas de código y los elementos
necesarios para ensamblar la aplicación. El segundo es **la base de
datos**, donde tendríamos todos los datos a los que la aplicación
necesita acceder.

**Figura 1. Ejemplo de arquitectura de aplicación**

![] (./img/Buenas-Practica- Parte3/image2.png)

Debido a esta separación de elementos, nos encontramos con dos perfiles
muy diferenciados para el desarrollo de dichas aplicaciones:

1.  **Desarrollador**: Especialistas en lenguajes de programación
    declarativos u orientados a objetos, como por ejemplo C, C++,
    VB.NET, C\#, Java, etc.

2.  **DBA (Database Administrator) / DBD (Database Developer)**:
    Especialistas en programación y desarrollo orientados a base de
    datos mediante el uso del estándar SQL.


El perfil del desarrollador se encargaría de implementar toda la parte
relativa al aplicativo, mientras que el DBA/DBD se encargaría de
mantener e implementar procesos a nivel de base de datos. Tal y como se
muestra en las figuras 2 y 3, los desarrolladores piensan en los datos
que manejan las aplicaciones como una serie de entidades u objetos, con
atributos, colecciones de objetos etc. En cambio, el DBA/DBD los ve
desde un punto de vista relacional, y piensa en tablas, relaciones,
integridad referencial, restricciones etc. Claramente, son dos
perspectivas muy distintas sobre una misma aplicación.

**Figura 2. ¿Cómo piensa un desarrollador?**


![] (./img/Buenas-Practicas-Parte3/image3.png)


**Figura 3. ¿Cómo piensa un DBA/DBD?**

![] (./img/Buenas-Practicas-Parte3/image4.png)

En toda aplicación existe un punto en el que hay que establecer conexión
con la base de datos y comenzar a realizar operaciones con los mismos.
Este es el punto más conflictivo, ya que es un punto en el que se pisa
el territorio del desarrollador y el territorio del DBA/DBD. Es en este
punto cuando intervienen los ORM, *frameworks* capaces de generar estas
capas intermedias de acceso a datos. Los motivos del uso de ORM son
varios, pero en este artículo destacamos cuatro:

1.  **Abstracción del servidor de base de datos**: Al desarrollador no
    le importa contra qué base de datos esté trabajando; le da igual si
    conecta contra un servidor de SQL Server o de Oracle, lo que le
    interesa es acceder a los datos. Para ello, el ORM genera toda una
    serie de traducciones a la implementación de SQL del servidor de
    base de datos que estemos usando; por ejemplo, si usáramos SQL
    Server sería T-SQL, y si usáramos Oracle sería PL-SQL.

2.  **Rechazo al lenguaje SQL**: El desarrollador no conoce o no es
    experto en el lenguaje SQL o su implementación específica para un
    servidor concreto; este conocimiento se corresponde más con un
    perfil de DBA/DBD. El desarrollador se siente más cómodo trabajando
    con lenguajes más familiares para él.

3.  **Manejo de cadenas de texto**: Una de las posibilidades para lanzar
    consultas a la base de datos desde la capa de acceso a datos son las
    consultas ad-hoc que hemos estudiado en artículos anteriores. Para
    lanzar este tipo de consulta, se requiere el trabajo con cadenas de
    texto, lo cual no suele gustar mucho a los desarrolladores ya que
    puede producir errores en tiempo de ejecución y no en tiempo de
    compilación**.** Si queremos lanzar una consulta **SELECT** contra
    una base de datos, en la capa de acceso a datos la tendremos que
    codificar como cadena de texto, y si el desarrollador no es experto
    en este lenguaje, podría cometer algún tipo de error. Este error
    solamente será detectado en tiempo de ejecución y no en tiempo de
    compilación, que es a lo que el desarrollador está acostumbrado.

4.  **Estar a la moda**: Parece que en el mundo de la informática hay
    tecnologías que se ponen de moda. Aparecen los ORM, se promocionan,
    y ya parece que si no se utiliza esta tecnología te estás
    quedando obsoleto. Hay muchas organizaciones que adoptan esta
    tecnología por pensar que sus aplicativos podrían quedar obsoletos,
    independientemente de las ventajas o desventajas que un ORM
    pueda aportar.


###Pros y contras de los ORM


La utilización de ORM para nuestras capas de acceso a datos nos
proporciona una serie de ventajas, pero es importante saber también sus
inconvenientes.

###Ventajas


1.  **Autonomía completa del desarrollador**: Con los ORM podemos ser
    capaces de desarrollar una aplicación de acceso a datos sin escribir
    ninguna línea en lenguaje SQL y sin ningún tipo de interacción con
    el DBA/DBD. Por lo tanto, el desarrollador puede ser completamente
    autónomo en el desarrollo de la misma.

2.  **Tiempo de desarrollo reducido**: Gracias a los ORM, vamos a
    encontrarnos que para desarrollar los métodos de acceso a datos
    basta con escribir 4 ó 5 líneas de código. Esto reduce bastante el
    tiempo de desarrollo de la capa de acceso a datos, permitiendo al
    desarrollador centrarse más en la capa de presentación y en la
    lógica de negocio.

3.  **Curva de aprendizaje pequeña**: Normalmente, los ORM permiten a
    los desarrolladores trabajar con entidades/objetos; esto es bastante
    útil y cómodo, puesto que son lenguajes/conceptos que ya conocen y
    en los cuales son expertos. El desarrollador se siente más cómodo y
    es más productivo.

4.  **Errores en tiempo de ejecución**: Al trabajar normalmente con
    entidades/objetos, cuando los desarrolladores codifican cualquier
    operación de acceso a datos obtienen errores de codificación en
    tiempo de compilación, lo cual facilita mucho el trabajo.


###Inconvenientes

Principalmente sólo existe un inconveniente cuando utilizamos ORM, pero
éste es muy importante y se debe tenerlo en cuenta a la hora de decidir
si utilizar un ORM o no. El principal inconveniente de los ORM es la
**poca escalabilidad** que tienen. Como ya hemos comentado antes, los
ORM realizan una serie de traducciones a lenguaje SQL de todas aquellas
operaciones que programemos a través del lenguaje del ORM en concreto.
El problema son **las malas traducciones** y **la mala calidad** del
código traducido. Aunque éstas van mejorando a medida que pasa el
tiempo, todavía siguen quedando escenarios donde es mucho mejor utilizar
procedimientos almacenados con buen código SQL, diseñado idealmente por
un DBA/DBD, que las traducciones de los ORM.

###Entity Framework

Vamos a presentar ahora de manera más detallada el ORM más popular de
Microsoft, llamado **Entity Framework** (EF), actualmente en su versión
5.

###Introducción

EF es un conjunto de librerías de clases y herramientas que permite a
los desarrolladores crear aplicaciones de acceso a datos, pero en vez de
programar contra modelos relacionales para acceder a estos datos,
pasamos a programar contra esquemas o modelos **conceptuales**, de modo
que el desarrollador puede trabajar sobre el modelo conceptual de la
aplicación y centrarse en “lo que quiere conseguir”, y no perder tiempo
en “cómo lo quiere conseguir”.

###Entity Data Model

Normalmente, cuando se desarrolla una aplicación de acceso a datos
tenemos un esquema o modelo de datos como que se presenta en la figura
4. En este modelo de datos de una aplicación de acceso a datos
distinguimos:

1.  **Modelo conceptual**: Modelo que define el comportamiento de la
    aplicación, y se corresponde con la perspectiva que tiene el
    desarrollador sobre la aplicación de acceso a datos. En el modelo
    conceptual entrarían todas las entidades o clases de la aplicación,
    las relaciones, atributos, colecciones de objetos etc.

2.  **Modelo lógico**: Modelo que define el diseño de la base de datos
    con la que va a trabajar la aplicación de acceso a datos. Incluye
    todo lo que serían tablas, claves, restricciones etc.

3.  **Modelo físico**: Modelo que define la implementación del
    modelo lógico. Aquí se incluirían los Índices en *clusters* o
    *heaps*, particiones, etc.


**Figura 4. Modelo de datos**

![] (./img/Buenas-Practicas-Parte3/image5.png)

Lo que va a hacer EF es generarnos un nuevo elemento denominado **Modelo
de datos de entidades** (*Entity Data Model*, EDM). A partir de ahora,
nuestra aplicación pasa a trabajar contra el EDM. Este nuevo elemento
abarca lo que serían el modelo conceptual y el modelo lógico (figura 5).

**Figura 5. Entity Data Model**

![] (./img/Buenas-Practicas-Parte3/image6.png)

De este modo, EF nos abstrae del modelo lógico, que recordemos que era
el modelo relacional, para dejar paso a un modelo conceptual que es el
EDM. Esta abstracción se realiza gracias a una serie de mapeos entre
tablas o entidades del modelo relacional con tablas o entidades del
modelo conceptual (figura 6). Con estos mapeos, un desarrollador
solamente tiene que centrarse en trabajar con las entidades de la
aplicación, que a su vez están vinculadas con las tablas del modelo
relacional. El resto de operaciones con la base de datos corren a cuenta
del ORM que, como ya hemos dicho antes, se encarga de traducir las
operaciones a código SQL.

**Figura 6. Mapeo entre el modelo conceptual y el modelo lógico**

![] (./img/Buenas-Practicas-Parte3/image7.png)

###Operaciones con EF


Una vez tenemos definido el EDM, lo siguiente es realizar operaciones
contra dicho modelo. EF soporta todo tipo de operaciones CRUD (*Create*,
*Read*, *Update*, *Delete*). A continuación vamos ver un ejemplo de cada
uno de los tipos de operaciones de actualización (inserción, borrado,
modificación) utilizando C\# y EF.

###Inserción


Para realizar la inserción de un registro, un ejemplo de código basado
en EF podría ser el que se presenta en el listado 1. Como podemos
observar, el código es muy sencillo y entendible para un desarrollador.
En este caso, la entidad **Department** está mapeada a una tabla de la
base de datos que se llama exactamente igual.

**Listado 1**

>C\#

```

public void AddDepartment(Department dep)

    {

    using (CompanySalesEntities ctx = new CompanySalesEntities())

    {

    ctx.Departments.AddObject(dep);

    ctx.SaveChanges();

    }

    }
```

Básicamente los pasos que se siguen son:

1.  Instanciar el EDM, como si fuera una base de datos virtual.

2.  Insertar esta nueva entidad en la colección de departamentos del
    modelo (base de datos virtual). Esta base de datos virtual posee
    varias colecciones de entidades, y cada colección ofrece un método
    denominado **AddObject**, que sirve para insertar nuevos registros.

3.  Ejecutar **SaveChanges**. Este método hace que se confirme la
    inserción y se ejecute físicamente en la base de datos.


Si lanzamos el SQL Profiler y capturamos el código T-SQL que nos genera
EF, veremos que para la llamada en C\# que se muestra en el listado 2,
se generaría el código T-SQL del listado 3, en el que podemos ver cómo
se ejecuta una sentencia **insert** parametrizada mediante el
procedimiento **sp\_executesql**, lo que ofrece todas las ventajas que
hemos comentado al estudiar los patrones de bajo nivel en artículos
anteriores.

**Listado 2**

>C\#

```

    DAO d = new DAO();

    d.AddDepartment(new Department() { name = "Dep nuevo" });
```

**Listado 3**
```

    exec sp\_executesql N'insert \[dbo\].\[Department\](\[name\])

    values (@0)

    select \[DepartmentID\]

    from \[dbo\].\[Department\]

    where @@ROWCOUNT &gt; 0 and \[DepartmentID\] =
    scope\_identity()',N'@0 varchar(30)',@0='Dep nuevo'
```

###Borrado


Para realizar el borrado de un registro de la base de datos, tendremos
el código que se presenta en el listado 4. El código es muy parecido al
de inserción, con la diferencia de que en este caso:

1.  Localizamos el objeto que queremos borrar.

2.  Llamamos al método **DeleteObject** de la colección **Departments**.

3.  Confirmamos la transacción con **SaveChanges**.


**Listado 4**

>C\#


```
    public void DeleteDepartment(int depID)

    {

    using (CompanySalesEntities ctx = new CompanySalesEntities())

    {

    Department d =

    ctx.Departments.First(d1 =&gt; d1.DepartmentID == depID);

    ctx.Departments.DeleteObject(d);

    ctx.SaveChanges();

    }

    }
```

Aprovechando de nuevo el SQL Profiler, para la llamada en C\# del
listado 5 capturaríamos el código T-SQL que se muestra en el listado 6.
En este caso, se realizan dos operaciones:

1.  Seleccionar los datos de la entidad con **id=5** para cargar el
    objeto con la información actual.

2.  Ejecutar el borrado del departamento.

Nuevamente, vemos cómo ambas sentencias se implementan mediante
sentencias parametrizadas ejecutadas a través del procedimiento
**sp\_executesql**, lo que ofrece todas las ventajas que hemos comentado
al estudiar los patrones de bajo nivel en artículos anteriores.

**Listado 5**

>C\#

```

    DAO d = new DAO();

    d.DeleteDepartment(5);
```

**Listado 6**
```
    -- selecciona la entidad a modificar

    exec sp\_executesql N'SELECT TOP (1)

    \[Extent1\].\[DepartmentID\] AS \[DepartmentID\],

    \[Extent1\].\[name\] AS \[name\]

    FROM \[dbo\].\[Department\] AS \[Extent1\]

    WHERE \[Extent1\].\[DepartmentID\] =
    @p\_\_linq\_\_0',N'@p\_\_linq\_\_0 int',@p\_\_linq\_\_0=5

    -- hace el borrado

    exec sp\_executesql N'delete \[dbo\].\[Department\]

    where (\[DepartmentID\] = @0)',N'@0 int',@0=5
```

###Modificación


El código para realizar la modificación de un registro sería similar al
del listado 7. Para la modificación vemos que no es necesario invocar a
ningún método de actualización, simplemente realizamos los siguientes
pasos:

1.  Seleccionamos la entidad a modificar (a través de su ID).

2.  Modificamos la entidad (en este caso, solo el nombre).

3.  Llamamos a **SaveChanges** para confirmar la operación.


**Listado 7**

>C\#

```

    public void UpdateDepartment(int depID, string new\_name)

    {

    using (CompanySalesEntities ctx = new CompanySalesEntities())

    {

    Department d =

    ctx.Departments.First(d1 =&gt; d1.DepartmentID == depID);

    d.name = new\_name;

    ctx.SaveChanges();

    }

    }
```

Capturando con el SQL Profiler el código generado por EF (listado 9)
para la modificación de una entidad tal y como se muestra en el listado
8, veremos cómo en este caso se realizan dos operaciones:

1.  Seleccionar los datos de la entidad con **id=5** para cargar el
    objeto con la información actual

2.  Ejecutar un **update** para cambiar el nombre del departamento.

Una vez más, podemos ver cómo ambas sentencias se implementan mediante
sentencias parametrizadas ejecutadas a través del procedimiento
**sp\_executesql**, lo que asegura todas las ventajas que hemos
comentado al estudiar los patrones de bajo nivel en artículos
anteriores.

**Listado 8**

>C\#

```

    DAO d = new DAO();

    d.UpdateDepartment(5, "Dep modificado");
```


**Listado 9**

```
    -- selecciona la entidad a modificar

    exec sp\_executesql N'SELECT TOP (1)

    \[Extent1\].\[DepartmentID\] AS \[DepartmentID\],

    \[Extent1\].\[name\] AS \[name\]

    FROM \[dbo\].\[Department\] AS \[Extent1\]

    WHERE \[Extent1\].\[DepartmentID\] =
    @p\_\_linq\_\_0',N'@p\_\_linq\_\_0 int',@p\_\_linq\_\_0=5

    -- hace la modificación

    exec sp\_executesql N'update \[dbo\].\[Department\]

    set \[name\] = @0

    where (\[DepartmentID\] = @1)

    ',N'@0 varchar(30),@1 int',@0='Dep modificado',@1=5
```





