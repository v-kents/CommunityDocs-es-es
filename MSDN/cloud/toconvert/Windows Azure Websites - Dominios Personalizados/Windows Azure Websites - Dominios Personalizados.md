Por Walter Novoa, **Microsoft Developer Evangelist**

1.  ![](./media/media/image1.png){width="1.3231014873140858in"
    height="1.8335892388451445in"}

Twitter: @warnov

Sitio personal: [http://warnov.com](http://warnov.com/)

En general los sitios de Azure Websites vienen con nombres del estilo:
[*http://warnov.azurewebsites.net*](http://warnov.azurewebsites.net/).

Afortunadamente Azure ofrece una metodología muy sencilla para asignar
un nombre de dominio personalizado para que tu sitio tenga por ejemplo
el nombre: [*http://warnov.com*](http://warnov.com/).

Básicamente lo que tenemos que hacer:

**Verificar que nuestro Azure WebSite esté en Shared o Reserved (los
free no pueden tener dominio propio)\
\
**

1.  ![](./media/media/image2.png){width="4.010976596675415in"
    height="1.7710804899387576in"}

    **Configurar en el proveedor de dominio los nombre tipo A.**

Uno para el @ y otro para el \*

Ambos van con la IP que ofrece Azure:

1.  ![](./media/media/image3.png){width="2.50034886264217in"
    height="2.0940419947506563in"}

    ![](./media/media/image4.png){width="2.50034886264217in"
    height="1.3231014873140858in"}

    **Configurar en el proveedor de dominio los CNAMEs:**

    **awverify** debe corresponder con awverify.warnov.azurewebsites.net
    (para acceder a [*warnov.com*](http://warnov.com/))

    **awverify.www** debe corresponder con
    [*www.awverify.warnov.azurewebsites.net*](http://www.awverify.warnov.azurewebsites.net/)
    (para acceder a [*www.warnov.com*](http://www.warnov.com/))

    **www** debe corresponder a
    [*warnov.azurewebsites.net*](http://warnov.azurewebsites.net/)

    ![](./media/media/image5.png){width="4.052648731408574in"
    height="1.0313943569553805in"}

**Grabar los cambios en el proveedor y volver a** **Azure para agregar
los dominios recientemente configurados:**

[*warnov.com*](http://warnov.com/)

[*www.warnov.com*](http://www.warnov.com/)

1.  ![](./media/media/image6.png){width="2.333659230096238in"
    height="2.50034886264217in"}

 

Los detalles de esta operación los podemos ver en este video de solo 6
minutos, usando como ejemplo a GoDaddy

Las instrucciones mostradas en este video, podrían aplicarse fácilmente
a la configuración en cualquier otro proveedor de dominios:

<http://www.youtube.com/watch?feature=player_embedded&v=bz6c96hBBbA#t=0>
