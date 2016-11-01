# octave-web

This is the [http://www.octave.org][1] website development repository.

The development and deployment workflow in short:

1. The website is developed in this [web-octave][2] Mercurial repository.
2. Static HTML pages are generated from this [web-octave][2] repository
   and are deployed at the [Savannah CVS][3] repository.
3. After deploying the static pages, they are visible from
   [http://www.octave.org][1], that redirects to
   [https://www.gnu.org/software/octave][4].

[1]: http://www.octave.org
[2]: http://hg.octave.org/web-octave
[3]: http://web.cvs.savannah.gnu.org/viewvc/octave/?root=octave
[4]: https://www.gnu.org/software/octave



## Development

### What makes this way of development better, than the prior?

- **Official RSS feeds** are **easily** maintained now **at a single place**:
  the `_posts` subdirectory, later accessible via
  `https://www.gnu.org/software/octave/feed.xml` and automatically spread
  to an arbitrary amount of readers, including almost all below mentioned.

  The Octave News are currently very widespread
  (and **individually maintained!**) at:
  - https://www.gnu.org/software/octave/ (excerpt for the start page)
  - https://www.gnu.org/software/octave/news.html (some archive)
  - https://www.gnu.org/software/octave/community-news.html (excerpt for the
    Octave GUI)
  - https://www.gnu.org/software/octave/fixes-4.0.x.html (here are many more
    to come!)
  - http://wiki.octave.org/GNU_Octave_Wiki#News (some excerpt, anyone can edit)

- **Content is content**: Page content is primary written in [Markdown][5],
  a lightweight Markup language, thus no nasty forgotten HTML tags, that
  make content look ugly for any author of a HTML page.
  [Jekyll][6] makes valid HTML from [Markdown][5] content.

- **Easy maintenance**: Just a single command (see below), and [Jekyll][6]
  builds a consistent, up-to-date static page.  The only maintenance burden,
  as it is today anyway: The [Savannah CVS][3] repository.

[5]: https://daringfireball.net/projects/markdown/syntax
[6]: https://jekyllrb.com/



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

[7]: https://rubygems.org/



### Building the static website

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
`http://www.octave.org/new`, use

    jekyll build --config _config.yml,_config_test.yml



### Typical development tasks

- **Add a new RSS post**

  Duplicate another post in the subdirectory `_posts` and
  adjust the filename, especially the date





## Deploying

After building the static website from [web-octave][2] into the
the subdirectory `_site` using Jekyll it can be deployed at the
[Savannah CVS][3] repository to become visible to the world.

Therefore, checkout the [Savannah CVS][3] repository somewhere
outside the [web-octave][2] directory, typing

    export CVS_RSH=ssh
    cvs -z3 -d:ext:<Savannah account>@cvs.savannah.gnu.org:/web/octave checkout -P octave

Now the following steps are required for deployment
(see [here][8] and [here][9] for some introduction to CVS):

1. Remove all previous files in the target directory,
   *but no directories at all or CVS related stuff*!
   This is due to a [limitation of CVS][10].

       find octave -type f -not -path "*/CVS/*" -exec rm -f '{}' \;

   *Note:* `octave` in the command above is the name of the checked out
   [Savannah CVS][3] repository.

2. Now copy the new content of [web-octave][2] subdirectory `_site` into the
   [Savannah CVS][3] repository.

3. Then in the [Savannah CVS][3] repository:

       cd octave

   1. Remove all no longer existent files

          cvs remove

   2. Add all potential new directories to CVS

          find . -type d -not -name "CVS" -exec cvs add '{}' \;

   3. Add all potential new files to CVS (the [following command][11]
      proved to me fast)

          find . -type f | grep -v CVS | xargs cvs add

   4. Commit the chages to get online

          cvs commit

Now everything should be visible to the world.

[8]: https://savannah.nongnu.org/projects/cvs
[9]: http://www.cs.umb.edu/~srevilak/cvs.html
[10]: https://web.archive.org/web/20140629054602/http://ximbiot.com/cvs/manual/cvs-1.11.23/cvs_7.html#SEC69
[11]: http://stackoverflow.com/questions/5071/how-to-add-cvs-directories-recursively
