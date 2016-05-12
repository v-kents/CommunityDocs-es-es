#Explorando el DOM: Nodos de texto. Gestión multinodal 

©Jaime Peña Tresancos, 2015 

[Twitter: @jpt219] (https://twitter.com/jpt219) 

[LinkedIn] (https://es.linkedin.com/pub/jaime-peña-tresancos/28/677/696)  



En este trabajo hablaremos de ciertas labores de tratamiento de contenidos de los nodos de texto, en su vertiente de gestión de nodos hermanos o multinodos en general. 

Todo ello será abordado con ejemplos ilustrativos para cada caso; en concreto: 

* Conocimiento del número de nodos hijos de uno dado. 

* Propiedades básicas para la obtención de los contenidos de los nodos hijos de uno aludido. 

* Cómo recorrer todo el árbol de nodos hijos de uno dado –nodos hermanos-. 

* Obtención del contenido textual, formateado o no, de los nodos hijos de un nodo dado. 

* Obtención del contenido HTML de los nodos hijos, incluyendo o excluyendo las etiquetas del nodo padre aludido. 

En un anterior artículo, cuya referencia se cita seguidamente, habíamos tratado los aspectos más fundamentales de los nodos de texto; sugerimos se dé un repaso a su contenido antes de abordar el presente: 

[Explorando el DOM: Nodos de texto. Creación, propiedades y métodos] (https://msdn.microsoft.com/es-es/library/mt143193.aspx)

###Referencias del DOM 

Las bases de referencia vienen dadas por el denominado DOM *Document Object Model*. Inicialmente el DOM ha sido definido como una API *Application Programming Interface* para la gestión de documentos XML en general *eXtensible Markup Language, lenguaje de marcas extensible* y posteriormente implementada para documentos HTML en particular. 

Para una descripción introductoria del DOM puede acudir a: http://es.wikipedia.org/wiki/Document_Object_Model 

La documentación oficial y más recomendable sobre el DOM se encuentra en el foro del W3C –World Wide Web Consortium- en diversos niveles de conformidad, por ejemplo: 

http://www.w3.org/TR/REC-DOM-Level-1/level-one-core.html 

http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html 

###Gestión de nodos hermanos –sibling text nodes- 

Cuando nos encontremos con un nodo dado con diferentes nodos hijos, estos tendrán entre sí la relación de nodos hermanos. 

Para tratar con ellos y extraer sus contenidos emplearemos, en los ejemplos, las siguientes propiedades: 

Propiedad | Descripción 
--------- | -----------
*firstChild* | Primer nodo hijo, del nodo de texto aludido (sobre el que se aplica)
*lastChild* | Último nodo hijo, del nodo de texto aludido 
*nextSibling* | Siguiente nodo hermano, del nodo de texto aludido 
*previousSibling* | Previo nodo hermano, del nodo de texto aludido 
*childNodes* | Colección de nodos hijos, del nodo de texto aludido 

En nuestros Listado 1 y Listado 2 y posteriormente en el Listado 3, extraeremos los contenidos de los nodos constituyentes del elemento <div> que hay en el cuerpo del documento. En los dos primeros casos, con aproximaciones diferentes –aunque similares- llegamos a obtener los tres nodos hijos. 

En el tercer caso, extraeremos el contenido exclusivamente textual del segundo nodo, esto será extraer el nodo hijo del segundo nodo hijo del elemento < div >.

Obsérvese la diferencia en las imágenes adjuntas. 

En lo esencial los respectivos listados contienen los siguientes códigos, con sus particularidades, fácilmente elucidables: 

* Un botón de comando que al ser pulsado llamara a la función *hermanos()*. 

* En dicha función se recoge el contenido de la propiedad *childNodes* perteneciente al elemento <div> *único elemento* <div> que hay en el cuerpo del documento y recabamos su longitud de nodos hijos cantidad de ellos, para más detalles véase el apartado que sigue y, según los casos se utilizarán las propiedades mostradas en la tabla anterior y/o sus combinaciones para ir recuperando los diferentes nodos hermanos los hijos del nodo padre original. 

* Se expone el resultado en la consola de textos, *mediante console.log()*. 

* Obsérvese en las figuras que siguen el resultado en cada caso. (La figura de los Listado 1 y Listado 2 es la misma) 

**NOTA**: Recuérdese que para acceder a la consola de textos de Internet Explorer hemos de pulsar la tecla F12 y posteriormente hacer clic sobre la pestaña Consola.

**Listado 1**: Obtención de los contenidos de nodos hermanos versión 1. 

````
<!doctype html> 

<html> 

<head lang="es-es"> 

    <meta charset="utf-8" /> 

    <title>Text Node - siblings</title> 

    <script> 

        function hermanos() { 

            var elementoDiv = document.querySelector('div'); 

            console.log(elementoDiv.childNodes.length);      // número de hijos (3) 

            console.log(elementoDiv.firstChild.data);        // primer hijo 

            console.log(elementoDiv.firstChild.nextSibling); // segundo hijo; el elemento <i> 

            console.log(elementoDiv.lastChild.data);         // último hijo 

        } 

    </script> 

</head> 

<body> 

    <div>Hola, <i>amigo y compañero</i> de fatigas</div> 

    <hr /> 

    <input type="button" value="siblings" onclick="hermanos()" /> 

</body> 

</html> 
````
**Listado 2**: Obtención de los contenidos de nodos hermanos versión 2. 

````
<!doctype html> 

<html> 

<head lang="es-es"> 

    <meta charset="utf-8" /> 

    <title>Text Node - siblings</title> 

    <script> 

        function hermanos() { 

            var elementoDiv = document.querySelector('div'); 

            console.log(elementoDiv.childNodes.length);      // número de hijos (3) 

            console.log(elementoDiv.firstChild.data);        // primer hijo 

            console.log(elementoDiv.firstChild.nextSibling); // segundo hijo; el elemento <i> 

            console.log(elementoDiv.firstChild.nextSibling.nextSibling.data); // tercer hijo 

        } 

    </script> 

</head> 

<body> 

    <div>Hola, <i>amigo y compañero</i> de fatigas</div> 

    <hr /> 

    <input type="button" value="siblings" onclick="hermanos()" /> 

</body> 

</html> 
````

![img1] (https://github.com/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img1.png)


**Listado 3**: Obtención de los contenidos de nodos hijos finales.
````
<!doctype html>
<html>
<head lang="es-es">
    <meta charset="utf-8" />
    <title>Text Node - siblings</title>
    <script>
        function hermanos() {
            var elementoDiv = document.querySelector('div');
            console.log(elementoDiv.childNodes.length);      // número de hijos (3)
            console.log(elementoDiv.firstChild.data);        // primer hijo
            console.log(elementoDiv.firstChild.nextSibling.firstChild.data); // hijo del segundo hijo; hijo del elemento <i>
            console.log(elementoDiv.firstChild.nextSibling.nextSibling.data); // tercer hijo
        }
    </script>
</head>
<body>
    <div>Hola, <i>amigo y compañero</i> de fatigas</div>
    <hr />
    <input type="button" value="siblings" onclick="hermanos()" />
</body>
</html>
````

![img2] (https://github.com/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img2.png)

### Recorrer el conjunto de nodos hermanos

En muchas, si no la mayor parte de las ocasiones de programación real, nos interesará, si acaso, conocer los contenidos de nodos hijos de un nodo dado que será pasado sin saber sus datos de antemano –al contrario de lo que era el caso de los ejemplos anteriores, que ya partíamos de la base de que eran tres nodos hijos-.
Una manera muy eficiente es mediante la propiedad *childNodes*, que hasta el presente habíamos utilizado para conocer el número de nodos hijos nodos hermanos, por tanto y nada más. Pero, su valor mayor es que almacena toda la colección de nodos hijos, comenzado a contar por el *childNodes[0]* que será el primero, hasta el *childNodes[childNodes.length-1]*, que será el último.

En el Listado 4 hemos programado:
* Un botón de comando que al ser pulsado llamara a la función *hermanos()*.
* En dicha función se recoge el contenido de la propiedad *childNodes* perteneciente al elemento <div> –único elemento <div>- que hay en el cuerpo del documento y recabamos su longitud de nodos hijos y el contenido de cada uno de ellos, según un bucle que parte de *childNodes[0]*.
* Se expone el resultado en la consola de textos, mediante *console.log()*.
* Obsérvese en la figura que sigue el resultado.


````
**Listado 4**: Obtención recursiva de los nodos hijos –nodos hermanos- de uno dado.
<!doctype html>
<html>
<head lang="es-es">
    <meta charset="utf-8" />
    <title>Text Node - childNodes</title>
    <script>
        function hermanos() {
            var elementoDiv = document.querySelector('div');
            var i = elementoDiv.childNodes.length;
            console.log(i);      // número de hijos (3)
            for (j = 0; j < i; j++) {
                console.log(elementoDiv.childNodes[j]);
            }
        }
    </script>
</head>
<body>
    <div>Hola, <i>amigo y compañero</i> de fatigas</div>
    <hr />
    <input type="button" value="siblings" onclick="hermanos()" />
</body>
</html>
````
![img3] (https://github.com/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img3.png)

###Obtención de los textos sin marcas HTML

Se tratará de extraer en el sentido de obtener el texto de todos los posibles elementos hijos de un nodo dado, en una única operación. A su vez, se eliminarán todas las marcas HTML de dichos nodos hijos.
Las propiedades a emplear son lo que se recogen en la tabla siguiente:

Propiedad | Descripción 
--------- | -----------
*textContent* | Extraerá todo el texto de los elementos hijos del nodo aludido, de manera formateada.
*innerText* | Extraerá el texto de los elementos hijos del nodo aludido, de manera no formateada. Se excluyen diversos tipos de textos.

Las diferencias entre una y otra propiedad se pueden resumir en fundamentalmente:

* *textContent* lee el contenido de todos los elementos, incluyendo los elementos <script> y <style>, innerText no los incluirá.
* *innerText* tiene en cuenta los estilos CSS y, por ejemplo, no retornará el texto de elementos ocultos.
* *textContent* devolverá los textos con el formato original, mientras que innerText los devolverá en una única cadena. (Véanse las figuras adjuntas)

Para más información y ejemplos, puede acudirse a la dirección URL:
https://developer.mozilla.org/es/docs/Web/API/Node/textContent

En el Listado 5 hemos programado lo que sigue:

* Un botón de comando que al ser pulsado llamara a la función *texto()*.
* En dicha función se recoge el contenido de la propiedad *textContent* perteneciente a la cabecera del documento HTML *head*.
* Se expone el resultado en la consola de textos, mediante *console.log()*.
* Obsérvese en la figura que sigue el resultado, un texto formateado sin marcas HTML, con el contenido de la cabecera del documento HTML.

**Listado 5**
````
<!doctype html>
<html>
<head lang="es-es">
    <meta charset="utf-8" />
    <title>Text Node - textContent</title>
    <script>
        function texto() {
            console.log(document.head.textContent);         // Contenido textual
        }
    </script>
</head>
<body>
    <div>Hola, <i>amigo y compañero</i> de fatigas</div>
    <hr />
    <input type="button" value="textContent" onclick="texto()" />
</body>
</html>
````

![img4] (https://github.com/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img4.png)

En el Listado 6 hemos programado lo que sigue:

* Un botón de comando que al ser pulsado llamara a la función *texto()*.
* En dicha función se recoge el contenido de la propiedad innerText perteneciente a la cabecera del documento HTML *head*.
* Se expone el resultado en la consola de textos, mediante *console.log()*.
* Obsérvese en la figura que sigue el resultado, un texto no formateado sin marcas HTML, con el contenido de la cabecera del documento HTML.

**Listado 6

````
<!doctype html>
<html>
<head lang="es-es">
    <meta charset="utf-8" />
    <title>Text Node - innerText</title>
    <script>
        function texto() {
            console.log(document.head.innerText);         // Contenido textual
        }
    </script>
</head>
<body>
    <div>Hola, <i>amigo y compañero</i> de fatigas</div>
    <hr />
    <input type="button" value="innerText" onclick="texto()" />
</body>
</html>
````
![img5] (https://github.com/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img5.png)


En el Listado 7 hemos programado lo que sigue:
* Un botón de comando que al ser pulsado llamara a la función *texto()*.
* En dicha función se recoge el contenido de la propiedad innerHTML perteneciente al cuerpo del documento HTML *body*.
* Se expone el resultado en la consola de textos, mediante *console.log()*.
* Obsérvese en la figura que sigue el resultado, un texto formateado con marcas HTML, con el contenido del cuerpo del documento HTML. Se excluyen las etiquetas del nodo base, en nuestro caso <body>…</body>.

**Listado 7

````
<!doctype html>
<html>
<head lang="es-es">
    <meta charset="utf-8" />
    <title>Text Node - innerHTML</title>
    <script>
        function texto() {
            console.log(document.body.innerHTML);         // Contenido textual HTML
        }
    </script>
</head>
<body>
    <div>Hola, <i>amigo y compañero</i> de fatigas</div>
    <hr />
    <input type="button" value="innerHTML" onclick="texto()" />
</body>
</html>
````

###Obtención de los textos con las marcas HTML

Pasamos ahora a ver cómo obtener todo el contenido HTML anidado en un nodo dado, es decir, obtener el o los textos correspondientes, juntamente con las etiquetas de documento HTML que los acompañen.
Las propiedades a emplear son lo que se recogen en la tabla siguiente:

Propiedad | Descripción 
--------- | -----------
*innerHTML* | Devolverá la cadena formateada de la porción del código del documento HTML hijo.
No se incluyen las etiquetas HTML del nodo base aludido.
*outerHTML* | Devolverá la cadena formateada de la porción del código del documento HTML hijo.
Se incluyen las etiquetas HTML del nodo base aludido.

![img6] (https://github.com/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img6.png)


En el Listado 7 hemos programado lo que sigue:

* Un botón de comando que al ser pulsado llamara a la función texto().
* En dicha función se recoge el contenido de la propiedad innerHTML perteneciente al cuerpo del documento HTML –body-.
* Se expone el resultado en la consola de textos, mediante console.log().
* Obsérvese en la figura que sigue el resultado, un texto formateado con marcas HTML, con el contenido del cuerpo del documento HTML. Se excluyen las etiquetas del nodo base, en nuestro caso <body>…</body>.

**Listado 7

````
<!doctype html>
<html>
<head lang="es-es">
    <meta charset="utf-8" />
    <title>Text Node - innerHTML</title>
    <script>
        function texto() {
            console.log(document.body.innerHTML);         // Contenido textual HTML
        }
    </script>
</head>
<body>
    <div>Hola, <i>amigo y compañero</i> de fatigas</div>
    <hr />
    <input type="button" value="innerHTML" onclick="texto()" />
</body>
</html>
````

En el Listado 7 hemos programado lo que sigue:

* Un botón de comando que al ser pulsado llamara a la función texto().
* En dicha función se recoge el contenido de la propiedad outerHTML perteneciente al cuerpo del documento HTML –body-.
* Se expone el resultado en la consola de textos, mediante console.log().
* Obsérvese en la figura que sigue el resultado, un texto formateado con marcas HTML, con el contenido del cuerpo del documento HTML. Se incluyen las etiquetas del nodo base, en nuestro caso <body>…</body>.

**Listado 8

````
<!doctype html>
<html>
<head lang="es-es">
    <meta charset="utf-8" />
    <title>Text Node - outerHTML</title>
    <script>
        function texto() {
            console.log(document.body.outerHTML);         // Contenido textual HTML
        }
    </script>
</head>
<body>
    <div>Hola, <i>amigo y compañero</i> de fatigas</div>
    <hr />
    <input type="button" value="outerHTML" onclick="texto()" />
</body>
</html>
````

![img7] (https://github.com/Microsoft/Community/blob/master/MSDN/articles/web-dev/img/img7.png)

###Conclusiones

En el presente artículo hemos visto cómo realizar diversas labores extracción –obtención, queremos significar- de textos de nodos hermanos, desde la base de un nodo padre determinado. Hemos repasado las formas de realizarlo, tanto si conocemos o no el número de hermanos y si queremos o no las marcas HTML adjuntas.
Esperamos que lo aquí expuesto les haya servido de ayuda en su trabajo y no dejen de preguntar cualquier duda que les pudiese surgir. Hasta la próxima, tengan unas provechosas sesiones de programación.
