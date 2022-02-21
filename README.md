# GNU Octave Website development

This is the <https://www.octave.org> website development repository.

The development and deployment workflow in short:

1. The website is developed at two synchronized locations:
   - <https://hg.octave.org/web-octave> (Mercurial)
   - <https://github.com/gnu-octave/gnu-octave.github.io> (Git)

2. Static HTML pages are generated from these repositories
   and deployed at
   - <https://web.cvs.savannah.gnu.org/viewvc/octave/?root=octave> (Savannah)
   - <https://gnu-octave.github.io/> (GitHub Pages)

3. The deployment to GitHub Pages happens automatically by pushing to the
   respective repository.  The deployment on Savannah is more complicated and
   described below in detail and is visible at <https://www.octave.org> that
   redirects to <https://www.gnu.org/software/octave>.


## Simple website changes / contributions

Anyone is free to clone this website development repository, simply type

    git clone https://github.com/gnu-octave/gnu-octave.github.io.git
    hg  clone https://hg.octave.org/web-octave

to get anonymous read access without writing privileges.

If you want submit changes/additions, please create a
[**pull request**](https://docs.github.com/en/github/getting-started-with-github/github-glossary#pull-request)
on GitHub or contact the Octave developers at <https://octave.discourse.group/>.

> **Note:** Changes made to the GitHub page repository are only visible there.
> To change <https://www.octave.org>, the Savannah CVS repository must be
> updated (see below).


### Add a new RSS post

Duplicate another post in the subdirectory `_posts` and adjust the filename,
especially the date.

**Be sure to choose the correct categories!!**

`categories: news release` is reserved for release announcements, those posts
are also displayed inside the Octave GUI.  Consider choosing another category
like `categories: news` or alike for less important news.


## Advanced development

### Synchronize Mercurial and GitHub repositories

You need writing permissions to the Mercurial repository

    hg clone ssh://gnuoctave@octave.org/hg/web-octave

Add to `.hg/hgrc`

    [paths]
    default = ssh://gnuoctave@hg-new.octave.org/hg/web-octave
    github = git+ssh://git@github.com:gnu-octave/gnu-octave.github.io.git


### Building requisites

To build the static website offline, you need to install [Ruby][] and
[Bundler][].  For Debian/Ubuntu please perform the following setup fist.
For other Linux distributions this command might change.

    sudo apt-get install ruby-full build-essential zlib1g-dev

    gem install bundler

From now on, everything is handled by Bundler.  Install all required
dependencies for the static Octave website by running

    bundle install

from within the checked-out website development repository (Mercurial or
GitHub).

For the responsive webpages, we internally use the [Foundation 6][Foundation]
framework.  All necessary files are already included inside this website
development repository.

[Ruby]: https://www.ruby-lang.org/
[Bundler]: https://bundler.io/
[Foundation]: https://get.foundation/sites/docs/


### Building the static website offline

All relevant information for Bundler to build the static website are located in
the files `_config.yml`, `Gemfile`, and `Gemfile.lock`.  Typing

    bundle exec jekyll build

from the repository root directory will build a complete static website
into the subdirectory `_site` using this information.  This directory is
ignored by Mercurial and will be created on first build.

Especially for development, it is beneficial to watch the changes locally
before pushing any changes.  Jekyll provides a local webserver by typing

    bundle exec jekyll serve

and rebuilds the whole static website automatically, as it monitors any
file changes.


### Deploying the static website online at Savannah CVS

For this step you need to have writing permissions to the Savannah CVS
repository.  Usually, it should suffice to type

    make deploy

if anything doesn't work as expected, look at the provided `Makefile` and
perform the steps on your own manually, if necessary.


## License

### Website Design and Code

- Copyright (c) 2016-2022 The Octave Project Developers.
- Copyright (c) 2015-2016 Alex Krolick.

See the file LICENSE in the top-level directory of this distribution or
<https://octave.org/copyright/>.

The Octave website is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your option)
any later version.

The Octave website is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with the Octave website; see the file COPYING.  If not, see
<https://www.gnu.org/licenses/>.

### Website Content

The website content is licensed under a
[Creative Commons Attribution-NoDerivatives 4.0 International License](https://creativecommons.org/licenses/by-nd/4.0/).
