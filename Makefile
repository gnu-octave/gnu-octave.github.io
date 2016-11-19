USRNAME ?= $(shell bash -c 'read -p \
  "The Octave Savannah CVS repository is checked out to the parent directory.  Savannah login: " usr; \
	echo $$usr')

SAVANNAH_DIR := ../octave

CVS_RSH=ssh

export CVS_RSH

all: deploy

deploy: | $(SAVANNAH_DIR)
	jekyll build
	cp -a _site/. $(SAVANNAH_DIR)
	cd $(SAVANNAH_DIR) && find . -type d -not -name "CVS" -exec cvs add '{}' \;
	cd $(SAVANNAH_DIR) && find . -type f | grep -v CVS | xargs cvs add
	cd $(SAVANNAH_DIR) && cvs commit

$(SAVANNAH_DIR):
	cd .. \
	&& cvs -z3 -d:ext:$(USRNAME)@cvs.savannah.gnu.org:/web/octave checkout -P octave
