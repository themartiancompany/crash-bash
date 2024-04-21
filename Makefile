#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/libcrash-bash
DATA_DIR=$(DESTDIR)$(PREFIX)/share/libcrash-bash
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/libcrash-bash

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard crash-bash/*)
EXAMPLES_FILES=$(wildcard examples/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES) $(EXAMPLES_FILES)

install: install-libcrash-bash install-doc install-examples

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-libcrash-bash:

	install -vdm 755 "$(LIB_DIR)"
	install -vDm 755 crash-bash/crash-bash "$(LIB_DIR)"

install-libcrash-bash:

	install -vdm 755 "$(DATA_DIR)/examples"
	install -vDm 755 examples/ahno "$(DATA_DIR)/examples"

.PHONY: check install install-doc install-examples install-libcrash-bash shellcheck
