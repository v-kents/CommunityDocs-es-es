Por Juan José Diaz Antuña, @diazantuna 

Microsoft MVP

Windows Expert-IT Pro

Ya sabéis que hay una nueva versión de Windows Server, hasta ahora en
Technical Preview, y que por supuesto entre múltiples novedades trae
novedades en el rol de Hyper-V, que sigue creciendo poco a poco.

Voy a ir mostrando en los dos blogs en diazantuna.es y en
blogs.itpro.es/diazantuna cada una de las novedades de Hyper-V en este
nuevo servidor, empezando por este artículo en el que voy a contaros las
versiones de máquinas virtuales y como probar en el nuevo servidor de
Hyper-V con las maquinas que actualmente tenemos en Windows Server 2012
R2 sin cargárnoslas.

Deciros que en vNext tenemos maquinas versión 5 y versión 6. Deciros que
la versión 5 es compatible con Windows Server 2012 R2, es decir podemos
ejecutar esas máquinas en servidores Windows Server 2012 R2 y vNext
(Technical Preview); mientras las de versión 6 solo las podremos
ejecutar en la versión Technical Preview y no en Windows Server 2012 R2.

Con estos antecedentes deciros que podéis actualizar de versión 5 a 6,
pero no pasar de 6 a 5, una vez en versión 6 no podéis volver atrás.

Puedo ver la versión de mi máquina virtual con el comando:

#### Get-VM \* | Format-Table Name, Version

Para actualizar de versión 5 a 6 debo de tener en cuenta estos puntos:

Una vez actualizada la máquina virtual no puedo mover la maquina aun
servidor de Hyper-V en Windows Server 2012 R2

Una vez pasada a versión 6 no puedo pasar a versión 5

Para actualizar la máquina, esta debe de estar apagada.

El cmdlet para actualizar está bloqueado en un clúster de Hyper-V si su
nivel funcional es 2012 R2.

Una vez actualizada la máquina virtual, el fichero de configuración de
máquina virtual pasa a ser con extensión .VMCX y un fichero .VMRS para
el runtime de la máquina. Estos nuevos ficheros mejoran la eficiencia de
acceso de lectura/escritura a la configuración de la misma, así como
reduce la corrupción de fichero en el caso de un fallo en el
almacenamiento.

El comando cmdlet a utilizar es:

#### Update-VmConfigurationVersion vmname

En breve más sobre vNext…
