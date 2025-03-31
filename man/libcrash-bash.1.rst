..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025  Pellegrino Prevete

   All rights reserved
   ----------------------------------------------------------------------

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.


==================
libcrash-bash
==================

-----------------------------------------------------------
Crash Bash Library
-----------------------------------------------------------
:Version: libcrash-bash |version|
:Manual section: 1

Synopsis
========


..  code-block:: bash

  _bin="$( \
    dirname \
      "$( \
        command \
          -v \
  	  "env")")"
  _lib="$( \
    realpath \
      "${_bin}/../lib")"
  _crash_bash="${_lib}/libcrash-bash/crash-bash"
  _sourced \
    "${_crash_bash}" 2>/dev/null || \
    source \
      "${_crash_bash}"

Description
===========

Bash library providing useful functions
to write easy to read, easy to extend
Bash applications.

There is an example application using
the library in the 'ahno' directory.

Most The Martian Company's applications
use the Crash Bash library.

Significant applications developed using the library are
the Ethereum Virtual Machine File System (EVMFS) [1]_,
the Ur [2]_ uncensorable Life and DogeOS user repository
and application store, its reference
pub [3]_ publishing tool and source retrieval tool aspe [4]_,
EVM OpenPGP Key Server [5]_, the uncensorable, undeletable,
distributed, network-neutral, decentralized Twitter
(whose sources are entirely hosted on
the EVMFS) and many others currently in development.

Crash Bash is a core component of the
Human Instrumentality Project (HIP).

Bugs
====

https://github.com/themartiancompany/crash-bash/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* libcrash-js

External Resources
===================

.. [1]  `Ethereum Virtual Machine File System`_
.. [2]  `Ur`_
.. [3] `Pub`_
.. [4] `Aspe`_
.. [5] `EVM OpenPGP Key Server`_

.. include:: variables.rst
