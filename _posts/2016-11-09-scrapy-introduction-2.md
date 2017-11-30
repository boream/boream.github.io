---
layout: post
title:  Introducción a scrapy - UR2IM y proyecto scrapy
date:   2016-11-09 18:28:00 +0200
categories: Python
---
Este blog quiere servir como referencia rápida de scrapy 1.2.

# UR2IM

URL, Request, Response, Items, More URLs. Típicamente un *Spider* implementará
el proceso entero de *UR2IM*.

## URLs

Lo primero que se realiza en el proceso de scrapear una web es navegar a una URL
para recuperar la información de la página.

Para cargar una página mediante la *shell* de Scrapy se puede lanzar el siguiente comando:

```
scrapy shell 'https://www.meneame.net/'
```

Para hacer lo mismo pero con el debugger activado en caso de excepciones hay que utilizar la opción --pdb:

```
scrapy shell --pdb 'https://www.meneame.net/'
```

## Request y Response
La respuesta es generada en los *Spiders* y pasa a través del sistema hasta que
alcanza un *Downloader*, el cúal ejecuta la *Request* y devuelve una *Response*
que viaja de vuelta al *Spider* que generó la *Request*.
[Scrapy doc](https://doc.scrapy.org/en/1.2/topics/request-response.html).

En la doc se explica los parámetros y métodos
de ambas clases así como como subclases interesantes como *FormRequest* (Para hacer
peticiones de formulario) o *TextResponse* (para recuperar mediante métodos
interesantes - xpath, css - datos de la respuesta).

### Selectors
El método *Response.xpath* nos sirve para extraer datos mediante la sintáxis que ofrece *xpath*. *xpath()* nos devuelve un
*Selector* precargado con los oontenidos de la página. También existe el método *Response.css* que igualmente devuelve un
*Selector*.

Para recuperar los arrays de datos hemos de utilizar los métodos *Response.xpath.extract* o *Response.css.extract*.
Además, el *Selector* que se devuelve tiene un método curioso *Response.xpath.re* que permite devolver un array de *String* en
función de una expresión regular. Por último cosas como `response.css('.toto').xpath('//div[class=paco]/text()').re('[.0-9]+')`
son válidas, es decir los selectores tiene una *Fluent API*.

## Items
Los *Items* es la manera que tiene *Scrapy* para estructurar información de una
web. Para definir un formato común de salida *Scrapy* usa *Items*.

Los *Items* están compuestos de *Fields*. Un *Item* es un diccionario python al
que se le añade el método *Item.fields*. Las *Fields* son un diccionario python
tal cual.

### Items Loaders
[Documentación de ItemLoaders](https://doc.scrapy.org/en/1.2/topics/loaders.html#module-scrapy.loader)
Es el mecanismo que proporciona *Scrapy* para rellenar los *Items*. Mientras que
los *Items* son el contenedor de los datos scrapeados, los *ItemsLoaders* proporcionan
el mecanismo para rellenar dichos contenedores.

Los *ItemsLoaders* utilizan *Input and Output processors* para rellenar los
*Items*. Los *Input processors* son llamados por un montón de métodos de los
*Items Loaders* mientras que los *Output processors* típicamente con el métodos
*ItemLoader.load_item*, que recuperará los datos definidos mediante los métodos
de input y los pasará a través del *Output processor* para devolver un *Item*
rellenado.

Este mecanismo permite la composición, filtrado, concatenación de procesadores,
etc. Dando gran flexibilidad y potencia al mecanismo.


## Extraer más URL (M)

El proceso de scrapping tiene típicamente dos direcciones:
* **Horizontal**: Desde una página de índice a otra. Se denomina así porque el
movimiento del scrapping va de una página a otra del mismo nivel.
* **Vertical**: Desde una página índice a listings o páginas hijas. Es decir,
desde una página de un nivel superior a otra de un nivel inferior. Por ejemplo
cuando desde una página se recorren diferentes Items que nos llevan a otras
páginas con detalles de cada Item.

### Diferencias entre Spider y Crawler
Un Spider (extender nuestra clase de *Scrapy.Spider*) nos permite hacer una
navegación más manual.

Un Crawler (extender nuestra clase de *Scrapy.CrawlSpider*) nos permite ahorrar
líneas de código utilizando *LinkExtractors* y *Rules*. *Scrapy.CrawlSpider*
utilizará la propiedad *rules* para llamar automáticamente a la función
*Spider.parse* utilizando las reglas de navegación que se definan.

Como apunte, en la configuración de Spiders se puede configurar el número máximo
de peticiones, la prioridad de cada petición, etc. Scrapy utiliza una estrategia
**LIFO** por defecto. La última petición es la que se realiza primero. Esto puede
ser cambiando asignando diferentes prioridades.
