---
layout: post
title:  Resumen del Polymerday en Madrid
date:   2016-10-24 12:28:00 +0200
categories: Polymer
---

El pasado fin de semana tuve la oportunidad de asistir al evento [PolymerDay](https://www.polymerday.com/home/){:target="_blank" __} que tuvo lugar en Madrid. Sobra decir que fué una gran oportunidad que me permitió profundizar más en mi conocimiento sobre esta maravillosa librería y las nuevas tendencias que se dan dentro del desarrollo WEB orientado a componentes. También me permitió conocer a mucha gente muy interesante que ya está haciendo cosillas con esta librería.

Este post va dedicado a plasmar en la red las notas que tomé durante aquellos dos días en la carpa situada al lado de la estación de Príncipe Pío...

# [Polymer: How We Got Here and Where We're Going](https://www.youtube.com/watch?v=VBbejeKHrjg&feature=youtu.be&list=PLNYkxOF6rcICc687SxHQRuo9TVNOJelSZ){:target="_blank" __}
Esta maravillosa charla fue dada por [Taylor Savage](https://twitter.com/taylorthesavage){:target="_blank" __}. La charla bien se podría titular en español **El estado de Polymer y los web components**. El link del título no corresponde con la charla dada en Madrid ya que esta aún no está disponible en la página del [PolymerDay](https://www.polymerday.com/home/){:target="_blank" __}. Los puntos a destacar a mi modo de ver fueron los siguientes:

* **#UseThePlatform** - Utilizar la plataforma WEB (el estándar) lo máximo posible.
  * Dejar al browser hacer el trabajo más pesado.
  * Se selectivo con la abstracción al realizar componentes web. Cuanto más abstracción, más código intermedio ha de ejecutarse y por tanto más riesgo de hacer que el sistema vaya lento.
  * Aprovechar las ventajas que ofrece el estándar.

* **Web components** - Explicó por encima el paradigma de los componentes web
    * Los Web Components sirven para extender el lenguaje HTML estándar. Sirve para crear nuevas etiquetas HTML.
    * La especificación del estándar está descrito desde el 22 de mayo de 2012. Esta versión es la v0.
    * Hay una nueva versión v1 que se supone ofrecerá compatibilidad para la mayoría de navegadores.

* **Historia** - Dio un repaso a las diferentes versiones que han habido de Polymer e indicó las empresas que actualmente están utilizando *Polymer* en proyectos de producción.
* **Introducción a Polymer 2.0** - Indicó que la nueva versión va dar soporte a la especificación v1 de los componentes web. Que esto permite un mejor interoperatibilidad con otros frameworks y librerías. Que intenta impedir que las cosas ya realizadas y existentes se rompan (demasiado...). Y por último que va dar soporte a la *Web native*, el uso de la plataforma para que nuestros componentes web corran mejor y más rápido.
* **Herramientas** - Explicó las herramientas actuales que nos permiten mejorar nuestro desarrollo de componentes web. Hizo un repaso a las *Polymer Tools*
    * *Analyzer* - Permite ver el grafo de dependencias de nuestros componentes, incluyendo JS, imágenes, CSS, etc...
    * *Package Management* - Aquí señaló que *NPM* no funciona bien. Debido a eso han desarrollado una nueva herramienta que se llama [Yarm](https://github.com/yarnpkg/yarn){:target="_blank" __} que permite trabajar bien con *NPM* y los componentes web.
    * *Progressive web* - Habló sobre construir y separar ficheros para las *PWA*.
    * *Polymer CLI* - Trató la linea de comandos de Polymer.
    * Editores de plugins para Polymer.

También dijo que hay ejemplos de esto en [WEBCOMPONENTS.ORG](https://beta.webcomponents.org/){:target="_blank" __}.
