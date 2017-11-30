---
layout: slide
title: Introducción a Docker
description: Use another theme (moon.css) and disable the progress bar at the bottom
reveal:
  theme: beige
  slideNumber: true
  loop: true
---

<!--
1st slide
-->
<section data-markdown>
  # {{ page.title }}
  ![Logo](/images/docker-ico.png)
</section>


<!--
2st slide
-->
<section data-markdown>
## ¿Qué es docker?

Plataforma opensource para desarrollar, implantar y correr aplicaciones.

  * Facilita el desarrollo
  * Facilita el despliegue
  * Facilita la infraestructura

</section>

<!--
3st slide
-->
<section>
<div data-markdown>
### ¿Qué es docker?
## Desarrollo

  * Permite correr tus apps en cualquier máquina con las mismas dependencias sin importar el SO del host.

  * Por ejemplo, os podéis descargar este blog y sin tener ruby o jekyll instalado en tu ordenador,
  ejecutarlo.
</div>
  <small>Docker no necesita máquina virtual en sistemas linux pero sí en Windows Professional</small>

</section>


<!--
4th slide
-->
<section data-markdown>
### ¿Qué es docker?
## Despliegue

  * Al aislar la app en un container, desplegar en un servidor es cuestión de crear
  la misma imagen que en nuestro puesto de desarrollo.

</section>

<!--
5th slide
-->
<section data-markdown>
### ¿Qué es docker?
## Infraestructura

  * La infraestructura necesaria se **simplifica** al ser **aislada en containers**.

  * Se crea mediante **ficheros docker** que describen los sistemas y programas necesarios para ejecutar nuestra aplicación.

  * ¿¿**DevOps**?? Gracias a Docker una misma persona se puede encargar de muchos sistemas.

</section>
<!--
6th slide
-->
<section>
<div data-markdown>
## Arquitectura

  ![Principal](/images/architecture.svg)
</div>
<small>Fuente: docker.com</small>
</section>

<!--
7th slide
-->
<section>
  <h3>Arquitectura</h3>
  <h2>VM vs Container</h2>
  <div style="text-align: left; float: left;max-width:45%;">
    <p data-markdown>![Principal](/images/docker-vm.png)</p>
  </div>

  <div style="text-align: right; float: right;max-width:45%;">
    <p data-markdown>![Principal](/images/docker-container.png)</p>
  </div>
  <div style="text-align: center;">
    <small>Fuente: docker.com</small>
  </div>
</section>

<!--
8th slide
-->
<section data-markdown>

### Conceptos básicos

## Image

* Es un template (**Dockerfile**) de solo lectura con instrucciones para crear un **Container**. A menudo una imagen
está basada en otra imagen.

* Cada **instrucción** en el Dockerfile genera una **capa**.

* Cuando cambias una **capa** (instruccion en Dockerfile) y
reconstruyes la imagen, sólo se ejecutan las instrucciones que han cambiado. (**Útil!!!**)

</section>

<!--
9th slide
-->
<section data-markdown>

### Conceptos básicos

## Container

* Es una **instancia** de una imagen.

* Esta instancia se puede **parar, ejecutar, mover o borrar**. También se puede **conectar**
a un container que esté en ejecución.

* Básicamente es como tener una máquina virtual, sólo que consume menos recursos.
</section>

<!--
10th slide
-->
<section data-markdown>
## Container - Ejemplo Dockerfile
```
# Use an official Python runtime as a parent image
FROM python:2.7-slim
# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
ADD . /app
# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt
# Make port 80 available to the world outside this container
EXPOSE 80
# Define environment variable
ENV NAME World
# Run app.py when the container launches
CMD ["python", "app.py"]
```
</section>

<!--
11th slide
-->
<section data-markdown>
## Container - Ejemplo Dockerfile
* La imagen se crea a partir de una imagen docker python.

* Se selecciona el directorio /app del container como $PWD.

* Se copia todo lo que tengas en el actual directorio en /app del container.

* Se instalan las dependencias de python 2.
</section>

<!--
12th slide
-->
<section data-markdown>
## Container - Ejemplo Dockerfile

* Se expone el puerto 80 para que el host tenga mapeado en su puerto 80 la salida
del container por el puerto 80.

* Se define una variable de entorno **NAME** con valor por defecto *World*.

* Se ejecuta nuestro **python app.py** dentro del container.
</section>


<section data-markdown>
## Ejemplo - Jekyll

* **Jekyll**: Un static site generator. Creas fichero *md* y te los transforma
en *html*.

* Alojamiento https gratis por tener cuenta en [github](http://github.com).

* **Dependencias**:

  * ruby, gcc, cmake, gem, jekyll ...

Requiere tiempo poner tu sistema en orden... Problemas con las dependencias... Solución....
</section>

<section data-markdown>
## Ejemplo - Jekyll
![funny-docker](/images/funny-docker.png)
# ¡USAR DOCKER!
</section>

<section data-markdown>
## Ejemplo - Jekyll

* Nos basamos en una imagen ya [existente (envygeeks/jekyll-docker)](https://github.com/envygeeks/jekyll-docker). Ohhh yeahh!!!

* Esta imagen permite que ejecutemos el container de la siguiente manera:

```
  export JEKYLL_VERSION=3.5
  docker run --rm --volume="$PWD:/srv/jekyll"\
        -it jekyll/builder:$JEKYLL_VERSION\
        COMANDO A EJECUTAR
```

</section>

<section data-markdown>
## Ejemplo - Jekyll
```
  docker run --rm --volume="$PWD:/srv/jekyll"\
        -it jekyll/builder:$JEKYLL_VERSION
```
* `--rm` para evitar que se muera el container al acabar el comando
* `--volume` mapea dir_host:dir_container
* `-it` mantener la consola abierta e interactiva
*  Nombre de la imagen.
</section>

<section data-markdown>
### Ejemplo - Jekyll
```
  docker run --rm --volume="$PWD:/srv/jekyll"\
        -it jekyll/builder:$JEKYLL_VERSION jekyll build
```
```
  docker run --rm --volume="$PWD:/srv/jekyll"\
        -it jekyll/builder:$JEKYLL_VERSION jekyll serve
```
```
  export JEKYLL_VERSION=3.5
  docker run --rm --volume="$PWD:/srv/jekyll" \
        -it jekyll/minimal:$JEKYLL_VERSION \
        jekyll build jekyll serve
```
Pero estos containers no se comunican con el exterior ... ni
puedes ver las dependencias del proyecto para modificar el layout.
</section>

<section data-markdown>
### Ejemplo - Jekyll
```
  docker run --rm --volume="$PWD:/srv/jekyll"\
        --port="4000:4000"
        --volume="$PWD/vendor/bundle/:/usr/local/bundle"
        -it jekyll/builder:$JEKYLL_VERSION jekyll build
```
```
  docker run --rm --volume="$PWD:/srv/jekyll"\
        -p 4000:4000 -v $PWD:/usr/local/bundle
        -it jekyll/builder:$JEKYLL_VERSION jekyll serve
```
* Habilitamos un puerto donde escucha el host y escucha el container [host:container]
* Mapeamos un volumen donde compartimos los ficheros entre host y container.
* Y solo hemos visto el comando **run** ...
</section>

<section data-markdown>
## Ejemplo - Jekyll
### Ventajas:
* No necesitas bajarte las dependencias.
* Cualquier persona nueva puede entrar a desarrollar rápidamente.
* Los entornos de test/integración se simplifican igualmente.
* Se facilitan y agilizan los despliegues. Se evitan redespliegues innecesarios
de librerías y dependencias.
</section>

<section data-markdown>
## Ejemplo - Jekyll
### Mejoras:
* Los comandos son muy difíciles: **docker-compose**

Los anteriores comandos se pueden describir como si fueran servicios en
un fichero **docker-compose**.

Esto nos permite además describir un cluster o **swarm** docker para ejecutar
dichos servicios.
</section>

<section data-markdown>
## Ejemplo - Jekyll
### docker-compose
```
version: '3'

services:
  site:
    build:
      context: .
    command: jekyll serve
    container_name: boream-blog
    image: boream/boream-blog
    ports:
      - "4000:4000"
    volumes:
      - .:/srv/jekyll
      - ./vendor/bundle:/usr/local/bundle

```
</section>

<section data-markdown>
## Ejemplo - Jekyll
### docker-compose
Para usar el docker-compose anterior he creado una imagen que parte de
[envygeeks/jekyll-docker](https://github.com/envygeeks/jekyll-docker), dónde se
instala algunas dependencias más entre ellas una **bash** para facilitar el acceso
al container.
```
FROM jekyll/jekyll:latest
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories
RUN apk update
RUN apk add bash bash-doc bash-completion cmake
EXPOSE 4000

```
</section>

<section data-markdown>
## Ejemplo - Jekyll
### docker-compose:
```
docker-compose up
```
Esto creará una imagen y instanciará el container ejecutando al final de todo
el comando:
```
jekyll serve
```
```
docker-compose run site jekyll serve
docker-compose run site jekyll build
```
Los comandos anteriores
</section>
