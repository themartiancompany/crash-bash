#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/libcrash-bash
BIN_DIR=$(DESTDIR)$(PREFIX)/lib/libcrash-bash

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard media-tools/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-libcrash-bash install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-libcrash-bash:

	install -vdm 755 "$(LIB_DIR)"
	install -vDm 755 crash-bash/crash-bash "$(LIB_DIR)"


.PHONY: check install install-doc install-libcrash-bash shellcheck
