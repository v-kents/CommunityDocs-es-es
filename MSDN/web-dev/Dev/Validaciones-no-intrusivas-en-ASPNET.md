<properties
	pageTitle="Validaciones no intrusivas en ASP.NET 4.5"
	description="Validaciones no intrusivas en ASP.NET 4.5"
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



#Validaciones no intrusivas en ASP.NET 4.5

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)

Hola a todos, volviendo al desarrollo Web, hoy quiero aprovechar este post para mostrar una de las nuevas características de ASP.NET 4.5 que son las validaciones no intrusivas y el error que vamos a obtener cuando creamos una nueva aplicación Web.
Vamos a crear una nueva aplicación Web, agregar una nueva página aspx y allí vamos a tener un formulario para el registro de personas, adicionalmente usaremos algunos validadores que ofrece ASP.NET (si no los conoces revisa este post), entonces el sencillo código que necesitamos es:

```
    <form id="form1" runat="server">
    <div>
         <table>
             <tr>
                 <td>Nombre:</td>
                 <td>
                     <asp:TextBox ID="txtNombre" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="*"></asp:RequiredFieldValidator>
                 </td>
            </tr>
            <tr>
                <td>Correo:</td>
                <td>
                    <asp:TextBox ID="txtCorreo" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Usuario:</td>
                <td>
                    <asp:TextBox ID="txtUsuario" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Clave:</td>
                <td>
                    <asp:TextBox ID="txtClave" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredClave" runat="server" ControlToValidate="txtClave" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Button ID="btnGuardar" runat="server" Text="Guardar" /></td>
            </tr>
        </table>
    </div>
    </form>
```
Como vemos, el HTML es muy simple, peor ahora si lanzamos la aplicación vamos a obtener el siguiente error:

![] (./img/Validaciones-no-intrusivas-en-ASPNET/image1.png)

Extraño no? simplemente creamos una página bastante sencilla (sin nada de código de servidor) y ya está fallando… pero si revisamos un poco el error vemos que dice “WebForms UnobtrusiveValidationMode requires a ScriptResourceMapping…” y ya tenemos una idea del error, lo que pasa es que con ASP.NET 4.5 tenemos una nueva característica la cual reducir la cantidad de código JavaScript necesario, la definición exacta dice:
You can now configure the built-in validator controls to use unobtrusive JavaScript for client-side validation logic. This significantly reduces the amount of JavaScript rendered inline in the page markup and reduces the overall page size. 
Y dicha característica viene habilitada por defecto, para deshabilitarla vamos a nuestro Global.asax y en el evento Application_Start le decimos:


   ValidationSettings.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
   
Y ahora si lanzamos de nuevo la aplicación va a funcionar… pero no estaríamos aprovechando la validación no intrusiva, y si revisamos el HTML que es generado en el cliente tenemos:
```

<!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">
   <head><title>
   Formulario
     </title></head>
     <body>
         <form method="post" action="index.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="form1">
     <div class="aspNetHidden">
    <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
    <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
    <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="2pkd4JZKXmDyDJwu0HIaaT5x/EzINW3Fmj5ECNYtq721M2fzxgYIW/yLzuVDUpE6C5+JtdW4Mo7Mh7EH1jcQPCiVMtXSlRRYD3i7hJ3zQLM=" />
    </div>
     
    <script type="text/javascript">
    //<![CDATA[
    var theForm = document.forms['form1'];
    if (!theForm) {
        theForm = document.form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
    //]]>
    </script>
     
     
    <script src="/WebResource.axd?d=pynGkmcFUV13He1Qd6_TZAlhwiK26CMjFC_AwUoa5b3ERCspA6cmt_C-L8IOpCe633BVnc0wcDgTvonIIsSvwQ2&amp;t=634776373276709129" type="text/javascript"></script>
     
  <script src="/WebResource.axd?d=x2nkrMJGXkMELz33nwnakEDhIJdn4zA9e1UqVq1SVvHhRhIprKEH70Wnr0YNmajC6LdVxQkRSvYza9nzCfZpzIEPGw7MYTdtpXpxdmoJjww1&amp;t=634776373276709129" type="text/javascript"></script>
  <script type="text/javascript">
  //<![CDATA[
  function WebForm_OnSubmit() {
  if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
  return true;
  }
    //]]>
    </script>
    <div class="aspNetHidden">
        <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="bZYSXvfMEK7zHv9kV0tE+oZEnunr/8QE7gS9ULLQ4JyQa0/rv/1MRHr1bmVesMg6m/hAbEjp+lbFzmo0SV+QBKLDALpSfGJ0DfJ5FA03pkiwbqmguFNLc2gD7rvhbwgkveOk/e6MOPe2FJKM0lEwaBBiTadifQmqoEyokjWDmTbeUzilOBcBLxfc4JnhDC5gTorEWeVaxxVnfEZrKxCLsg==" />
    </div>
        <div>
            <table>
                <tr>
                    <td>Nombre:</td>
                    <td>
                        <input name="txtNombre" type="text" id="txtNombre" style="width:300px;" />
                        <span id="requiredNombre" style="visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td>Correo:</td>
                    <td>
                        <input name="txtCorreo" type="text" id="txtCorreo" style="width:300px;" />
                        <span id="requiredCorreo" style="visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <input name="txtUsuario" type="text" id="txtUsuario" style="width:300px;" />
                        <span id="requiredUsuario" style="visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td>Clave:</td>
                    <td>
                        <input name="txtClave" type="password" id="txtClave" style="width:300px;" />
                        <span id="requiredClave" style="visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnGuardar" value="Guardar" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;btnGuardar&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))" id="btnGuardar" /></td>
                </tr>
            </table>
        </div>
        
    <script type="text/javascript">
    //<![CDATA[
    var Page_Validators =  new Array(document.getElementById("requiredNombre"), document.getElementById("requiredCorreo"), document.getElementById("requiredUsuario"), document.getElementById("requiredClave"));
    //]]>
    </script>
     
    <script type="text/javascript">
    //<![CDATA[
    var requiredNombre = document.all ? document.all["requiredNombre"] : document.getElementById("requiredNombre");
    requiredNombre.controltovalidate = "txtNombre";
    requiredNombre.errormessage = "*";
    requiredNombre.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
    requiredNombre.initialvalue = "";
    var requiredCorreo = document.all ? document.all["requiredCorreo"] : document.getElementById("requiredCorreo");
    requiredCorreo.controltovalidate = "txtCorreo";
   requiredCorreo.errormessage = "*";
   requiredCorreo.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
   requiredCorreo.initialvalue = "";
   var requiredUsuario = document.all ? document.all["requiredUsuario"] : document.getElementById("requiredUsuario");
   requiredUsuario.controltovalidate = "txtUsuario";
   requiredUsuario.errormessage = "*";
   requiredUsuario.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
   requiredUsuario.initialvalue = "";
   var requiredClave = document.all ? document.all["requiredClave"] : document.getElementById("requiredClave");
   requiredClave.controltovalidate = "txtClave";
   requiredClave.errormessage = "*";
   requiredClave.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
   requiredClave.initialvalue = "";
   //]]>
   </script>
   <script type="text/javascript">
   //<![CDATA[
    
   var Page_ValidationActive = false;
   if (typeof(ValidatorOnLoad) == "function") {
       ValidatorOnLoad();
   }
    
   function ValidatorOnSubmit() {
       if (Page_ValidationActive) {
          return ValidatorCommonOnSubmit();
       }
       else {
           return true;
       }
   }
           //]]>
   </script>
   </form>
   </body>
   </html>
```
Como vemos son 137 líneas de código y en la parte final bastante código JavaScript.
Ahora vamos a habilitar la validación no intrusiva (recuerden en el Global.asax):

    ValidationSettings.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.WebForms;

Y para solucionar el error simplemente adicionamos la librería jQuery, pero lo debemos hacer de nuevo en el Global.asax de la siguiente manera:

```
ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
         new ScriptResourceDefinition
         {
             Path = "/Scripts/jquery-1.8.0.js"
         }
     );
```

En Path especificamos la ruta de la librería, y ahora si volvemos a lanzar la aplicación y a revisar el HTML generado tenemos:
```
     <!DOCTYPE html>
      
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head><title>
         Formulario
     </title></head>
     <body>
         <form method="post" action="index.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="form1">
     <div class="aspNetHidden">
    <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
    <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
    <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="alparljtLhNy2xupYlZBZObSGVyvyxxogr8jThTTwWgWjbCJGZlWBvzpy1msUcxlr7zmHWThPw30eTwgrEBC9jxViHQKMQdl97MNwbdtIyg=" />
    </div>
     
    <script type="text/javascript">
    //<![CDATA[
    var theForm = document.forms['form1'];
    if (!theForm) {
        theForm = document.form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
    //]]>
    </script>
     
     
    <script src="/WebResource.axd?d=pynGkmcFUV13He1Qd6_TZAlhwiK26CMjFC_AwUoa5b3ERCspA6cmt_C-L8IOpCe633BVnc0wcDgTvonIIsSvwQ2&amp;t=634776373276709129" type="text/javascript"></script>
     
     
    <script src="/Scripts/jquery-1.8.0.js" type="text/javascript"></script>
    <script src="/WebResource.axd?d=x2nkrMJGXkMELz33nwnakEDhIJdn4zA9e1UqVq1SVvHhRhIprKEH70Wnr0YNmajC6LdVxQkRSvYza9nzCfZpzIEPGw7MYTdtpXpxdmoJjww1&amp;t=634776373276709129" type="text/javascript"></script>
    <script type="text/javascript">
    //<![CDATA[
    function WebForm_OnSubmit() {
    if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
    return true;
    }
    //]]>
    </script>
     
    <div class="aspNetHidden">
     
        <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="+364tW9Dc7pDt6plQ90xe5FouuoNJLAEzbosO0J1tGmDKGpwQcxZ1kdqIV/tRvjZENOFLgzZM85V7T0z3t6I607wioiuB8cTrjZfCFSxHIPE/QbqekiEkZw9CeWGtKKGd2SzLZyMEXvyjxGP4xzOcHDDG0s00+EWD0Gay9W4uDXNzzVdNiwpoNp6dSj21Rvzuttb/+4L1dlkpikZJVdSig==" />
    </div>
        <div>
            <table>
                <tr>
                    <td>Nombre:</td>
                    <td>
                        <input name="txtNombre" type="text" id="txtNombre" style="width:300px;" />
                        <span data-val-controltovalidate="txtNombre" data-val-errormessage="*" id="requiredNombre" data-val="true" data-val-evaluationfunction="RequiredFieldValidatorEvaluateIsValid" data-val-initialvalue="" style="visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td>Correo:</td>
                    <td>
                        <input name="txtCorreo" type="text" id="txtCorreo" style="width:300px;" />
                        <span data-val-controltovalidate="txtCorreo" data-val-errormessage="*" id="requiredCorreo" data-val="true" data-val-evaluationfunction="RequiredFieldValidatorEvaluateIsValid" data-val-initialvalue="" style="visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <input name="txtUsuario" type="text" id="txtUsuario" style="width:300px;" />
                        <span data-val-controltovalidate="txtUsuario" data-val-errormessage="*" id="requiredUsuario" data-val="true" data-val-evaluationfunction="RequiredFieldValidatorEvaluateIsValid" data-val-initialvalue="" style="visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td>Clave:</td>
                    <td>
                        <input name="txtClave" type="password" id="txtClave" style="width:300px;" />
                        <span data-val-controltovalidate="txtClave" data-val-errormessage="*" id="requiredClave" data-val="true" data-val-evaluationfunction="RequiredFieldValidatorEvaluateIsValid" data-val-initialvalue="" style="visibility:hidden;">*</span>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnGuardar" value="Guardar" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;btnGuardar&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))" id="btnGuardar" /></td>
                </tr>
            </table>
        </div>
        </form>
    </body>
    </html>
```

Lo primero que observamos es que solo tenemos 87 líneas en contra de las 137 anteriores (bastantes menos no?), lo segundo es que ya no tenemos tanto código JavaScript y lo tercero es que aparecen nuevos atributos en los span, y esos atributos son los que ahora determinan las validaciones. Inicialmente el HTML de un span era:

    <span id="requiredNombre" style="visibility:hidden;">*</span>

Y luego con la validación no intrusiva lista:

    <span data-val-controltovalidate="txtNombre" data-val-errormessage="*" id="requiredNombre" data-val="true" data-val-evaluationfunction="RequiredFieldValidatorEvaluateIsValid" data-val-initialvalue="" style="visibility:hidden;">*</span>

Como se puede ver, se han generado nuevos atributos del tipo data-val-<…> los cuales determinan como se realizará la validación.
Espero les sea de utilidad este post, saludos!

