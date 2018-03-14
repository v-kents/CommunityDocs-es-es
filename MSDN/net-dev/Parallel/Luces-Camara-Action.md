---
redirect_url: https://docs.microsoft.com/
title: Parallel Series - Luces, cámara, Action
description: Parallel Series - Luces, cámara, Action
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: net-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

# Parallel Series - Luces, cámara, Action

[Lluís Franco](http://lluisfranco.com/about/), Microsoft MVP

<http://lluisfranco.com/category/language/spanish/>

<http://www.linkedin.com/in/lluisfranco>

<https://twitter.com/lluisfranco>

Magia sin delegados
-------------------

Los delegados de tipo
[Action](http://msdn.microsoft.com/en-us/library/018hxwa8.aspx) son una
de las pequeñas maravillas traídas a .NET desde la [programación
funcional](http://lluisfranco.com/2012/02/08/programacin-funcional-para-el-resto-de-nosotros/).
Pueden definirse como un método que tiene un sólo parámetro (en su
sobrecarga más simple) y que no devuelve ningún valor. Habitualmente
suelen usarse para almacenar referencias a métodos o para pasar un
método como parámetro sin tener que declarar explícitamente un delegado.
Basta definir el parámetro con la misma firma que se espera recibir y la
magia empieza a actuar.

Un detalle importante que podemos ver al observar la firma de
Action<T> es que el tipo T es contravariante, de modo que podemos
usar este tipo en cualquier otro tipo derivado.  Si quieres saber más
sobre [covarianza y contravarianza en
Generics](http://msdn.microsoft.com/en-us/library/dd799517.aspx) dale un
buen vistazo a [este
post](http://geeks.ms/blogs/etomas/archive/2010/11/18/c-b-225-sico-covarianza-en-gen-233-ricos.aspx)
del blog del colega [Eduard
Tomàs](http://geeks.ms/blogs/etomas/default.aspx).

Veamos un poco de esta magia. Suponiendo que tenemos un método que
admite un parámetro de tipo Action<string> podemos llamar al
método y pasarle (o más bien inyectarle) el comportamiento deseado, es
decir pasarle un método que cumpla con la firma por parámetro:


    void test()
    {
        string msg = "This is the value...";
        doSomethingWithStringValue(enqueueMessage, msg);
        doSomethingWithStringValue(saveToDatabase, msg);
        doSomethingWithStringValue(writeMessageToConsole, msg);
    }

    private void doSomethingWithStringValue(Action<string>
    actionToDo, string value)
    {
        //do several things with this value
        validateMessage(value);
        compressMessage(value);
        //when finishing...
        actionToDo(value);
    }

    private void enqueueMessage(string value)
    {
        //do something & enqueue this value
        Queue<string> messages = new Queue<string>();
        messages.Enqueue(value);
    }

    private void saveToDatabase(string value)
    {
        //do something & save to db this value
        addLineToUserLog(value);
    }

    private void writeMessageToConsole(string value)
    {
        //do something & output this value
        Console.WriteLine(value);
    }

Fijaros: Por un lado tenemos tres métodos que hacen cosas distintas pero
tienen la misma firma (todos esperan un parámetro de tipo string). Y por
el otro tenemos un método que tiene un parámetro de tipo
Action&lt;string&gt;. Es decir, este parámetro admite como valor
cualquier método que tenga la misma firma que hemos declarado. De este
modo, podemos invocarlo varias veces y en cada una de ellas de podemos
decir que utilice un método distinto para hacer algo distinto. Muy
similar a las funciones asíncronas de Javascript o al [patrón
Promise](http://wiki.commonjs.org/wiki/Promises/A).

Bonito, eh? Es lo mismo que utilizar delegados pero, uhm… espera! Si,
sin usarlos :)

Actions por todos lados
-----------------------

Pues cada vez son más las clases del framework que hacen uso de este
tipo de delegados y de su hermano Func, que viene a ser lo mismo pero
retornando un valor. Sin ir más lejos, los métodos extensores de LINQ
(Select, Where, OrderBy) utilizan Func y casi toda la
[TPL](http://lluisfranco.com/2011/01/25/parallel-series-indice-de-contenidos/)
se basa en el uso de Action, desde los bucles For y ForEach de [la clase
estática
Parallel](http://lluisfranco.com/2011/06/26/parallel-series-la-clase-esttica-parallel/),
hasta la creación explícita de tareas mediante la clase Task.

Por ejemplo, cuando deseamos ejecutar una tarea de forma asíncrona,
podemos utilizar el método StartNew de la clase Task.Factory. Este
método tiene una sobrecarga en el que acepta un parámetro de tipo Action
o Func, y lo mejor de todo es que puede crearse inline (en línea), es
decir en el mismo momento en que se realiza la llamada. Veamos unos
ejemplos:

Partiendo de un método simple:

    private void doSomething()
    {
        //Pause for 0 to 10 seconds (random)
        Random r = new Random(Guid.NewGuid().GetHashCode());
        Thread.Sleep(r.Next(10000));
    }

Puesto que es un método que ni recibe parámetros ni devuelve nada
podemos llegar a utilizar su sobrecarga más sencilla:


    Task.Factory.StartNew(doSomething);

Otra opción, si el método tuviese un parámetro int para especificar el
número de segundos (en lugar de ser aleatorio) podría ser esta:

    private void doSomething(int seconds)
    {
        int mseconds = seconds \* 1000
        Thread.Sleep(mseconds);
    }

    Task.Factory.StartNew(() => doSomething(5));

Aquí ya vemos algo más curioso. Algo que seguramente hemos observado
muchas veces y utilizado antes: Una [expresión
lambda](http://msdn.microsoft.com/en-us/library/bb397687.aspx). Esta
expresión es también algo tomado de la [programación
funcional](http://lluisfranco.com/2012/02/08/programacin-funcional-para-el-resto-de-nosotros/),
y puede leerse como: “va hacia”. En la parte izquierda de la expresión
se especifican los  parámetros de entrada o variables (si existen, en
este caso no), y en la parte derecha la propia expresión. El caso
anterior es tan simple que no tiene parámetros y sólo usamos la parte
derecha de la expresión para enviar el valor 5 al método.

Al usar una expresión lambda se permite que las instrucciones contenidas
en dicha expresión puedan varias líneas, de modo que también podemos
llegar a hacer algo como esto:

    Task.Factory.StartNew(() =>
    {
        int x = 5;
        doSomething(x);
        Console.WriteLine("finished!");
    });

O directamente esto:

    Task.Factory.StartNew(() =>
    {
        int x = 5;
        int mseconds = seconds * 1000;
        Thread.Sleep(mseconds);
        Console.WriteLine("finished!");
    });

En este caso, podemos incluso omitir el método doSomething y usar el
código inline directamente en la llamada a StartNew. No obstante, un
consejo: No es conveniente abusar de las expresiones inline, de modo que
si tenemos más de 5 ó 6 líneas tal vez será más conveniente refactorizar
este código para no hacerlo demasiado complejo y respetar los buenos
principios de diseño.

**Ahora con parámetros**

Hasta ahora al realizar la llamada siempre hemos usado un delegado de
tipo Action sin parámetros, de ahí los paréntesis vacíos en la parte
izquierda de la expresión lambda. Sin embargo encontraremos multitud de
casos en los que debemos pasar parámetros. Sin ir más lejos el método
Parallel.For tiene un parámetro de tipo Action al que hay que pasarle un
valor de tipo int, lógico por otra parte ya que dentro de un bucle es
muy necesario conocer en todo momento el valor de la iteración:

    Parallel.For(1, 40, (i) =>
    {
        serie.Add(i.Fibonacci());
    });

Observar que no es necesario definir el tipo de datos de la variable i
porque el propio compilador es capaz de inferirlo, pero evidentemente
también podemos declarar el tipo previo al nombre de la variable, como
siempre (int i).

Podemos pasar tantos parámetros como necesite la Action, el mismo método
tiene otra sobrecarga que admite un objeto
[ParallelLoopState](http://msdn.microsoft.com/en-us/library/system.threading.tasks.parallelloopstate.aspx)
para poder cancelar el bucle:

    Parallel.For(1, 40, (i, loopState) =>
    {
        serie.Add(i.Fibonacci());
        if (i > 35) loopState.Break();
    });

Y por supuesto podemos crearnos nuestras propias acciones con tantos
parámetros como sean necesarios. Aunque al igual que ante, si
necesitamos pasar más de 3 ó 4 parámetros a un Action tal vez deberíamos
plantearnos si estamos haciendo las cosas bien.

    private void saveToDatabase(string value, bool useDetails)
    {
        addLineToUserLog(value);
        if (useDetails) addLineToUserLogDetails();
    }

    void test()
    {
        //Define una acción que apunta al método saveToDatabase
        Action<string, bool> myAction = (v, s) =>
        {
            saveToDatabase(v, s);
        };

        string value = "This is the value...";
        bool usedetails = true;
        myAction(value, usedetails); //Aquí se llama a la acción y al método al que apunta
    }

Resumiendo
----------

Los delegados de tipo Action son muy útiles para simplificar el trabajo
con delegados (ahora que lo pienso hace bastante tiempo que no los uso,
ni para declarar eventos). Nos permiten especificar las acciones a
realizar pudiendo llegar a tener hasta 16 parámetros -demasiados en mi
opinión- y al igual que los método void no devuelven ningún valor. Si
queremos lo mismo pero pudiendo retornar un resultado debemos utilizar
su hermano [Func<T,
TResult>](http://msdn.microsoft.com/en-us/library/bb549151.aspx) que
es exactamente igual, pero en todas sus sobrecargas (y tiene tantas como
Action) el último argumento representa el valor de retorno.

Espero que os haya quedado un poco más claro, para cualquier duda
[contactad conmigo](http://lluisfranco.com/contact/).

Post complementario a la serie sobre la TPL. [Ir al índice de
contenidos](http://lluisfranco.com/2011/01/25/parallel-series-indice-de-contenidos/)

**Oops! No soy tan original como pensaba…**

Una vez terminado este post, me he percatado de que existe otro post
sobre Action del conocido BlkRabbitCoder con el mismo título que he
usado yo (en su caso es el título de una sección). He estado a punto de
quitarlo, pero… que demonios! Para una idea buena que tengo :-D




