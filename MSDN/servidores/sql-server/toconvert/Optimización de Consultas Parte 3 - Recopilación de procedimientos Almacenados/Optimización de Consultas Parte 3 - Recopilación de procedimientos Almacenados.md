Por **FREDDY LEANDRO ANGARITA C.\
SqlServer MVP** \
[Perfil
MVP](https://mvp.support.microsoft.com/es-es/mvp/Freddy%20Leandro%20Angarita%20Castellanos-4028407)\
\
<freddy_angarita@hotmail.com>\
<http://geeks.ms/blogs/fangarita/default.aspx>

Cada vez que se ejecuta un procedimiento almacenado en SQL Server por
primera vez, se optimiza y su plan de ejecución se compila y se almacena
en el caché de SQL Server. Cada  vez que el procedimiento almacenado se
ejecuta luego de ser almacenado en el caché, usará el mismo plan de
ejecución, eliminando la necesidad de compilar y de almacenar el plan de
ejecución de dicho procedimiento cada vez que se ejecuta. Si éste
procedimiento se ejecuta 1000 o más veces por día, los recursos de
hardware se optimizan al ahorrarse dichos pasos.\
\
Si los parámetros dentro del procedimiento almacenado son idénticos en
el Where, entonces reusar el plan de ejecución tiene mucho sentido. Pero
¿qué pasa si los valores de los parámetros en cada ejecución cambian?,
que pasa si el tamaño del resultado varía notablemente (Columnas y
Filas), que sucede si para unos parámetros la búsqueda óptima es una
búsqueda por índice, pero para otros valores el mejor camino es un table
scan?\
\
Todo eso depende de que tan genéricos sean los parámetros, de que tan
bien esté definida la funcionalidad del procedimiento almacenado si
están definidos de tal manera que no recarguemos su funcionalidad y que
los resultados sean parecidos aun los valores de los parámetros sean
diferentes el procedimiento ejecutará de manera óptima y obtendrá todos
los beneficios mencionados anteriormente. Pero para el caso contrario,
reutilizar el plan de ejecución puede no ser lo óptimo, como resultado
la consulta se ejecutará más lentamente que si se creara dinámicamente
su plan de ejecución.\
\
En la mayoría de los casos, no es una cuestión de la cual preocuparse,
pero si se hace la pregunta, por qué mi procedimiento almacenado ejecuta
bien en el diseñador de consultas pero toma mucho tiempo en producción,
éste puede ser el caso. Siempre teniendo en cuenta que el diseño del
procedimiento almacenado, junto con granularidad, ofrecen la mejor
estrategia para diseñarlos y claro para mantenerlos\
\
Cómo solucionar el problema:\
\
1. Aplicar recopilación a todos los procedimientos periódicamente\
Ejecutar con el procedimiento almacenado del sistema sp\_recompile sobre
todos los procedimientos almacenados de la base de datos (Cada dos o
tres meses)\
\
2. Crear los procedimientos almacenados que consideremos que sean
candidatos para sufrir este problema con la opción With Recompile,
teniendo en cuenta que cada vez que ejecutemos el procedimiento
almacenado el mismo se recompilará (se generará un nuevo plan de
ejecución)\
CREATE PROCEDURE MiProcedimiento\
WITH RECOMPILE\
AS\
....\
\
3. Si el caso en donde los resultados cambian demasiado dependiendo de
valores específicos y plenamente identificados podemos ejecutarlo usando
la opción with recopile de exec:\
EXECUTE MiProcedimiento @p2 = 'A' WITH RECOMPILE;\
GO\
\
4. Query Hint RECOMPILE\
A partir de SQL Server 2005 se introdujo RECOMPILE como query hint, lo
que logra este hint es que el analizador de consulta descarte cualquier
plan de ejecución previamente generado para esa consulta dentro del
procedimiento almacenado y recompile sólo esta consulta\
\
5. Creando [Guías de Plan de
Ejecución](http://msdn.microsoft.com/es-es/library/ms190417.aspx)\
Permite realizar cambios administrativos sobre procedimientos
almacenados que ya han sido creados en la base de datos que no se puede
o no se quiere modificar para agregar algún tipo de optimización como la
mencionada. Esto se logra forzando hints sobre las consultas o fijando
un plan de ejecución diferente a dicho procedimiento o consulta.\
\
La creación de guías de plan es una opción avanzada de administración es
recomendado leer detenidamente la documentación sobre el tema y luego
observar los casos en donde sea prudente aplicarlo\
Debemos usar éste tipo de solución cautelosamente dado que usar
recompile, aunque nos aseguramos que cada vez el plan de ejecución
generado es correcto, hace que perdamos los muy buenos beneficios de
tener un plan de ejecución almacenado para el procedimiento y nos guía
hacia un mejor diseño de los procedimientos almacenados que incluiremos
en nuestros sistemas

 

**FREDY LEANDRO ANGARITA CASTELLANOS\
SQL Server MVP**
