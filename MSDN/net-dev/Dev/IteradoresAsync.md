---
title: Iteradores y async. ¿Están sincronizados?
description: Iteradores y async. ¿Están sincronizados?
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: win-dev
ms.custom: CommunityDocs
---







#Iteradores y async. ¿Están sincronizados?


![] (./img/IteradoresAsync/image1.png)

Por **Miguel Katrib, Mario del Valle, Ludwic Leonard**

http://www.dnmplus.net

###Entradilla


Ha sido muy bienvenida la inclusión oficial de async y await en C\# 5.0
y Visual Studio 2012. En un temprano artículo \[1\], ya **dNM** nos
había ilustrado sobre las bondades de estos recursos para simplificar el
código cuando se quiere expresar la ejecución asíncrona entre el código
llamante y el código llamado. Uno de los escenarios típicos para
expresar ejecución asíncrona es mantener ejecutando la hebra que
controla interacción con el usuario en una GUI, mientras a la par se van
cargando y mostrando datos de una fuente de datos. ¿Para esto están
adecuadamente integrados el nuevo async y el foreach con el que
recorremos la fuente de datos? Sobre esto trataremos en esta entrega.

El operador de bucle foreach y la maquinaria de iteración que el
compilador genera por detrás cuando se hace uso de yield para formar un
IEnumerable que funciona de forma perezosa (*lazy*) simplifican la forma
de expresar el proceso de generar los datos y consumirlos, abstrayendo
al código usuario de la forma en que dichos datos se producen. Ya en uno
de nuestros primeros trabajos en **dotNetManía** \[2\], cuando aún .NET
andaba por su versión 1.0 y no existía todavía yield en C\#, ilustramos
cómo lograr el efecto de éste usando una suerte de "corutinas"
implementadas a través de hebras que sincronizaban. Separar el tiempo de
producir un dato de quien espera para consumirlo es un escenario
propicio para aplicar la asincronía. El que manda a procesar los datos
puede querer ir haciendo otra cosa mientras se obtiene el resultado.

Cuando damos los primeros pasos con async, uno de los problemas que
muchos pretendemos resolver es el de obtener grandes volúmenes de datos
de cualquier fuente (por ejemplo, una consulta LINQ) sin bloquear la
hebra llamante, que en la mayoría de los casos coincide con la hebra de
una interfaz de interacción con el usuario (GUI). El código del listado
1 muestra un escenario típico: queremos ir rellenando los valores de un
control con datos obtenidos de una base de datos y no quisiéramos que la
interfaz se congelase mientras los datos se van cargando.

**Listado 1. Código para mostrar una lista de contactos**

```

    private void ShowListButton\_OnClick(object sender,
    RoutedEventArgs e)

    {

    Contacts.Clear();

    foreach (var item in from item in DataSource.Contacts

    orderby item.BirthDate descending

    select item)

    {

    Contacts.Add(item);

    }

    }
```

Para evitar que la hebra llamante se bloquee, podemos pensar en usar
ingenuamente async y await en la forma en que se muestra en el listado
2.

**Listado 2. Carga de lista de contactos de forma asíncrona**

```

    private async void ShowListButton\_OnClick(object sender,
    RoutedEventArgs e)

    {

    Contacts.Clear();

    await Task.Run(() =&gt;

    {

    foreach (var item in from item in DataSource.Contacts

    orderby item.BirthDate descending

    select item)

    {

    Contacts.Add(item);

    }

    });

    }
```

De esta manera, estamos forzando a que el bucle foreach que se ocupa de
llenar la lista ocurra asíncronamente con el código que ejecutó la
llamada a ShowListButton\_OnClick, en este caso alguna GUI en la que se
ha presionado el botón de mostrar la lista.

¡Tenemos entonces una interfaz de usuario **no** bloqueada, pero que por
un tiempo no muestra **ninguno** de los datos resultantes de la consulta
realizada! La interfaz no se bloquea pero ¿y el usuario? Éste no verá
sus datos hasta que salen todos de golpe.

Una alternativa es ir mostrando los resultados de a poco, mientras se
obtienen los demás. Aparentemente, podemos pensar en escribir un código
como el del listado 3, en el que la hebra que hace la llamada al método
ejecutará justo hasta la sentencia precedida por el await, y la tarea
indicada con el await se ejecutará asíncronamente.

**Listado 3. Haciendo asíncrono el mostrar cada elemento**

```

    private async void ShowListButton\_OnClick(object sender,
    RoutedEventArgs e)

    {

    Contacts.Clear();

    foreach (var item in from item in DataSource.Contacts

    orderby item.BirthDate descending

    select item)

    {

    await Task.Run(() =&gt;

    {

    Contacts.Add(item);

    });

    }

    }
```

Sin embargo, posiblemente esto no solucionaría el problema, porque lo
que se ha hecho asíncrono con el método llamante es mostrar el dato
Contacts.Add(item), no el producirlo. Hacer asíncrono añadir el método a
la lista de contactos lo que puede provocar es que los elementos
aparezcan en la lista no necesariamente en el mismo orden en que se
producen en la consulta.

Si recordemos que foreach no es más que azúcar sintáctica aplicada sobre
los tipos IEnumerator e IEnumerable, realmente el código del listado 3
es transformado por el compilador en algo equivalente a lo que se
muestra en el listado 4.

**Listado 4. Código con MoveNext antes del await**

```
    private async void ShowListButton\_OnClick(object sender,
    RoutedEventArgs e)

    {

    Contacts.Clear();

    var enumerable = from item in DataSource.Contacts

    orderby item.BirthDate descending

    select item;

    var enumerator = enumerable.GetEnumerator();

    while (enumerator.MoveNext())

    {

    var item = enumerator.Current;

    await Task.Run(() =&gt;

    {

    Contacts.Add(item);

    });

    }

    }
```

Note que la acción de MoveNext (operación encargada de obtener el dato
de la fuente de datos, y posiblemente la de mayor demora) queda fuera
del await. Se podría reescribir el código como se muestra en el listado
5 para pasar el MoveNext hacia dentro del await. En este caso, la hebra
principal puede ir trabajando asíncronamente mientras se produce el
dato.

**Listado 5. Código con MoveNext dentro del await**

```

    private async void ShowListButton\_OnClick(object sender,
    RoutedEventArgs e)

    {

    Contacts.Clear();

    var enumerable = from item in DataSource.Contacts

    orderby item.BirthDate descending

    select item;

    var enumerator = enumerable.GetEnumerator();

    while (await Task&lt;bool&gt;.Factory.StartNew(enumerator.MoveNext))

    var item = enumerator.Current;

    Contacts.Add(item);

    }

    }
```
¿Pero no es esto una vuelta atrás que obliga a manejar explícitamente el
uso de MoveNext y Current, con la pérdida del azúcar sintáctico y
protección que nos da la sentencia foreach?

###Patrón para hacer iteradores asíncronos 


Lo que nos interesa es ver si podemos ofrecer un patrón para recorrer
asíncronamente un iterador (IEnumerable) pasándole el menor trabajo
posible al desarrollador.

Para simplificar, considere un iterador como el del listado 6 (note que
demora “cierto” tiempo en obtener un dato), que es recorrido con el
extensor Foreach para hacer determinado procesamiento.

**Listado 6. Patrón de procesamiento síncrono de un IEnumerable**

```

    public static IEnumerable&lt;long&gt; SlowEnumerable()

    {

    long count = 0;

    while (...)

    {

    Thread.Sleep(500); // Simular le demora en obtener el dato

    yield return count++;

    }

    }

    // ...

    foreach (var x in SlowEnumerable())

    {

    Console.Writeline(x));

    }

    // Acción que queda bloqueada a la espera del procesamiento anterior

    while (true) Console.Write("\*");
```

Podemos pensar que una forma simple para que la producción de los datos
sea asíncrona es hacer como en el listado 7. Sin embargo, esto no es
correcto, porque C\# exige que un método especificado async devuelva
void o un Task. ***NOTA***: Recuerde que si está trabajando con async
instalado sobre VS 2010, debe usar TaskEx.Delay en lugar de Task.Delay,
que sí es aplicable en VS2012.

**Listado 7. Errónea versión asíncrona de un IEnumerable**

```

    public static async IEnumerable&lt;long&gt; AsyncSlowEnumerable()

    {

    long count = 0;

    while (...)

    {

    await Task.Delay(500)); // Simular la demora en obtener el dato

    yield return count++;

    }

    }
```

El código del listado 8, aunque correcto, no resolvería el problema,
porque lo que sería asíncrono en este caso es la ejecución de la tarea
que construye el IEnumerable, pero recuerde que este código es perezoso
(*lazy*) y no produce realmente una colección física; el MoveNext real
(el probable causante de la demora que queremos aprovechar) quedará
fuera del await cuando el compilador genere el código correspondiente a
la maquinaria del yield. Por tanto, la ejecución no llega hasta la
sentencia while (true) Console.Write("\*"); hasta que no se procese todo
el IEnumerable (lo que en este ejemplo, al ser infinito, implica que no
se alcanzaría nunca dicha sentencia).

**Listado 8. Código con mala ubicación de la asincronía**

```

    public static async
    Task&lt;IEnumerable&lt;long&gt;&gt; AsyncSlowEnumerable()

    {

    return await
    Task&lt;IEnumerable&lt;long&gt;&gt;.Factory.StartNew(SlowEnumerable);

    }

    // ...

    AsyncSlowEnumerable().Result.Foreach((x)=&gt;Console.Writeline(x));

    while (true) Console.Write("\*");
```

Para evitar que el desarrollador tenga que desmantelar la maquinaria del
yield y usar directamente MoveNext, con una solución como la que
mostramos en el ejemplo del listado 5, vamos a definir un tipo
IAsyncEnumerable&lt;T&gt; (listado 9) y un método extensor Async que
convierte un IEnumerable&lt;T&gt; en un IAsyncEnumerable&lt;T&gt;.

La clave está en que el GetEnumerator de un IAsyncEnumerable&lt;T&gt;
devuelve IAsyncEnumerator&lt;T&gt;, y es el método MoveNext de
IAsyncEnumerator&lt;T&gt; quien devuelve un Task&lt;bool&gt; donde el
IEnumerator de origen devolvía bool. La iteración entonces debería
hacerse con el método AsyncForeach que se muestra en el listado 10.

**Listado 9. Conversión de IEnumerable a IEnumerable asíncrono**

```

    public interface IAsyncEnumerable&lt;T&gt;

    {

    IAsyncEnumerator&lt;T&gt; GetEnumerator();

    }

    public interface IAsyncEnumerator&lt;T&gt;

    {

    T Current { get; }

    Task&lt;bool&gt; MoveNext();

    }

    public class AsyncEnumerable&lt;T&gt; : IAsyncEnumerable&lt;T&gt;

    {

    public AsyncEnumerable(IEnumerable&lt;T&gt; e)

    {

    this.e = e;

    }

    IEnumerable&lt;T&gt; e;

    class AsyncEnumerator : IAsyncEnumerator&lt;T&gt;

    {

    IEnumerator&lt;T&gt; en;

    public AsyncEnumerator(IEnumerator&lt;T&gt; en)

    {

    this.en = en;

    }

    public T Current

    {

    get { return en.Current; }

    }

    public Task&lt;bool&gt; MoveNext()

    {

    return TaskEx.Run(() =&gt; en.MoveNext());

    }

    }

    public IAsyncEnumerator&lt;T&gt; GetEnumerator()

    {

    return new AsyncEnumerator(e.GetEnumerator());

    }

    }

```

**Listado 10. Patrón para hacer la iteración asíncrona**

```

    public static async Task AsyncForeach&lt;T&gt;(this
    IEnumerable&lt;T&gt; e, Action&lt;T&gt; action)

    {

    IAsyncEnumerator&lt;T&gt; en = new
    AsyncEnumerable&lt;T&gt;(e).GetEnumerator();

    while (await en.MoveNext())

    {

    var x = en.Current;

    action(x);

    }

    }
```

Note que el método AsyncForeach retorna un Task para que el código
llamante pueda decidir esperar por su terminación (aunque esto no lo
usaremos en los ejemplos que siguen). Si ejecutamos ahora un código como
el del listado 11, obtendríamos el resultado que se muestra en la figura
1.

**Listado 11. Probando AsyncForeach**

```

    class Program

    {

    SlowEnumerable().AsyncForeach((x) =&gt;

    {

    Console.WriteLine(x);

    for (int k = 0; k &lt; 10; k++)

    {

    TaskEx.Delay(100).Wait();

    Console.Write("\*");

    }

    });

    while (true)

    {

    Console.Write(".");

    TaskEx.Delay(100).Wait();

    }

    }

```

**Figura 1**

```

    ![](./media/media/image2.png){width="6.5in" height="2.2125in"}
```

Note cómo la hebra principal sigue ejecutando asíncronamente con la
producción de cada dato, y cómo la acción a realizar con cada dato
producido en la iteración se va intercalando con la ejecución de la
hebra principal.

Siguiendo este patrón, el ejemplo inicial de consulta LINQ sobre
contactos puede reescribirse de la forma que muestra el listado 12.

**Listado 12. Código para mostrar una lista de contactos**

```

    private void ShowListButton\_OnClick(object sender,
    RoutedEventArgs e)

    {

    Contacts.Clear();

    (from item in DataSource.Contacts

    orderby item.BirthDate descending

    select item).AsyncForeach(x =&gt;

    {

    Contacts.Add(x);

    });

    }
```

Es importante aclarar que este método AsyncForeach no debe confundirse
con el del método Parallel.Foreach de System.Threading.Tasks. El
comportamiento de ambos métodos es diferente. En el caso de nuestra
propuesta, el objetivo es que el método que llama al AsyncForeach no se
bloquee esperando por el iterador, pero la ejecución de la iteración y
de la acción que se le pasa al AsyncForeach como cuerpo del bucle ocurre
ordenadamente una iteración tras otra en el mismo orden en que se
producen los datos. El objetivo de Parallel.Foreach es otro: el cuerpo
del Foreach se aplica asíncronamente a los distintos datos de la fuente
de datos, pero tratando de lograr paralelismo (físico o virtual, en
dependencia de los recursos), sin comprometerse con el supuesto orden en
que se producen los datos sobre los que se itera.

###Conclusiones


En esta entrega proponemos un patrón para los casos en que queremos
recorrer de forma asíncrona un enumerable, aprovechando los nuevos
recursos de async y await sin que el desarrollador tenga que renunciar a
la sencillez y expresividad del mecanismo de yield y foreach.

La evolución de Visual Studio y de C\# nos ha mostrado cómo este
lenguaje ha ido evolucionando con la inclusión de nuevos recursos y
azúcar sintáctica, mientras el compilador se ha encargado de hacer
transparentemente las transformaciones de código para que todo funcione,
y sin incompatibilidad con el código ya existente. Así ocurrió cuando se
introdujeron los iteradores con yield; así ocurrió también con la
genericidad, con el patrón LINQ, con los delegados y las expresiones
lambda, y más recientemente con async. Faltaría un paso que integre
mejor async e iteradores. Una idea como la que se ha mostrado en esta
propuesta pudiera ser útil.

Podría aceptarse la especificación async a un bucle foreach de tal modo
que un código como

    async foreach (T x in *expr*) {…*acción*…},

el compilador lo transformase en

    *expr*.AsyncForeach((x)=&gt; …*acción…*)

Un método que devuelva un IEnumerable podría especificarse de forma
asíncrona haciendo

    async IEnumerable M(){…}

de tal modo que se considere que si el tal M() es recorrido en un bucle
de la forma

    foreach (T x in M())

el compilador lo transforme en algo como

    M().Async&lt;T&gt;().AsyncForeach(…*acción…*)

donde Async&lt;T&gt; es un método extensor como

    public static IAsyncEnumerable&lt;T&gt; Async&lt;T&gt;(

    this IEnumerable&lt;T&gt; ie)

    {

    return new AsyncEnumerable&lt;T&gt;(ie);

    }

El tema no está agotado; quedan algunos temas pendientes que podrán ser
objeto de futuros trabajos. Por ejemplo: ¿por qué no pueden ser async el
get y/o el set de una propiedad? o ¿cómo ligar el async con un
Parallel.Foreach?

###Referencias


\[1\] **Katrib, M.**, **Leonard, L**. Programación asíncrona en C\# 5.0.
En **dNM** nº 87, diciembre de 2011.

\[2\] **Katrib M.**, **del Valle, M**. Enumeradores e iteradores en C\#
y C\# 2.0. En **dotNetManía** nº 7, septiembre de 2004.

\[3\] **Paneque L.**, **Katrib M**. Programación paralela en Visual
Studio 2010. En **dotNetManía** nº 69, abril de 2010.


