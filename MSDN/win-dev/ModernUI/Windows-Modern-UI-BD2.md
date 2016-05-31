<properties
	pageTitle="Windows Modern UI -  Bases de datos locales en aplicaciones (II)"
	description="Windows Modern UI -  Bases de datos locales en aplicaciones (II)"
	services="win-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="win-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>


#Windows Modern UI -  Bases de datos locales en aplicaciones (II)

Por **Josue Yeray Julian Ferreiro**



¡Hola a todos!

En la [*primera
parte*](http://geeks.ms/blogs/jyeray/archive/2012/07/04/windows-8-bases-de-datos-locales-en-aplicaciones-metro-i.aspx)
de esta serie sobre bases de datos locales vimos como instalar y usar
**SQLite** en nuestras aplicaciones Modern UI, en esta segunda parte
vamos a examinar al siguiente contendiente, **SiaqoDb**.

**SiaqoDb**

![] (./img/Windows-Modern-UI-BD2/image1.png)

SiaqoDb es una base de datos manejada basada en objetos para .NET que
usa Linq de forma nativa como lenguaje de consulta. No tiene soporte
para sentencias SQL, lo cual está muy bien, te aleja de la tentación de
usarlas, pero si por alguna razón necesitas hacer uso de nuestro viejo
amigo SQL, esta base de datos no es para ti.

Otra ventaja de SiaqoDb es su multiplataforma, al estar construida en
.NET soporta Silverlight/WPF/WinForms, Windows Phone 7, Compact
Framework así como Mono/MonoTouch y MonoDroid.

###Consideraciones


Recientemente además han publicado una versión beta para aplicaciones
Modern UI, si bien avisan de que no está lista para entrar en
producción, es una de las primeras empresas en crear una base de datos
viable y comercial para WinRT.

Una vez dicho todo esto, ¡empecemos!

###Setup


Al igual que en el caso de SQLite, SiaqoDb no viene por defecto incluida
en WinRT o Windows 8 por lo que tendremos que descargarnos el componente
a incluir en nuestra aplicación, al igual que SQLite o SQL Server CE
estamos tratando con una base de datos “in process” con lo que no usa
ningún servidor externo y la configuración debería limitarse a incluir
todos los requisitos necesarios en nuestra aplicación.

Para empezar, necesitarás ir a la página de descargas de SiaqoDb y
descargar la versión Beta para Windows 8 Modern UI,
[*aquí*](http://siaqodb.com/?page_id=8)

Una vez tengas el zip descargado al descomprimirlo encontraremos tres
carpetas: **Bin**, que contiene el componente WinRT que necesitaremos
añadir en nuestra aplicación, **MetroExample**, con un ejemplo completo
y funcional de cómo implementar SiaqoDb y por último **SiaqoDbManager**,
un gestor de base de datos para SiaqoDb que nos permite escribir
consultas Linq y consultar nuestras bases de datos. Para iniciar esta
última aplicación deberemos indicar la licencia trial que podemos
solicitar en la página de descargas. Recuerda que SiaqoDb es de pago y
tienes una licencia trial totalmente funcional de 30 días. Esta licencia
también será necesaria cuando empecemos a usar nuestra base de datos en
código como veremos a continuación.

Ahora vamos a crear un nuevo proyecto Modern UI en Visual Studio 2012 y
vamos a hacer clic derecho y seleccionamos la opción “**Add
Reference**”, en la pantalla “**Reference Manager**” haz clic en el
botón “Browse…” en la parte inferior y navega hasta el directorio Bin
que acabamos de descomprimir, donde encontrarás un componente de WinRT
llamado SiaqoDbWinRT.dll, selecciónalo y haz clic en aceptar, a
continuación ya lo tendrás listo en la pantalla de referencias y solo te
quedará presionar “OK”:

![] (./img/Windows-Modern-UI-BD2/image2.png)

Esta es toda la configuración que necesitamos para usar **SiaqoDb** en
nuestro proyecto, a continuación vamos a crear nuestra base de datos.

###Usando SiaqoDb


Para comenzar a trabajar con toda base de datos, lo primero que
necesitamos es definir los objetos que vamos a almacenar. **SiaqoDb** no
es una base de datos relacional al uso, con un esquema sobre el cual
insertamos líneas en tablas, en lugar de esto nos permite almacenar
objetos de cualquier tipo que luego podremos consultar y recuperar
mediante LinQ, para ello usaremos clases decoradas con atributos que
podemos encontrar en el namespace **Sqo.Attributes**:


```
    public class Customer
    {
        public int OID { get; set; }
        \[MaxLength(100)\]
        public string Name { get; set; }
        \[MaxLength(256)\]
        public string Address { get; set; }
    }
```

Existe una particularidad a la hora de crear nuestras clases,
**SiaqoDb** siempre busca una propiedad pública llamada **OID** de tipo
entero de 32bits donde almacenará el identificador de objeto único, esto
no evita que nosotros creemos índices adicionales, pero este siempre
debe estar presente.

Y ya podemos empezar a usar nuestra base de datos, insertando nuestros
objetos:


```
    private async void InitializeDb()
    {
        SiaqodbConfigurator.SetTrialLicense("nuestro\_codigo\_de\_licencia");
        Siaqodb db = new Siaqodb();
        await
        db.Open(Windows.Storage.ApplicationData.Current.LocalFolder);
        Customer = new Customer() { Name = "Josué Yeray", Address = "Bilbao" };
        await db.StoreObject(customer);
        await db.Flush();
        db.Close();
    }
```

Iniciamos la base de datos indicando el directorio en el que se guardará
(en este caso el directorio de datos de la aplicación) y usamos el
método StoreObject para guardar instancias de nuestros objetos. Para
finalizar, usamos el método **Flush** para escribir nuestros datos en
disco y cerramos la conexión.

Si abrimos la aplicación SiaqoDbManager e indicamos la ruta de nuestra
carpeta de datos, podremos ver los objetos almacenados en ella:

![] (./img/Windows-Modern-UI-BD2/image3.png)
 

Si modificamos la propiedad Name o Address podremos consultarlas en
nuestro código:

```
    private async void QueryDb()
    SiaqodbConfigurator.SetTrialLicense("nuestro\_codigo\_de\_licencia");
    Siaqodb db = new Siaqodb();
    await
    db.Open(Windows.Storage.ApplicationData.Current.LocalFolder);
    var customer = await (from Customer c in db select c).ToListAsync();
    if (customer.Any())
    {
        MessageDialog dlg = new
        MessageDialog(customer.FirstOrDefault().Name);
        await dlg.ShowAsync();
    }
    db.Close();
    }
```

Si ejecutamos veremos que obtenemos el resultado esperado. En este caso
uso el método **ToListAsync**, cuando en realidad podría usar el
**FirstOrDefaultAsync** porque este último no funciona correctamente
todavía en todas las situaciones (recordemos que nos encontramos ante
una beta).

![] (./img/Windows-Modern-UI-BD2/image4.png)

###Conclusiones


Como hemos podido ver, **SiaqoDb** tiene mucho potencial, es muy
sencillo de usar y está muy bien planteada. Como todo, aun no es
perfecta, tiene algunas cosas que debemos tener en cuenta:

Es de pago, aún no sabemos los precios de **WinRT** (la trial de WinRT
dura 90 días en vez de 30) pero de media cuesta 189\$ por desarrollador
y producto, esto quiere decir que si deseamos usarla en Windows Phone,
WPF y Modern UI, tendríamos que pagar 3 licencias por cada
desarrollador. Dada la calidad que aporta y el soporte que tiene detrás
no creo que este sea un precio desorbitado para cualquier desarrollador
freelance que gane dinero por su trabajo o cualquier empresa. Quizás es
un punto de inflexión para un desarrollador solitario que esté
comenzando y no tenga ingresos fijos. Aun así, creo que está justificado
el coste, no me parece excesivo y es un buen producto.

Multiplataforma a medias, no tenemos clientes nativos para Linux o
    Mac y en Android o iOS dependemos de usar Mono. Esto puede ser un
    problema y conlleva un gasto extra en licencias de MonoTouch
    y MonoDroid.



Pero en la otra cara, hay que reconocer que tiene grandes ventajas:

- El proceso de empezar a trabajar es mucho más sencillo que con
    SQLite, además el componente es nativo de WinRT por lo que no
    tendremos que preocuparnos de compilar distintas versiones para x64,
    x86 y ARM

- El modelo de desarrollo, haciendo uso de async / await es realmente
    cómodo

- No tenemos que preocuparnos por caracteres especiales en el path de
    la base de datos como ocurre en SQLite.


En definitiva, creo que **SiaqoDb** **es, en estos momentos, la mejor
base de datos que tenemos disponible para WinRT**, de pago eso sí, y con
menos opciones de multiplataforma. Pero si estos dos aspectos no te
asustan, su forma de trabajar y lo bien que está creada hacen que valga
la pena y mucho.
[*Aquí*](https://skydrive.live.com/redir?resid=FD100135B82F3364!655)
tienes como siempre el proyecto de ejemplo que hemos usado para que
puedas jugar con él. En un próximo artículo intentaré realizar una
comparación de rendimiento para ver cuál de nuestros dos contrincantes
aguanta mejor el tipo, no te lo pierdas.

Un saludo y Happy Coding!
