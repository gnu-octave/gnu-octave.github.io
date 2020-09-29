USRNAME ?= $(shell bash -c 'read -p \
  "The Octave Savannah CVS repository is checked out to the parent directory.  Savannah login: " usr; \
	echo $$usr')

SAVANNAH_DIR := ../octave

CVS_RSH=ssh

export CVS_RSH

deploy: | $(SAVANNAH_DIR)
	#
	# Build static website into the subdirectory `_site` using Jekyll via
	# Bundler
	#
	bundle exec jekyll build
	#
	# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
	# DANGEROUS STEP, omitted by default.
	#
	# Remove all previous files in the target directory, but no directories
	# at all or CVS related stuff.  This is due to a limitation of CVS, see
	#
	#   https://web.archive.org/web/20140629054602/http://ximbiot.com/cvs/manual/cvs-1.11.23/cvs_7.html#SEC69
	#
	# For some introduction to CVS, see
	#    https://savannah.nongnu.org/projects/cvs
	#    https://www.cs.umb.edu/~srevilak/cvs.html
	#
	# find $(SAVANNAH_DIR) -type f -not -path "*/CVS/*" -exec rm -f '{}' \;
	# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	#
	# Copy the content of that directory `_site` into the checked out
	# Savannah CVS (see make target $(SAVANNAH_DIR)).
	#
	cp -a _site/. $(SAVANNAH_DIR)
	#
	# Avoid multiple key authentications for the next step
	#
	ssh-add
	#
	# Add all potential new directories to CVS
	#
	cd $(SAVANNAH_DIR) \
	  && find . -type d -not -name "CVS" -exec cvs add '{}' \; \
	  | true  # succeed in any case
	#
	# Add all potential new files to CVS (the following command taken from
	# http://stackoverflow.com/questions/5071/how-to-add-cvs-directories-recursively
	# proved to be fast) and succeed in any case.
	#
	cd $(SAVANNAH_DIR) && find . -type f | grep -v CVS | xargs cvs add | true
	#
	# Commit the changes to get online.
	#
	cd $(SAVANNAH_DIR) && cvs commit -m "Update website."
	#
	# Now everything should be visible to the world.
	#

$(SAVANNAH_DIR):
	cd .. \
	&& cvs -z3 -d:ext:$(USRNAME)@cvs.savannah.gnu.org:/web/octave checkout -P octave

.DEFAULT_GOAL :=
