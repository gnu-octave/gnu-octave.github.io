# GNU Octave Website development

This is the [https://www.octave.org][1] website development repository.

The development and deployment workflow in short:

1. The website is developed in this [web-octave][2] Mercurial repository.
2. Static HTML pages are generated from this [web-octave][2] repository
   and are deployed at the [Savannah CVS][3] repository.
3. After deploying the static pages, they are visible from
   [https://www.octave.org][1], that redirects to
   [https://www.gnu.org/software/octave][4].

[1]: https://www.octave.org
[2]: https://hg.octave.org/web-octave
[3]: https://web.cvs.savannah.gnu.org/viewvc/octave/?root=octave
[4]: https://www.gnu.org/software/octave



## Development

### Getting the sources

Anyone is free to clone this website development repository, simply type

    hg clone https://hg.octave.org/web-octave

to get anonymous read access without writing privileges.
To push your changes, please contact the octave developers at
https://octave.discourse.group/.

If you already have writing permissions for this repository,
you should clone the repository using

    hg clone ssh://gnuoctave@octave.org/hg/web-octave



### Building requisites

To build the static website, you need to install [Ruby][6] and [Bundler][7].
For Debian/Ubuntu please perform the following setup fist.  For other Linux
distributions this command might change.

    sudo apt-get install ruby-full build-essential zlib1g-dev

    gem install bundler

From now on, everything is handled by Bundler.  Install all required
dependencies for the static Octave website by running

    bundle install

from within the checked-out [hg development repository][2].

For the responsive webpages, we internally use the [Foundation 6][8]
framework.  All necessary files are already included inside this
[hg development repository][2].

[6]: https://www.ruby-lang.org/
[7]: https://bundler.io/
[8]: https://get.foundation/sites/docs/



### Building the static website locally

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



### Add a new RSS post

Duplicate another post in the subdirectory `_posts` and adjust the filename,
especially the date.

**Be sure to choose the correct categories!!**

`categories: news release` is reserved for release announcements, those posts
are also displayed inside the Octave GUI.  Consider choosing another category
like `categories: news` or alike for less important news.



### Deploying the static website online

For this step you need to have writing permissions to the [Savannah CVS][3]
repository.  Usually, it should suffice to type

    make deploy

if anything doesn't work as expected, look at the provided `Makefile` and
perform the steps on your own manually, if necessary.
