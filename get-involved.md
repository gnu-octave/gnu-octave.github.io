---
layout: page
title: Get Involved
menu: true
---

We always need more help improving Octave and there are many ways you can
contribute.  You can help by fixing bugs, developing new features, answering
questions on the mailing list or IRC channel, helping to improve the web pages.

If you are wondering what to work on, we have a standard answer:
what would you like to work on?  We try not to tell contributors
what to work on as most people do their best work when they are
within their own field of interest.  So, we would love your help,
but would also love for you to work on what you love.

For some inspiration, we do maintain a [list of possible projects][1]
on the Wiki.

If you have an idea on what to contribute, then join the
[`{{ site.maintainers_email }}`][2] mailing list or the IRC
[`{{ site.irc_channel }}` channel][3] in Freenode and discuss your ideas there.
That way others can provide input early on, which makes your contribution more
likely to get accepted.

<div class="row">
<div class="columns small-12">
<div class="panel callout">
Please do <strong>not</strong> send help requests or bug reports to the
<samp>{{ site.maintainers_email }}</samp> mailing list.  Refer to the
<a href="{{ "bugs.html" | relative_url }}">bug tracker</a> or other
<a href="{{ "support.html" | relative_url }}">support options</a> instead.
</div>
</div>
</div>

[1]: http://www.octave.org/wiki/Projects
[2]: https://lists.gnu.org/mailman/listinfo/octave-maintainers
[3]: http://webchat.freenode.net/?channels=octave&amp;uio=MT1mYWxzZSYyPXRydWUmMTI9dHJ1ZQda


# Using the Development Sources

The latest development sources of Octave are also available via
[Mercurial][4] (hg) archive.

The primary archive address is [http://www.octave.org/hg/octave][5],
which currently redirects to [http://hg.savannah.gnu.org/hgweb/octave][6].

If you decide to use the development sources from the Mercurial archive,
please read the file [`etc/HACKING`][7] that is available with the source
files.

Assuming you have Mercurial and git installed on your machine you may obtain
the latest development version of Octave sources with the following command:

{% highlight text %}
hg clone http://www.octave.org/hg/octave
{% endhighlight %}

This will clone *two* repositories, one of which is subrepository of the
main Octave repository. Once you have these, you can resync with the archive
by doing

{% highlight text %}
hg -v pull
hg -v update
{% endhighlight %}

The `-v` option is not required but provides extra information
about what was pulled and updated.  The Octave manual has more
information about [contributing to Octave's development][8].

[4]: http://www.selenic.com/mercurial/wiki
[5]: http://www.octave.org/hg/octave
[6]: http://hg.savannah.gnu.org/hgweb/octave
[7]: http://www.octave.org/hg/octave/file/tip/etc/HACKING
[8]: {{ site.docs_url }}/Contributing-Guidelines.html#Contributing-Guidelines


# Octave Forge

The community-developed [Octave-Forge][9] packages expand Octave's core
functionality by providing field specific features via Octave's package system.
For example, image and signal processing, fuzzy logic, instrument control,
and statistics packages are examples of individual [Octave-Forge packages][10].

[9]: http://octave.sourceforge.net/
[10]: http://octave.sourceforge.net/packages.php
