---
title: Buenas prácticas de codificación para capas de acceso a datos de aplicaciones (II)
description: Buenas prácticas de codificación para capas de acceso a datos de aplicaciones (II)
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: win-dev
ms.custom: CommunityDocs
---







#Buenas prácticas de codificación para capas de acceso a datos de aplicaciones (II)

![] (./img/Buenas-Practicas-Parte2/image1.png)

<http://www.dnmplus.net>

Por **Enrique Catalá Bañuls y Enrique Puig Nouselles** ([SolidQ](http://www.solidq.com))

En nuestra entrega anterior, establecimos una clasificación de las capas
de acceso a datos de las aplicaciones en base a la **tipología de
acceso** que utilizan (soluciones basadas en conjuntos vs. soluciones
basadas en cursores) y establecimos las diferencias entre ellas. Esta
vez nos centraremos en la clasificación basada en los **patrones de bajo
nivel** utilizados.

###Patrones de bajo nivel


En la clasificación según patrones de bajo nivel, hemos querido
diferenciar entre dos tipologías:

Patrón de acceso dinámico

Patrón de acceso estático

Con el término “patrón de acceso dinámico” queremos referirnos a
patrones de acceso a SQL Server en los que la aplicación genera al vuelo
la petición a SQL Server; mientras que con “patrón de acceso estático”
queremos referirnos a una manera de hacer las cosas en la que la
aplicación ejecute un objeto que exista en SQL Server, y dicho objeto
contenga la lógica de lo que se desea ejecutar.

Es de destacar que esta clasificación según patrones de bajo nivel es
totalmente complementaria a la clasificación según tipología de acceso
vista anteriormente; es posible, por ejemplo, lanzar de forma dinámica
un cursor.

###Patrón de acceso dinámico

**Consultas ad-hoc puras**

Por **consultas ad-hoc puras** entendemos aquellas consultas que son
creadas al vuelo por la aplicación para lanzarlas contra SQL Server en
su forma original. En este modo, típicamente la aplicación crea una
*query* a partir de texto concatenado a una variable, que finalmente
acaba ejecutando contra el servidor. El código del listado 1 podría ser
un ejemplo.

Típicamente, este modo de ejecución lanza las consultas en modo texto y
sin importar ni tipo de datos ni parámetros a devolver ni a filtrar.
Este método le permite una flexibilidad muy alta al desarrollador, que
puede lanzar prácticamente lo que quiera y como quiera… incluso
permitiéndole fácilmente programar lógica de creación de consultas
filtradas grandísimas con poco esfuerzo. Sin embargo, este método
esconde una serie de problemas de rendimiento bastante desagradables.

**Listado 1**
```
    string queryString =

    "SELECT name FROM sys.tables WHERE name LIKE ‘" + variableWhere +
    "’";

    using (SqlConnection connection =
    new SqlConnection(connectionString))

    {

    SqlCommand command = new SqlCommand(queryString, connection);

    connection.Open();

    SqlDataReader reader = command.ExecuteReader();

    // Call Read before accessing data.

    while (reader.Read())

    {

    ReadSingleRow((IDataRecord)reader);

    }

    // Call Close when done reading.

    reader.Close();

    }
```
La figura 1 muestra las dos tablas en relación maestro-detalle que
utilizaremos para los ejemplos; sus nombres indican claramente el rol
que juegan.

**Figura 1**

![] (./img/Buenas-Practicas-Parte2/image2.png)

Para comentar el escenario, vamos a lanzar 50.000 veces la misma
consulta, simplemente cambiando el valor de id\_maestro en el filtro
(listado 2). Para ello, vamos a utilizar un cursor. No confundir el
hecho lanzar el cursor con el efecto que vamos a ver debido a que se
realizan 50.000 peticiones ad-hoc.

**Listado2**


```
    --------------------------------------------------------------------------------------

    -- Ejecución AD-HOC

    -- 50k ejecuciones simulando aplicación corriendo

    -- se lanza 50k veces la misma consulta cambiando el valor

    --------------------------------------------------------------------------------------

    -- Primero vaciamos la caché, para que no quede lugar a dudas

    --

    DBCC FREEPROCCACHE --&gt; NUNCA LANZAR EN PRODUCCIÓN !!!!!

    GO

    SET NOCOUNT ON;

    DECLARE @s1 NVARCHAR(MAX), @i2 INT

    DECLARE @query NVARCHAR(1024), @queryExec NVARCHAR(1024)

    SET @query = N'DECLARE @a INT

    SELECT @a = 1

    FROM dbo.maestro m

    INNER JOIN dbo.detalle d ON m.id\_maestro = d.fk\_maestro

    WHERE id\_maestro='

    DECLARE @i INT=1;

    WHILE (@i &lt; 50000)

    BEGIN

    SET @queryExec = CONCAT(@query, @i)

    --PRINT @queryExec

    EXEC(@queryExec)

    SET @i+=1

    END

    GO
```

El tiempo de ejecución de este proceso en nuestra máquina de prueba ha
sido de 1 minuto y 38 segundos, y si este tiempo nos parece elevado para
tan solo 50k consultas, es que lo es. ¿A qué es debido esto? La consulta
del listado 2 (su resultado se muestra de forma gráfica en la figura 2)
nos da la clave.

**Listado 3**

```
    SELECT SUM(size\_in\_bytes) AS size\_in\_bytes,

    SUM(size\_in\_bytes)/1024 AS size\_in\_kb,

    SUM(size\_in\_bytes)/1024/1024 AS size\_in\_mb,

    SUM(size\_in\_bytes)\*1.0/1024/1024/1024 AS size\_in\_gigabytes

    FROM sys.dm\_exec\_cached\_plans

    CROSS APPLY sys.dm\_exec\_sql\_text(plan\_handle)

    WHERE cacheobjtype LIKE 'Compiled Plan%' AND text LIKE '%FROM
    dbo.maestro%'

    AND text NOT LIKE '%dm\_exec\_cached\_plans%'

```

**Figura 2**

![] (./img/Buenas-Practicas-Parte2/image3.png)

Sí, amigo lector… Esa inocente rutina que cambia 50.000 veces el valor
del filtro está consumiendo 1.55 GB de memoria RAM tan solo en planes de
ejecución. El problema es que **las consultas AD-HOC solo reutilizan el
plan de ejecución cuando es exactamente idéntico** (espacios en blanco y
mayúsculas-minúsculas incluidos), por lo que simplemente variar el valor
de id\_maestro ya invalida dicha reutilización. Traslada este ejemplo a
tu entorno, donde se pueden estar lanzando millones de peticiones
diariamente a tu base de datos, para darte cuenta de la importancia de
evitar las consultas ad-hoc.

En resumen, el uso de ad-hoc puro en tus aplicaciones tiene el siguiente
efecto sobre SQL Server:

Uso ineficiente de la memoria (excesivo trasiego).

Una consulta genera su plan de ejecución utilizando CPU y requiriendo
memoria para ello.

Se resuelve la consulta.

La memoria no se vuelve a reutilizar (con alta probabilidad), pasando a
un *round-robin* que va “envejeciendo” los planes de ejecución no
reutilizados.

Tiempo de respuesta a peticiones más elevado de lo necesario, puesto que
consultas que podrían reutilizar el plan de ejecución no lo están
haciendo por realizarse de forma ad-hoc.


¿Cómo evitar el problema? Tenemos dos opciones que veremos a
continuación: las consultas dinámicas parametrizadas y los
procedimientos almacenados

    <span id="_Parametrizable" class="anchor"></span>**Consultas dinámicas
    parametrizables**

Por código dinámico parametrizable entendemos aquel código generado por
una aplicación cliente que acaba siendo lanzado contra una instancia SQL
Server. A diferencia del código dinámico al que hemos llamado ad-hoc
puro, en este caso no lanzamos la consulta tal cual en modo texto, sino
que lo hacemos a través de un procedimiento almacenado especial que nos
provee SQL Server llamado
[sp\_executesql](http://msdn.microsoft.com/en-us/library/ms188001.aspx).
Es decir, que lo que hacemos es llamar a este procedimiento almacenado,
pasándole como parámetros nuestra consulta y sus valores de filtro por
separado. De esta forma, vamos a conseguir reutilizar los planes de
ejecución, lo que no solo va a optimizar el uso de memoria RAM, evitando
tener que almacenar planes innecesariamente, sino que minimizaremos uso
de CPU y tiempo de respuesta.

La forma de utilizar
[sp\_executesql](http://msdn.microsoft.com/en-us/library/ms188001.aspx)
es realmente simple (listado 4a), y es totalmente compatible con que la
aplicación genere consultas al vuelo… únicamente las tiene que generar
con el formato sp\_executesql. Es decir, que una consulta como la del
listado 4b se parametrizaría de la forma que se muestra en el listado
4c.

**Listado 4a**

```
    sp\_executesql \[ @statement = \] statement

    \[

    { , \[ @params = \] N'@parameter\_name data\_type \[ OUT | OUTPUT
    \]\[ ,...n \]' }

    { , \[ @param1 = \] 'value1' \[ ,...n \] }

    \]

    Listado 4b

    SELECT \* FROM sys.databases WHERE name = 'Adventureworks'

```

**Listado 4c**

```
    sp\_executesql N'SELECT \* FROM sys.databases WHERE name = @p1',

    N'@p1 sysname',

    @p1 = 'Adventureworks'
```
(en recuadrito)

**IMPORTANTE**: sp\_executesql trabaja en Unicode, y es imperativo
proporcionar los parámetros desglosados con su tipo de datos correcto y
separado.

Dicho esto, veamos en qué nos puede mejorar utilizar sp\_executesql
sobre el ejemplo anterior. Si ejecutamos 50.000 veces una consulta con
filtro equivalente a la de antes (listado 5), su tiempo de ejecución
será de 5 segundos, lo que obviamente ya nos gusta más. ¿A qué es debido
esto ahora? Pues ahora básicamente hemos necesitado solo 40 KB de
memoria para estos planes de ejecución (figura 3), ya que realmente se
ha almacenado sólo un único plan de ejecución, parametrizado, que se ha
reutilizado 49.999 veces (ver columna usecounts en listado 6 y columna
4). Nuevamente, traslada este ejemplo a tu entorno, donde se pueden
estar lanzando millones de peticiones diariamente a tu base de datos,
para darte cuenta de la importancia de parametrizar tus consultas desde
la aplicación cliente si no utilizas procedimientos almacenados.

**Listado 5**

```

    --------------------------------------------------------------------------------------

    -- Ejecución parametrizada

    -- 50k ejecuciones simulando aplicación corriendo

    -- se lanza 50k veces la misma consulta cambiando el valor

    --------------------------------------------------------------------------------------

    -- Primero vaciamos la caché, para que no quede lugar a dudas

    --

    DBCC FREEPROCCACHE --&gt; NUNCA LANZAR EN PRODUCCIÓN !!!!!

    GO

    SET NOCOUNT ON;

    DECLARE @s1 NVARCHAR(MAX), @i2 INT

    DECLARE @query NVARCHAR(1024), @queryExec NVARCHAR(1024)

    SET @query = N'DECLARE @a INT

    SELECT @a = 1

    FROM dbo.maestro m

    INNER JOIN dbo.detalle d ON m.id\_maestro = d.fk\_maestro

    WHERE id\_maestro=@p1'

    DECLARE @i INT=1;

    WHILE (@i &lt; 50000)

    BEGIN

    EXEC sp\_executesql @stmt=@query, @params=N'@p1 INT', @p1=@i

    SET @i+=1

    END

    GO

```

**Figura 3**

![] (./img/Buenas-Practicas-Parte2/image4.png)}

<!-- -->

**Listado 6**

```

    SELECT usecounts, cacheobjtype, objtype, size\_in\_bytes, text

    FROM sys.dm\_exec\_cached\_plans

    CROSS APPLY sys.dm\_exec\_sql\_text(plan\_handle)

    WHERE cacheobjtype LIKE 'Compiled Plan%' AND text LIKE '%FROM
    dbo.maestro%'

    AND text NOT LIKE '%dm\_exec\_cached\_plans%'

```

**Figura 4**

![] (./img/Buenas-Practicas-Parte2/image5.png)

###Patrón de acceso estático


    <span id="_Stored_procedures" class="anchor"></span>Procedimientos
    almacenados

Éste es el patrón de acceso recomendado en toda aplicación que utilice
SQL Server. A continuación podemos ver algunas de las razones para
recomendar su uso:

- Compilación de una o más sentencias T-SQL

- Mejora uso de recursos.

- Mejora el desacoplamiento

- Facilita desarrollos eficientes con equipos de trabajo especializados.

- Facilita la reutilización de código.

- Minimiza problemas de seguridad

- Imposibilita la Inyección de SQL[^1].

- Permite ejecuciones con cambio de contexto controladas.



Para más información sobre cómo programar procedimientos almacenados,
consulte los libros en pantalla \[1\].

Por desgracia, a veces el desconocimiento produce mala praxis en el uso
de procedimientos almacenados. Los anti-patrones que se muestran en el
listado 7 **nunca** deberían existir en nuestras bases de datos, puesto
que es como si no usáramos procedimientos almacenados y no obtenemos
ningún beneficio y sí todos los inconvenientes de consultas dinámicas
ad-hoc puras vistas anteriormente.

**Listado 7**

```

    USE tempdb;

    GO

    -- EJEMPLO DE LO QUE NO HAY QUE HACER

    --

    CREATE PROCEDURE dbo.no\_usar\_nunca @param NVARCHAR(MAX)

    AS

    BEGIN

    EXEC(@param)

    END

    GO

    -- EJEMPLO DE LO QUE NO HAY QUE HACER

    --

    EXEC dbo.no\_usar\_nunca N'SELECT \* FROM sys.databases'
```

###Código dinámico vs procedimientos almacenados


Llegados a este punto, nos surge la duda de qué método utilizar para
nuestra capa de acceso a datos. El tema de ejecutar sentencias generadas
dinámicamente suele generar muchas discusiones. La facilidad que implica
poder crear la sentencia a ejecutar de la forma en que se necesite en
cada momento enmascara sus inconvenientes, que son muchos y muy
importantes:

**Seguridad de la base de datos**. Se les debe asignar permisos
explícitos a los usuarios para poder ejecutar la sentencia, ya sea ésta
SELECT, INSERT, DELETE o UPDATE. Esto supone que si un usuario conoce
las credenciales, pueda conectarse desde otra aplicación y ejecutar
otras sentencias que el programador de la base de datos no pensó cuando
diseñaba la aplicación

**Evitar la Inyección de SQL (*SQL Injection)***. Si la aplicación
recoge el valor de un campo de texto para generar una sentencia que
busque en un campo de una tabla por dicho valor, un usuario podría
añadir código malintencionado para ejecutar sentencias que borraran
datos e incluso tablas. Aunque éste es un tema bastante conocido, no es
extraño encontrar esta vulnerabilidad en aplicaciones, por lo que una
pequeña introducción al tema nunca está de más; la Wikipedia lo explica
de manera concisa (**http://es.wikipedia.org/wiki/Inyección\_SQL**), y
también la ayuda en línea de SQL Server
([**http://msdn2.microsoft.com/es-es/library/ms161953.aspx**](http://msdn2.microsoft.com/es-es/library/ms161953.aspx)).

Sin embargo, además de estos dos puntos, lo principal es que normalmente
se escoge entre código dinámico de la aplicación o procedimientos
almacenados de SQL Server. Algunas veces la razón es conseguir que la
aplicación sea portable fácilmente a otros gestores de bases de datos;
sin embargo, es más recomendable diseñar capas intermedias diferentes
por gestor que realizar una sola capa que sea compatible con todos los
gestores (tarea en muchos casos nada sencilla, por otra parte). De este
modo, estaremos consiguiendo el máximo rendimiento, en este caso, de SQL
Server.

Otra razón común para usar código dinámico es para construir las
condiciones de filtrado en un formulario de búsqueda. Nuevamente, no es
imprescindible recurrir al código generado dinámicamente para solucionar
esta situación; existe un artículo de un MVP de SQL Server muy
reconocido (**Erland Sommarskog**) que describe de forma más detallada
las alternativas \[2\].

Así que en vez de mostrar los inconvenientes de usar código dinámico,
vamos a mostrar las ventajas que tiene diseñar la aplicación accediendo
a procedimientos almacenados:

**Seguridad de la base de datos**. Los usuarios solo tienen acceso a
ejecutar el código concreto que valida el procedimiento almacenado. No
pueden acceder a las tablas y/o vistas sobre las que no tienen permisos
explícitos.

**Reduce el tráfico de red**. No es lo mismo enviar una consulta
combinando varias tablas, añadiendo agrupados y/o filtros (muchos bytes)
que el texto de una sentencia EXEC que lanza un procedimiento
almacenado. Además, no sólo se reduce el tráfico en sentido cliente
-&gt; servidor, sino también al revés, puesto que los procedimientos
almacenados pueden devolver parámetros de salida, mucho más livianos que
tener que procesar conjuntos de resultados (*resultsets*).

**Conocer el acceso a los objetos**. Buscar dónde y de qué forma se
accede a los objetos de nuestra base de datos desde una aplicación puede
resultar complicado. Sin embargo, si siempre se accede a ellos a través
de procedimientos almacenados, se puede consultar la vista de catálogo
sys.sql\_dependencies (siempre y cuando los objetos se hayan creado en
el orden correcto) o, en el peor de los casos, buscar en el código de
los procedimientos almacenados el texto que necesitemos mediante la
función object\_definition(object\_id).

Es posible proporcionar **parámetros de tipo tabla** como valores de
entrada (\[3\]).

Hemos dejado para el final **la razón más importante** por la cual el
uso de los procedimientos almacenados es recomendable: **la compilación
de las sentencias** enviadas a SQL Server y su almacenamiento en la
caché de planes de consultas. Ya lo hemos comentado anteriormente, pero
recuerda que si un plan compilado que se encuentre en la caché puede
satisfacer la sentencia que le llega, el motor se ahorra el tiempo para
crear dicho plan. El tiempo empleado en ello podría parecer
despreciable, pero si lo multiplicamos por un porcentaje muy alto de las
sentencias que le lleguen al motor, al final nos podemos encontrar con
una situación en la que el servidor dedique mucho tiempo (y recursos) en
la creación de planes de ejecución.

SQL Server almacena en caché diferentes tipos de sentencias que le
llegan:

Las consultas ad hoc tienen que **coincidir exactamente** (mayúsculas y
minúsculas, espacios en blanco, etc.) para que el plan de ejecución
pueda ser reutilizado.

En algunos casos, SQL Server sustituye los valores literales (… WHERE
col = ‘valor’) por parámetros (… WHERE col = @p1). Sin embargo, existen
muchos condicionantes para que lo haga de forma automática (que la
consulta no contenga la cláusula IN, que no contenga UNION, que no tenga
sugerencias de consulta, que no tenga cláusula TOP, entre otras), por lo
que al final, las situaciones en las que la parametrización automática
aparece son exclusivamente en sentencias sencillas. Aunque en SQL Server
se puede indicar que se use parametrización forzada, ésta también tiene
sus limitaciones y además no deja de ser una solución intermedia.

Procedimientos almacenados. SQL Server reutiliza el plan de ejecución de
un procedimiento almacenado a partir del nombre de éste. En la mayoría
de los casos, no necesitará volver a compilar para ejecutarlo.

Las referencias \[4\] y \[5\] apuntan a dos documentos muy recomendables
dedicados a este tema.

###Resumen

Tal y como hemos podido ver en estos dos artículos, la arquitectura
recomendada de bajo nivel debería ser principalmente [**orientada a
conjuntos**](#_Soluciones_basadas_en) y basada en [**procedimientos
almacenados**](#_Stored_procedures). Si la aplicación necesita generar
código ad-hoc, recordar siempre [**parametrizar la
consulta**](#_Parametrizable) generada mediante
[sp\_executesql](http://msdn.microsoft.com/en-us/library/ms188001.aspx)
para obtener el mejor rendimiento posible.

###Referencias

\[1\] Información sobre procedimientos almacenados en los Libros en
pantalla de SQL Server 2012:
**http://msdn.microsoft.com/es-es/library/ms190782.aspx**.

\[2\] **Sommarskog, Erland**. *Dynamic search conditions in T-SQL*:
**http://www.sommarskog.se/dyn-search.html**.

\[3\] Parámetros con valores de tabla:
**http://msdn.microsoft.com/es-es/library/bb675163.aspx**.

\[4\] **Microsoft**. “Problemas de compilación y re compilación de
lotes, y de almacenamiento en caché de planes en SQL Server”:
**http://www.microsoft.com/latam/technet/productos/servers/sql/2005/recomp.mspx**.

\[5\] **Sommarskog, Erland**. *The curse and blessings of dynamic SQL*:
**http://www.sommarskog.se/dynamic\_sql.html**.

[^1]: Aquí obviamente debemos poner de nuestra parte y evitar lanzar lo
    que entre por parámetro de entrada.


