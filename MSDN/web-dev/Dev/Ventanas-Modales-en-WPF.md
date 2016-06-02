  
  
  
  
#Ventanas Modales en WPF
  
Por **Nicolás Herrera**                                                                            

[Blog](http://nicolocodev.wordpress.com/)

Hola, en los últimos días volví a tocar uno de los lenguajes de marcado
que mas me ha gustado, si estoy hablando de XAML, esta vez con Windows
Presentation Foundation, allí tuve que implementar ventanas modales, y
creí que seria tan fácil como crear un elemento ChildWindow
(Silverlight) y llamarlo. Pero bueno, manos a la obra, igual si algún
lector se sabe una mejor… por favor hágamelo saber.

###Implementando una ventana Modal


En un proyecto con dos ventanas de WPF normales:

![] (./img/Ventanas-Modales-en-WPF/image1.png)

Para lanzar una ventana como modal, basta con hacer lo siguiente.

Sobre el evento del control que debe llamar la ventana modal:

>C\#

```
    private void LlamarModalClick(object sender, RoutedEventArgs e)

    {

    Modal modal = new Modal();

    modal.Owner = this;

    modal.ShowDialog();

    }
```
Como podemos ver, la ventana ha salido en una posición “aleatoria” y
parece todo menos una ventana modal, para cambiar esto lo que haremos
será modificar algunas propiedades en esta.

El XAML de la ventana modal quedaría de la forma:

>XAML

```

    &lt;Window x:Class=”ModalWPF.Modal”

    xmlns=”http://schemas.microsoft.com/winfx/2006/xaml/presentation”

    xmlns:x=”http://schemas.microsoft.com/winfx/2006/xaml”

    Title=”Modal”

    Height=”300″

    Width=”300″

    WindowStyle=”None”

    ShowInTaskbar=”False”

    WindowStartupLocation=”CenterOwner”&gt;

    &lt;Grid&gt;

    &lt;Label Content=”Hola soy la

    ventana modal “&gt;&lt;/Label&gt;

    &lt;/Grid&gt;

    &lt;/Window&gt;

```

![] (./img/Ventanas-Modales-en-WPF/image2.png)

Ahora nuestra ventana modal tiene un mejor aspecto, aun se puede
mejorar, pero para allá vamos, lo que si notamos es que no se ve bonita
la ventana de fondo, es decir, debería tener un efecto como de
desenfoque ¿no?

###Aplicando efecto de fondo con una ventana Modal

Para aplicar un efecto de desenfoque emplearemos el espacio de nombres
**[System.Windows.Media.Effects](http://msdn.microsoft.com/en-us/library/system.windows.media.effects.aspx),**
el código nos quedaría de la forma:

>C\#

```

    private void LlamarModalClick(object sender, RoutedEventArgs e)

    {

    Modal modal = new Modal();

    modal.Owner = this; AplicarEfecto(this);

    modal.ShowDialog();

    }

    private void AplicarEfecto(Window win)

    {

    var objBlur = new System.Windows.Media.Effects.BlurEffect();

    objBlur.Radius = 5;

    win.Effect = objBlur;

    }
```

Y el resultado se vería de la forma:

![] (./img/Ventanas-Modales-en-WPF/image3.png)

Ahora bien, si quisiéramos recibir la respuesta de la ventana y una vez
hecho esto, volver la Main Window a su estado original, ¿Cómo se haria?

###Obtener el resultado de la ventana y volver al estado original

Sobre la ventana modal agregamos un botón “VOLVER” y sobre el evento
*click* del mismo, implementamos el siguiente código:

>C\#

```

    private void VolverButtonClick(object sender, RoutedEventArgs e)

    {

    DialogResult = false;

    Close();

    }
```

Y sobre la ventana principal, implementamos el siguiente código:

>C\#

```

    private void AceptarButtonClick(object sender, RoutedEventArgs e)

    {

    ConfirmacionVotoModal modal = new ConfirmacionVotoModal();

    modal.Owner = this;

    AplicarEfecto(this);

    modal.ShowDialog();

    bool?

    resultado = modal.DialogResult;

    if (resultado != null)

    {

    if (resultado == false)

    {

    QuitarEfecto(this);

    }

    }

    }

    private void AplicarEfecto(Window win)

    {

    var objBlur = new System.Windows.Media.Effects.BlurEffect();

    objBlur.Radius = 5;

    win.Effect = objBlur;

    }

    private void QuitarEfecto(Window win)

    {

    win.Effect = null;

    }
```

Y listo, ya podremos recuperar el estado original de nuestra ventana
principal.

Como *bonus* les dejo el XAML (me lo encontré en la *WEB*) para mejorar
la apariencia de la ventana modal:

>XAML

```
    &lt;Window x:Class=”ModalWPF.Modal”
    xmlns=”http://schemas.microsoft.com/winfx/2006/xaml/presentation”

    xmlns:x=http://schemas.microsoft.com/winfx/2006/xaml

    Title=”Modal”

    Height=”300″

    Width=”300″

    WindowStyle=”None”

    ShowInTaskbar=”False”

    WindowStartupLocation=”CenterOwner”

    AllowsTransparency=”True”

    Background=”Transparent”&gt;

    &lt;Border BorderBrush=”Gray”

    BorderThickness=”0,0,2,2″

    CornerRadius=”10″

    Background=”AliceBlue”&gt;

    &lt;Border BorderBrush=”Transparent”

    BorderThickness=”5″

    CornerRadius=”10″&gt;

    &lt;Border BorderBrush=”Black”

    BorderThickness=”1.5″

    CornerRadius=”10″&gt;

    &lt;Grid&gt;

    &lt;Label Content=”Hola soy la ventana modal “&gt;&lt;/Label&gt;

    &lt;Button Click=”VolverButtonClick”

    Content=”Volver”

    Height=”60″

    VerticalAlignment=”Bottom”

    Margin=”5″&gt;&lt;/Button&gt;

    &lt;/Grid&gt;

    &lt;/Border&gt;

    &lt;/Border&gt;

    &lt;/Border&gt;

    &lt;/Window&gt;
```

El resultado se vería como el siguiente:

Insert Caption

```

    ![](./media/media/image4.png){width="5.990419947506561in"
    height="4.208920603674541in"}
```

Bien, con esto llegamos al final.

Espero les sea de utilidad.
