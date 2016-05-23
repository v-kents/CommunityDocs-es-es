<properties
	pageTitle="[ASP.NET MVC] Implementando un CustomUserValidator en ASPNET Identity"
	description="Implementando un CustomUserValidator en ASPNET Identity"
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



#[ASP.NET MVC] Implementando un CustomUserValidator en ASPNET Identity



Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola, en el post anterior vimos cómo implementar un
[CustomPasswordValidation](http://www.julitogtu.com/2014/06/10/asp-net-mvc-implementando-un-custompasswordvalidator-en-aspnet-identity/)
para implementar de reglas de negocio adicionales para el password
cuando trabajamos con [ASPNET Identity](http://www.asp.net/identity),
así que hoy vamos a ver como lo podemos hacer sobre el resto de
propiedades del usuario.

Si vamos a la clase **IdentityConfig**, método **Create** podemos
encontrar la siguiente porción de código

```
    // Configure validation logic for usernames

    manager.UserValidator =
    new UserValidator&lt;ApplicationUser&gt;(manager)

    {

    AllowOnlyAlphanumericUserNames = false,

    RequireUniqueEmail = true

    };
```

Y allí tan solo tenemos dos propiedades disponibles:

AllowOnlyAlphanumericUserNames: Si el nombre de usuario solo puede tener
letras y números o no.

RequireUniqueEmail: Si el email debe ser único o no.

Ahora para poder extender dichas reglas, vamos a crear una clase
**CustomUserValidation**, que debe heredar de
**UserValidator&lt;T&gt;**, donde T es la clase que define las
propiedades del usuario, esa hereda de **IdentityUser**, si quieres ver
cómo es posible agregar nuevas propiedades al usuario revisa el post del
crack [Eduard Tomás](https://twitter.com/eiximenis):  [Cambiar el
esquema con ASP.NET
Identity.](http://geeks.ms/blogs/etomas/archive/2013/12/23/cambiar-el-esquema-con-asp-net-identity.aspx)

Luego de tener la clase creada, sobrescribimos el método ValidateAsync y
allí usando el objeto item (de tipo ApplicationUser) es posible acceder
a las propiedades del usuario y hacer las validaciones respectivas, en
el ejemplo solo se valida que el email no tenga test, para que no nos
vayan a trollear.

```
    public class CustomUserValidation :
    UserValidator&lt;ApplicationUser&gt;

    {

    public
    CustomUserValidation(ApplicationUserManager applicationUserManager)

    : base(applicationUserManager)

    {}

    public override async Task&lt;IdentityResult&gt;
    ValidateAsync(ApplicationUser item)

    {

    IdentityResult result = await base.ValidateAsync(item);

    if (item.Email.ToLower().Contains("test"))

    {

    var errors = result.Errors.ToList();

    errors.Add("Email invalid, this is a serious app!");

    result = new IdentityResult(errors);

    }

    return result;

    }

    }
```

Ahora, volvemos al método Create de IdentityConfig y utilizamos la clase
creada anteriormente:


```
    // Configure validation logic for usernames

    manager.UserValidator =
    new Infrastructure.CustomUserValidation(manager)

    {

    AllowOnlyAlphanumericUserNames = false,

    RequireUniqueEmail = true

    };
```
Ahora si probamos:

![] (./img/CustomUserValidator-en-ASPNET-Identity/image1.png)

Espero les sea interesante y no te olvides compartir!
