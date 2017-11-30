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
<section data-markdown>
### ¿Qué es docker?
## Facilita el desarrollo

  * Permite correr tus apps en cualquier máquina con las mismas dependencias sin importar el SO del host.

  * Por ejemplo, os podéis descargar este blog y sin tener ruby o jekyll instalado en tu ordenador,
  ejecutarlo.

</section>


<!--
4th slide
-->
<section data-markdown>
### ¿Qué es docker?
## Facilita el despliegue

  * Al aislar la app en un container, desplegar en un servidor es cuestión de crear
  la misma imagen que en nuestro puesto de desarrollo.

</section>

<!--
5th slide
-->
<section data-markdown>
### ¿Qué es docker?
## Facilita la infraestructura

  * La infraestructura necesaria ya no es implantada a mano en los sistemas.

  * Se crea mediante ficheros docker que describen los sistemas y programas necesarios para ejecutar nuestra aplicación.

  * ¿¿DevOps?? Gracias a Docker una misma persona se puede encargar de todos los sistemas de la empresa.

</section>
<!--
6th slide
-->
<section data-markdown>
## Arquitectura

  ![Principal](/images/architecture.svg)

</section>

<!--
7th slide
-->
<section>
  <h3>Arquitectura</h3>
  <h2>VM vs Container</h2>
  <div style="text-align: left; float: left;max-width:49%;">
    <p data-markdown>![Principal](/images/docker-vm.png)</p>
  </div>

  <div style="text-align: right; float: right;max-width:49%;">
    <p data-markdown>![Principal](/images/docker-container.png)</p>
  </div>
</section>

<!--
8th slide
-->
<section data-markdown>

### Conceptos básicos

## Image

* Es un template (Dockerfile) de solo lectura con instrucciones para crear un *Container*. A menudo una imagen
está basada en otra imagen.

* Cada instrucción en el Dockerfile genera una *layer*.

* Cuando cambias una *layer* (instruccion en Dockerfile) y
reconstruyes la imagen, sólo se ejecutan las instrucciones que han cambiado. (*Útil!!!*)

</section>

<!--
9th slide
-->
<section data-markdown>

### Conceptos básicos

## Container

* Es una instancia de una imagen.

* Esta instancia se puede parar, ejecutar, mover o borrar. También se puede conectar
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

* **Dependencias**:

  * ruby -> ni idea de la versión
  * gcc, cmake, etc ...
  * gem
  * Jekyll

Requiere tiempo poner tu sistema en orden... Problemas con las dependencias... Solución....
</section>

<section data-markdown>
## Ejemplo - Jekyll
![funny-docker](/images/funny-docker.png)
# ¡USAR DOCKER!
</section>

<section data-markdown>
## Ejemplo - Jekyll

* Nos basamos en una imagen ya [existente](https://github.com/envygeeks/jekyll-docker). Ohhh yeahh!!!

* Esta imagen permite que ejecutemos el container de la siguiente manera:

```
  docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/builder:$JEKYLL_VERSION COMANDO A EJECUTAR
```

</section>
