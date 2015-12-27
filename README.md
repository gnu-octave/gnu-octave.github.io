# octave-web
Proposed update of [octave.org](http://www.octave.org).

## Developing
- Install Jekyll from Rubygems
  
  `gem install jekyll`
  
- Compile the assets into `_site` (this directory is ignored by revision control and will be created on first build)
  
  `jekyll build`
  
- Serve the site

  `jekyll serve --watch`
  
## Configuring
See [_config.yml](_config.yml). In particular, `baseurl` will need to be adjusted to match the path of the subdirectory where the site will be hosted, e.g., for `gnu.org/octave` use `/octave`. Currently `baseurl` is set to the repository name in order to work with the Github Pages' build service.

## Deploying
- Configure paths as needed in `_config.yml`
- Build the static site
  
  `jekyll build`

- Copy the static assets from `_site` to a server.
