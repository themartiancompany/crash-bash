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
_PROJECT=crash-bash
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/lib$(_PROJECT)
DATA_DIR=$(DESTDIR)$(PREFIX)/share/lib$(_PROJECT)
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/lib$(_PROJECT)
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

SCRIPT_FILES=$(wildcard $(_PROJECT)/*)
EXAMPLES_FILES=$(wildcard examples/*)

DOC_FILES=\
  $(wildcard *.rst) \
  $(wildcard *.md)

_INSTALL_FILE=install -vDm644
_INSTALL_EXE=install -vDm755
_INSTALL_DIR=install -vdm755

_CHECK_TARGETS=\
  shellcheck
_CHECK_TARGETS_ALL=\
  check \
  $(_CHECK_TARGETS)
_INSTALL_TARGETS=\
  install-$(_PROJECT) \
  install-doc \
  install-examples \
  install-man
_INSTALL_TARGETS_ALL=\
  install \
  $(_INSTALL_TARGETS)

all:

check: $(_CHECK_TARGETS)

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES) $(EXAMPLES_FILES)

install: $(_INSTALL_TARGETS)

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-crash-bash:

	$(_INSTALL_DIR) \
	  "$(LIB_DIR)"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(LIB_DIR)"

install-examples:

	$(_INSTALL_DIR) \
	  "$(DATA_DIR)/examples"
	$(_INSTALL_EXE) \
	  "examples/ahno" \
	  "$(DATA_DIR)/examples"

install-man:

	$(_INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	rst2man \
	  "man/$(_PROJECT).1.rst" \
	  "$(MAN_DIR)/man1/lib$(_PROJECT).1"

.PHONY: $(_CHECK_TARGETS_ALL) $(_INSTALL_TARGETS_ALL)
