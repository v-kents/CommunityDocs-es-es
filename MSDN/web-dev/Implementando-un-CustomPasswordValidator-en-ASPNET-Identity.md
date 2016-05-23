<properties
	pageTitle="Web API II – Creando un CRUD, trabajando con verbos HTTP"
	description="Implementar fácilmente un CRUD"
	services="web-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="web-dev"
	ms.workload="identity"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/16/2016"
	ms.author="andygonusa"/>


#[ASP.NET MVC] Implementando un CustomPasswordValidator en ASPNET Identity


Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)


Hola, desde ASP.NET MVC 5 se tiene una nueva opción para el manejo de
seguridad en las aplicaciones (si, se ha dejado de lado Membership y
Simplemembership) que se conoce [ASPNET
Identity](http://www.asp.net/identity), el cual tienes varias
características interesantes, dentro de ellas una que me parece muy
interesante es que ya viene implementada mediante **OWIN**.

Ahora, es posible setear algunas propiedades básicas para establecer
algunas reglas para definir el password, sin embargo si esas opciones no
son suficientes siempre podemos extender dicha configuración para que
cumpla con nuestra necesidad puntual.

Para ejemplificar vamos a crear una nueva aplicación de tipo ASP.NET Web
Application:

![] (./img/Implementando-un-CustomPasswordValidator-en-ASPNET-Identity/image1.png)


Luego seleccionamos el template MVC y nos aseguramos que en la parte de
autenticación se tenga seleccionado **Invidual Users Accounts**, la idea
de usar este template es porque ya tiene implementado ASPNET Identity
(pero si quieren luego lo hacemos desde ceros):

![] (./img/Implementando-un-CustomPasswordValidator-en-ASPNET-Identity/image2.png)


Una vez creado el proyecto, vamos a ir a **App\_Start -&gt;
IdentityConfig.cs**, y en el método **Create** nos fijamos en la
siguiente parte de código:

CODIGO Configure validation logic for passwords

```
    // Configure validation logic for passwords

    manager.PasswordValidator = new PasswordValidator

    {

    RequiredLength = 6,

    RequireNonLetterOrDigit = true,

    RequireDigit = true,

    RequireLowercase = true,

    RequireUppercase = true,

    };
```

El código anterior lo que hace es establecer algunas reglas para el
password, pero como se ve son limitadas, así que vamos a extender dicha
configuración, para ello creamos una clase llamada
**CustomPasswordValidator**, dicha clase debe heredar de
**PasswordValidator**, y allí sobre-escribimos el método
**ValidateAsync**, en dicho método agregamos la validación que nosotros
requerimos (para el ejemplo vamos a validar que no se tengan espacios en
blanco):


```
    public class CustomPasswordValidator : PasswordValidator

    {

    public override async Task&lt;IdentityResult&gt;
    ValidateAsync(string item)

    {

    var result = await base.ValidateAsync(item);

    if (item.Contains(" ")) {

    var errors = result.Errors.ToList();

    errors.Add("El password no puede contener espacios en blanco");

    result = new IdentityResult(errors);

    }

    return result;

    }

    }
```

Una vez lista la clase con la validación necesaria, volvemos al archivo
IdentityConfig, método Create, y en el manager.PasswordValidator ahora
usamos la clase personalizada que hemos  creado:


```
    // Configure validation logic for passwords

    manager.PasswordValidator = new
    Infrastructure.CustomPasswordValidator

    {

    RequiredLength = 6,

    RequireNonLetterOrDigit = true,

    RequireDigit = true,

    RequireLowercase = true,

    RequireUppercase = true,

    };
```

Y eso es todo, ahora solo es probar, y la siguiente imagen muestra que
la lógica si se está cumpliendo:

![] (./img/Implementando-un-CustomPasswordValidator-en-ASPNET-Identity/image3.png)


Espero les sea interesante y no te olvides de compartir!
