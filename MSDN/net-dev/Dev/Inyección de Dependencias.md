---
title: Qué es Inyección de dependencias
description: Qué es Inyección de dependencias
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: net-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

# Qué es Inyección de dependencias

Por Juan Carlos Ruiz Pacheco, **Microsoft Technology Evangelist**

![](./img/Inyección de Dependencias/image1.png)

  Twitter   | <https://twitter.com/JuanKRuiz>
  ----------| ----------------------------------------
  Facebook  | <https://www.facebook.com/JuanKDev>
  LinkdIn   | <http://www.linkedin.com/in/juankruiz>



La inyección de dependencias o DI por sus siglas en inglés, es una
herramienta comúnmente utilizada en varios patrones de diseño orientado
a objetos, consiste en inyectar comportamientos a componentes.

Esto no es más que extraer responsabilidades a un componente para
delegarlas en otro, estableciendo un mecanismo a través del cual el
nuevo componente pueda ser cambiado en tiempo de ejecución. Es
conveniente no confundir Inyección de dependencias (DI) con Inversión de
Control (IoC), error muy comúnmente cometido que figura especialmente en
la web. IoC es un tema para un próximo artículo.

Ejemplo y Explicación detallada

Imaginemos que estamos haciendo un videojuego en cual tenemos un
personaje que es un robot, este robot puede realizar acciones de
diferentes maneras, por lo cual su cabeza puede ser conectada a
infinidad de cuerpos distintos.

Las soluciones tradicionales desde el punto de vista de POO son
diversas, ejemplo:

* Una clase base Robot con un atributo cuerpo, crear varias clases asignando un atributo Cuerpo diferente en el constructor

* Una clase Robot con un atributo enumeración que le permita cambiar de cuerpo

* Muchas clases cuerpo que heredan de una clase Robot

Sin embargo a la final la responsabilidad del cuerpo y de la cabeza
sigue siendo confusa, otro de mis principios favoritos de Diseño
Orientado a Objetos es de “Single Responsability” o mejor

“Un objeto una responsabilidad”

Claramente las soluciones clásicas al problema planteado no ofrecen esa
opción.

¿Qué hacer? Inyección de dependencias también puede llamarse inyección
de comportamientos, en todo caso es un nombre muy profesional y
estilizado, lo cual puede ser intimidante, pero es un nombre preciso.
Que sucede cuando te inyectan algo, ¿una vacuna por ejemplo? Depositan
nuevos componentes en tu cuerpo, que pueden modificar el funcionamiento,
sin que esto implique que vuelvas a nacer.

De eso mismo se trata la Inyección de Dependencias, colocar dentro de un
objeto otros que puedan cambiar su comportamiento, sin que esto implique
volver a crear el objeto.

Esto nos permite tener un objeto que puede hacer un conjunto de tareas,
cada una de esas tareas es una responsabilidad, que puede ser ejecutada
por otro objeto únicamente especialista y dedicado a ello \[una
responsabilidad\], pero ahora tenemos otro diferenciador, El objeto
responsable de ejecutar esa única tarea

Puede establecerse en tiempo de ejecución

La implementación habitual en programación es crear un método capaz de
establecer el comportamiento, es decir capaz de cambiar el valor de un
atributo asignándole una instancia de objeto diferente.

Esta seria una posible implementación de Robot que no utiliza Inyección
de Dependencias


    public class Robot
    {
        public Robot() { }
        public void Caminar()
        {
            //Caminando Ando...
            /*Paso 1
            *Paso 2
            *Paso 3
            *Paso N*/
        }
        /*Hacer otras cosas cool que hacen los robots*/
        public void Disparar();
        public void Volar();
        public void BuscarAJhonConnor()
        {
            /*Paso 1 buscar en internet
            *Paso 2 correr
            *Paso 3 caminar para ahorrar batería
            *Paso N*/
        }
    }

Ahora cambiemos la implementación por una que si haga Inyección de
dependencias, primero creamos la clase Body la cual será la responsable
de ejecutar las acciones del cuerpo:



    public class Body
    {
        public void Caminar()
        {
            //Caminando ando...
        }
        public void Volar()
        {
            //Volando ando...
        }
        public void Disparar()
        {
            //Volando ando...
        }
    }

Seguidamente creamos un Robot que camina por medio de un Body, teniendo
atención en delegar las responsabilidades a dicho objeto:



    public class Robot
    {
        public Body _body;
        public Robot() { }
        public void Caminar()
        {
            if(_body != null)
                _body.Caminar();
        }

        public void Volar()
        {
            if (_body != null)
                _body.Volar();
        }

        public void Disparar()
        {
            if (_body != null)
                _body.Disparar();
        }

        /*Hacer otras cosas cool que hacen los robots*/

        public void BuscarAJhonConnor()
        {
            /*Paso 1 buscar en internet
            *Paso 2 _body.Caminar();
            *Paso 3 _body.Disparar();
            *Paso N*/
        }
    }

Como nos podemos dar cuenta el Robot hace todo lo que hacia antes aunque
no tiene asignado aún un body, así que establecemos un mecanismo para
hacer esto:


    public class Robot
    {
        public Body _body;
        //Inyectar un cuerpo al Robot
        public void SetBody(Body newBody)
        {
            _body = newBody;
        }

        public Robot() { }
        public void Caminar()
        {
            if(_body != null)
                _body.Caminar();
        }

        public void Volar()
        {
            if (_body != null)
                _body.Volar();
        }

        public void Disparar()
            {
            if (_body != null)
                _body.Disparar();
        }

        /*Hacer otras cosas cool que hacen los robots*/
        public void BuscarAJhonConnor()
        {
            /*Paso 1 buscar en internet
            *Paso 2 _body.Caminar();
            *Paso 3 _body.Disparar();
            *Paso N*/
        }

    }

Bueno eso fue muy ‘java’, pongámonos serios y volvámoslo más elegante,
fácil de leer y de mantener, más C\#. Hagamos uso de propiedades y
deshagámonos del private storage


    public class Robot
    {
        //Inyectar un cuerpo al Robot
        public Body Cuerpo { get; set; }
        public Robot() { }
        public void Caminar()
        {
            if (Cuerpo != null)
                Cuerpo.Caminar();
        }

        public void Volar()
        {
            if (Cuerpo != null)
                Cuerpo.Volar();
        }

        public void Disparar()
        {
            if (Cuerpo != null)
                Cuerpo.Disparar();
        }

        /*Hacer otras cosas cool que hacen los robots*/
        public void BuscarAJhonConnor()
        {
            /*Paso 1 buscar en internet
            *Paso 2 Cuerpo.Caminar();
            *Paso 3 Cuerpo.Disparar();
            *Paso N*/
        }
    }

Como se puede observar la clase Robot tiene la acción caminar, pero la
responsabilidad es de la clase Body, también es claro que el valor de la
propiedad Cuerpo lo podemos cambiar en tiempo de ejecución tan solo
asignando una instancia diferente a la propiedad Cuerpo. Esta es una
primera aproximación a la inyección de dependencias, siendo más formales
incluso muchos comportamientos como Volar y Caminar incluso podrían
llegar a estar en clases distintas.

Ahora subamos un poco el nivel, con lo aprendido podemos hablar del
patrón de estrategia, el tema del próximo artículo.




