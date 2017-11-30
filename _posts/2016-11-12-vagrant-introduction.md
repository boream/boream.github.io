---
layout: post
title:  Introducción a Vagrant
date:   2016-11-12 12:28:00 +0200
categories: Vagrant
---

# Introducción a Vagrant
Herramienta para gestionar entornos de desarrollo y el workflow necesario para
llevar dichos entornos a producción. Básicamente elimina la necesidad de instalar
y configurar todo el stack tecnológico a utilar manualmente.

## Cosas que intenta solucionar Vagrant

* Hay un montón de lenguajes y configuraciones asociadas a ellos que son díficiles
de manejar cuando se tienen varios entornos (dev, test, prod)
* Igualmente hay muchas bases de datos que se pueden usar...
* Cada desarrollador podría querer usar un SO específico para su entorno de
desarrollo. En el caso de Windows, puede haber un montón de servicios difíciles
de correr que pudieran ser necesarios para el sistema.
* Instalar a mano todo el stack ya no es viable. Se quiere mejorar la automatización
de esos procesos.
* La configuración puede ser incluso más complicada que la instalación. También
debería ser automática.
* Con la instalación y configuración manual, hay un montón de posibles bugs y
diferencias entre los entornos de desarrollo y producción.
* Manejar diferentes proyectos también es problemático porque puede haber configuraciones
muy diferentes de uno a otro.
* Es difícil mantener la sincronía entre los entornos de desarrollo de diferentes
desarrolladores.


# Instalación de Vagrant en Linux
1. Descargarse la distibución más nueva para el SO a usar. Para linux, Vagrant
se instala en ```vagrant/bin```. Pudiera ser necesario añadir ```/opt/vagrant/bin```
al path, para ejecutarlo desde cualquier terminal.

   En mi caso, en una máquina con Ubunto 16.04 me [descargé](https://www.vagrantup.com/downloads.html) la versión para Debian
   de 64 bits y lo ejecuté con doble click ya que es un archivo instalable *.deb*.

2. Antes de poder usar Vagrant se ha de instalar VirtualBox. Seguí las
[instrucciones](https://www.virtualbox.org/wiki/Linux_Downloads) que se dan en la
propia página de Virtual Box.

3. Para ver que todo está correctamente, ejecutar ```$ vagrant --version```.

# Poner en marcha la primera máquina Vagrant
1. Voy a crear una máquina virtual con Ubuntu 16.04 (xenial) con la que me siento
cómodo:

   ```
   $ vagrant init ubunut/xenial64
   $ vagrant up --provider virtualbox
   ```

2. Para conectarse a la máquina virtual recién creada:

   ```
   $ vagrant ssh
   ```

   Que nos abrirá una sesión por consola. Para cerrarla ```exit```.

# Vagrant's files

* Shared folders : ``` config.vm.synced_folder ".", "/vagrant"```. Estamos indicando
que se comparta la carpeta desde donde lanzamos vagrant con la carpeta /vagrant
dentro de la máquina virtual que hemos creado.
