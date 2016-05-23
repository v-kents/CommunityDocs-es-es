Por [Jesús Enrique
Gonzales](http://mvp.microsoft.com/en-us/mvp/Jesus%20Enrique%20Gonzales%20Azcarate-5000714)

Blog: <http://geeks.ms/blogs/JesusGonzales/>

<http://pe.linkedin.com/pub/jesus-enrique-gonzales-azcarate/24/a41/530>

Primero empezamos creando la VM en donde instalaremos Windows Server
2012, para ésto debemos agregar el rol de Hyper-V en

Windows Server y luego procedemos a crear la máquina virtual desde cero
para continuar con la instalación del S.O.

Pueden descargar una copia trial de Windows Server 2012:
[*http://technet.microsoft.com/en-us/evalcenter/hh670538.aspx*](http://technet.microsoft.com/en-us/evalcenter/hh670538.aspx) 

1.  ![](./media/media/image1.PNG){width="5.281987095363079in"
    height="6.657179571303587in"}

    ![](./media/media/image2.PNG){width="5.3340780839895015in"
    height="4.959025590551181in"}

Una vez configurada la VM con los recursos necesarios, agregamos el ISO
de instalación de WS 2012 y continuamos con la instalación:

1.  ![](./media/media/image3.PNG){width="5.3340780839895015in"
    height="8.449095581802275in"}

    ![](./media/media/image4.PNG){width="5.396586832895888in"
    height="1.6043908573928258in"}

Configuramos la cuenta Administrator y agregamos el password respectivo.

1.  ![](./media/media/image5.PNG){width="5.3340780839895015in"
    height="3.27128937007874in"}

Luego debemos de activar nuestro WS 2012, accedemos al CMD como
administrador y ejecutamos lo siguiente:

Ejecuta CMD como Administrator

slmgr.vbs –ipk **“Ingresar product key” **

slmgr.vbs -ato

1.  ![](./media/media/image6.PNG){width="5.615367454068242in"
    height="1.6252263779527558in"}   

En una próxima entrega estaremos instalando y configurando nuestro
servidor WS 2012 como Active Directory, DNS y DHCP.

Nos vemos!
