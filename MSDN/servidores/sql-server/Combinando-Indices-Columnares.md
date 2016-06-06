<properties
	pageTitle="Combinando Índices Columnares y Particionado de datos en Tablas de SQL Server"
	description="Combinando Índices Columnares y Particionado de datos en Tablas de SQL Server"
	services="sqlserver"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="sqlserver"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>


#Combinando Índices Columnares y Particionado de datos en Tablas de Hechos en SQL Server 2012

Por **Eladio Rincón**

Twitter: http://twitter.com/erincon

Linkedin: http://es.linkedin.com/in/erincon

Blog: http://blogs.solidq.com/elrinconDelDBA/Home.aspx

Introducción

SQL Server 2012 Enterprise Edition introdujo los índices columnares que son una evolución de la tecnología xVelocity introducida en SQL Server 2008R2 con PowerPivot tanto para Excel 2012 como para SharePoint 2010. A grandes rasgos, la tecnología se basa en un cambio radical de almacenamiento de los datos: utilizar almacenamiento basado en columnas frente al modelo tradicional de almacenamiento basado en filas. En este artículo conocerá para qué escenarios está diseñada esta tecnología y entenderá cómo se puede adaptar a las necesidades del lector.

Estado del Arte de la Tecnología Columnar

En los últimos años la adquisición de hardware tiene un ROI sin precedentes; ya es natural adquirir servidores con mucha memoria RAM, que implícitamente ayuda a reducir la paginación de datos en memoria. Por otra parte, la capacidad de procesamiento de los servidores (ciclos de CPU y número de cores) ha mejorado en ratios similares, permitiendo que los servidores sean capaces de procesar más rápido las consultas de los usuarios paralelizando el procesamiento de las consultas; estas dos medidas mejoran el tiempo de respuesta ayudando a poder tomar decisiones más rápido.

Las mejoras en paginación (memoria) y la capacidad de procesamiento (CPU) son los factores fundamentales que ayudan a emerger tecnologías en memoria (conocidas como “in-memory”): por una parte el hardware está preparado para gestionar volúmenes más grandes y por otra parte el software (SQL Server) se adapta a usar de manera diferente los recursos hardware a su disposición.

La tecnología columnar se basa en dos principios:

- Compresión: posibilidad de dar sentido a los datos en tamaños muy reducidos
- Paralelización: Descomprimir el dato de forma rápida y eficiente

###Diferencias entre Compresión de Páginas (Page Compression) e Índices Columnares

Que los índices columnares utilicen tecnología de compresión quizás induzca a confusión sabiendo que en SQL Server 2008 se introdujo compresión de tipo página (Page Compression). Al margen de que se utilicen diferentes algoritmos de compresión, la diferencia fundamental es la siguiente:

- Índices columnares utilizan compresión basada en segmentos que almacenan la información relativa a cada columna elegida en el índice. Más información en el siguiente enlace: http://msdn.microsoft.com/es-es/library/gg492088.aspx
- La compresión de páginas utiliza algoritmos de compresión basados en agrupaciones de todas las columna de los registros almacenados en cada página. Más información en el siguiente enlace: http://msdn.microsoft.com/es-es/library/cc280464(v=SQL.100).aspx

La principal ventaja de los índices columnares frente a la compresión de páginas es que al utilizar algoritmos parecidos – no el mismo – al algoritmo de Huffman (ver siguiente enlace: http://en.wikipedia.org/wiki/Dictionary_coder) cuanto más repetidos estén los datos, mayor será la posibilidad de compresión; por ejemplo, si una columna almacena valores numéricos enteros para almacenar códigos de productos, la probabilidad de reutilizar códigos del maestro de artículos en la tabla de pedidos es muy alta (el factor de unicidad es el número de unidades existentes en el maestro de artículos).

###Imperfecciones de la Tecnología

El principal inconveniente de la tecnología columnar en SQL Server 2012 es que una vez creado un índice columnar, no se podrán hacer modificaciones en la tabla. Tecnológicamente se podría haber resuelto dicha necesidad, pero más allá de las justificaciones técnicas, la causa por la que no está disponible en estos momentos es porque el diseño de la funcionalidad se realizó pensando en escenarios de Almacenes de Datos (DataWarahouse) donde la necesidad de modificar datos no es habitual. Sin embargo, Microsoft ha respondido a las necesidades de la comunidad y en SQL Server 2012 Parallel Datawarehouse ya se implementan índices clustered columnares donde sí se permite borrar e insertar datos en la estructura. La diferencia principal con la aproximación tradicional de almacenamiento en formato fila es que cuando suceden los cambios, en lugar de almacenar en el lugar exacto las filas modificadas por cada operación, SQL Server internamente realiza el cambio de forma diferida manteniéndolas en una zona de registro de cambios antes de moverlas al segmento definitivo. En todos los casos – si está en la zona intermedia o en el segmento definitivo – las operaciones de lectura leerán el dato de forma consistente garantizando los niveles ACID de las operaciones –http://es.wikipedia.org/wiki/ACID.

###Objetivos de la Tecnología y Escenarios a Cubrir

Tras posicionar la tecnología se introducirá el caso de negocio a resolver: alimentar una tabla de hechos de forma óptima, considerando los siguientes aspectos:

- La tabla no se puede reconstruir
- A la tabla se le pueden añadir filas periódicamente (por ejemplo, cada mes)
- A la tabla se le pueden añadir filas con criterios – filtros – conocidos (por ejemplo, cada mes se añaden las filas del mes en curso)
- Se necesita dar soporte a tal variedad de combinación de índices que debe utilizar tecnología columnar

Con estas premisas, se puede utilizar la siguiente combinación de tecnologías:
- Índices columnares para soportar la “variabilidad” de columnas a indexar
- Particionado de datos para añadir cada mes como grupos nuevos a la tabla
- Vistas para ofrecer un interface que exponga la suma de tabla con índice columnar y tabla sin índice columnar

La siguiente imagen muestra la estructura de las tablas del ejemplo:


![] (./img/Combinando-Indices-Columnares/image1.png)

La información de cada mes irá almacenada en una partición (la condición de particionado es la columna fecha de la tabla [Hechos_Historicos] que se irá agrupando por meses).

Para cada mes vencido, la partición tendrá un índice columnar. Para los meses activos (tabla [Hechos_En_Curso]) no se utilizarán índices columnares por la necesidad de poder escribir sobre la tabla; con estas premisas, cada final de mes sucederá lo siguiente – imagínese que el día actual es 1 de mayo de 2013, y debemos ajustar la estructura de particionamiento. Las siguientes imágenes representan el cambio de mes:

![] (./img/Combinando-Indices-Columnares/image3.png)

Como puede ver en las imágenes anteriores, al cambiar de mes en la estructura sucederá lo siguiente:
- Los datos del mes de abril se traspasarán de la tabla [Hechos_En_Curso] a la tabla [Hechos_Historicos]. El proceso se hará de forma que el cambio de “pertenencia” se realice a nivel de metadata sin actividad física de E/S
- Al hacer el cambio, se creará un índice columnar en la nueva partición añadida a la tabla [Hechos_Historicos]
- Tras este cambio, la tabla [Hechos_En_Curso] quedará preparada para gestionar las filas del mes de mayo 2013

###Creación de la estructura física de los objetos

Para poder reproducir el ejemplo paso a paso, necesita la base de datos AdventureWorks2012DW que se puede 
descargar en el siguiente [enlace](http://msftdbprodsamples.codeplex.com/downloads/get/165405); asuma que se encuentra en el mes de marzo de 2013, y en la tabla [Hechos_Historicos] se almacenarán los datos agrupándolos de la siguiente forma:

- Una partición para datos anteriores a 2013
- Una partición para el mes de enero
- Una partición para el mes de febrero
- “Hueco” reservado para cuando se incorpore el mes de marzo (el día 1 de abril). Nota: es necesario dejar un hueco para cada “mes siguiente” porque la función SWITCH de particionado requiere que una de las particiones a cambiar se encuentre vacía
- Una partición adicional vacía para que cuando se prepare el mes siguiente (mayo), la función SPLIT sea más eficiente trabajando sobre particiones completamente vacías 

Para ello se usa el siguiente script:
```
CREATE PARTITION FUNCTION [PF_Mensual](int) AS RANGE RIGHT 
FOR VALUES (20130101, 20130201, 20130301, 20130401); 
GO

--
-- para un entorno real, mejor distribuir por FILEGROUPs
CREATE PARTITION SCHEME [PS_Mensual] 
AS PARTITION [PF_Mensual] ALL TO ([PRIMARY]);

A continuación se crean las dos tablas en cuestión – [Hechos_Historicos] y [Hechos_En_Curso]; nótese que al estar activo el mes de marzo 2013, la tabla [Hechos_En_Curso] tiene habilitada una CONSTRAINT que fuerza a que sólo se almacenen datos del mes en curso; se utilizará el siguiente script:
CREATE TABLE [dbo].[Hechos_Historicos](
[ProductKey] [int] NOT NULL,
[CustomerKey] [int] NOT NULL,
[OrderDateKey] [int] NOT NULL,
[SalesOrderNumber] [nvarchar](20) NOT NULL,
[SalesOrderLineNumber] [int] NOT NULL,
[OrderQuantity] [int] NOT NULL,
[UnitPrice] [decimal](15, 4) NOT NULL,
[UnitPriceDiscountPct] [decimal](15, 4) NOT NULL,
CONSTRAINT Meses_Anteriores_Marzo_2013
CHECK ([OrderDateKey]<(20130301))
) ON [PS_Mensual] ([OrderDateKey]);
GO

CREATE CLUSTERED INDEX ci_Hechos_Historicos
ON [dbo].[Hechos_Historicos]([OrderDateKey]) 
ON [PS_Mensual] ([OrderDateKey]);
GO

CREATE TABLE [dbo].[Hechos_En_Curso](
[ProductKey] [int] NOT NULL,
[CustomerKey] [int] NOT NULL,
[OrderDateKey] [int] NOT NULL,
[SalesOrderNumber] [nvarchar](20) NOT NULL,
[SalesOrderLineNumber] [int] NOT NULL,
[OrderQuantity] [int] NOT NULL,
[UnitPrice] [decimal](15, 4) NOT NULL,
[UnitPriceDiscountPct] [decimal](15, 4) NOT NULL,
CONSTRAINT Mes_En_Curso CHECK ([OrderDateKey] >= 20130301 AND [OrderDateKey] < 20130401)
) ON [PRIMARY];
GO

CREATE CLUSTERED INDEX ci_Hechos_En_Curso
ON [dbo].[Hechos_En_Curso]([OrderDateKey]) 
ON [PRIMARY];
```
**Nota**: en entornos DataWarehouse es habitual no utilizar restricciones (PRIMARY KEYs, UNIQUE, CHECK) porque es responsabilidad de los procesos ETL asegurarse la unicidad de los datos; sin embargo, el uso de restricciones CHECK ayuda al optimizador (Query Optimizer) a descargar conjuntos de datos a través de la definición del modelo. 

Y finalmente se crea la vista que agrupa los datos de las dos tablas con el siguiente script – se utiliza UNION ALL porque se trabaja con conjuntos disjuntos:

```
CREATE VIEW [dbo].[Hechos] AS
SELECT 
[ProductKey], [CustomerKey], [OrderDateKey],
[SalesOrderNumber], [SalesOrderLineNumber],
[OrderQuantity], [UnitPrice], [UnitPriceDiscountPct]
FROM [dbo].[Hechos_Historicos] f
UNION ALL
SELECT 
[ProductKey], [CustomerKey], [OrderDateKey],
[SalesOrderNumber], [SalesOrderLineNumber],
[OrderQuantity], [UnitPrice], [UnitPriceDiscountPct]
FROM [dbo].[Hechos_En_Curso] f2
```
###Relleno de datos hasta 31 marzo 2013


Tabla Origen| Periodo| Tabla Destino
------------|--------|----------------
FactInternetSales| Año 2012| Hechos_Historicos
FactInternetSales| Enero 2013| Hechos_Historicos
FactInternetSales| Febrero 2013| Hechos_Historicos
FactInternetSales| Marzo 2013| Hechos_En_Curso

Como lo datos origen son del año 2006, se ha hecho un ajuste en el cálculo de las fechas para añadirle 7 años a la fecha origen; el script es el siguiente:

```
--
-- Datos del año 2012
INSERT INTO [dbo].[Hechos_Historicos]
SELECT 
[ProductKey], [CustomerKey], 
CONVERT(VARCHAR(8), DATEADD(YEAR, 7, CAST(
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 1, 4) + '-' + 
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 5, 2) + '-' + 
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 7, 2) + ' 00:00:00.000'
AS DATETIME)), 112) [OrderDateKey], 
[SalesOrderNumber], [SalesOrderLineNumber], 
[OrderQuantity], [UnitPrice], [UnitPriceDiscountPct]
FROM [dbo].[FactInternetSales] WITH (TABLOCK)
WHERE OrderDateKey BETWEEN 20050101 AND 20051231;
GO

--
-- Datos de Enero y Febrero 2013
INSERT INTO [dbo].[Hechos_Historicos]
SELECT 
[ProductKey], [CustomerKey], 
CONVERT(VARCHAR(8), DATEADD(YEAR, 7, CAST(
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 1, 4) + '-' + 
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 5, 2) + '-' + 
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 7, 2) + ' 00:00:00.000'
AS DATETIME)), 112) [OrderDateKey], 
[SalesOrderNumber], [SalesOrderLineNumber], 
[OrderQuantity], [UnitPrice], [UnitPriceDiscountPct]
FROM [dbo].[FactInternetSales] WITH (TABLOCK)
WHERE OrderDateKey BETWEEN 20060101 AND 20060228;
GO

-- 
-- Datos de Marzo 2013
INSERT INTO [dbo].[Hechos_En_Curso]
SELECT 
[ProductKey], [CustomerKey], 
CONVERT(VARCHAR(8), DATEADD(YEAR, 7, CAST(
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 1, 4) + '-' + 
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 5, 2) + '-' + 
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 7, 2) + ' 00:00:00.000'
AS DATETIME)), 112) [OrderDateKey], 
[SalesOrderNumber], [SalesOrderLineNumber], 
[OrderQuantity], [UnitPrice], [UnitPriceDiscountPct]
FROM [dbo].[FactInternetSales] WITH (TABLOCK)
WHERE OrderDateKey BETWEEN 20060301 AND 20060331;

```
Una vez creados los datos, se creará el índice columnar sobre la tabla [Hechos_Historicos] porque se puede dar por cerrado los datos anteriores a Febrero 2013; el índice se creará con la siguiente instrucción:

```
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccs_Hechos_Historicos] ON [dbo].[Hechos_Historicos]
(
[ProductKey],[CustomerKey],
[OrderDateKey],[SalesOrderNumber],[SalesOrderLineNumber],
[OrderQuantity],[UnitPrice],[UnitPriceDiscountPct]
) ON [PS_Mensual] ([OrderDateKey]);
```
###Proceso de 1 de abril 2013

Llegado el día 1 de abril, se debe ajustar la estructura para dar cabida a los datos ya “cerrados” – el mes marzo 2013 – y preparar la estructura para el mes siguiente – abril 2013 – reservando espacio vacío para el mes de mayo 2013; para ello se realizarán las siguiente 4 tareas:

1.Preparar la estructura de particiones para almacenar el mes de abril y establecer el límite del mes siguiente (mayo 2013); se utilizarán las siguientes instrucciones:

```
--
-- Preparar tabla y partición para el mes 2013-05
ALTER PARTITION FUNCTION [PF_Mensual]() SPLIT RANGE (20130501);
ALTER PARTITION SCHEME [PS_Mensual] NEXT USED [PRIMARY];
```
2.Crear índice columnar sobre la estructura a cambiar – los datos del mes de Marzo 2013 – que pasarán a ser propiedad de la tabla [Hechos_Historicos]; se utilizará la siguiente instrucción:

```
CREATE NONCLUSTERED COLUMNSTORE INDEX [nccs_Hechos_Historicos_Mar_2013] ON [dbo].[Hechos_En_Curso]
(
[ProductKey], [CustomerKey],
[OrderDateKey], [SalesOrderNumber], [SalesOrderLineNumber],
[OrderQuantity], [UnitPrice], [UnitPriceDiscountPct]
) ON [PRIMARY];
```
3.Cambiar las particiones de propietario – pasar de [Hechos_Historicos] a [Hechos_En_Curso]; la parte interesante y bonita aquí es que este cambio no supone ningún movimiento de datos – tan sólo es un cambio a nivel de metadatos de ambas tablas:

```
--
-- Cambio de partición de marzo 2013
DECLARE @P INT = $partition.[PF_Mensual](20130301);
ALTER TABLE [dbo].[Hechos_En_Curso] 
SWITCH TO [dbo].[Hechos_Historicos] PARTITION @P;
```
4.Borrar en [Hechos_Historicos] la restricción CHECK que evitaba insertar datos anteriores de marzo 2013 en la carga inicial – a continuación se moverán los datos de marzo 2013: 

```
--
-- borrar la CONSTRAINT para mover los datos de marzo 2013
ALTER TABLE [dbo].[Hechos_Historicos] 
DROP CONSTRAINT Meses_Anteriores_Marzo_2013;
```

5.Modificar la estructura – CONTRAINTS – de la tabla [Hechos_En_Curso] para dar soporte al mes de Abril 2013, y [Hechos_Historicos] para reflejar que tiene datos anteriores a Abril 2013:

```
ALTER TABLE [dbo].[Hechos_En_Curso] 
DROP CONSTRAINT Mes_En_Curso;
GO

ALTER TABLE [dbo].[Hechos_En_Curso] 
ADD CONSTRAINT Mes_En_Curso 
CHECK ([OrderDateKey]>=20130401 AND [OrderDateKey]<20130501);
GO

ALTER TABLE [dbo].[Hechos_Historicos] 
ADD CONSTRAINT Meses_Anteriores_Abril_2013 
CHECK ([OrderDateKey]<20130401);
```

6.Borrar el índice columnar en la tabla [Hechos_En_Curso] para poder recibir las inserciones del mes en curso:
```
DROP INDEX [nccs_Hechos_Historicos_Mar_2013] 
ON [dbo].[Hechos_En_Curso];
```
De esta forma, la tabla [Hechos_En_Curso] ya está preparada para gestionar los datos vivos – leer, insertar y modificar – del mes en curso. Al lector ya sólo le quedaría automatizar este proceso para realizarlo a principio de cada mes. 

###Analizar la eficiencia de las consultas

Finalmente, la razón para organizar esta arquitectura es para poder utilizar índices columnares cuando sea posible sin afectar a la operativa normal del negocio (inserciones y borrados sobre tablas que lo requieren). El siguiente es un ejemplo de consulta que combina información de las tablas [Hechos_En_Curso] y [Hechos_Historicos]. 

Primero cargaremos datos en el mes de abril 2013 para simular que la tabla [Hechos_En_Curso] está recibiendo datos; para ello se utilizará la siguiente instrucción:

```
--
-- mes siguiente
INSERT INTO [dbo].[Hechos_En_Curso]
SELECT 
[ProductKey], [CustomerKey], 
CONVERT(VARCHAR(8), DATEADD(YEAR, 7, CAST(
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 1, 4) + '-' + 
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 5, 2) + '-' + 
SUBSTRING(CAST([OrderDateKey] AS VARCHAR(8)), 7, 2) + ' 00:00:00.000'
AS DATETIME)), 112) [OrderDateKey], 
[SalesOrderNumber], [SalesOrderLineNumber], 
[OrderQuantity], [UnitPrice], [UnitPriceDiscountPct]
FROM [dbo].[FactInternetSales] WITH (TABLOCK)
WHERE OrderDateKey BETWEEN 20060401 AND 20060430;
```

Una vez que ambas tablas tiene datos, se ejecutarán tres consultas, analizando su plan de ejecución – en SQL Server Management Studio combinación de teclas Control + M:

Consulta que necesita datos de [Hechos_Historicos] (acceso a una partición)

```
--
-- Ventas del año 2012: [Hechos_Historicos]
-- Acceso a una partición
SELECT 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS [Año],
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS Mes,
SUM ([OrderQuantity] * [UnitPrice] * (1.00-[UnitPriceDiscountPct])) Importe
FROM [dbo].[Hechos]
WHERE [OrderDateKey] >= 20120101 and [OrderDateKey] < 20130101
GROUP BY 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)),
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE))
ORDER BY [Año], Mes
```

Viendo el detalle del operador Columnstore Index Scan la propiedad Actual Partition Count indica que se accede a sólo una partición; dicho de otra forma, el optimizador de consulta descarta las particiones que no son relevantes para la consulta:

![] (./img/Combinando-Indices-Columnares/image4.png)

Consulta que necesita datos de [Hechos_Historicos] (acceso a varias particiones):

```
--
-- Ventas anteriores a marzo 2013: [Hechos_Historicos]
-- Acceso a varias particiones
SELECT 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS [Año],
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS Mes,
SUM ([OrderQuantity] * [UnitPrice] * (1.00-[UnitPriceDiscountPct])) Importe
FROM [dbo].[Hechos]
WHERE [OrderDateKey] < 20130301 
GROUP BY 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)),
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE))
ORDER BY [Año], Mes
```

Viendo el detalle de operador Columnstore Index Scan la propiedad Actual Partition Count indica que se accede a 3 particiones (partición 1 con datos anteriores a enero 2013, partición 2 con datos de enero 2013, y partición 3 con datos de febrero 2013:

![] (./img/Combinando-Indices-Columnares/image5.png)

Consulta que necesita datos de [Hechos_En_Curso]
```
--
-- Ventas de abril 2013: [Hechos_En_Curso]
SELECT 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS [Año],
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS Mes,
SUM ([OrderQuantity] * [UnitPrice] * (1.00-[UnitPriceDiscountPct])) Importe
FROM [dbo].[Hechos]
WHERE [OrderDateKey] >= 20130401 and [OrderDateKey] < 20130501
GROUP BY 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)),
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE))
ORDER BY [Año], Mes
```

Donde se accede solamente a la tabla [Hechos_En_Curso] a pesar de que conceptualmente se soliciten datos a las tablas subyacentes a través de la vista; en este escenario, el uso de la restricción CHECK sobre la tabla [Hechos_Historicos] confirma al optimizador de consultas que no necesita acceder a datos anteriores a 20130401: 

![] (./img/Combinando-Indices-Columnares/image6.png)

Consulta que necesita datos de [Hechos_Historicos] y [Hechos_En_Curso] pero no utiliza el índice columnar.

```
--
-- Ventas del año 2013: [Hechos_Historicos] y [Hechos_En_Curso]
-- sin utilizar índice columnar
SELECT 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS [Año],
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS Mes,
SUM ([OrderQuantity] * [UnitPrice] * (1.00-[UnitPriceDiscountPct])) Importe
FROM [dbo].[Hechos]
WHERE [OrderDateKey] >= 20130101 
GROUP BY 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)),
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE))
ORDER BY [Año], Mes
```
Donde se puede en color Rojo que se accede al índice columnar en la tabla [Hechos_Historicos] y en color verde el índice clustered de la tabla [Hechos_En_Curso]: 

![] (./img/Combinando-Indices-Columnares/image7.png)

Consulta que necesita datos de [Hechos_Historicos] y [Hechos_En_Curso] pero no utiliza el índice columnar.

```
--
-- Ventas del año 2013: [Hechos_Historicos] y [Hechos_En_Curso]
-- sin utilizar índice columnar
SELECT 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS [Año],
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)) AS Mes,
SUM ([OrderQuantity] * [UnitPrice] * (1.00-[UnitPriceDiscountPct])) Importe
FROM [dbo].[Hechos]
WHERE [OrderDateKey] >= 20130101 
GROUP BY 
DATEPART(YEAR, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE)),
    DATEPART(MONTH, CAST(CAST(OrderDateKey AS VARCHAR(8)) AS DATE))
ORDER BY [Año], Mes
```
Donde a se descarta utilizar el índice columna en la tabla [Hechos_Historicos]; en este caso las estimaciones del optimizador de consultas desecha usar el índice columnar; si la consulta se codificara contra la tabla directamente en lugar de a través de la vista se podría influir al optimizador a utilizar el índice columnar a través de hints (WITH (INDEX=nccs_Hechos_Historicos), pero al consultar contra la vista, no se posible inferir el índice: 

![] (./img/Combinando-Indices-Columnares/image8.png)

Nota: sea consciente del uso de HINTs sobre índices en SQL Server y analícelo su efecto cuidadosamente. Si el optimizador ha decidido hacer un recorrido parcial del índice clustered es debido a que es más eficiente en este caso que recorrer y descomprimir los segmentos del índice columnar. Notará que cuanto mayor es el índice columnar y más reducido es el conjunto de datos a recuperar de la tabla de hechos, con menor frecuencia se utilizará el índice columnar. 

###Conclusiones

En este artículo se ha visto cómo utilizar la tecnología de almacenamiento columnar para dar soporte a escrituras y modificaciones sobre la estructura lógica que representan las tablas de hecho de un proyecto de Business Intelligence. De esta forma, se pueden acelerar notablemente el rendimiento de las consultas tipo de Almacenes de Datos en escenarios ROLAP donde típicamente se accede a grandes conjuntos de datos de forma secuencial. Las premisas fundamentales de esta implementación son dos: 1) identificar la columna/condición para particionar los datos, y 2) seleccionar el instante en el tiempo para cambiar estructuras de lectura-escritura a estructuras sólo-lectura.


