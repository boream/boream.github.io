---
layout: slide
title: Introducción a Docker
description: Use another theme (moon.css) and disable the progress bar at the bottom
reveal:
  theme: beige
  slideNumber: true
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
8th slide
-->
<section data-markdown>

### Conceptos básicos

## Container

* Es un template (Dockerfile) de solo lectura con instrucciones para crear un *Container*. A menudo una imagen
está basada en otra imagen.

* Cada instrucción en el Dockerfile genera una *layer*.

* Cuando cambias una *layer* (instruccion en Dockerfile) y
reconstruyes la imagen, sólo se ejecutan las instrucciones que han cambiado. (*Útil!!!*)

</section>
