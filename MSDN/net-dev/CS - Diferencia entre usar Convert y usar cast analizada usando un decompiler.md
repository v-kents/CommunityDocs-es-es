<properties
	pageTitle="C# - Diferencia entre usar Convert y usar cast analizada usando un decompiler"
	description="Diferencia entre usar Convert y usar cast analizada usando un decompiler"
	services="net-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="net-dev"
	ms.workload="CS"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/17/2016"
	ms.author="andygonusa"/>


# C\# - Diferencia entre usar Convert y usar cast analizada usando un decompiler

![](./img/CS - Diferencia entre usar Convert y usar cast analizada usando un decompiler/image1.PNG)

Por Juan Carlos Ruiz Pacheco, **Microsoft Technology Evangelist**

  Twitter   | <https://twitter.com/JuanKRuiz>
  ----------|----------------------------------------
  Facebook  | <https://www.facebook.com/JuanKDev>
  LinkdIn   | <http://www.linkedin.com/in/juankruiz>
  Blog      | <http://juank.io>

Esta es una duda frecuente cuando quieres convertir de un tipo numérico
a otro.

En ese caso hay diferencias importantes sobre todo en cuanto a velocidad
de procesamiento, veamos dos ejemplos que he explicado **después de
analizar los ensamblados del .Net Framework** para revisar su
funcionamiento interno...

![](./img/CS - Diferencia entre usar Convert y usar cast analizada usando un decompiler/image2.png)


CONVERTIR DE TIPO DECIMAL A TIPO INT
------------------------------------

#### UTILIZANDO CAST

\[ int a = (int)123.33m \]

El runtime lo que hará es simplemente tomar la parte entera del número
descartando completamente la parte decimal.

El tipo **decimal** es de 16 bytes mientras que el tipo **int** es de 4
bytes, lo que sucede es que el runtime toma la parte entera del tipo
**decimal** y la coloca en los 4 bytes del **int**.

Pero atención, siempre y cuando la parte entera del dato tipo
**decimal** quepa en 2\^32 , de lo contrario se genera una excepción de
overflow.

#### UTILIZANDO CONVERT.TOINT32

Cuando el método estático **Convert.ToInt32()** (en adelante solo
**ToInt32**) recibe como parámetro un tipo de dato **decimal** hace más
que solo retornar la parte entera, de hecho redondea el resultado al
entero más cercano.

Esto genera una sobrecarga adicional que lo hace mucho más lento.

Cuando **ToInt32** recibe un tipo **decimal** llama internamente al
método **Decimal.FCallToInt32** que a su vez es un wrapper de un método
implementado en código nativo que hace los cálculos necesarios para
producir un valor redondeado.

Como se observa entonces hay invocación a 3 métodos como mínimo lo cual
implica 3 cambios de contexto: el primero al llamar a **ToInt32**, luego
al llamar a **Decimal.FCallToInt32** y luego cuando este hace el wrapper
a la función de código nativo, hasta allí ya es mucho más lento que
simplemente usar el **cast (int)**.

Ahora, la lógica usada internamente para convertir el tipo de 16 bytes
al tipo de 4 bytes **y tener en cuenta el redondeo** y los casos
especiales como por ejemplo cuando el parámetro es **null**, convierte a
esta función en unas muchísimas veces más lenta que solo hacer cast a
**int**.

CONVERTIR DE TIPO FLOAT A TIPO INT
----------------------------------

#### UTILIZANDO CAST

\[ int a = (int)123.33f \]

El runtime lo que hará es simplemente tomar la parte entera del número
descartando completamente la parte decimal.

El tipo **float** es de 4 bytes al igual que el tipo **int**, así que lo
que sucede es que el runtime toma la parte entera del tipo float y la
coloca en los 4 bytes enteros.

#### UTILIZANDO CONVERT.TOINT32

Cuando el método estático **ToInt32()** recibe como parámetro un tipo de
dato **float** hace más que solo retornar la parte entera, de hecho
redondea el resultado al entero más cercano. Esto genera una sobrecarga
adicional que lo hace mucho más lento.

**ToInt32** cuando recibe un tipo **float** llama al método interno
**Convert.ToInt32** (se llama sí mismo, pero llama la spbrecarga que
recibe parámetro tipo **double** ya que la lógica para **double** es la
misma que para **float**) que es finalmente quien resuelve la lógica
para hacer el redondeo.

Como se observa entonces hay invocación a 2 métodos mínimo lo cual
implica 2 cambios de contexto: el primero al llamar a
**ToInt32(float)**, luego al llamar a **ToInt32(double)** que al final
es que tiene en cuenta el redondeo y los casos especiales como por
ejemplo cuando el parámetro es null.

Esto convierte a esta función en unas muchísimas veces más lenta que
solo hacer cast a **int**, pero comparativamente con el caso de
**decimal** no es tan lenta.

CONCLUSIÓN
----------

Si necesitas velocidad siempre usa operadores de cast ejemplo:

    int a = (int)123.33f

Si requieres aproximación y que te tengan en cuenta los casos especiales
usa siempre Convert.

    int a = Convert.ToInt32(123.33f);
