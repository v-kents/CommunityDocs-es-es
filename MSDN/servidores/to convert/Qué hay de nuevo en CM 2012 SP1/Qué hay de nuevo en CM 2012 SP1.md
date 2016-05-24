[Marcela Berri*\
*](https://plus.google.com/102022832380927697290/posts/p/pub)Instructor
/ Consultor Senior IT\
MCT – MVP Configuration Manager

MCTS Server Administrator - MCTS AD 2008 - MCTS Network Inf\
MCTS - Server Virtualization\
MCTS W7 & Off2010 - MCTS SCCM 2012/2007 - MCTS SCOM 2007\
MCITP Exchange 2010/2007 - MCTS Exch 2010/2007 - MCTS Lync 2010

Blog [IT Technology Site: *About
me*](http://ittechnologysite.blogspot.com.ar/)

**Con el Service Pack 1 de Configuration Manager 2012**, se abren muchas
nuevas posibilidades que flexibilizan aún más la nueva jerarquía y sus
funcionalidades, aunque todavía no hay fecha cierta de salida. Aquí les
dejo un resumen de las más importantes:   Para ver artículo oficial,
haga [clic
aquí](http://technet.microsoft.com/es-es/library/jj591552.aspx)

  Resumen
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  La extensión del schema de AD permanece sin cambios. No es necesario extender el esquema nuevamente para el SP1.
  Existen nuevos comandos de Windows PowerShell para poder realizar script. Para poder ver los cmdlets disponibles, se puede utilizar get-command -module ConfigurationManager. Para abrir la consola de Power Shell, en el menú Application, se encuentra Connect via Windows PowerShell
  Ahora se permite expandir un site stand-alone ya configurado, e incluir un CAS –Central Administration Site-. ¡Ya deja de ser una decisión al momento de instalar! Hay una nueva opción dentro del setup que pregunta si el CAS es “El primer sitio de una nueva Jerarquía” o si “expande un sitio Stand-alone”. Además permite migrar una jerarquía CM 2012 SP1 de otra organización a otra con CM 2012 SP1, o migrar el ambiente de “test” a “producción”.<span id="more" class="anchor"></span>
  Se reemplazan las “Address” por “file routes” para la replicación basada en archivos entre sites. Sólo es un cambio de nombre, no de funcionalidad.
  Hay mejoras en cuanto a los controles que se pueden realizar en la replicación de las bases entre Sites. Se puede programar la transferencia, controlar la frecuencia, definir la sumarización de los datos. Se puede cambiar el Puerto usado por el SQL Server Service Broker. También se puede configurar compresión en la transferencia de los datos y el período que espera ante una falla de replicación.
  Ahora se podrá subscribir alertas por email de cualquiera de las características del producto, no solo Endpoint.
  Se puede recobrar un Site Secundario usando el nodo Sites – la opción Recover Secondary Site en la consola.
  Soporta ahora que un Distribution Point esté en la nube: cloud service con Windows Azure. Se puede usar como fallback o estándar DP.
  Se puede elegir el drive en donde ubicar el contenido de “Content Library” cuando se crea el Distribution Point como parte del asistente o configurarlo posteriormente.
  Clientes: Soporte para Windows 8. Se puede instalar el cliente en el Sistema Operativo y hacer upgrade de versiones previas. Además soporta Windows To Go (instalación de Windows 8 en pendrive). Soporta además realizar el deployment de aplicaciones Windows 8 (.appx)
  Se puede utilizar seteos de compliance para incluir ítems de “User Data y Profiles” para clientes Windows 8. Esto permite que se pueda controlar la efectividad de folder redirection, offline files, y roaming profiles en la empresa.
  El cliente de CM 2012 SP1, puede detectar el “power state” de los dispositivos Windows 8 x86 y retrasar determinadas acciones ayudando al ahorro de batería. (Always On Always Connected)
  Soporta Windows Server 2012 and SQL Server 2012.
  Soporta clientes Mac. Se puede implementar software, recolectar inventario y manejar compliance property list (.plist).
  Soporta clientes Linux y UNIX servers. Se puede implementar software, recolectar inventario de hardware.
  Se puede instalar el cliente en dispositivos Windows Embedded como en cualquier otro cliente.
  Brinda la posibilidad de iniciar ciertas operaciones de cliente desde la consola como: Bajar computer policies, iniciar un escaneo de malware en forma independiente del intervalo establecido, etc. Estas acciones son vistas en un nuevo nodo de Client Operations dentro de Monitoring.
  App-V soporta ambientes virtuales que permiten que múltiples aplicaciones virtuales compartan información de un mismo file system y registry en vez de correr en un espacio de memoria separado.
  CfgMgr soporta aplicaciones hechas en App-V 5.
  Se puede manejar cómo transfiere datos un cliente Windows 8 sobre una conexión de internet, mediante “client Settings”.
  Las colecciones built-in son read-only ahora. No pueden ser modificadas.
  Software Updates: Ahora se pueden agregar múltiples SUP (Software Update Point) en un site. Se puede configurar el SUP en el mismo forest, en un cross-forest o para Internet-based clients. Los clientes se conectarán al más apropiado según su forest boundary.
  En un Site Secundario, solo sigue siendo posible instalar solo un SUP.
  No existe más el concepto de “Active Software Update Point”. Ahora es posible declarar e integrar el WSUS existente como upstream server y sincronizará directamente desde ahí. . Es más, es posible en las propiedades del SUP proporcionar credenciales para conectarte al WSUS que puede estar en otro forest.
  Hay dos nuevas plantillas built-in para elegir en el asistente de implementación de los updates: “Definition Updates” que provee los seteos comunes para implementar software updates y “Patch Tuesday” que provee las configuraciones para parchar updates sobre el ciclo mensual. Realmente esto facilita bastante la tarea.
  Es posible correr hasta 3 veces en el día las reglas de implementación automática para Microsoft System Center Endpoint Protection y así ajustarse a la frecuencia de publicación.
  Ahora se puede seleccionar múltiples Software Updates para instalar y colocarlos directamente como un grupo en el Software Center.
  Se puede controlar el comportamiento del “write filter” para los dispositivos Windows Embedded cuando se implementan Software Updates.

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Operating System Deployment: La implementación de Sistema Operativo sufrió varios cambios operativos:
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Históricamente veníamos utilizando el WAIK como base para implementar OSD. Con el SP1, se utiliza el [Windows ADK](http://msdn.microsoft.com/es-es/library/windows/hardware/hh825486.aspx) - Windows Assessment and Deployment Kit- y debe bajarse e instalarse en el site server y en la máquina que se utilice para el armado de las implementaciones.

  La herramienta “User State Migration Tool” (USMT) para Windows 8 se instala automáticamente con el Win ADK. Se crea un paquete automáticamente con la nueva versión de USMT en el top-level site.

  El setup además actualiza las boot images en el Site. Será necesario actualizar aquellas que se hayan personalizado.

  En cuanto a las Task sequences, se modificó la “Default” para optimizar la implementación de los sistemas operativos iniciando con Windows 7.

  Se soportan las máquinas que están en modo Unified Extensible Firmware Interface (UEFI). Existe una variable SMSTSBootUEFI en la secuencia de tareas que detecta si la pc se encuentra en ese modo.

  La secuencia de tareas Default, particiona automáticamente la computadora basada en la configuración default para el sistema operativo a implementar.

  La secuencia de tareas Built and Capture, se actualizó para aplicar una imagen en vez de correr el setup e instalar. . De todas formas se puede elegir correr el setup para las implementaciones de Windows 8.

  Se puede controlar el comportamiento del “write filter” para los dispositivos Windows Embedded cuando se usan secuencias de tareas.

  Con respecto a “Prestaged media”, ahora se puede agregar o remover contenido allí; se puede especificar aplicaciones, paquetes y drivers para implementarse con el SO; por último (muy bueno) la task sequence que corre a partir del asistente de “prestaged media”, chequea primero la tarea y valida el contenido local. Si éste no se encuentra, el contenido es bajado del Distribution Point.

  Cambios en el soporte de Bitlocker: Hay un paso en las secuencia de tareas Pre-provision BitLocker que encripta el drive desde el winPE y solo encripta el espacio de datos utilizado. Esto acelera los tiempos de encriptación.

  Además dentro de las opciones de Key Management se encuentra ahora TPM and PIN para toda la operatoria a realizar en el paso de Enable Bitlocker.

  Se agregó la varible SMSTSLanguageFolder, para poder cambiar el lenguaje dentro del Windows PE. El lenguaje se auto detecta y se usa, cuando se inician las boot image desde el Software Center.

  Se incluyen nuevas variables para las task sequences: SMSTSPersistContent (caché persistente) / SMSTSPostAction (correr un comando luego de finalizadas las tareas) / OSDPreserveDriveLetter (se usa para poder especificar la letra del drive en el que instalará el OS) / SMSTSDownloadProgram (se usa para especificar otro programa de bajada de contenido en vez del default).
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  El listado completo de variables puede verse [aquí](http://technet.microsoft.com/es-es/library/hh273375.aspx).
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Manejo de imágenes offline: Los updates ahora son copiados directamente del “Content Library” en el Site Server, no más desde “package source”. Además es posible continuar actualizando una imagen aun cuando algún update falle en instalar.

  Mejoró el monitoreo y estatus del contenido e implementación de la secuencia de tareas.

  Existen nuevos pasos con tareas específicas para correr en Windows PE.

  Se pueden manejar los componentes opcionales que tendrá el WinPE directamente desde las propiedades de las imágenes de booteo.

  Se pueden importar/exportar los paquetes de drivers a la “Software Library”.

         Asset Intelligence: Ahora soporta los “7 mandatory software identification tags” que se definen en ISO/IEC 19770-2. Y además se agregaron 3 nuevos reportes para visualizarlos: Software 14A, Software 14B, y Software 14C.

         Endpoint Protection:

  Se puede setear el cliente instalado para los dispositivos Windows Embedded que tengan “write filter” habilitado.

  Se pueden tomar acciones en todos los clientes que tengan una infección por malware específica o especificar el estatus de remedio.

  Se pueden utilizar ventanas de mantenimiento para instalar el Endpoint Protection.

  Ahora, Endpoint Protection utiliza “client notification” para iniciar las acciones “as soon as posible” cuando se realiza: Force antimalware definition updates / Run quick scans /Run full scans / Allow threats / Exclude folders and files / Restore quarantined files en vez de esperar el ciclo predeterminado.

  Cuando múltiples políticas se implementan en el cliente, se unen (merge). Si alguna entra en conflicto, toma precedencia la de más alta prioridad.
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 

Como verán, son bastantes los cambios realizados y muchos mejoran
operativamente el producto.
