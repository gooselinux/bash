# This makefile is downloading an archive found in 
# the 'archive' file already existing in this directory
# and validating the md5sum of the archive against it.

CURL	?= $(shell if test -f /usr/bin/curl ; then echo "curl -H Pragma: -O -R -S --fail --show-error" ; fi)
WGET	?= $(shell if test -f /usr/bin/wget ; then echo "wget -nd -m" ; fi)
CLIENT	?= $(if $(CURL),$(CURL),$(if $(WGET),$(WGET)))

sources:
	$(CLIENT) http://herlo.org/misc/bash-4.1.tar.gz
	md5sum -c archive || ( echo 'MD5 check failed' && rm bash-4.1.tar.gz; exit 1 )

clean:
	rm bash-4.1.tar.gz
