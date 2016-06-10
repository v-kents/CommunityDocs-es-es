---
title: Sobre Delegados, Action, Func y Lambda
description: Sobre Delegados, Action, Func y Lambda
author: MSCommunityPubService
ms.date: 06/01/2016
ms.topic: how-to-article
ms.service: net-dev
ms.custom: CommunityDocs
---








# Sobre Delegados, Action, Func y Lambda

Nicolás Herrera                                                                            | Junio 2012 
-------------------------------------------------------------------------------------------|------------
MVP, miembro Gold del grupo de Microsoft Community Specialist Colombia, blogger y speaker  | 
[Blog](http://nicolocodev.wordpress.com/) |


Delegados:
----------

Estos son unos de los temas que por lo general nos generan ciertas
dudas, todas parten del concepto de los delegados, y si no conocemos
bien este, pues no vamos a poder sacarle todo el potencial a muchos
aspectos de Generics, por ejemplo. No quiero profundizar mucho en la
teoría de lo que son los delegados, ya el buen Eduard Tomas escribió
[*este*](http://geeks.ms/blogs/etomas/archive/2010/07/21/c-b-225-sico-delegates.aspx)
excelente artículo en su blog al respecto.

En definitiva, una definición muy breve para un delegado podría ser, un
tipo que define la firma de un método, entonces podríamos asociar a la
instancia de un evento a cualquier método que respete su firma. Por
ejemplo un delegado que realice una operación entre dos números, nos
quedaría de la forma:

    public delegate double Operacion(double num1, double num2);
    static void Main(string\[\] args)
    {
        double num1 = 8;
        double num2 = 6;
        Operacion sumar = new Operacion(Sumar);
        double resultado = sumar(num1, num2);
        Console.WriteLine("Suma: {0}", resultado);
    }

    static double Sumar (double num1, double num2)
    {
        return num1 + num2;
    }

Simple y muy útil, pero sin duda uno de los mejores aspectos de los
*delegates* es el de poder pasar métodos como argumentos de un método,
¿cómo? … veamos un ejemplo:


    public delegate double Operacion(double num1, double num2);
    static void Main(string\[\] args)
    {
        double num1 = 8;
        double num2 = 6;
        Operacion operacionSuma = new Operacion(Sumar);
        double resultSuma = RealizarOperacion(num1, num2, operacionSuma);
        Operacion operacionResta = new Operacion(Restar);
        double resultResta = RealizarOperacion(num1, num2, operacionResta);
        Console.WriteLine(string.Format("Suma: {0}", resultSuma));
        Console.WriteLine(string.Format("Resta: {0}", resultResta));
    }
    static double RealizarOperacion(double num1, double num2, Operacion operacion)
    {
        return operacion(num1, num2);
    }
    static double Sumar (double num1, double num2)
    {
        return num1 + num2;
    }
    static double Restar(double num1, double num2)
    {
        return num1 - num2;
    }

Ahora con esto tenemos una función “genérica” que espera un método como
parámetro, para operar con los valores y devolvernos un valor.

Action&lt;T1, T2…&gt;:
----------------------

Este es un delegado que encapsula un método con hasta 16 parámetros y no
devuelve valor, la ventaja que tenemos con este, es que no necesitamos
definir un delegado personalizado, pero repito el precio que pagamos por
este beneficio es que no podemos devolver un valor, este deberá ser
*void*. Un ejemplo de aplicación de este en el contexto de nuestro
ejemplo:

    static void Main(string[] args)
    {
        double num1 = 8;
        double num2 = 6;
        Action<double, double> dividir = Dividir;
        dividir(num1, num2);
    }
    static void Dividir(double num1, double num2)
    {
        double resultado = num1/num2;
        Console.WriteLine(string.Format("Division: {0}", resultado));
    }

Func&lt;T, TResult&gt;:
-----------------------

En principio es similar al Actio&lt;T&gt; con la diferencia que este si
nos retorna un valor, es decir, no necesitamos declarar un delegado
personalizado y de este si podemos esperar un valor de respuesta , el
ejemplo seria el siguiente:

    static void Main(string[] args)
    {
        double num1 = 8;
        double num2 = 6;
        Func<double, double, double> operacionMultipl = Multiplicar;
        double resultMultipl = operacionMultipl(num1, num2);
        Console.WriteLine(string.Format("Multiplicar: {0}", resultMultipl));
        Console.ReadKey();
    }
    static double Multiplicar(double num1, double num2)
    {
        return num1*num2;
    }

Expresiones Lambda:
-------------------

Una expresión lambda es una función anónima que puede contener
expresiones e instrucciones y se puede utilizar para crear delegados o
tipos de árboles de expresión, se identifican con el operador lambda
“=&gt;” por ejemplo:

    public delegate double Operacion(double num1, double num2);
    static void Main(string[] args)
    {
        double num1 = 8;
        double num2 = 6;
        Operacion operacion = (x, y) => (x*y);
        double resultado = operacion(num1, num2);
    }

O mejor aún, podríamos emplearlos para pasarlos como parámetro de
nuestro método de operaciones aritméticas, sin tener que definir un
método que implemente su firma, pues el método va anónimo en la
expresión (x\*y):

public delegate double Operacion(double num1, double num2);

    static void Main(string[] args)
    {
        double num1 = 8;
        double num2 = 6;
        double resultadoOperacion = RealizarOperacion(num1, num2, (x, y) => (x*y));
        Console.WriteLine(string.Format("Multiplicacion: {0}",
        resultadoOperacion));
    }

    static double RealizarOperacion(double num1, double num2, Operacion operacion)
    {
        return operacion(num1, num2);
    }




