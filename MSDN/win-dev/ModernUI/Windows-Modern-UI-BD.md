---
redirect_url: https://docs.microsoft.com/
title: Windows Modern UI -  Bases de datos locales en aplicaciones (I)
description: Windows Modern UI -  Bases de datos locales en aplicaciones (I)
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: win-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#Windows Modern UI -  Bases de datos locales en aplicaciones (I)

Por **Josue Yeray Julian Ferreiro**


¡Hola a todos!

Hoy vamos a ver cómo está de resuelto el escenario de bases de datos
locales en las aplicaciones Modern UI con Windows 8. En Windows Phone
disponíamos “out of the box” de SQL Server CE pero en Windows 8 no
tenemos esta suerte. Ahora mismo hay dos opciones principales, cada una
con sus pros y sus contras: SQLite y SiaqoDb. En este artículo no voy a
entrar a consideraciones de rendimiento. Voy a introducir cada base de
datos, ver como poder empezar a desarrollar con ella y luego analizar lo
bueno y lo malo de lo que hayamos visto.  Tenemos que recordar que
estamos ante un sistema operativo y un SDK Beta, por lo que no podemos
pedirle peras al olmo y existen fallos que, espero y confío, se
subsanarán en una futura versión RTM.

Dicho esto, empecemos con el primer participante, SQLite

**SQLite**

![] (./img/Windows-Modern-UI-BD/image1.gif)

Con la versión 3.7.13 [*SQLite*](http://www.sqlite.org) añadió soporte
oficialmente para WinRT y las aplicaciones Modern UI, el objetivo de
este artículo es dar los primeros pasos para ver cómo usar bases de
datos locales en nuestros proyectos Modern UI.

###Consideraciones 


SQLite es un componente nativo, no un ensamblado manejado de WinRT, esto
nos obligará a tener que distribuir diferentes paquetes de nuestra
aplicación, pues necesitaremos una dll de SQLite para ARM, otra para x64
y otra para x86. Actualmente, en la web de descargas de SQLite solo
tenemos acceso a la dll de x64, si necesitamos la de ARM o la de x86
tendremos que descargarnos el código fuente y compilarla nosotros
mismos, esto por si solo daría para varios largos artículos, por lo que
os dejo un
[*vídeo*](http://timheuer.com/blog/archive/2012/06/05/howto-video-using-sqlite-in-metro-style-app.aspx)
de **Tim Heuer** en el que explica muy bien cómo hacerlo. Una vez dicho
esto, ¡podemos empezar!

###Setup


Por defecto SQLite no viene incluido en Windows 8 como pasa con SQL
Server CE en Windows Phone, por lo que tendremos que descargarnos los
componentes necesarios para hacerlo funcionar.

En primer lugar necesitas el binario de SQLite 3.7.13 que puedes
descargar [*aquí*](http://www.sqlite.org/download.html), guárdalo en
algún lugar de tu disco duro a buen recaudo, lo usaremos más adelante.

A continuación, abre Visual Studio 2012 y crea un nuevo proyecto Modern
UI, haz clic derecho sobre él en el explorador de soluciones, escoge la
opción “**Manage NuGet Packages…**” y busca el componente
**sqlite-net**, un ORM creado a medida para SQLite y que ya es
compatible totalmente con WinRT, además de hacer uso de la TPL (Task,
async, await) para trabajar con la base de datos, lo cual es un gran
extra:

![] (./img/Windows-Modern-UI-BD/image2.png)

Solo tienes que hacer clic en el botón install y se añadirán dos clases
a tu proyecto: **SQLite.cs** y **SQLiteAsync.cs. **

Ahora solo necesitamos incluir la dll de SQlite 3 en nuestro proyecto,
como se trata de un componente nativo y no de un ensamblado, no lo
añadiremos como una referencia, lo añadiremos directamente como
contenido en nuestro proyecto (**Add &gt; Add Existing Item**):

![] (./img/Windows-Modern-UI-BD/image3.png)

Una vez añadido, establecemos su Build Action a Content y Copy To Output
Directory a Copy if newer.

Ya estamos listos para trabajar con SQLite en nuestra aplicación de
Modern UI!

###Usando SQLite-net


Primero definamos una tabla, ¿Cómo? Pues de una manera conocida, usando
una clase decorada con atributos y que contenga propiedades públicas que
actuarán como campos de la tabla, en nuestro caso una tabla sencilla,
**Customers**:


```
    public class Customer
    {
        \[PrimaryKey, AutoIncrement\]
        public int id { get; set; }
        public string Name { get; set; }
        \[MaxLength(256)\]
        public string Address { get; set; }
    }
```
Todos estos atributos los encontramos definidos en el namespace
**SQLite**.

Ahora es momento de realizar el código necesario para crear nuestra base
de datos y sus tablas, para esto haremos uso del soporte incluido en
sqlite-net para el uso asíncrono de nuestra base de datos:


```
    private async void InitializeDb()
    {
        var db = new
        SQLiteAsyncConnection(Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path,
        "people.sqlite"));
        var result = await db.CreateTableAsync&lt;Customer&gt;();
    }
```

De esta forma tan sencilla creamos la base de datos. Como se puede
observar le pasamos la ruta completa donde deseamos crear la base de
datos, usando el almacenamiento de datos de nuestra aplicación. En esta
parte nos encontraremos con un grave problema, al menos bajo mi punto de
vista: La ruta que usemos para la base de datos no puede contener
caracteres no standard, como tildes, cedillas u otros por el estilo. Por
ejemplo, en mi caso la ruta incluye mi nombre de usuario, que es
“JosuéYeray” con tilde. Al intentar crear la base de datos nos
encontramos con el siguiente error:

![] (./img/Windows-Modern-UI-BD/image4.png)

Esto pinta feo, la excepción tampoco es muy descriptiva, pero después de
bucear algunos días por internet, encontré la solución, usar una ruta
sin tildes ni ningún otro carácter especial, con lo que me cree un
usuario “Dummy” y todo funciono como la seda, pero depender de como esté
escrito el nombre del usuario que ejecuta la aplicación es, cuanto
menos, peligroso. ¿Podríamos usar otro path para la base de datos? En
principio estamos restringidos al path de datos de nuestra aplicación
que por defecto se encuentra bajo nuestro usuario. Esperemos que lo
arreglen en siguientes versiones y si no, tenemos el código fuente a
nuestra disposición, ¿Quién dijo miedo?

A continuación, si no hemos huido espantados con el error anterior,
añadimos una tabla de tipo **Customer**. El resultado será el número de
entradas generadas en el esquema de base de datos. ¿Qué pasa si la tabla
ya existe? **CreateTableAsync** ejecuta internamente una operación
“Create if not exist”, por lo que si la tabla ya existe no realizará
ninguna acción.

Ahora ya podemos empezar a insertar registros en nuestra tabla
**Customer**:


```
    private async void InitializeDb()
    {
    var db = new SQLiteAsyncConnection(Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path,
    "people.sqlite"));
    var result = await db.CreateTableAsync&lt;Customer&gt;();
    Customer c = new Customer();
    c.Name = "Josué Yeray";
    c.Address = "Bilbao";
    int insertedItems = await db.InsertAsync(c);
    if (insertedItems &gt; 0)
        {
        MessageDialog mDlg = new MessageDialog(string.Format("New inserted id: {0}", c.id));
        await mDlg.ShowAsync();
        }
    }
```

Meridianamente simple, rellenamos una instancia de nuestra tabla
**Customer** y llamamos al método **InsertAsync**, que nos devolverá el
número de registros insertados.

Y por último pero no menos importante, como recuperar datos guardados,
gracias a Linq, más fácil todavía:

 ```   
    private async void InitializeDb()
    var db = new SQLiteAsyncConnection(Path.Combine(Windows.Storage.ApplicationData.Current.LocalFolder.Path,"people.sqlite"));
    var result = await db.CreateTableAsync&lt;Customer&gt;();
    Customer c = new Customer();
    c.Name = "Josué Yeray";
    c.Address = "Bilbao";
    int insertedItems = await db.InsertAsync(c);
    if (insertedItems &gt; 0)
    {
        MessageDialog mDlg = new MessageDialog(string.Format("New inserted id: {0}", c.id));
        await mDlg.ShowAsync();
        var customer = await db.Table&lt;Customer&gt;().Where(cust =&gt;
        cust.Name == "Josué Yeray").FirstOrDefaultAsync();
        if (customer != null)
        {
            mDlg.Content = string.Format("Customer Name: {0}, Address: {1}",customer.Name, customer.Address);
            mDlg.ShowAsync();
        }
    }
```

Haciendo uso de Linq podemos consultar la tabla que nos interese
haciendo uso del objeto **Table&lt;T&gt;** que expone sqlite-net.
También nos permite ejecutar consultas SQL si lo necesitamos:


```
    int NumCustomers = await
    db.ExecuteScalarAsync&lt;int&gt;("SELECT COUNT(Id) FROM Customer");
```

Pero recuerda, cada vez que usas SQL en línea en vez de usar **Linq**,
dios mata un gatito, así que no lo uses, piensa en los gatitos.

####Conclusiones
------------

Aunque todavía tenemos que esperar a ver cómo se comporta **SiaqoDb**,
hay varias cosas que no me gustan en **SQLite**:

- Nos obliga a generar un paquete de nuestra aplicación por cada
    plataforma (x86, x64, ARM) aunque una vez en la tienda de Windows es
    transparente para el usuario.

- **El fallo de los caracteres especiales en la ruta del path de la
    base de datos es realmente peligroso.**

- Permite ejecutar sentencias SQL, para algunos esto será bueno, pero
    para mí es una aberración que no debería permitirse.


Pero a cambio, tiene algunas cosas muy buenas también:

- Me gusta como han implementado el soporte para TPL, el uso de
    **async** y **await** hace muy cómodo trabajar con la base de datos
    sin bloquear la aplicación.

- La multiplataforma: Linux, Mac OS X, Windows, iOS, Android, Symbian…
    es muy posible que si estás portando una app de otra plataforma,
    uses SQLite, al mismo tiempo, si piensas portar tu app Windows 8 a
    otra plataforma, podrás usar SQLite.

La última duda que tengo, es si será compatible con Windows Phone 8,
supongo que para saber algo todavía tendremos que esperar un poco más!

Como siempre,
[*aquí*](https://skydrive.live.com/redir?resid=FD100135B82F3364!653) os
dejo el código fuente de ejemplo que he usado en el artículo para que
podáis trastear con él un poco. Espero que os haya resultado
interesante.

Un saludo y Happy Coding!




