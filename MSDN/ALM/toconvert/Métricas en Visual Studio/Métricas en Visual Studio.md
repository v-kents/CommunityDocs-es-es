  -----------------------------------------------------------------
  **Diego Rojas**                                      Junio 2012
                                                       
  **MCTS WCF 3.5 - MCTS Biztalk - MCTS Data Access**   
  ---------------------------------------------------- ------------
  [Blog](http://icomparable.blogspot.com/)
  -----------------------------------------------------------------

En lo que respecta a las pruebas unitarias, siempre existirá el factor
humano a la hora de garantizar la calidad estructural del software a
partir de estas pruebas, y normalmente cuando se trata de enseñar el
tema a los desarrolladores de software surgen las mismas preguntas:

1.  ¿Cómo saber si las pruebas están bien hechas?

    ¿Qué debo probar y que no debo probar?

    ¿Cómo se cuanto código es verificado con nuestros unit test?

Esta y muchas otras preguntas pueden responderse de muchas formas; sin
embargo, con la ayuda de las métricas de visual studio podemos obtener
información para responder estas y muchas otras preguntas. En este post
nos vamos a enfocar en como determinar la cantidad de código cubierto
por nuestras pruebas unitarias utilizando Visual Studio 2010.

### Proyecto Ejemplo

Nuestro proyecto será una simple aplicación de consola con dos clases
con diferentes propósitos. Una que nos permitirá manipular colecciones
de objetos y otra que nos permita manipular arreglos de enteros.

La clase que nos permite manipular colecciones de objetos es la
siguiente:

1.  C\#

<!-- -->

1.  public class AdministradorDeColecciones

    {

    public T PrimerElemento&lt;T&gt;(IEnumerable&lt;T&gt; pColeccion )

    {

    return pColeccion.FirstOrDefault();

    }

    public T UltimoElemento&lt;T&gt;(IEnumerable&lt;T&gt; pColeccion)

    {

    return pColeccion.LastOrDefault();

    }

    public IEnumerable&lt;T&gt; ObtenerDelTipo&lt;T&gt;(
    IEnumerable&lt;T&gt; pColeccion, Type pType)

    {

    return pColeccion.Where(p =&gt; p.GetType() == pType);

    }

    public IEnumerable&lt;T&gt; ObtenerTodosMenosDelTipo&lt;T&gt;(
    IEnumerable&lt;T&gt; pColeccion, Type pType )

    {

    return pColeccion.Where(p =&gt; p.GetType() != pType);

    }

    }

La clase que nos permite manipular arreglos de enteros es la siguiente:

1.  C\#

<!-- -->

1.  public class AdministradorDeArreglosNumericos

    {

    public decimal ObtenerPromedio( int\[\] pArreglo)

    {

    return (pArreglo.Sum() / pArreglo.Count());

    }

    public int ObtenerElMayor( int\[\] pArreglo)

    {

    return

    (from \_i in pArreglo orderby \_i descending select
    \_i).FirstOrDefault();

    }

    }

Ahora procedemos a crear un proyecto para realizar nuestras pruebas
unitarias a la clase anterior. Para esto creamos en la misma solución un
proyecto de Test en WCF. La solución se ve ahora de la siguiente forma:

1.  ![](./media/media/image1.png){width="2.542694663167104in"
    height="3.3763648293963255in"}

En la figura anterior se pueden ver dos cosas relevantes: 1. se agregó
una referencia al proyecto donde están las clases a probar. 2. Se creó
un archivo del tipo “unit test” básico. Ahora vamos a crear un test para
probar el método ObtenerElMayor de la clase
AdministradorDeArreglosNumericos.

1.  C\#

<!-- -->

1.  \[TestClass\]

    public class PruebasEjemploMetricas

    {

    \[TestMethod\]

    public void ObtenerElMayorDeLaLista\_RetornaTreinta()

    {

    int\[\] \_lista = {11, 4, 8, 6, 30, 7};

    var \_administrador = new AdministradorDeArreglosNumericos();

    int \_resultado = \_administrador.ObtenerElMayor(\_lista);

    Assert.AreEqual(30, \_resultado, "Retorno del mayor de la lista
    incorrecto");

    }

    }

Esta prueba al ser ejecutada pasa sin ningún problema.

1.  ![](./media/media/image2.png){width="5.877375328083989in"
    height="0.989983595800525in"}

Ahora, queremos ver cuanto código esta cubierto por nuestras pruebas
unitarias –&gt; en este caso, un método con una prueba. Este dato es
relevante sobre todo cuando la cantidad de código escrito es abundante y
las pruebas unitarias aparentan tener todo cubierto.

### Test Coverage en Visual Studio

En Visual Studio 2010 podemos calcular la cantidad de código que está
cubierta por las pruebas unitarias cambiando la configuración en el
archivo Local.testsettings.

1.  ![](./media/media/image3.png){width="2.3863812335958006in"
    height="2.803216316710411in"}

Al darle doble click al archivo nos aparecerá un diálogo de
configuración. En esta pantalla procedemos seleccionar “Data and
Diagnostics” y marcamos la opción “Code Coverge” tal y como se muestra
en la figura.

1.  ![](./media/media/image4.png){width="5.773167104111986in"
    height="4.251718066491689in"}

El siguiente paso es configurar el “Code Coverage” por lo que procedemos
a dar click sobre el botón “configure” justo arriba de la lista de
roles. Ahí nos aparecerá la siguiente pantalla.

1.  ![](./media/media/image5.png){width="5.960742563429571in"
    height="2.949108705161855in"}

Aquí procedemos a seleccionar el assembly sobre el cual queremos aplicar
la métrica. Ahora procedemos a ejecutar la prueba unitaria de nuevo y
seleccionamos la opción de ver los resultados de la cobertura de las
pruebas.

1.  ![](./media/media/image6.png){width="6.2212642169728785in"
    height="0.8128280839895013in"}

En esta pantalla si expandimos los resultados podemos ver el código
cubierto por nuestra prueba unitaria. Como podemos ver en los resultados
todos los métodos tienen 0% de cobertura excepto el método
ObtenerElMayor.

1.  ![](./media/media/image7.png){width="6.3463156167979005in"
    height="1.8028116797900262in"}

Por último, en Visual Studio todos los métodos que no estén cubiertos
por las pruebas unitarias estarán marcados por un fondo rojo, y los que
si estén cubiertos por al menos una prueba unitaria estarán con el fondo
celeste. Esto se puede ver en la siguiente figura.

1.  ![](./media/media/image8.png){width="5.981584645669291in"
    height="2.5635356517935257in"}

Igualmente, la clase AdministradorDeColecciones al no tener una prueba
unitaria tendrá todos sus métodos marcados con fondo rojo.

1.  ![](./media/media/image9.png){width="6.1274770341207345in"
    height="3.511836176727909in"}


