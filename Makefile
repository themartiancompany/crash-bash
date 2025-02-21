# SPDX-License-Identifier: GPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

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

install: install-crash-bash install-doc install-examples

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-crash-bash:

	install -vdm 755 "$(LIB_DIR)"
	install -vDm 755 crash-bash/crash-bash "$(LIB_DIR)"

install-examples:

	install -vdm 755 "$(DATA_DIR)/examples"
	install -vDm 755 examples/ahno "$(DATA_DIR)/examples"

.PHONY: check install install-doc install-examples install-crash-bash shellcheck
