Por [Jesús Enrique
Gonzales](http://mvp.microsoft.com/en-us/mvp/Jesus%20Enrique%20Gonzales%20Azcarate-5000714)

Blog: http://geeks.ms/blogs/JesusGonzales/

<http://pe.linkedin.com/pub/jesus-enrique-gonzales-azcarate/24/a41/530>

En esta 4ta parte de la serie de artículos, estaremos agregando las
imágenes de Boot e Instalación (boot.wim/install.wim) a

Windows Deployment Services. Estos archivos se encuentran dentro del DVD
de instalación de Windows 8, dentro de la carpeta sources.

Pueden descargar una copia trial de Windows 8 Enterprise desde:
<http://msdn.microsoft.com/en-us/evalcenter/jj554510.aspx>

1.  ![](./media/media/image1.PNG){width="4.9069346019247595in"
    height="8.678293963254593in"}

    ![](./media/media/image2.PNG){width="5.094460848643919in"
    height="8.897074584426946in"}

    ![](./media/media/image3.PNG){width="5.172916666666667in"
    height="9.0in"}

    ![](./media/media/image4.PNG){width="5.250732720909887in"
    height="6.21961832895888in"}

    ![](./media/media/image5.PNG){width="5.302823709536308in"
    height="6.198781714785651in"}

    ![](./media/media/image6.PNG){width="5.407004593175853in"
    height="3.17752624671916in"}

Una vez terminada la configuración de agregar las imagenes .WIM, debemos
de crear una nueva máquina virtual para que simule nuestro cliente
Windows 8, y éste pueda bootear por la red conectandose al DHCP y
haciendole la petición que le entregue una dirección del scope
configurado.

Creamos nuestro cliente Windows 8:

1.  ![](./media/media/image7.PNG){width="6.5in"
    height="3.8569444444444443in"}

    ![](./media/media/image8.PNG){width="6.5in"
    height="3.859027777777778in"}

A tener en cuenta, para que la máquina virtual pueda realizar el boot de
la red necesitamos agregar el adaptador de red legacy:

1.  ![](./media/media/image9.PNG){width="6.5in"
    height="1.8715277777777777in"}

Ahora encendemos el cliente virtual, de esta forma se comunicará con el
DHCP para solicitar una dirección IP, presionamos F12 para que haga el
boot por la red mediante PXE:

1.  ![](./media/media/image10.PNG){width="5.677876202974629in"
    height="3.2921259842519683in"}

Notamos en el DHCP que ya le entregó una dirección de IP válida:

1.  ![](./media/media/image11.PNG){width="5.615367454068242in"
    height="3.2817082239720037in"}

Ahora seleccionamos la imagen de boot del S.O. a elegir:

1.  ![](./media/media/image12.PNG){width="5.740384951881015in"
    height="3.323380358705162in"}

Empieza la transferencia y carga del archivo boot.wim:

1.  ![](./media/media/image13.PNG){width="5.813311461067366in"
    height="6.761360454943132in"}

Una vez dentro del ambiente de preinstalación de windows, ingresamos las
credenciales del administrador del dominio o una cuenta similar, así
aparecerán las imagenes disponibles:

1.  ![](./media/media/image14.PNG){width="5.896655730533683in"
    height="6.792614829396325in"}

    ![](./media/media/image15.PNG){width="6.042509842519685in"
    height="6.990558836395451in"}

    ![](./media/media/image16.PNG){width="6.105018591426072in"
    height="3.5629975940507435in"}

Y el proceso de instalación sigue su curso:

1.  ![](./media/media/image17.PNG){width="6.198781714785651in"
    height="3.5838331146106737in"}

Podemos personalizar un archivo de instalación para que de esta forma
sea totalmente desatendido (que se instale de forma automática sin la
intervención del usuario). Para eso podemos utilizar System Image
Manager que viene dentro del paquete de herramientas de The Windows®
Assessment and Deployment Kit (Windows
ADK)(<http://www.microsoft.com/en-us/download/details.aspx?id=30652>)

1.  ![](./media/media/image18.PNG){width="6.1779451006124235in"
    height="3.542160979877515in"}

Con esto finalizamos esta parte de configuración y deploy con WDS.
Continuaremos en nuestra próxima entrega commo hacer la instalación y
configuración para un deploy de Windows 8 con Microsoft Deployment
Toolkit 2012 Update 1.

Saludos!
