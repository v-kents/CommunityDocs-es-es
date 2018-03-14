---
redirect_url: https://docs.microsoft.com/
title: La pesadilla de los web.config Gigantes
description: La-pesadilla-de-los-web_config-Gigantes
author: MSCommunityPubService
ms.author: andygon
ms.date: 06/01/2016
ms.topic: article
ms.service: web-dev
ms.prod: 
ms.technology:
ms.custom: CommunityDocs
---

#La pesadilla de los web.config Gigantes


![Juan Carlos Ruiz ](http://gravatar.com/avatar/2c36e6ebd9b4d33c3e9a0362607b3e57?s=150)
<!-- -->

Por Juan Carlos Ruiz Pacheco, **Microsoft Senior Technology Evangelist**

  Network   | Url
  ----------|----------------------------------------
  Twitter   | https://twitter.com/JuanKRuiz
  Facebook  | https://www.facebook.com/JuanKDev
  LinkdIn   | http://www.linkedin.com/in/juankruiz
  Blog      | https://juank.io

Como programadores siempre tenemos que lidiar con archivos de
configuración, archivos XML destinados a la configuración de la
aplicación, aunque varian un poco dependiendo del tipo d aplicación que
hagamos, en su mayoría son exactamente lo mismo.

- Web.config

- App.config

- Otros.config

En mi opinión son una hermosa forma de deshacernos de complejidad
innecesaria en el código y desde luego una manera muy cool de crear
aplicaciones fléxibles.

Sin embargo en aplicaciones de tipo empresarial comenzamos a tener
detestables problemas con estos archivos. El notable aumento de
complejidad en su estructura se convierte en una bomba de tiempo para el
mantenimiento de las aplicaciones, es común encontrase con archivos de
configuración que se miden en cientos de lineas y a veces en miles.

![] (./img/La-pesadilla-de-los-web_config-Gigantes/image2.png)

###CÓMO TENER UN ARCHIVO DE CONFIGURACIÓN MÁS LIMPIO


Por fortuna existe un mecanismo muy útil, a continuación les muestro un
archivo de configuración que si bien no es uno precisamente enorme, ya
comienza a mostrar problemasde legibilidad, en esta ocasión generados
por la configuración de **Unity Application Block** , hablaremos de el
en otro momento.

C\#


```
    &lt;configuration&gt;

    &lt;configSections&gt;

    &lt;section name="unity"
    type="Microsoft.Practices.Unity.Configuration.UnityConfigurationSection,
    Microsoft.Practices.Unity.Configuration" /&gt;

    &lt;/configSections&gt;

    &lt;unity
    xmlns="http://schemas.microsoft.com/practices/2010/unity"&gt;;

    &lt;typeAliases&gt;

    &lt;!-- Lifetime manager types --&gt;

    &lt;typeAlias alias="singleton"

    type="Microsoft.Practices.Unity.ContainerControlledLifetimeManager,

    Microsoft.Practices.Unity" /&gt;

    &lt;typeAlias alias="external"

    type="Microsoft.Practices.Unity.ExternallyControlledLifetimeManager,

    Microsoft.Practices.Unity" /&gt;

    &lt;!-- User-defined Lifetime manager types --&gt;

    &lt;typeAlias alias="web\_session"

    type="Traversal.Utilities.Web.WebSessionLifetimeManager,

    Traversal" /&gt;

    &lt;!-- Tipos para Domain.Core --&gt;

    &lt;typeAlias alias="IDataContextWrapper"
    type="Domain.Core.Data.IDataContextWrapper\`1, Domain.Core" /&gt;

    &lt;typeAlias alias="IParameterManager"
    type="Domain.Core.Repositories.IParameterManager, Domain.Core" /&gt;

    &lt;typeAlias alias="ILocalizationManager"
    type="Domain.Core.Repositories.ILocalizationManager, Domain.Core"
    /&gt;

    &lt;typeAlias alias="ContextWrapperSTE"
    type="Domain.Core.Data.ContextWrapperSTE\`1, Domain.Core" /&gt;

    &lt;typeAlias alias="ContextWrapperEF"
    type="Domain.Core.Data.ContextWrapperEF\`1, Domain.Core" /&gt;

    &lt;typeAlias alias="ParameterManager"
    type="Domain.Core.Repositories.ParameterManager, Domain.Core" /&gt;

    &lt;typeAlias alias="LocalizationManager"
    type="Domain.Core.Repositories.LocalizationManager, Domain.Core"
    /&gt;

    &lt;!-- Tipos para oplkjsdfkpwe.Core --&gt;

    &lt;typeAlias alias="IEnteManager"
    type="Domain.wsldckm.Repositories.IEnteManager, Domain.oplkjsdfkpwe"
    /&gt;

    &lt;typeAlias alias="IEquipoManager"
    type="Domain.wsldckm.Repositories.IEquipoManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="IEstadioManager"
    type="Domain.wsldckm.Repositories.IEstadioManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="IEventoManager"
    type="Domain.wsldckm.Repositories.IEventoManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="IPartidoManager"
    type="Domain.wsldckm.Repositories.IPartidoManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="ITagManager"
    type="Domain.wsldckm.Repositories.ITagManager, Domain.oplkjsdfkpwe"
    /&gt;

    &lt;typeAlias alias="ITipoFormacionManager"
    type="Domain.wsldckm.Repositories.ITipoFormacionManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="ITorneoEtapaManager"
    type="Domain.wsldckm.Repositories.ITorneoEtapaManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="ITorneoNominaManager"
    type="Domain.wsldckm.Repositories.ITorneoNominaManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="ITorneoManager"
    type="Domain.wsldckm.Repositories.ITorneoManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="EnteManager"
    type="Domain.wsldckm.Repositories.EnteManager, Domain.oplkjsdfkpwe"
    /&gt;

    &lt;typeAlias alias="EquipoManager"
    type="Domain.wsldckm.Repositories.EquipoManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="EstadioManager"
    type="Domain.wsldckm.Repositories.EstadioManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="EventoManager"
    type="Domain.wsldckm.Repositories.EventoManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="PartidoManager"
    type="Domain.wsldckm.Repositories.PartidoManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="TagManager"
    type="Domain.wsldckm.Repositories.TagManager, Domain.oplkjsdfkpwe"
    /&gt;

    &lt;typeAlias alias="TipoFormacionManager"
    type="Domain.wsldckm.Repositories.TipoFormacionManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="TorneoEtapaManager"
    type="Domain.wsldckm.Repositories.TorneoEtapaManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="TorneoNominaManager"
    type="Domain.wsldckm.Repositories.TorneoNominaManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;typeAlias alias="TorneoManager"
    type="Domain.wsldckm.Repositories.TorneoManager,
    Domain.oplkjsdfkpwe" /&gt;

    &lt;/typeAliases&gt;

    &lt;containers&gt;

    &lt;container name="WebContainer"&gt;

    &lt;types&gt;

    &lt;!-- Tipos para Domain.Core --&gt;

    &lt;type type="IParameterManager" mapTo="ParameterManager" /&gt;

    &lt;type type="ILocalizationManager" mapTo="LocalizationManager"
    /&gt;

    &lt;type type="IDataContextWrapper" mapTo="ContextWrapperEF"&gt;

    &lt;lifetime type="web\_session" /&gt;

    &lt;/type&gt;

    &lt;!--

    &lt;type type="IDataContextWrapper" mapTo="ContextWrapperSTE"&gt;

    &lt;lifetime type="web\_session" /&gt;

    &lt;/type&gt;--&gt;

    &lt;!-- Tipos para oplkjsdfkpwe.Core --&gt;

    &lt;type type="IEnteManager" mapTo="EnteManager" /&gt;

    &lt;type type="IEquipoManager" mapTo="EquipoManager" /&gt;

    &lt;type type="IEstadioManager" mapTo="EstadioManager" /&gt;

    &lt;type type="IEventoManager" mapTo="EventoManager" /&gt;

    &lt;type type="IPartidoManager" mapTo="PartidoManager" /&gt;

    &lt;type type="ITagManager" mapTo="TagManager" /&gt;

    &lt;type type="ITipoFormacionManager"
    mapTo="TipoFormacionManager"/&gt;

    &lt;type type="ITorneoEtapaManager" mapTo="TorneoEtapaManager" /&gt;

    &lt;type type="ITorneoNominaManager" mapTo="TorneoNominaManager"
    /&gt;

    &lt;type type="ITorneoManager" mapTo="TorneoManager" /&gt;

    &lt;/types&gt;

    &lt;/container&gt;

    &lt;container name="StandAloneContainer"&gt;

    &lt;types&gt;

    &lt;type type="IParameterManager" mapTo="ParameterManager" /&gt;

    &lt;type type="ILocalizationManager" mapTo="LocalizationManager"
    /&gt;

    &lt;type type="IDataContextWrapper" mapTo="ContextWrapperEF" &gt;

    &lt;lifetime type="singleton" /&gt;

    &lt;/type&gt;

    &lt;/types&gt;

    &lt;/container&gt;

    &lt;/containers&gt;

    &lt;/unity&gt;

    &lt;appSettings&gt;

    &lt;add key="UnitySection" value="unity"/&gt;

    &lt;add key="UnityContainer" value="WebContainer"/&gt;

    &lt;/appSettings&gt;

    &lt;compilation debug="true" targetFramework="4.0" /&gt;

    &lt;authentication mode="Forms"&gt;

    &lt;forms loginUrl="\~/Account/Login.aspx" timeout="2880" /&gt;

    &lt;/authentication&gt;

    &lt;membership&gt;

    &lt;providers&gt;

    &lt;clear/&gt;

    &lt;add name="AspNetSqlMembershipProvider"
    type="System.Web.Security.SqlMembershipProvider"
    connectionStringName="ApplicationServices"

    enablePasswordRetrieval="false" enablePasswordReset="true"
    requiresQuestionAndAnswer="false" requiresUniqueEmail="false"

    maxInvalidPasswordAttempts="5" minRequiredPasswordLength="6"
    minRequiredNonalphanumericCharacters="0" passwordAttemptWindow="10"

    applicationName="/" /&gt;

    &lt;/providers&gt;

    &lt;/membership&gt;

    &lt;profile&gt;

    &lt;providers&gt;

    &lt;clear/&gt;

    &lt;add name="AspNetSqlProfileProvider"
    type="System.Web.Profile.SqlProfileProvider"
    connectionStringName="ApplicationServices" applicationName="/"/&gt;

    &lt;/providers&gt;

    &lt;/profile&gt;

    &lt;roleManager enabled="false"&gt;

    &lt;providers&gt;

    &lt;clear/&gt;

    &lt;add name="AspNetSqlRoleProvider"
    type="System.Web.Security.SqlRoleProvider"
    connectionStringName="ApplicationServices" applicationName="/" /&gt;

    &lt;add name="AspNetWindowsTokenRoleProvider"
    type="System.Web.Security.WindowsTokenRoleProvider"
    applicationName="/" /&gt;

    &lt;/providers&gt;

    &lt;/roleManager&gt;

    &lt;/system.web&gt;

    &lt;system.webServer&gt;

    &lt;modules runAllManagedModulesForAllRequests="true"/&gt;

    &lt;/system.webServer&gt;

    &lt;!--LOT OF MORE STUFF--&gt;

    &lt;/configuration&gt;
```

Toda sección posee un atributo **configSource** en el cual se puede
indicar la ruta donde se encuentra definido el XML, asi que podemos
extraer toda la sección de Unity en un archivo Unity.config , incluyendo
la etiqueta y sus atributos, y el archivo de configuración quedaria de
la siguiente forma, bastante más legible y manteniendo toda su
funcionalidad...

Por no mencionar la abismal diferencia cuando se utilizan múltiples
bloques...

C\#

```

    &lt;configuration&gt;

    &lt;configSections&gt;

    &lt;section name="unity"
    type="Microsoft.Practices.Unity.Configuration.UnityConfigurationSection,
    Microsoft.Practices.Unity.Configuration" /&gt;

    &lt;/configSections&gt;

    &lt;unity configSource="Unity.config" /&gt;

    &lt;appSettings&gt;

    &lt;add key="UnitySection" value="unity"/&gt;

    &lt;add key="UnityContainer" value="WebContainer"/&gt;

    &lt;/appSettings&gt;

    &lt;system.webServer&gt;

    &lt;modules runAllManagedModulesForAllRequests="true"/&gt;

    &lt;/system.webServer&gt;

    &lt;/configuration&gt;
```

Y desde luego ese mismo atributo lo podemos usar en todas las secciones
que superen un tamaño pequeño.

Enjoy it!




