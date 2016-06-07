


#Controladores de Dominio: Copia de Seguridad y Recuperar – Restore

Por **Guillermo Delprato**

[Blog](https://windowserver.wordpress.com/)

Continuando con esta serie de notas sobre el tema de copias de seguridad (Backup) de Controladores de Dominio, y las diferentes formas de recuperación, en esta vamos a ver cómo podemos recuperar una cuenta de usuario eliminada accidentalmente.

Para esto hay varias posibilidades. En este caso veremos un procedimiento que permitiría recuperar la cuenta, teniendo un único Controlador de Dominio en el Dominio, y además si no contamos con copia de seguridad.

O sea, que en este caso nos valdremos únicamente con las herramientas disponibles en el propio sistema operativo

Es importante aclarar que esto lo podremos hacer únicamente si no ha pasado el “Tombstone time”, ya que en dicho caso ya no estará más en la base de Active Directory

Este procedimiento lo podremos ejecutar, porque en realidad cuando borramos una cuenta, el sistema no la elimina totalmente, sino que la *marca como borrada* y elimina casi todos sus atributos. Específicamente los únicos cuatro atributos que se conservan son: SID, ObjectGUID, LastKnownParent y SAMAccountName

Seguramente alguno se preguntará cuál es la ventaja de recuperar la cuenta, ya que pierde prácticamente todos sus atributos, lo que implica entre otras cosas que deberé reconfigurar la pertenencia a grupos y todos sus restantes atributos. La importancia radica en que tendremos una cuenta con el mismo SID, o sea con la misma identidad, con todo lo que implica.

Comenzaré con un ejemplo muy sencillo, donde eliminaré una cuenta llamada “Use Uno”

![] (./img/Copia-de-Seguridad-y-Recuperar/image1.png)

![] (./img/Copia-de-Seguridad-y-Recuperar/image2.png)

![] (./img/Copia-de-Seguridad-y-Recuperar/image3.png)

Bien, no está más la cuenta. Pero ahora supongamos que en realidad no la queríamos borrar, entonces comencemos el proceso de recuperación
Hay una utilidad muy poderosa para acceder a Active Directory, que está incluida en el sistema operativo, y que yo pienso que Microsoft “la esconde” justamente porque al ser tan poderosa, si cayera en manos inexpertas podría generar problemas graves de resolver.
Vamos a verla ahora, se llama LDP.EXE y la ejecutamos desde Inicio / Ejecutar

![] (./img/Copia-de-Seguridad-y-Recuperar/image4.png)

¿Se ve poco amigable no? :-)
No nos preocupemos, ingresemos por el menú Connection / Connect y conectémonos a nuestro Controlador de Dominio

![] (./img/Copia-de-Seguridad-y-Recuperar/image5.png)

Ahora nuevamente desde el menú Connections elijamos la opción Bind. Estando conectados con la cuenta Administrator no hace falta seleccionar nada, sino botón Aceptar

![] (./img/Copia-de-Seguridad-y-Recuperar/image6.png)

Ahora debemos ingresar al menú Options y seleccionar Control. Dentro de este cuadro, en la parte “Load predefined options” elejimos “Return Deleted Objects” y aceptamos

![] (./img/Copia-de-Seguridad-y-Recuperar/image7.png)

Ingresamos al menú View y elegimos Tree. No hace falta que seleccionemos ninguna partición del Directorio, simplemente botón Ok
Veremos que sobre la izquierda aparece un árbol, con nuestro dominio, el cual iremos expandiendo con doble click hasta que encontremos el contenedor cuyo nombre comienza con “CN=Deleted Objects …”

![] (./img/Copia-de-Seguridad-y-Recuperar/image8.png)

Lo expandimos con doble click, y buscamos la cuenta en cuestión

![] (./img/Copia-de-Seguridad-y-Recuperar/image9.png)

Sobre dicha cuenta, con botón derecho elejimos la opción Modify. Y cuidado que ahora viene lo difícil, hay que cuidar el detalle y no apurarse
En “Edit Entry Attribute” escribimos “IsDeleted” (sin comillas por supuesto)
En “Operation” seleccionamos “Delete”
Por último el botón “Enter” NO PULSEN “CLOSE” NI LA TECLA ENTER

Quedará así

![] (./img/Copia-de-Seguridad-y-Recuperar/image10.png)

Seguimos. Ahora completamos
En “Edit Entry Attribute” escribimos “DistinguishedName”
En “Value” ingresamos el DN de la cuenta a recuperar, en mi caso usé “CN=U1-Recuperado,ou=OU1,DC=guillermod,dc=local”
En “Operation” seleccionamos “Replace”
Y por último el botón Enter

Quedará así

![] (./img/Copia-de-Seguridad-y-Recuperar/image10.png)

Por último marcamos la opción “Extended” y el botón “Run” para que se ejcute
Si todo salió bien, podremos ver nuestro “usuario recuperado”

![] (./img/Copia-de-Seguridad-y-Recuperar/image11.png)


Observen que de acuerdo al DN que le he puesto lo he podido recuperar con diferente nombre, o inclusive, lo podría haber recuperado en una unidad organizativa específica
No digamos que el procedimiento es sencillo, pero si no hay una copia de seguridad disponible y debemos recuperar una cuenta, lo justifica
Existen también varios métodos y aplicaciones que se podrían aplicar, a quien le interese profundizar el tema le recomiendo ver
[How to restore deleted user accounts and their group memberships in Active Directory](https://support.microsoft.com/en-us/kb/840001)
