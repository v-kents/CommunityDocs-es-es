

<properties
pageTitle="Hyper-V: Implementación Rápida de Máquinas Virtuales"
description="Hyper-V: Implementación Rápida de Máquinas Virtuales"
services="servers"
documentationCenter=""
authors="andygonusa"
manager=""
editor="andygonusa"/>

<tags
ms.service="servers"
ms.workload="Hyper-V"
ms.tgt_pltfrm="na"
ms.devlang="na"
ms.topic="how-to-article"
ms.date="05/12/2016"
ms.author="andygonusa"/>


#Hyper-V: Implementación Rápida de Máquinas Virtuales



Por **Guillermo Delprato**

[Blog](http://windowserver.wordpress.com/)


Es frecuente que los que nos dediquemos a IT o TI, como quieran, creemos
ambientes de prueba con máquinas virtuales. Varias máquinas en algunos
casos, o inclusive casi siempre con los mismos sistemas operativos

El proceso de instalación de una máquina virtual es algo que siempre
lleva su tiempo, aunque actualmente se ha reducido mucho con respecto a
versiones anteriores.

Algunos emplean la técnica de copiar directamente la Carpeta/Archivos de
una máquina ya creada para obtener otra, pero recordar que siempre
debemos ejecutar SYSPREP para cambiar el SID

Ejecutar lo anterior, además de tedioso tiene un problema que no es de
fácil solución: el espacio ocupado en disco

Si, no hay discos que nos alcancen :-)

Todo esto lo podemos evitar usando “discos diferenciales”

Por las dudas les recuerdo el concepto: un “disco diferencial”, es un
VHD que contiene todo lo que contiene el disco “parent”, pero que en
realidad guarda sólo los cambios respecto del primero (“parent”)

Luego, puedo usar el mismo disco “parent” para crear múltiples “discos
diferenciales”, que serán modificables independientemente, sin alterar
al “parent”

Atención: no modifiquemos de ninguna forma el “parent” ya que eso
invalidaría automáticamente a todos los “discos diferenciales” que
derivan de él

Comento la técnica que utilizo personalmente, ya sea por instalación la
primera vez o con el método que recientemente publiqué (Crear un Disco
Virtual (VHD) Directo desde el WIM) obtenemos una máquina genérica.
Utilizo este término para indicar una instalación típica que utilizamos

La técnica consiste simplemente en crear una nueva máquina virtual que
utilice un “disco diferencial” que toma como “parent” al creado
anteriormente.

Veamos ambos casos.

### Instalación de una máquina “base”

- Es una instalación normal (enter, enter, … etc), y luego procedemos
    al apagado

-     Si no quieren correr riesgos de modificar el disco “parent”
    simplemente borren la máquina virtual, ya que esto no elimina su
    disco

-    En Hyper-V creamos un disco diferencial, tomando como “Parent” a la
    de la instalación genérica

-    Luego creamos una nueva máquina virtual, utilizando el “disco
    diferencial”

-    Finalmente, luego que inicia, recordar que debemos ejecutar el
    SYSPREP salvo que estemos utilizando el procedimiento detallado en
    [Crear un Disco Virtual (VHD) Directo Desde el
    WIM (WIM2VHDx)](http://windowserver.wordpress.com/2012/08/03/demostracin-crear-un-disco-virtual-vhd-directo-desde-el-wim-wim2vhdx/)

### Instalación utilizando un VHD genérico

Este procedimiento es más rápido, ya que automáticamente durante el
primer inicio se ejecutará el SYSPREP

- Creamos el VHD “parent” utilizando el procedimiento nombrado en la
    nota ([Crear un Disco Virtual (VHD) Directo Desde el
    WIM (WIM2VHDx)](http://windowserver.wordpress.com/2012/08/03/demostracin-crear-un-disco-virtual-vhd-directo-desde-el-wim-wim2vhdx/))

-   En Hyper-V creamos un disco diferencial, tomando como “Parent” al
    VHD que tenemos ya generado

-    Luego creamos una nueva máquina virtual, utilizando el
    “disco diferencial”. En este caso ya no debemos ejecutar manualmente
    el SYSPREP porque se ejecuta automáticamente

El tiempo vale, y sobre todo el nuestro :)

Crear el disco “parent” puede ser que dependiendo el hardware nos lleve
hasta aproximadamente 20 minutos, pero una vez hecho esto todo es
rápido.

¿Cuántos Windows Server 2012 necesito? ¿Cinco? en menos de 5 minutos los
tengo listos y preparados, sólo falta eventualmente renombrarlos y
ponerle la configuración de red que necesite
