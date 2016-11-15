---
title: Pivot dinámico con SQL Server
description: Pivot dinámico con SQL Server
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: servers
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Pivot dinámico con SQL Server

Por **FREDDY LEANDRO ANGARITA C.**

**SqlServer MVP** 

[Perfil MVP](https://mvp.support.microsoft.com/es-es/mvp/Freddy%20Leandro%20Angarita%20Castellanos-4028407) / <freddy_angarita@hotmail.com> / <http://geeks.ms/blogs/fangarita/default.aspx>


Pivotes Dinámicos
-----------------

En muchas ocasiones tenemos información en filas y queremos convertirlas
en columnas, esto se presenta especialmente en escenarios de análisis en
donde tener la información en columnas es un requerimiento.

Revisemos el ejemplo que presenta
[MSDN](http://msdn.microsoft.com/es-co/library/ms177410.aspx) en su
documentación

Si tenemos una consulta:

``` SQL
USE AdventureWorks2008R2 ;
GO
SELECT DaysToManufacture, AVG(StandardCost) AS AverageCost
FROM Production.Product
GROUP BY DaysToManufacture;
``` 

La cual arroja los siguientes resultados

|DaysToManufacture  | AverageCost|
|------------------- |-------------|
|0                  | 5.0885|
|1             |      223.88|
|2            |       359.1082|
|4             |      949.4105|

Y queremos verla en columnas

|Cost\_Sorted\_By\_Production\_Days |  0   |     1   |     2     |     3    |  4|
|------------------------------------| -------- |-------- |---------- |------ |----------|
|AverageCost                 |         5.0885   |223.88  | 359.1082 |  NULL |  949.4105|


Debemos usar PIVOT

``` SQL
SELECT 'AverageCost' AS
Cost_Sorted_By_Production_Days, [0], [1], [2], [3],
[4]
FROM
(SELECT DaysToManufacture, StandardCost FROM Production.Product) AS SourceTable

PIVOT
(AVG(StandardCost)
FOR DaysToManufacture IN ([0], [1], [2], [3], [4])
) AS PivotTable;
```

Revisando la sintaxis de la consulta tenemos que debemos definir una a
una las columnas que deseamos obtener con la consulta y que éstas
correspondan al Valor que queremos poner en esa columna, es decir, para
cero (0) días de manufactura debemos crear una columan con el nombre 0
para que se asocie el valor que se tiene para esa columna, y se observa
también que se debe incluir una función de agregación para crear un
contexto para cada celda en el momento de poner el valor en la columna,
esto es clave para poder generar el pivote.

Si se ha trabajado anteriormente con tablas dinámicas se verá que el
comportamiento es similar tan solo debemos escribir nosotros mismos la
consulta

EN SQL 2000
-----------

Acá tenemos una idea de cómo se podría solucionar en SQL 2000, algunas
de las funciones que se presentan en ésta solución pronto será
descontinuadas en las futuras versiones de SQL




``` SQL
use AdventureWorks2008R2;
go

SELECT
  [No. Sales per year]=CASE WHEN row IS NULL THEN 'Sum'
    ELSE CONVERT(VARCHAR(80),\[row\]) END ,
  [1996] =SUM( CASE col WHEN '2005' THEN data ELSE 0 END ),
  [1997] =SUM( CASE col WHEN '2006' THEN data ELSE 0 END ),
  [1998] =SUM( CASE col WHEN '2007' THEN data ELSE 0 END ),
  [Total]= SUM( data )
FROM
   (SELECT [row]=P.firstname+' '+ P.lastname,
           [col]=YEAR(SOH.OrderDate),
           [data]=COUNT(*)
    FROM Sales.SalesPerson SP INNER JOIN Sales.SalesOrderHeader SOH ON (SP.BusinessEntityID=SOH.SalesPersonID)
    inner join HumanResources.Employee E ON SP.BusinessEntityID = E.BusinessEntityID
    inner join Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
    GROUP BY P.firstname+' '+ P.lastname, YEAR(SOH.OrderDate)
)f
GROUP BY row WITH ROLLUP
ORDER BY GROUPING(row),total DESC
```

IDEAS
-----
Siempre que aprendemos algo se nos ocurren más ideas, tales como: ¿Qué
pasa si se tienen días de manufactura diferentes? ¿Qué pasa si quiero
una columna para cada uno de esos días, que pasa si lo hacemos por
producto? ¿Por país? qué pasa si cada uno de ellos tiene un
comportamiento diferente?

Muchas de esas preguntas se responden realizando un pivote con columnas
dinámicas, es decir, al contrario de la sintaxis normal en donde debemos
definir cada columna, que se interprete y de obtengan todas las columnas
que necesito sin necesidad de definirlas una a una

CONSULTA DINÁMICA
-----------------

``` SQL
use AdventureWorks2008R2;
go

declare @columnas varchar(max)

set @columnas = ''

select @columnas = coalesce(@columnas + '[' + cast(DaysToManufacture as varchar(12)) + '],', '')
FROM (select distinct DaysToManufacture from Production.Product) as DTM

set @columnas = left(@columnas,LEN(@columnas)-1)

DECLARE @SQLString nvarchar(500);

set @SQLString = N'
    SELECT *
    FROM 
    (SELECT DaysToManufacture, StandardCost
        FROM Production.Product) AS SourceTable
    PIVOT
    (
    AVG(StandardCost)
    FOR DaysToManufacture IN (' + @columnas + ')
    ) AS PivotTable;'

EXECUTE sp_executesql @SQLString
```


Pero esta solución tiene el inconveniente de tener que lidiar con
consultas Ad-Hoc (Dinámicas) que asocian posibles problemas de seguridad
y rendimiento a la solución, esta solución así como la demás que se
puedan implementar debe considerar dónde se van a usar, posiblemente sea
más eficiente realizar el pivote en reporting services (Matriz) que en
SQL, esto debe evaluarse para cada y depende de lo que se quiera
realizar

**OPCION CTE - Nombres de columna dinámicos**

Para 2005 o superior existe una alternativa para facilitar, mas no
soluciona del todo el problema y es crear una consulta que asigna
valores (números a las columnas) facilitando la construcción final de la
consulta. En este caso queremos pivotear por el nombre del mes, pero
supongamos que el rango que damos en la primera consulta cambia,
entonces los nombre de las columnas (Nombre del mes) no podrían ser
usados.

Por ejemplo si enviamos como parámetro el primero de agosto,  hasta el
31 de diciembre o si enviamos el 1 de enero al 30 de junio, tendríamos
que cambiar constantemente la consulta o presentar todos los meses, para
solucionar esto tenemos el siguiente ejemplo



``` SQL
use AdventureWorksDW2008R2;
go;

With monthyears as (
SELECT DISTINCT SpanishMonthName as CalendarMonthYearName, MonthNumberOfYear as MonthOfYear,CalendarYear
    FROM dbo.DimDate
    WHERE DateKey > @FechaInicio AND DateKey < @FechaFinal
),
CalMonthYears AS
(
SELECT CalendarMonthYearName AS 'CalendarMonthYearName',
    MonthOfYear,
    CalendarYear,
    ROW_NUMBER() OVER (ORDER BY CalendarYear DESC) AS 'YearMonthNum'
    FROM monthyears
)
SELECT ProductKey,
    [1],[2],[3],[4],[5],[6]
FROM
(
-- your query to get your data, pivot this data
SELECT YearMonthNum,s.ProductKey,
    SUM(OrderQuantity) AS 'Quantity'
    FROM FactResellerSales s
    INNER JOIN dbo.DimDate d ON s.OrderDateKey = d.DateKey
    INNER JOIN CalMonthYears cmy ON d.SpanishMonthName =
    cmy.CalendarMonthYearName
GROUP BY YearMonthNum,s.ProductKey
) AS SourceTable
PIVOT
(
SUM(Quantity)
FOR YearMonthNum IN (
    [1],[2],[3],[4],[5],[6]
    )
) AS PivotTable
```

Espero sea de ayuda, 

**FREDY LEANDRO ANGARITA CASTELLANOS**




