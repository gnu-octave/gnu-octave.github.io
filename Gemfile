source "https://rubygems.org"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!

# NOTE: Jekyll 4 released 2020-05-09, but no support for Pygments, see below
#       https://jekyllrb.com/docs/liquid/tags/
gem "jekyll", "~> 3.8.7" # Release 2020-05-08

# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.14" # Release 2020-06-24
end

# Rouge is the default highlighter for Jekyll 4 and does not support Octave
# highlighting yet.  Thus stay on Jekyll 3.8 for a while.
gem "pygments.rb"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0", :install_if => Gem.win_platform?
