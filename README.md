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
[2]: http://hg.octave.org/web-octave
[3]: https://web.cvs.savannah.gnu.org/viewvc/octave/?root=octave
[4]: https://www.gnu.org/software/octave



## Development

### Getting the sources

Anyone is free to clone this development repository, simply type

    hg clone http://hg.octave.org/web-octave

to get anonymous read access without writing privileges.
To push your changes, please contact the octave developers at
`maintainers@octave.org`.

If you already have writing permissions for this repository,
you should clone the repository using

    hg clone ssh://gnuoctave@octave.org/hg/web-octave



### Building requisites

To build the static website, you need to install [Jekyll][6] and a few more
tools from [Rubygems][7].  Just type

    gem install jekyll pygments.rb

A small prerequisite check is performed, by Typing

    make check_prerequisites

For the responsive webpages, we internally use the [Foundation 5][8]
framework.  All necessary files are already included inside the
[hg development repository][2].

[6]: https://jekyllrb.com/
[7]: https://rubygems.org/
[8]: https://foundation.zurb.com/sites/docs/v/5.5.3/



### Building the static website locally

All relevant information for Jekyll to build the static website is located
in the file `_config.yml`.
Typing

    jekyll build

from the repositories root directory will build a complete static website
into the subdirectory `_site` using this information (this directory is
ignored by Mercurial and will be created on first build).

Especially for development, it is beneficial to watch the changes locally
before pushing any changes.
Jekyll provides a local webserver by typing

    jekyll serve

and rebuilds the whole static website automatically, as it monitors any
file changes.

To build the test page, that can be deployed at some subdirectory, e.g.
`https://www.octave.org/new`, use

    jekyll build --config _config.yml,_config_test.yml



### Add a new RSS post

Duplicate another post in the subdirectory `_posts` and adjust the filename,
especially the date.

**Be sure to choose the correct categories!!**

`categories: news release` is reserved for release announcements, those posts
are also displayed inside the GUI.  Consider choosing another category like
`categories: news` or alike for less important news.



### Deploying the static website online

For this step you need to have writing permissions to the [Savannah CVS][3]
repository.  Usually, it should suffice to type

    make deploy

if anything doesn't work as expected, look at the provided `Makefile` and
perform the steps on your own manually, if necessary.
