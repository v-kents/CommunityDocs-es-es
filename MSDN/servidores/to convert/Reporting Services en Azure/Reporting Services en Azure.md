Por FREDDY LEANDRO ANGARITA C.\
SQL Server MVP \
[Perfil
MVP](https://mvp.support.microsoft.com/es-es/mvp/Freddy%20Leandro%20Angarita%20Castellanos-4028407)\
\
<freddy_angarita@hotmail.com>\
<http://geeks.ms/blogs/fangarita/default.aspx>

Una vez se adquiere la cuenta de Azure, bien sea de prueba o paga se
puede crear un servidor de Base de datos

Creando el Servidor
-------------------

1.  ![](./media/media/image1.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Éste paso es opcional para usar Reporting Services, pero para éste
artículo usaremos la base de datos SQL de Azure

Para crear el servidor debemos configurar un usuario Administrador con
el que luego nos conectaremos a la instancia de SQL Server, es
importante seleccionar la región correcta (la más cercana) para
disminuir latencia en el servicio

1.  ![](./media/media/image2.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Una vez está todo configurado Azure realiza el proceso de creación de
servidor, presentado en la siguiente imagen:

1.  ![](./media/media/image3.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Una vez finalizada la creación se ve una pantalla como la presentada a
continuación:

1.  ![](./media/media/image4.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Para poder acceder a la base de datos remotamente se debe permitir el
acceso, para cual se necesita crear una regla en el Proxy Azure, para
crearla fácilmente se hace clic en Manage

1.  ![](./media/media/image5.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Azure advierte que no tiene permisos y que debe crear una regla para
permitir el acceso y ofrecerlo automáticamente:

1.  ![](./media/media/image6.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Dado que seleccionamos la opción de administración ofrecer ir a éste
sitio, pero tan solo queremos crear la regla, por lo que seleccionamos
NO

1.  ![](./media/media/image7.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Para el ejemplo que trabajaremos, usamos la base de datos de ejemplo
encontrada en
<http://msftdbprodsamples.codeplex.com/releases/view/37304>

1.  ![](./media/media/image8.png){width="5.729966097987751in"
    height="2.8962379702537184in"}

 La instrucción Usada para subir la base de datos es:

CreateAdventureWorksForSQLAzure

&lt;NombreServidorDB&gt;.database.windows.net
SqlDemo@&lt;NombreServidorDB&gt; Pa\$\$w0rd

 

SERVIDOR DE REPORTING SERVICES
------------------------------

Crearemos el servicio de Reporting Services

1.  ![](./media/media/image9.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

 

Al hacer clic en Crear se presenta la siguiente pantalla:

1.  ![](./media/media/image10.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Luego de diligenciar el formulario inicia el proceso de creación del
servidor

1.  ![](./media/media/image11.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Al finalizar, se puede revisar el servidor al hacer clic en la columna
WebService URL

1.  ![](./media/media/image12.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

El Servicio solicita credenciales:

1.  ![](./media/media/image13.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Se presenta la página básica del servicio:

1.  ![](./media/media/image14.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

 

 

CONECTÁNDOSE DESDE SSMS
-----------------------

Éste paso es opcional

1.  ![](./media/media/image15.png){width="4.439294619422572in"
    height="3.3555227471566056in"}

Ésta es la forma en la que se visualiza la base de datos Azure desde
SSMS

1.  ![](./media/media/image16.png){width="5.729966097987751in"
    height="4.1047397200349955in"}

 

 

REPORT BUILDER
--------------

Para crear un reporte podemos utilizar Visual Studio o Report Builder,
en éste caso usaremos Report Builder

1.  ![](./media/media/image17.png){width="5.729966097987751in"
    height="4.3756102362204725in"}

Nos conectaremos al Servidor

1.  ![](./media/media/image18.png){width="4.220456036745407in"
    height="2.0424923447069117in"}

Ingresamos las credenciales de Reporting

1.  ![](./media/media/image19.png){width="3.7515168416447944in"
    height="2.1154385389326333in"}

Y posteriormente crearemos el DataSource que usaremos para el reporte

1.  ![](./media/media/image20.png){width="5.729966097987751in"
    height="4.219338363954506in"}

Conectándose a Base de Datos Remota (importante escribir el nombre de la
base de datos a mano)

1.  ![](./media/media/image21.png){width="4.064142607174103in"
    height="5.564749562554681in"}

Conexión Exitosa

1.  ![](./media/media/image22.png){width="2.7719542869641294in"
    height="1.7923906386701662in"}

Visualizamos la cadena de conexión

1.  ![](./media/media/image23.png){width="5.729966097987751in"
    height="4.219338363954506in"}

Luego, procedemos a crear el DataSet con el que vamos a desarrollar el
reporte

1.  ![](./media/media/image24.png){width="5.729966097987751in"
    height="5.854983595800525in"}

Clic en Query Designer (solicita credenciales)

1.  ![](./media/media/image25.png){width="4.001617454068241in"
    height="2.969950787401575in"}

Definimos el query a usar

1.  ![](./media/media/image26.png){width="5.729966097987751in"
    height="4.313101487314086in"}

El Query usado es:

1.  

<!-- -->

1.  SELECT SOH.SalesOrderNumber, S.Name AS Store, SOH.OrderDate,
    C.FirstName AS

    SalesFirstName, C.LastName AS SalesLastName, E.JobTitle AS
    SalesTitle,

    SOH.PurchaseOrderNumber, SM.Name AS ShipMethod, BA.AddressLine1

    AS BillAddress1, BA.AddressLine2 AS BillAddress2, BA.City AS
    BillCity,

    BA.PostalCode AS BillPostalCode, BSP.Name AS BillStateProvince,

    BCR.Name AS BillCountryRegion, SA.AddressLine1 AS ShipAddress1,

    SA.AddressLine2 AS ShipAddress2, SA.City AS ShipCity,

    SA.PostalCode AS ShipPostalCode, SSP.Name AS ShipStateProvince,
    SCR.Name AS

    ShipCountryRegion,

    PPP.PhoneNumber AS CustPhone, CC.FirstName AS CustFirstName,

    CC.LastName AS CustLastName

    FROM Person.Address AS SA INNER JOIN

    Person.StateProvince AS SSP ON SA.StateProvinceID =

    SSP.StateProvinceID INNER JOIN

    Person.CountryRegion AS SCR ON SSP.CountryRegionCode =

    SCR.CountryRegionCode RIGHT OUTER JOIN

    Sales.SalesOrderHeader AS SOH LEFT OUTER JOIN

    Sales.Customer AS SC ON SOH.CustomerID = SC.CustomerID LEFT OUTER

    JOIN

    Person.Person AS CC ON SC.PersonID = CC.BusinessEntityID INNER

    JOIN

    Person.PersonPhone AS PPP ON CC.BusinessEntityID =

    PPP.BusinessEntityID LEFT OUTER JOIN

    Person.Address AS BA INNER JOIN

    Person.StateProvince AS BSP ON BA.StateProvinceID =

    BSP.StateProvinceID INNER JOIN

    Person.CountryRegion AS BCR ON BSP.CountryRegionCode =

    BCR.CountryRegionCode ON SOH.BillToAddressID = BA.AddressID ON

    SA.AddressID = SOH.ShipToAddressID LEFT OUTER JOIN

    Person.Person AS C RIGHT OUTER JOIN

    HumanResources.Employee AS E ON C.BusinessEntityID =

    E.BusinessEntityID ON SOH.SalesPersonID = E.BusinessEntityID LEFT
    OUTER JOIN

    Purchasing.ShipMethod AS SM ON SOH.ShipMethodID = SM.ShipMethodID

    LEFT OUTER JOIN

    Sales.Store AS S ON SOH.SalesPersonID = S.BusinessEntityID

Establecemos un nombre al Dataset

1.  ![](./media/media/image27.png){width="5.729966097987751in"
    height="5.854983595800525in"}

 

Creamos el reporte:

1.  ![](./media/media/image28.png){width="5.729966097987751in"
    height="4.198502843394576in"}

Una vez diseñado:

1.  ![](./media/media/image29.png){width="5.729966097987751in"
    height="4.3756102362204725in"}

Ejecutamos el reporte localmente

1.  ![](./media/media/image30.png){width="5.729966097987751in"
    height="4.3756102362204725in"}

Posteriormente guardamos el reporte en el  servidor

1.  ![](./media/media/image31.png){width="5.729966097987751in"
    height="4.1047397200349955in"}

Reporte Publicado en Reporting Services Azure

1.  ![](./media/media/image32.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Visualización de reporte

1.  ![](./media/media/image33.png){width="5.729966097987751in"
    height="3.2087806211723535in"}

Observamos el campo que dice cambio de credenciales en caso de tener
varios usuarios y varios contextos de seguridad

Reporting Services en Azure permite la conexión desde varios orígenes de
datos, es importante tener en cuenta la latencia

También se recomienda que el desarrollo de los reportes (en la medida de
lo posible se haga con orígenes de datos remotos)
