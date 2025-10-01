---
layout: page
title: Download
icon: <i class="fas fa-download"></i>
menu: true
permalink: download
---

<div class="primary callout">
  <i class="fas fa-info-circle" style="color:#1779ba;"></i>
  <strong>GNU Octave 10.3.0</strong> is the latest stable release.
  (<a href="{{ "/NEWS-10.html" | relative_url }}">Release Notes</a>)
</div>

<div class="button-group large expanded stacked-for-small">
  <a class="button" href="#source"><i class="fas fa-code"></i> Source</a>
  <a class="button" href="#linux"><i class="fab fa-linux"></i> GNU/Linux</a>
  <a class="button" href="#bsd"><i class="fab fa-freebsd"></i> BSD</a>
  <a class="button" href="#macos"><i class="fab fa-apple"></i> macOS</a>
  <a class="button" href="#ms-windows"><i class="fab fa-windows"></i> MS Windows</a>
</div>


<p id="source">&nbsp;</p>

### <i class="fas fa-code"></i> Source {#source2}

The latest released version of Octave is always available from

- https://ftp.gnu.org/gnu/octave
- ftp://ftp.gnu.org/gnu/octave

Please download from
[https://ftpmirror.gnu.org/octave](https://ftpmirror.gnu.org/octave),
which will redirect automatically to a nearby
[mirror site](https://www.gnu.org/order/ftp.html).


<p id="linux">&nbsp;</p>

### <i class="fab fa-linux"></i> GNU/Linux {#linux2}

Packaged versions of Octave for GNU/Linux systems are provided by the
individual distributions described in the
[Octave wiki]({{ site.wiki_url }}/Category:Installation).
These packages are created by volunteers.
The delay between an Octave source release and the availability of a package
for a particular GNU/Linux distribution varies.

Alternatively,
there are some distribution independent installation methods for more recent
versions of GNU Octave described in the
[Octave wiki]({{ site.wiki_url }}/Octave_for_GNU/Linux#Distribution_independent).


<p id="bsd">&nbsp;</p>

### <i class="fab fa-freebsd"></i> BSD {#bsd2}

Executable versions of Octave for BSD systems are provided by the individual
distributions.
Both [FreeBSD](https://www.freebsd.org/) and [OpenBSD](https://www.openbsd.org/)
have Octave packages.
These packages are created by volunteers and the Octave project has no control
over that process.


<p id="macos">&nbsp;</p>

### <i class="fab fa-apple"></i> macOS {#macos2}

The [Octave Wiki]({{ site.wiki_url }}/Octave_for_macOS) has instructions for
installing Octave on macOS systems.
Octave is also available in third-party package managers such as
[Homebrew](https://brew.sh/) and [MacPorts](https://www.macports.org).


<p id="ms-windows">&nbsp;</p>

### <i class="fab fa-windows"></i> Microsoft Windows {#ms-windows2}

<div class="primary callout small" data-closable>
<b>Note:</b> All installers below bundle several <b>Octave packages</b>
so they don't have to be installed separately.
After installation type <code>pkg list</code> to list them.<br>
<a href="{{ site.wiki_url }}/Octave_for_Microsoft_Windows">Read more.</a>
<a href="#ms-windows" class="close-button" aria-label="Dismiss alert" type="button" data-close>
  <span aria-hidden="true">&times;</span>
</a>
</div>

- Windows-64 (recommended)
  - [octave-10.3.0-w64-installer.exe](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64-installer.exe)
    (~ 510 MB)
    [[signature]](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64-installer.exe.sig)
  - [octave-10.3.0-w64.7z](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64.7z)
    (~ 425 MB)
    [[signature]](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64.7z.sig)
  - [octave-10.3.0-w64.zip](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64.zip)
    (~ 760 MB)
    [[signature]](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64.zip.sig)

<p></p>

- Windows-64 (64-bit linear algebra for large data)
  <br><small>
  Unless your computer has more than ~32GB of memory
  <strong>and</strong> you need to solve linear algebra problems
  with arrays containing more than ~2 billion elements, this
  version will offer no advantage over the recommended Windows-64
  version above.
  </small>

  - [octave-10.3.0-w64-64-installer.exe](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64-64-installer.exe)
    (~ 510 MB)
    [[signature]](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64-64-installer.exe.sig)
  - [octave-10.3.0-w64-64.7z](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64-64.7z)
    (~ 425 MB)
    [[signature]](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64-64.7z.sig)
  - [octave-10.3.0-w64-64.zip](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64-64.zip)
    (~ 760 MB)
    [[signature]](https://ftpmirror.gnu.org/octave/windows/octave-10.3.0-w64-64.zip.sig)

<p></p>

The **32-bit Windows binaries** formerly distributed by the Octave project are no longer supported.
The download link has been removed from here but old installers are still available from the FTP mirrors.
Patches for known issues are still welcome.

An alternative source for Windows binaries of Octave is
[MSYS2](https://wiki.octave.org/Octave_for_Microsoft_Windows#GNU_Octave_in_MSYS2).

All Windows binaries with corresponding source code can be downloaded from
[https://ftpmirror.gnu.org/octave/windows/](https://ftpmirror.gnu.org/octave/windows/).
