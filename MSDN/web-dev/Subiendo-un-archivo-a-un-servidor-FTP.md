<properties
	pageTitle="Subiendo un archivo a un servidor FTP con un FileUpload"
	description="Subiendo un archivo a un servidor FTP con un FileUpload"
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





#Subiendo un archivo a un servidor FTP con un FileUpload

Por [Julio Cesar
Avellaneda](http://mvp.microsoft.com/en-us/MVP/Julio%20Cesar%20Avellaneda-4038198)

Microsoft MVP ASP.NET

MCT | MCSD | MCTS

Core Group BDotNet

[http://julitogtu.com](http://julitogtu.com/)

[@julito](https://twitter.com/julitogtu)
Hace poco me preguntaban en el blog sobre como era posible subir un
archivo a un servidor FTP utilizando el FileUpload de
[*ASP.NET*](http://www.asp.net/), esto se dio ya que tenia un post en el
cual mostraba como poder usar ese control ([*mira el post
acá*](http://julitogtu.wordpress.com/2011/04/28/subir-archivos-con-fileupload/)),
así que en esta entrada deseo responder a esa pregunta.

Lo primero a tener en cuenta es que el control fileupload no funciona
nativamente con el protocolo FTP, sino con el HTTP, así que debemos
realiza algunos pequeños cambios y usar alguna clase de .net que nos
permita trabajar con FTP; así que manos a la obra, lo primero es diseñar
una interfaz para la selección del archivo, y tres campos de texto para
el ingreso de:

Servidor FTP

    Usuario

    Clave

Entonces el HTML de nuestra página sería:

HTML

```
    &lt;h1&gt;Subir archivo a un servidor FTP&lt;/h1&gt;

    &lt;hr /&gt;

    &lt;fieldset&gt;

    &lt;legend&gt;Configuración FTP&lt;/legend&gt;

    &lt;table&gt;

    &lt;tr&gt;

    &lt;td&gt;&lt;b&gt;Servidor:&lt;/b&gt;&lt;/td&gt;

    &lt;td&gt;&lt;asp:TextBox ID="txtServidor" runat="server"
    Width="300px"&gt;&lt;/asp:TextBox&gt;&lt;/td&gt;

    &lt;/tr&gt;

    &lt;tr&gt;

    &lt;td&gt;&lt;b&gt;Usuario:&lt;/b&gt;&lt;/td&gt;

    &lt;td&gt;&lt;asp:TextBox ID="txtUsuario" runat="server"
    Width="300px"&gt;&lt;/asp:TextBox&gt;&lt;/td&gt;

    &lt;/tr&gt;

    &lt;tr&gt;

    &lt;td&gt;&lt;b&gt;Clave:&lt;/b&gt;&lt;/td&gt;

    &lt;td&gt;&lt;asp:TextBox ID="txtClave" runat="server"
    Width="300px"&gt;&lt;/asp:TextBox&gt;&lt;/td&gt;

    &lt;/tr&gt;

    &lt;tr&gt;

    &lt;td&gt;&lt;b&gt;Archivo:&lt;/b&gt;&lt;/td&gt;

    &lt;td&gt;&lt;asp:FileUpload ID="fileUpload1" runat="server"
    /&gt;&lt;/td&gt;

    &lt;/tr&gt;

    &lt;tr&gt;

    &lt;td colspan="2"&gt;

    &lt;asp:Button Text="Subir Archivo FTP" runat="server"
    ID="btnSubirArchivo" onclick="btnSubirArchivo\_Click" /&gt;

    &lt;/td&gt;

    &lt;/tr&gt;

    &lt;/table&gt;

    &lt;/fieldset&gt;
```

### Y ahora el código del evento clic del botón:

C\#


```
    if (fileUpload1.HasFile)

    {

    var server = String.Format("{0}files/{1}", txtServidor.Text,
    fileUpload1.FileName);

    var user = txtUsuario.Text;

    var pass = txtClave.Text;

    var request = WebRequest.Create(server);

    request.Method = WebRequestMethods.Ftp.UploadFile;

    request.Credentials = new NetworkCredential(user, pass);

    var sourceStream = new StreamReader(fileUpload1.FileContent);

    var fileContents = Encoding.UTF8.GetBytes(sourceStream.ReadToEnd());

    sourceStream.Close();

    request.ContentLength = fileContents.Length;

    var requestStream = request.GetRequestStream();

    requestStream.Write(fileContents, 0, fileContents.Length);

    requestStream.Close();

    var response = (FtpWebResponse)request.GetResponse();

    lblEstado.Text = response.StatusDescription;

    response.Close();

    }
```

Y listo, estamos tomando el archivo del fileupload, pero en este caso
utilizamos **fileupload1.FileContent**.

Espero les sea de utilidad, como siempre les dejo el código del ejemplo,
saludos!
