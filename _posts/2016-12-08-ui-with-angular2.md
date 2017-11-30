---
layout: post
title:  UI in Angular2
date:   2016-12-08 11:00:00 +0200
categories: Javascript
---

This post tries to resume all possibilities and trends doing UI
in **Angular2** Apps. First, I would like to collect several posts and Q&As found
in the wild:

* [Components and CSS libraries for Angular2 project - July 2016](https://fabricatech.wordpress.com/2016/07/05/component-and-css-library-choices-for-angular-2/)
This post explains which libraries could be used to set up user interfaces with
an **Angular2** project. Also it contains a comparative between different
libraries. It advices you to use Bootstrap if you are planning develop a web
site focused in web. It could be appropriate to read the section which explains
the different approach in app development.

* [StackOverflow - Which CSS framework to use with Angular2? - July 2016](http://stackoverflow.com/a/34831198)
This Q&A from StackOverflow tries to response which UI framework is appropriate
to use with **Angular2**

* [PrimeNG](http://www.primefaces.org/primeng/#/) The classic returns. This
opensourced library has a ton of widgets and components ready to be used by
**Angular2** application. It notes that is mobile ready framework and has a
responsive design. It could be an option to port from old prime faces app
developed in **JAVA** to new **Angular2** fashion developing.

* [Foundation CSS](http://foundation.zurb.com/sites/getting-started.html) It seems
that **Foundation** framework is not ready for **Angular2** apps.

* [Official documentation for Angular2 Styles](https://angular.io/docs/ts/latest/guide/component-styles.html)
**Angular2** explains how to styles are applied to components and in which ways.
In that page it is explained the different approaches to styling **Angular2**
components.

* [View encapsulation in **Angular2** apps - November 2016](http://blog.thoughtram.io/angular/2015/06/29/shadow-dom-strategies-in-angular2.html)
This post explains the encapsulation mechanism in **Angular2** applications:
  * **ViewEncapsulation.None** - No Shadow DOM at all. Therefore, also no style encapsulation.
  * **ViewEncapsulation.Emulated** - No Shadow DOM but style encapsulation emulation.
  * **ViewEncapsulation.Native** - Native Shadow DOM with all it’s goodness.

* [Example of responsive design with **Angular2** in StackOverflow - July 2016](http://stackoverflow.com/questions/38442091/how-to-do-responsive-components-in-angular2)
Brief question and response about how to target responsive design with **Angular2**
applications. It worths to read comments below the question and the response.

* [Brief introduction to change detection in **Angular2** - May 2016](http://blog.assaf.co/angular-2-change-detection-zones-and-an-example/)
This post explains what is *Change detection* and *Zones* and how to use it to
use a Media Query in an **Angular2 Component**. Also, it shows us some other
resources to look for more information.

* [Explanation of Change Detection in **Angular2** - July 2016](https://vsavkin.com/change-detection-in-angular-2-4f216b855d4c#.fd7hpdgqg)
This post explains what is *Change detection* in **Angular2** in depth. It explains
the difference between using immutable objects and observables. It is worth to read
if someone wants to understand how **Angular2** manages the changes.

* [Explanation of Change Detection in **Angular2** - February 2016](http://blog.thoughtram.io/angular/2016/02/22/angular-2-change-detection-explained.html)
This post explains what is *Change detection* in **Angular2** in depth. It explains
the difference between using immutable objects and observables. It is worth to read
if someone wants to understand how **Angular2** manages the changes.

* [Zones in Javascript development - August 2016](http://blog.thoughtram.io/angular/2016/01/22/understanding-zones.html)
This post explains what zones are and how can be used in order to be reactive
for changes. Explained in a general way.

* [Zones for **Angular2** - November 2018](http://blog.thoughtram.io/angular/2016/02/01/zones-in-angular-2.html)
This post explains zones for **Angular2** development.

# Responsive design with Angular2
[COMING SOON...]
