---
layout: default
---

<div class="grid-x grid-margin-x">
  <div class="cell medium-6">
    <a href="#"  data-open="meshModal">
      <img src="{{ "/img/example-mesh.svg" | relative_url }}"
            style="height: 400px; width: auto;" alt="Example mesh">
    </a>
  </div>
  <div class="cell medium-6">
    <h2 class="landing-page-logo">
      <img src="{{ "/img/octave-logo.svg" | relative_url }}"
            style="float: left; height: 48px; width: auto; padding-right: 0.5rem"
            alt="GNU Octave logo">
      GNU Octave
    </h2>
    <h3>Scientific Programming Language</h3>
    <ul>
      <li>Powerful mathematics-oriented syntax with built-in plotting and visualization tools</li>
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
The Octave interpreter can be run in GUI mode, as a console,
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
  <div class="cell medium-8">
{% highlight octave %}
b = [4; 9; 2] # Column vector
A = [ 3 4 5;
      1 3 1;
      3 5 9 ]
x = A \ b     # Solve the system Ax = b
{% endhighlight %}
  </div>
</div>

<div class="grid-x grid-margin-x">
  <div class="cell medium-4">
    <p>
      Visualize data with <strong>high-level plot commands</strong>
      in 2D and 3D.
    </p>
  </div>
  <div class="cell medium-8">
{% highlight octave %}
x = -10:0.1:10; # Create an evenly-spaced vector from -10..10
y = sin (x);    # y is also a vector
plot (x, y);
title ("Simple 2-D Plot");
xlabel ("x");
ylabel ("sin (x)");
{% endhighlight %}
    <a href="#" class="button small-only-expanded" data-open="plotModal">Click here to see the plot output</a>
  </div>
</div>


### Octave Forge

[Octave Forge]({{ site.sourceforge_url }}) is a collection of high quality
packages for GNU Octave, similar to Matlab's toolboxes.
To install a package, use the `pkg` command from the Octave prompt by typing:

{% highlight text %}
pkg install -forge package_name
pkg load package_name
{% endhighlight %}

<a href="{{ site.sourceforge_url }}/packages.php" class="button small-only-expanded">Browse Packages</a>


### Development

Octave is free software licensed under the
[GNU General Public License (GPL)]({{ "license.html" | relative_url }}).
Assuming you have Mercurial installed on your machine you may obtain the latest
development version of Octave sources with the following command:

{% highlight text %}
hg clone https://www.octave.org/hg/octave
{% endhighlight %}

[Get involved]({{ "/get-involved.html" | relative_url }}) in Octave development.


<div class="grid-x grid-margin-x">
  <div class="cell small-12">
    {% assign latest_post = site.posts.first %}
    {% if latest_post %}
      <div class="panel callout">
        <a class="right" href="{{ "/feed.xml" | relative_url }}">
          <span class="label warning">
            RSS
          </span>
        </a>
        <h3 class="entry-title">
          <a href="{{ latest_post.url | relative_url }}">{{ latest_post.title }}</a>
        </h3>
        <p class="post-meta">{{ latest_post.date | date: "%b %-d, %Y" }}</p>
        <div class="entry-content">{{ latest_post.excerpt }}</div>
      </div>
    {% endif %}
  </div>
</div>

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
