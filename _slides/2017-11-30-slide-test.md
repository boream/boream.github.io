---
layout: slide
title: Test slide 1
description: Use another theme (moon.css) and disable the progress bar at the bottom
reveal:
  theme: beige
---

<!--
1st slide
-->
<section>
  <h1>{{ page.title }}</h1>
</section>

<!--
2nd slide
-->
<section>
  <h2>Powered by</h2>
  <ul>
    <li class="fragment">Jekyll</li>
    <li class="fragment">reveal.js</li>
  </ul>
</section>

<!--
3rd slide with sample syntax highlighting
-->
<section>
  <h2>Code preview</h2>
  <pre>
    <code contententeditable>
void init_opts() {
        int i;
        for(i = 0; abook_vars[i].option; i++)
                restore_default(&abook_vars[i]);
}
    </code>
  </pre>
</section>
