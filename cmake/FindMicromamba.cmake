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
if(Micromamba_ROOT)
  get_filename_component(Micromamba_ROOT "${Micromamba_ROOT}" ABSOLUTE)
  set(MICROMAMBA_SEARCH_ROOT "${Micromamba_ROOT}")
  list(APPEND MICROMAMBA_SEARCHES ${MICROMAMBA_SEARCH_ROOT})
endif()

find_program(Micromamba_EXECUTABLE
  NAMES micromamba micromamba.exe
  HINTS "${MICROMAMBA_SEARCHES}"
  PATH_SUFFIXES bin Library/bin
  DOC "Micromamba executable")

if(NOT Micromamba_EXECUTABLE STREQUAL Micromamba_EXECUTABLE-NOTFOUND)
  execute_process(COMMAND ${Micromamba_EXECUTABLE} --version OUTPUT_VARIABLE Micromamba_VERSION)
  string(STRIP ${Micromamba_VERSION} Micromamba_VERSION)

  if(NOT TARGET Micromamba::Micromamba)
    add_executable(Micromamba::Micromamba IMPORTED)
  endif()
  set_property(TARGET Micromamba::Micromamba PROPERTY IMPORTED_LOCATION "${Micromamba_EXECUTABLE}")
endif()

unset(MICROMAMBA_SEARCHES)
unset(MICROMAMBA_SEARCH_ROOT)
if(${CMAKE_VERSION} VERSION_LESS 3.19)
  find_package_handle_standard_args(Micromamba REQUIRED_VARS Micromamba_EXECUTABLE Micromamba_VERSION VERSION_VAR Micromamba_VERSION)
else()
  find_package_handle_standard_args(Micromamba REQUIRED_VARS Micromamba_EXECUTABLE Micromamba_VERSION VERSION_VAR Micromamba_VERSION HANDLE_VERSION_RANGE)
endif()
mark_as_advanced(Micromamba_EXECUTABLE Micromamba_VERSION)
