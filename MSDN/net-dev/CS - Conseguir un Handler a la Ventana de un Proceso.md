<properties
	pageTitle="C# - Conseguir un Handler a la Ventana de un Proceso"
	description="Conseguir un Handler a la Ventana de un Proceso en C#"
	services="net-dev"
	documentationCenter=""
	authors="andygonusa"
	manager=""
	editor="andygonusa"/>

<tags
	ms.service="net-dev"
	ms.workload="CS"
	ms.tgt_pltfrm="na"
	ms.devlang="na"
	ms.topic="how-to-article"
	ms.date="05/17/2016"
	ms.author="andygonusa"/>


# C\# - Conseguir un Handler a la Ventana de un Proceso



![](./img/CS - Conseguir un Handler a la Ventana de un Proceso/image1.PNG)

Por Juan Carlos Ruiz Pacheco, **Microsoft Technology Evangelist**

  Twitter   | <https://twitter.com/JuanKRuiz>
  ----------| ----------------------------------------
  Facebook  | <https://www.facebook.com/JuanKDev>
  LinkdIn   | <http://www.linkedin.com/in/juankruiz>
  Blog      | <http://juank.io>

Cuando se está jugando con la API de Windows, especialmente con el tema
de las ventanas esta función puede resultar de muchísima utilidad. Sin
embargo no existe, así que hay que implementarla.

En resumen explicare los pasos necesarios para crear una función
*GetProcessWindowHandler*, la cual devuelve un handler a la ventana
principal de un proceso.

Necesitaremos recuperar el handler de la ventana (cuando la
encontremos), así que creare una clase que utilizare como LPARAM a
algunas funciones de la API, capaz de contener tanto el id del proceso
como el handler de la ventana.


    /// <summary>Almacena el ID de proceso y el handler de una
    ventana</summary>

    private class AuxInfo
    {
        public int processID; public IntPtr handler;
    }

Para lograrlo debemos recurrir a la función *EnumWindows*, la
utilizaremos para recorrer las ventanas existentes en búsqueda de una
ventana cuyo id de proceso coincida con el proceso que acabamos de
iniciar.

EnumWindows requiere como parámetro un delegado que se ejecutara para
las ventanas enumeradas, entonces la función de búsqueda debe tener el
signature de EnumWindowsProc, declarado en la API de Windows y que acá
lo declaro como un delegado.



    /// <summary>
    /// Delegado para hacer de callback
    /// </summary>
    /// <param name="hwnd" />handler de la ventana
    /// <param name="lParam" />paramétro con la informacion
    necesaria para el proceso
    /// <returns>Valor de retorno del proceso</returns>
    private delegate bool EnumWindowsProc(IntPtr hwnd, AuxInfo lParam);

Y acá la definición de EnumWindows


    /// <summary>
    /// Recorre las ventanas y ejecuta un proceso para cada una de ellas
    /// </summary>
    /// <param name="lpEnumFunc" />Delegado con el proceso a
    utilizar para cada ventana /// <param name="lParam"
    />paramétro con la informacion necesaria para el proceso ///
    <returns>Retorna true si se recorren todas las ventanas, de lo
    contrario false o segun determine el usuario a través del
    callback</returns>

    [DllImport("user32.dll")] private static extern bool
    EnumWindows(EnumWindowsProc lpEnumFunc, AuxInfo lParam);

Para poder determinar el id de proceso de cada una de las ventanas
enumeradas haré uso de **GetWindowThreadProcessId**:



    /// <summary>
    /// Devuelve el ID del proceso al que pertenece el hilo de la
    ventana
    /// </summary>
    /// <param name="hwnd" />handler de la ventana
    /// <param name="lpdwProcessId" />ID del proceso (parámetro
    de salida)
    /// <returns>ID del Thread que creó la ventana</returns>
    [DllImport("user32.dll")] private static extern uint
    GetWindowThreadProcessId(IntPtr hwnd, out int lpdwProcessId);

Ya con esta información mi función delegada para encontrar el handler de
ventana (la que se ejecutara por cada ventana hallada por EnumWindows)
es esta:



    /// <summary>
    /// Obtiene el handler de la ventana asociada a un proceso
    /// Este procedimiento es solo de utilería para usarse con
    EnumWindows
    /// y no debería ser invocado directamente
    /// </summary>
    /// <param name="hwnd" />handler de la ventana actual
    /// <param name="info" />informacion auxiliar para el proceso
    /// <returns>false si encuentra la ventana, true
    sino</returns>
    private static bool \_GetProcessWindowHandler(IntPtr hwnd,
    AuxInfo info) {
        int processID;
        GetWindowThreadProcessId(hwnd, out processID);
        if (processID == info.processID)
        {
            info.handler = hwnd;
            return false;
        }
        else
        {
            info.handler = IntPtr.Zero;
            return true;
        }

    }

Estando ya definida mi función de callback entonces llamaré a
EnumWindows y crearé con ella una función **GetProcessWindowHandler**,
la cual como su nombre lo indica será la que usaré para devolver el
handler de la ventana del proceso.

Sin embargo el tema no es tan fácil como pareciera a simple vista.

Si utilizo la función para traer un handler a la ventana de un proceso
ya abierto no tengo ningún problema, pero si el proceso recién lo estoy
lanzando desde mi aplicación, por ejemplo con Process.Start (), se debe
esperar a que el sistema operativo cree y muestre por primera vez la
ventana, de lo contrario no habrá manera de hallarla con EnumWindows,
así que debo llamar a EnumWindows hasta que se cumplan estas dos
condiciones:

Encontró una ventana asociada al proceso

Dicha ventana ya ha sido mostrada por el sistema operativo

Para la primera condición, y de acuerdo a como creamos nuestra función
de callback (GetProcessWindowHandler), basta con preguntar si el handler
es válido y para la segunda se debe determinar si la ventana de dicho
proceso ya ha sido mostrada lo cual lo hacemos con **IsWindowVisible**:


    /// <summary>
    /// Indica si una ventana es o no visible
    /// </summary>
    /// <param name="hWnd" />handler de la ventana
    /// <returns>Indicador de si la ventana es o no
    visible</returns>
    [DllImport("user32.dll")] private static extern bool
    IsWindowVisible(IntPtr hWnd);

Así que la función internamente debe tener un proceso iterativo para
poder hallar el handler


    /// <summary>
    /// Devuelve el handler de la ventana asociada al proceso
    /// </summary>
    /// <param name="pid" />Id del proceso
    /// <returns>handler de la ventana</returns>
    public static IntPtr GetProcessWindowHandler(int pid)
    {
        //Delegado con el proceso auxiliar de búsqueda
        EnumWindowsProc getHandlerVentana = new
        EnumWindowsProc(_GetProcessWindowHandler);
        //Informacion auxiliar
        AuxInfo informacion = new AuxInfo();
        informacion.processID = pid;
        /*Repetir bucle hasta que esté presente la ventana del proceso
        *(puede que la enumeración se realice y Windows aún no haya creado
        *la primera ventana del proceso o bien no la haya hecho visible,
        *por lo cual se debe repetir el bucle hasta encontrarla)*/
        do
        {
            /*Enumerar las ventanas buscando la que coincida con *el id de
            proceso contenido en informacion */
            EnumWindows(getHandlerVentana, informacion);
        }
        while (informacion.handler == IntPtr.Zero || !IsWindowVisible
        (informacion.handler));
        return informacion.handler;
    }

Bien, he encapsulado la funcionalidad en la clase Win32APITools y el
método GetProcessWindowHandler es el único método expuesto, asi que la
implementación completa queda así:


    using System;
    using System.Runtime.InteropServices;

    class Win32APITools
    {
    /// <summary>Almacena el ID de proceso y el handler de una
    ventana</summary>
    private class AuxInfo
    {
        public int processID;
        public IntPtr handler;
    }

    /// <summary>
    /// Delegado para hacer de callback
    /// </summary>
    /// <param name="hwnd" />handler de la ventana
    /// <param name="lParam" />paramétro con la informacion
    necesaria para el proceso
    /// <returns>Valor de retorno del proceso</returns>
    private delegate bool EnumWindowsProc(IntPtr hwnd, AuxInfo lParam);

    /// <summary>
    /// Recorre las ventanas y ejecuta un proceso para cada una de ellas
    /// </summary>
    /// <param name="lpEnumFunc" />Delegado con el proceso a
    utilizar para cada ventana
    /// <param name="lParam" />paramétro con la informacion
    necesaria para el proceso
    /// <returns>Retorna true si se recorren todas las ventanas,
    de lo contrario false o segun determine el usuario a través del
    callback</returns>
    [DllImport("user32.dll")]
    private static extern bool EnumWindows(EnumWindowsProc lpEnumFunc,
    AuxInfo lParam);

    /// <summary>
    /// Devuelve el ID del proceso al que pertenece el hilo de la
    ventana
    /// </summary>
    /// <param name="hwnd" />handler de la ventana
    /// <param name="lpdwProcessId" />ID del proceso (parámetro
    de salida)
    /// <returns>ID del Thread que creó la ventana</returns>
    [DllImport("user32.dll")]
    private static extern uint GetWindowThreadProcessId(IntPtr hwnd, out
    int lpdwProcessId);

    /// <summary>
    /// Indica si una ventana es o no visible
    /// </summary>
    /// <param name="hWnd" />handler de la ventana
    /// <returns>Indicador de si la ventana es o no
    visible</returns>
    [DllImport("user32.dll")]
    private static extern bool IsWindowVisible(IntPtr hWnd);

    /// <summary>
    /// Obtiene el handler de la ventana asociada a un proceso
    /// Este procedimiento es solo de utileria para usarse con
    EnumWindows
    /// y no deberia ser invocado directamente
    /// </summary>
    /// <param name="hwnd" />handler de la ventana actual
    /// <param name="info" />informacion auxiliar para el proceso
    /// <returns>false si encuentra la ventana, true
    sino</returns>
    private static bool _GetProcessWindowHandler(IntPtr hwnd,
    AuxInfo info)
    {
        int processID;
        GetWindowThreadProcessId(hwnd, out processID);
        if (processID == info.processID)
        {
            info.handler = hwnd;
            return false;
        }
        else
        {
            info.handler = IntPtr.Zero;
            return true;
        }
    }

    /// <summary>
    /// Devuelve el handler de la ventana asociada al proceso
    /// </summary>
    /// <param name="pid" />Id del proceso
    /// <returns>handler de la ventana</returns>
    public static IntPtr GetProcessWindowHandler(int pid)
    {
        //Delegado con el proceso auxiliar de búsqueda
        EnumWindowsProc getHandlerVentana = new
        EnumWindowsProc(_GetProcessWindowHandler);
        //Informacion auxiliar
        AuxInfo informacion = new AuxInfo();
        informacion.processID = pid;
        
        /*Repetir bucle hasta que esté presente la ventana del proceso
        *(puede que la enumeración se realice y Windows aún no haya creado
        *la primera ventana del proceso o bien no la haya hecho visible,
        *por lo cual se debe repetir el bucle hasta encontrarla)*/
        do
        {
            /*Enumerar las ventanas buscando la que coincida con
            *el id de proceso contenido en informacion */
            EnumWindows(getHandlerVentana, informacion);
        } while (informacion.handler == IntPtr.Zero ||
        !IsWindowVisible(informacion.handler));

        return informacion.handler;
        }

    }

Y este es un ejemplo de uso:


    using System;
    using System.Diagnostics;

    namespace GetProcessWindowHandler
    {
        class Program
        {
            static void Main(string[] args)
            {
                Process proc = new Process();
                ProcessStartInfo psi = new ProcessStartInfo("calc.exe");
                proc.StartInfo = psi; proc.Start(); IntPtr handler =
                Win32APITools.GetProcessWindowHandler(proc.Id);
                Console.WriteLine("El Handler obtenido para la ventana de este
                proceso es: {0}", handler);
                Console.ReadLine();
            }
        }
    }

Hasta Pronto.
