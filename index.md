---
layout: default
---

<div class="row">
  <div class="columns medium-6">
    <a href="#">
      <img src="{{ "/img/mesh.png" | prepend: site.baseurl }}" />
    </a>
  </div>
  <div class="columns medium-6">
    <h2 class="home-title">
      <img src="{{ "/img/logo.png" | prepend: site.baseurl }}" style="float: left; height: 48px; width: auto; padding-right: 0.5rem" />
      GNU Octave
    </h2>
    <h3>Scientific Programming Language</h3>
    <ul>
      <li>Powerful mathematics-oriented syntax with built-in plotting and visualization tools</li>
      <li>Free software, runs on GNU/Linux, Mac, BSD, and Windows</li>
      <li>Drop-in compatible with many Matlab scripts</li>
    </ul>
    <div>
      <ul class="button-group stack-for-small even-2">
        <li><a href="#install" class="button">Download</a></li>
        <li><a href="{{site.docs_url}}" class="button">Docs</a></li>
      </ul>
    </div>
  </div>
</div>


### Syntax Examples

The Octave syntax is largely compatible with
[Matlab](https://www.mathworks.com/matlab).
The Octave interpreter can be run in GUI mode, as a console,
or invoked as part of a shell script.

<div class="row">
  <div class="columns medium-4" >
    <p>
      Solve systems of equations with linear algebra operations on
      <strong>vectors</strong> and <strong>matrices</strong>
    </p>
  </div>
  <div class="columns medium-8">
{% highlight matlab%}
b = [4; 9; 2] % Column vector
A = [ 3 4 5;
      1 3 1;
      3 5 9 ]
x = A \ b     % Solve the system by inverting A
{% endhighlight %}
   </div>
</div>

<div class="row">
   <div class="columns medium-4">
      <p>
        Visualize data with <strong>high-level plot commands</strong>
        in 2D and 3D
      </p>
   </div>
   <div class="columns medium-8">
{% highlight matlab %}
x = -10:0.1:10 % Create an evenly-spaced vector from -10..10
y = sin(x)     % y is also a vector
plot(x,y)
{% endhighlight %}
      <div class="text-left">
        <a href="#" data-reveal-id="plotModal">
          <img src="{{ "/img/plot.png" | prepend: site.baseurl }}" style="height: 12rem; width: auto;"/>
          <span class="label">Expand</span>
      </a>
    </div>
  </div>
</div>

<a class="button" href="{{site.baseurl}}/examples">More Examples</a>


### Install

<div class="row">
  <div class="columns medium-8">
  {% include install.html %}
  </div>
  <div class="columns medium-4">
    <a href="#" data-reveal-id="guiModal">
      <img src="{{ "/img/screenshot-2016-small.png" | prepend: site.baseurl }}" title="GNU Octave 4.0.3 - Licensed under CC BY-SA 3.0"/>
    </a>
  </div>
</div>


### Octave Forge

[Octave Forge](http://octave.sourceforge.net/)
is a central location for development of packages for GNU Octave,
similar to Matlab's toolboxes.
To install a package, use the pkg command from the Octave prompt by typing:

<div class="row">
<div class="columns medium-9">
{% highlight text %}
pkg install -forge package_name
pkg load package_name
{% endhighlight %}
</div>
<div class="columns large-3">
  <a href="http://octave.sourceforge.net/packages.php" class="button expand">Browse Packages</a>
</div>
</div>


### Development

Octave is free software licensed under the
[GNU General Public License (GPL)](http://www.gnu.org/copyleft/gpl.html).
Assuming you have Mercurial installed on your machine
you may obtain the latest development version of Octave sources
with the following command:

{% highlight text %}
hg clone http://www.octave.org/hg/octave
{% endhighlight %}

If you want to participate in Octave development, join the
[maintainers@octave.org](https://lists.gnu.org/mailman/listinfo/octave-maintainers)
mailing list.


<a class="right" href="{{ "/feed.xml" | prepend: site.baseurl }}">
  <span class="label warning">RSS</span>
</a>

### News

{% for post in site.posts limit:3 %}
  <div class="panel callout">
    <h3 class="entry-title">
      <a href="{{ root_url }}{{ post.url }}">{{ post.title }}</a>
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
    </h3>
    <div class="entry-content">{{ post.content }}</div>
  </div>
{% endfor %}



<div id="plotModal" class="reveal-modal" data-reveal aria-hidden="true" role="dialog">
  <img src="{{ "/img/plot.png" | prepend: site.baseurl }}" />
  <a class="close-reveal-modal" aria-label="Close">&#215;</a>
</div>

<div id="guiModal" class="reveal-modal" data-reveal aria-hidden="true" role="dialog">
  <img src="{{ "/img/screenshot-2016.png" | prepend: site.baseurl }}" title="GNU Octave 4.0.3 - Licensed under CC BY-SA 3.0"/>
  <a class="close-reveal-modal" aria-label="Close">&#215;</a>
</div>
