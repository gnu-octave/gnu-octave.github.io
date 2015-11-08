---
layout: page
title: Contribute
permalink: /contribute/
menu: true
---

We always need more help improving Octave and there are many ways you can contribute. You can help by fixing bugs, developing new features, answering questions on the mailing list or IRC channel, helping to improve the web pages.

If you are wondering what to work on, we have a standard answer: what would you like to work on? We try not to tell contributors what to work on as most people do their best work when they are within their own field of interest. So, we would love your help, but would also love for you to work on what you love.

If you need some inspiration, we do maintain a list of possible projects on the [Wiki](http://www.octave.org/wiki/Projects).

If you have an idea on what to contribute, then join the maintainers mailing list and discuss your ideas there. That way others can provide input early on, which makes your contribution more likely to get accepted.

### Contacting developers

If you want to participate in Octave development, you should join the [maintainers@octave.org](https://lists.gnu.org/mailman/listinfo/octave-maintainers) mailing list. Please use this list only if you are participating in Octave's development. If you are looking for help in using Octave, please use the [help@octave.org](https://lists.gnu.org/mailman/listinfo/help-octave) list instead, or check out other [support options]({{"/support-options/" | prepend: site.baseurl}}).

For sometimes faster communication, you can also chat in IRC in #octave in Freenode. Note, however, that the primary medium for development talk is the mailing list.

### Using the Development Sources

The latest development sources of Octave are also available via Mercurial (hg) archive.

The primary archive address is [http://www.octave.org/hg/octave](http://www.octave.org/hg/octave), which currently redirects to [http://hg.savannah.gnu.org/hgweb/octave](http://hg.savannah.gnu.org/hgweb/octave).

If you decide to use the development sources from the Mercurial archive, please read the file [etc/HACKING](http://www.octave.org/hg/octave/file/tip/etc/HACKING) that is available with the source files.

Assuming you have Mercurial and git installed on your machine you may obtain the latest development version of Octave sources with the following command:

    hg clone http://www.octave.org/hg/octave
    
This will clone two repositories, one of which is subrepository of the main Octave repository. Once you have these, you can resync with the archive by doing
    
    hg -v pull
    hg -v update
    
The `-v` (verbose) option is not required but provides extra information about what was pulled and updated. The Octave manual has more information about contributing to Octave's development.
