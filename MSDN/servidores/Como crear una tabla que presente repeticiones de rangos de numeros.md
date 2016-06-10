---
title: Cómo crear una tabla que presente repeticiones de rangos de números
description: Cómo crear una tabla que presente repeticiones de rangos de números
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: servers
ms.custom: CommunityDocs
---







#Cómo crear una tabla que presente repeticiones de rangos de números


Por **Freddy Angarita**

SqlServer MVP - [Perfil
MVP](https://mvp.support.microsoft.com/es-es/mvp/Freddy%20Leandro%20Angarita%20Castellanos-4028407)

<freddy_angarita@hotmail.com>

<http://geeks.ms/blogs/fangarita/default.aspx>



El Problema
-----------

Se quiere tener una tabla que presente los siguiente es datos (por
ejemplo)

  *Dato*
  ------------
  4
  
  5
  
  6
  
  7
  
  1
  
  2
  
  3
  
  4
  
  5
  
  6
  
  7
  
  1
  
  .
  
  .

Anteriormente en el artículo [
\[Code\] Cómo generar N Filas Rápido Sql
Server](http://geeks.ms/blogs/fangarita/archive/2010/12/22/code-c-243-mo-generar-n-filas-r-225-pido-sql-server.aspx) ,
se presentan técnicas para generar una tabla de N filas rápidamente la
cual usaremos para desarrollar el algoritmo, en la primera parte se
tiene la tabla base, generada de la siguiente manera:
```SQL
declare @CantidadRegistros int, @ValorEnQueSeReInicia int, @IniciaEn int

set @CantidadRegistros = 30 --Valor Prueba
set @ValorEnQueSeReInicia = 7
set @IniciaEn = 4
--------------------

declare @IdTabla table (Id int, Periodo int default (0))

insert into @IdTabla(Id)
select i + @IniciaEn from dbo.fnGenTable(0,@CantidadRegistros,1) genTable

select * from @IdTabla
```
Hasta éste punto se logra tener una tabla con la cantidad de registros
que se quieren generar, se agrega una columna llamada Periodo que
contendrá el valor final repitiendo el intervalo, para obtener el valor
por cada fila se usará una técnica consignada en el artículo [
[Code
]
Cómo calcular un total acumulado Rápido SIN
Cursores](http://geeks.ms/blogs/fangarita/archive/2010/10/28/code-c-243-mo-calcular-un-total-acumulado-r-225-pido-sin-cursores.aspx)
```SQL
declare @CurrentId int = @IniciaEn - 1

update @IdTabla
set @CurrentId = Periodo = case when @CurrentId =
@ValorEnQueSeReInicia then 1 else @CurrentId+1 end

select * from @IdTabla
```
Con el bloque de código anterior se insertan actualizan los registros
dependiendo del valor que tenga y si necesita reuniciarse se hace en el
case del Update, el código final:
``` SQL
declare @CantidadRegistros int, @ValorEnQueSeReInicia int, @IniciaEn int

set @CantidadRegistros = 30 --Valor Prueba
set @ValorEnQueSeReInicia = 7
set @IniciaEn = 4
--------------------

declare @IdTabla table (Id int, Periodo int default (0))

insert into @IdTabla(Id)
select i + @IniciaEn from dbo.fnGenTable(0,@CantidadRegistros,1) genTable

declare @CurrentId int = @IniciaEn - 1
update @IdTabla
set @CurrentId = Periodo = case when @CurrentId = @ValorEnQueSeReInicia then 1 else @CurrentId+1 end

select * from @IdTabla
```
Los comentarios son bienvenidos, espero sea de ayuda,

FREDY LEANDRO ANGARITA CASTELLANOS

Sql Server MVP


