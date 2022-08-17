# Distributed under the MIT license.
# See accompanying file LICENSE or https://github.com/flagarde/cmake-micromamba/blob/main/LICENSE for details.

#[=======================================================================[.rst:
FindMicromamba
--------------

Find the micromamba executable.

IMPORTED Targets
^^^^^^^^^^^^^^^^

This module defines :prop_tgt:`IMPORTED` executable ``Micromamba::Micromamba``, if micromamba has been found.

Result Variables
^^^^^^^^^^^^^^^^

This module defines the following variables:

::

  MICROMAMBA_FOUND - system has micromamba.
  MICROMAMBA_EXECUTABLE - the micromamba executable.

Hints
^^^^^

A user may set ``MICROMAMBA_ROOT`` to a micromamba installation root to tell this module where to look.

#]=======================================================================]

include(FindPackageHandleStandardArgs)

# Search MICROMAMBA_ROOT first if it is set.
if(MICROMAMBA_ROOT)
  get_filename_component(MICROMAMBA_ROOT "${MICROMAMBA_ROOT}" ABSOLUTE)
  set(MICROMAMBA_SEARCH_ROOT "${MICROMAMBA_ROOT}")
  list(APPEND MICROMAMBA_SEARCHES ${MICROMAMBA_SEARCH_ROOT})
endif()

find_program(MICROMAMBA_EXECUTABLE
  NAMES micromamba micromamba.exe
  HINTS "${MICROMAMBA_SEARCHES}"
  PATH_SUFFIXES bin Library/bin
  DOC "micromamba executable")

if(NOT MICROMAMBA_EXECUTABLE STREQUAL MICROMAMBA_EXECUTABLE-NOTFOUND)
  execute_process(COMMAND ${MICROMAMBA_EXECUTABLE} --version OUTPUT_VARIABLE MICROMAMBA_VERSION)
  string(STRIP ${MICROMAMBA_VERSION} MICROMAMBA_VERSION)

  if(NOT TARGET micromamba::micromamba)
    add_executable(micromamba::micromamba IMPORTED)
    set_property(TARGET micromamba::micromamba PROPERTY IMPORTED_LOCATION "${MICROMAMBA_EXECUTABLE}")
  endif()
endif()

unset(MICROMAMBA_SEARCHES)
unset(MICROMAMBA_SEARCH_ROOT)
if(${CMAKE_VERSION} VERSION_LESS 3.19)
  find_package_handle_standard_args(Micromamba REQUIRED_VARS MICROMAMBA_EXECUTABLE MICROMAMBA_VERSION VERSION_VAR MICROMAMBA_VERSION)
else()
  find_package_handle_standard_args(Micromamba REQUIRED_VARS MICROMAMBA_EXECUTABLE MICROMAMBA_VERSION VERSION_VAR MICROMAMBA_VERSION HANDLE_VERSION_RANGE)
endif()
mark_as_advanced(MICROMAMBA_EXECUTABLE MICROMAMBA_VERSION)
