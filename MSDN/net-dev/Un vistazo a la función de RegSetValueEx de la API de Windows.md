

<properties
	pageTitle="Un vistazo a la función de RegSetValueEx de la API de Windows"
	description="Un vistazo a la función de RegSetValueEx de la API de Windows"
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

# Un vistazo a la función de RegSetValueEx de la API de Windows

Por Juan Carlos Ruiz Pacheco, **Microsoft Technology Evangelist**

![](./img/Un vistazo a la función de RegSetValueEx de la API de Windows/image1.png)

  Twitter   | <https://twitter.com/JuanKRuiz>
  ----------| ----------------------------------------
  Facebook  | <https://www.facebook.com/JuanKDev>
  LinkdIn   | <http://www.linkedin.com/in/juankruiz>


Hace apenas un par días me encontraba con [*Sergio
Calderón*](https://www.facebook.com/secalderonr) revisando un tema muy
interesante: como escribir en el registro de Windows utilizando Win32
API en C++. Sergio tenía un par de dudas al respecto y creo que es una
buena oportunidad para compartir la respuesta a sus inquietudes con
ustedes. Gracias Sergio por generar la inquietud y por ser incansable
para preguntar, así es como los mejores developers funcionan!

Porque utilizar la Win32 API
----------------------------

Pueden haber muchos motivos, desde el simple entusiasmo o ganas de
aprender hasta tener un rendimiento muy superior o tener un control muy
granular de cada una de las operacines, situaciones que hoy día no sonh
mu comunes ya que la mayoria de veces estamos creando sistemas de
información donde el mayor impacto y por mucho es la conexión a la BD o
el web server, pero cuando creamos productos para dar respuesta en
tiempo real, o para hacer millones de calculos por segundo en
aplicaciones cientificas o de simnulación estadística todo esto se
vuelve sumamente importante.

Qué hace RegSetValueEx y Cómo funciona?
---------------------------------------

Esta función de la API permite escribir en una llave de registro un
valor cualquiera, recordemos que las llaves de registro de Windows
pueden contener valores de diferente tipo y modo de presentación, es
decir pueden ser números enteros o cadenas de texto y cada una de estas
opciones a la vez puede ser representada en diferentes formatos bien sea
como conjuntos de bytes, enteros, enteros dobles, cadenas unicode ,
cadenas utf etc.

La documentación
de [*RegSetValueEx*](http://msdn.microsoft.com/es-co/library/windows/desktop/ms724923.aspx)
nos muestra esta definición:

    LONG WINAPI RegSetValueEx(
    _In_ HKEY hKey,
    _In_opt_ LPCTSTR lpValueName,
    _Reserved_ DWORD Reserved,
    _In_ DWORD dwType,
    _In_ const BYTE *lpData,
    _In_ DWORD cbData
    );

No entraré en detalles profundos de cada cosa ya que para ello esta la
documentación vinculada más arriba, sin embargo haré un examen básico
para que todos estemos en contexto.

hkey
----

Es la llave de registro raíz que deseamos abrir, esta puede ser
cualquiera de los siguientes valores que ya estan definidos en el
encabezado Windows.h de la API, por lo cual no nos preocuparemos por sus
correspondientes valores string reales.

- HKEY\_CLASSES\_ROOT
- HKEY\_CURRENT\_CONFIG
- HKEY\_CURRENT\_USER
- HKEY\_LOCAL\_MACHINE
- HKEY\_USERS



Si quisieramos escribir en una sub-key simplemente debemos hacer uso de
[*RegOpenKeyEx*](http://msdn.microsoft.com/es-co/library/windows/desktop/ms724897(v=vs.85).aspx)
o de
[*RegCreateKeyEx*](http://msdn.microsoft.com/es-co/library/windows/desktop/ms724844(v=vs.85).aspx)
, las cuales nos entregan un apuntador de tipo PHKEY, el cual podemos
usar para pasar el contenido como parámetro.

lpValueName
-----------

Este parámetro es el nombre del valor que vamos a escribir en la llave
de registro, así de simple. El tipo LPCTSTR es un nemotécnico de Long
Pointer Constant Text String, esto da para un tema de blog completo,
pero en resumen definida de esta forma la cadena es segura y su tamaño
dependera de si se usa Unicode o ASCII dendiendo de la configuación del
compilador.

Reserved
--------

Es un valor reservado que aún no hace nada en la API, debemos dejarlo
siempre en 0.

dwType
------

Es el tipo de valor que escribiremos en la llave de registro, como lo
mencione anteriormente hay muchos tipos diferentes de valor que pueden
ser almacenados.

Estos valores tambien se encuentran ya definidos en Windows.h por lo que
no hay que complicarse mucho y simplemente utilizar las constantes, que
son las listadas a continuación.

- REG\_BINARY
- REG\_DWORD
- REG\_DWORD\_LITTLE\_ENDIAN
- REG\_DWORD\_BIG\_ENDIAN
- REG\_EXPAND\_SZ
- REG\_LINK
- REG\_MULTI\_SZ
- REG\_NONE
- REG\_QWORD
- REG\_QWORD\_LITTLE\_ENDIAN
- REG\_SZ


EL detalle completo de que tipo de valor representa cada uno puede ser
encontrado aquí:*http://jkr.im/RegistryValueTypes*

lpData
------

Son los datos a guardar, dado que los datos pueden tener un formato
cualquiera esta función requiere que sea cual se la información se envie
en forma de BYTE \* es decir un array de bytes que desde leugo peude
contener cualquier cosa.

Para muchos el tema aca se pone un poco enrrado, que es eso de

    const BYTE *lpData

Un parámetro una constante?

Por eso amo C++, recuerden: control granular de la memoria. Qué pasa si
el valor que vamos a guardar es muy grande?, el array de bytes es un
apuntador así que pasarle el apuntador a la función es muy práctico pues
paso un dato de apenas un par de bytes y con este ya puedo acceder a una
cantidad ilimitada de información.

Pero hay un inconveniente, si yo mismo he creado la función puedo
confirmar plenamente en que la función no modoficara el array de bytes
que le pasé, pero que pasa cuando la función es creada por un tercero y
realmente no tengo idea de que más cosas hace?

Es un riesgo latente, así que normalmente uno no le pasaría el array de
bytes original sino una copia , de tal forma que si la copia es alterada
la lógica de mi programa no sufra contratiempos pues siempre estaria
trabajando con una copia segura del original.

Pero esto no siempre es optimo, menos cuando el volumen de la
información es enorme o cuando debo repetir la misma operación miles o
millones de veces. Las operaciones de I/O en este caso crear o copiar
memoria son de las operaciones más lentas en todo OS... así que a veces
no podemos darnos el lujo de crear copias en todo momento.

Por otro lado un desarrollo de calidad siempre se preocupa de hacer que
sus funcionalidades sean confiables sin importar cual es el uso final de
la rutina.

Estos inconvenientes se solucionan utilizando la palabra clave const en
el parámetro de la función, esta no quiere decir otra cosa distinta a
que el parámetro pasado, si bien es un puntero, no puede ser modificado
ni alterado, es una variable de solo lectura, la palabra clave const en
este contexto le indica al compilador que que aún en llamados
subsecuentes ese valor no puede ser enviado a una función que no declare
explicitamente en sus parámetros que es un parámetro const... es decir
de solo lectura.

Si como desarrolladores de C++ vemos que una función requiere que le
pasemos como parámetro un puntero const , podemos tener tranquilidad
respecto a que ese parámetro no será modificado, el compilador nos
garantiza eso.

en la notación utilizada por la API lpData es un nemotécnico de Long
Pointer Data, es decir un apuntador a un área grande de memoria. Este
parámetro no puede ser nulo, salvo que el siguiente parámetro, cbData,
sea igual a 0.

cbData
------

cbData es un nemotécnico de counter bytes Data, es decir la cantidad de
bytes pasados como datos, así que en este caso representa el tamaño de
la información pasada en lpData.

A diferencia de los entornos de memoria adminitrada como el CLR
(comunmente llamado .Net Framework) donde el propio runtime nos
garantiza que cada cosa tenga un tamaño en memoria controlado y
restringido en un ambiente nativo esto no sucede, un programador puede
valerse de artefactos para enviar un arreglo que parezca ser de un
tamaño X pero realmente sea de un tamaño superior... y utilizar esto
como un vector de ataque ya que puede sobrepasar el espacio de memoria
de datos y llegar al code segment y allí inyectar opcodes en memoria
para modificar el comportamiento del programa... así se explotan
vulnerabilidades en un sistema operativo o de hecho en cualquier
programa.

Así que prácticamente todas las llamadas de bajo nivel en la API que
deban recibir como parámetro un apuntador solicitan tambien el tamaño
del mismo, de esta forma el sistema reserva espacio en memoria para el
tamaño declarado truncado el valor si es que este se excede, a veces
arrojando una excepción sino councide.

Muchos diran que el sistema puede calcular autoáticamente el valor del
arreglo, pero esto no es así precisamente un programador experimentado
puede engañar al sistema colocando null en alguna posición de una
cadena, lo cual el sistema tomará como posición final, pero luego del
null puede enviar información adicional que puede llegar a ser escrita
donde menos conveniente es: en el code segment. Por ello se hace una
validación cruzada.

Si el tipo de dato guarda una cadena de caracteres el tamaño debe
incluir el tamaño final incluyendo el caracter null.

Cómo usar la función? ejemplo
-----------------------------

Digamos que queremos escribir en la llave HKEY\_CURRENT\_USER un valor
llamado **MyDemoValue**, este valor tendra con contenido un dato de tipo
entero : el número 1.

Un entero en la jerga de la API es un DWORD es decir una palabra doble.
Cada palabra (WORD) es de 2 bytes, por ende un DWORD es de 4 bytes, o
sea 32 bit, Un entero de 32 bit.

Así las cosas necesitamos definir las siguientes variables y llamar la
función:

HKEY hKey = HKEY\_CURRENT\_USER;

LPCTSTR lpValueName = L"MyDemoValue";//L es para indicar que es una
cadena larga (L=long) equivale a decir una cadena unicode

    DWORD Reserved=0;
    DWORD dwType = REG_DWORD;
    DWORD Value = 1;
    DWORD cbData = sizeof(Value);
    RegSetValueEx(hKey, lpValueName, Reserved, dwType, (const BYTE *) &Value, cbData);

Fíjense que la función requiere que lpData sea un array de BYTE pero le
estamos pasando un DWORD(entero) aplicandole alguna especie de CAST DEL
INFIERNO!... recueden C++ = control granular de la memoria.

Todo dato, CUALQUIERA QUE SEA, a la final no es sino un montón de bytes,
así que hemos hecho lo siguiente:

- Nuestro dato es el número 1 guardado en Value

- &Value no es más que la dirección de memoria de la variable Value

- Pero esa dirección de memoria sería de tipo DWORD \*, claro el tipo de dato es DWORD por ende el apuintador debe ser así

- La función no espera un DWORD \* espera un BYTE \*

- Pero a la final TODO son bytes así que un DWORD \* le podemos hacer casting a BYTE \* sin problema



Para algunos aún puede estar algo confuso o poco creíble eso que acabo
de afirmar, pero podemos re escribir el código de la siguiente forma
haciendo tal cual lo que la función nos pide sin 'atajos', en lugar de
usar un DWORD vamos usar directamente un BYTE\*, un arreglo es un
apuntador, así que podemos crear un arreglo de BYTE para manejar el
puntero que nos pide la función. Como el valor que vamos a asignar es un
entero DWORD necesitamos garantiozar que el apuntador tenga 4 bytes y
asignar los valores de esos bytes para que el número entero completo sea
1.

Nuestra lógica inocente nos dice a primera impresión que el arreglo de
bytes deberia quedar así

BYTE lpData\[\] = {0,0,0,1};

Pero esto es incorrecto, en memoria estos bytes estarían así: 0000 0001
-- 0000 0000 -- 0000 0000 -- 0000 0000 = 16777216 , es decir esta mal,
debería dar 1.

Recordemos que el primer miembro del arreglo es el byte menos
significativo algo importante a tener en cuenta porque en memoria el
primer miembro del array no se crea a la izquierda sino a al derecha que
es donde van en memoria los bytes menos significativos.

BYTE lpData\[\] = {1,0,0,0};

Este si es incorrecto, en memoria estos bytes estarían así: 0000 0000 --
0000 0000 -- 0000 0000 -- 0000 0001 = 1.

Quedandonos el código de esta forma, totalmente equivalente a lo que nos
pide la función y dando el mismo resultado que el código anterior, noten
que también actualicé el valor de cbData:

    HKEY hKey = HKEY_CURRENT_USER;
    LPCTSTR lpValueName = L"MyDemoValue";//L es para indicar que es una cadena larga (L=long) equivale a decir una cadena unicode
    DWORD Reserved=0;
    DWORD dwType = REG_DWORD;
    BYTE lpData [] = {1,0,0,0};
    DWORD cbData = sizeof(lpData);
    RegSetValueEx(hKey, lpValueName, Reserved, dwType, lpData, cbData);

Eso s todo!, pero se que aún tienen algunas dudas.

Porque complicarse con DWORD en vez de escribir directamente int?
-----------------------------------------------------------------

Sucede que Windows no siempre fue de 32 bit, antes fue de 16, el 8086
era un procesador de 16 bits y por estandar en un lenguaje nativo un
dato entero es del tamaño del ancho de palabra del procesador, es decir
en un 8086 un int era de 16 bit , posteriormente en un procesador de 32
bit el tipo de dato int es nativamente de 32 bit y así sucesivamente.

Así que como podrán imaginar el cambio de arquitectura traia muchos
problemas porque muchas operaciones que presumian que int era siempre de
16 bit fallaban de manera aberrante al correrlas en un procesador de 32
bit.Para evitar esos lios en la API se trabajaron todos los tipos de
datos con ALIAS, de tal forma que por ejemplo un WORD siempre era de 16
bit y un DWORD de 32 bit sin importar la arquitectura del procesador.

De esta forma, por ejemplo, cuando compilaban Windows para 16 bit
incluian un header donde DWORD (32 bit) era definido como la union de
dos datos enteros, pero cuando era la versión de 32 incluian un archivo
donde DWORD era el mismo int.

De esta forma se pudo programar todo el sistema y solo se cambiaba un
archivo para compilar a difertentes tipos de arquitectura.

Por eso todos los tipos nativos fueron redefinidos en la API para
programar tan agnóstico de la plataforma como fuera posible. Gracias a
este tipo de cosas es que por ejemplo hoy día Windows 8 puede trabajar
en arquitecturas ARM sin necesidad de haber hecho todo el sistema por
completo desde 0.

Si existe RegSetValueEx se supone que existe RegSetValue normal?
----------------------------------------------------------------

Si, y no.

Actualmente aún existe
[*RegSetValue*](http://msdn.microsoft.com/en-us/library/windows/desktop/ms724922(v=vs.85).aspx)
pero no debe ser utilizada, solo existe por compatibilidad con versiones
de programas hechos originalmente para Windows de 16 bit, esta función
solo recibia string como valores posibles .

Bueno ahora si FIN, espero que haya sido de provecho.
