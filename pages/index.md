---
layout: default
permalink: index
---

<div class="primary callout" data-closable>
  Need help? Try out our new user and developer forum
  <a href="https://octave.discourse.group/">Octave Discourse</a>.
  <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<div class="grid-x grid-margin-x">
  <div class="cell medium-6">
    <a href="#"  data-open="meshModal">
      <img src="{{ "/img/example-mesh.svg" | relative_url }}"
            style="height: 400px; width: auto;" alt="Example mesh">
    </a>
  </div>
  <div class="cell auto">
    <h2 class="landing-page-logo">
      <img src="{{ "/img/octave-logo.svg" | relative_url }}"
            style="float: left; height: 48px; width: auto; padding-right: 0.5rem"
            alt="GNU Octave logo">
      GNU Octave
    </h2>
    <p><b>Scientific Programming Language</b></p>
    <ul>
      <li>Powerful mathematics-oriented syntax with built-in 2D/3D plotting and visualization tools</li>
      <li>Free software, runs on GNU/Linux, macOS, BSD, and Microsoft Windows</li>
      <li>Drop-in compatible with many Matlab scripts</li>
    </ul>
    <div class="button-group stacked">
      <a href="{{ "download.html" | relative_url }}" class="button">Download</a>
      <a href="{{ site.docs_url }}" class="button">Documentation</a>
    </div>
  </div>
</div>


### Syntax Examples

The Octave syntax is largely compatible with Matlab.
The Octave interpreter can be run in
<a href="#" data-open="guiModal">GUI mode</a>, as a console,
or invoked as part of a shell script.
More Octave examples can be found in
[the Octave wiki]({{ site.wiki_url }}/Using_Octave).

<div class="grid-x grid-margin-x">
  <div class="cell medium-4" >
    <p>
      Solve systems of equations with linear algebra operations on
      <strong>vectors</strong> and <strong>matrices</strong>.
    </p>
  </div>
  <div class="cell auto">
{%- include code1.html -%}
<!--
```octave
b = [4; 9; 2] # Column vector
A = [ 3 4 5;
      1 3 1;
      3 5 9 ]
x = A \ b     # Solve the system Ax = b
```
-->
  </div>
</div>

<div class="grid-x grid-margin-x">
  <div class="cell medium-4">
    <p>
      Visualize data with <strong>high-level plot commands</strong>
      in 2D and 3D.
    </p>
  </div>
  <div class="cell auto">
{%- include code2.html -%}
<!--
```octave
x = -10:0.1:10; # Create an evenly-spaced vector from -10..10
y = sin (x);    # y is also a vector
plot (x, y);
title ("Simple 2-D Plot");
xlabel ("x");
ylabel ("sin (x)");
```
-->
    <a href="#" class="button small-only-expanded" data-open="plotModal">Click here to see the plot output</a>
  </div>
</div>


### Octave Packages

GNU Octave can be extended by packages, similar to Matlab's toolboxes.
Find packages at:
- [Octave Forge]({{ site.sourceforge_url }})
- [Package extensions index]({{ site.pkg_index_url }})


### Development

Octave is free software licensed under the
[GNU General Public License (GPL)]({{ "license.html" | relative_url }}).
Assuming you have Mercurial installed on your machine you may obtain the latest
development version of Octave sources with the following command:

```
hg clone https://www.octave.org/hg/octave
```

[Get involved]({{ "/get-involved.html" | relative_url }}) in Octave development.


{% assign latest_post = site.posts.first %}
{% if latest_post %}
  <div class="primary callout">
      <a class="float-right button tiny warning" href="{{ "/feed.xml" | relative_url }}">
        RSS
      </a>
    <h3 class="entry-title">
      <a href="{{ latest_post.url | relative_url }}">{{ latest_post.title }}</a>
    </h3>
    <p class="post-meta">{{ latest_post.date | date: "%b %-d, %Y" }}</p>
    <div class="entry-content">{{ latest_post.excerpt }}</div>
  </div>
{% endif %}

<div class="large reveal" id="meshModal" data-reveal>
  <img src="{{ "/img/example-mesh.svg" | relative_url }}" alt="Example mesh">
  <button class="close-button" data-close aria-label="Close modal" type="button">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<div class="large reveal" id="plotModal" data-reveal>
  <img src="{{ "/img/example-plot.svg" | relative_url }}" alt="Example plot">
  <button class="close-button" data-close aria-label="Close modal" type="button">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<div class="large reveal" id="guiModal" data-reveal>
  <img src="{{ "/img/GNU_Octave_4-4-0_screenshot_1600x900.png" | relative_url }}" alt="GNU Octave GUI screenshot">
  <button class="close-button" data-close aria-label="Close modal" type="button">
    <span aria-hidden="true">&times;</span>
  </button>
</div>