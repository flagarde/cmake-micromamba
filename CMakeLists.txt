cmake_minimum_required(VERSION 3.0...${CMAKE_VERSION} FATAL_ERROR)

cmake_policy(PUSH)

if(POLICY CMP0054)
  cmake_policy(SET CMP0054 NEW)
endif()

project(cmake-micromamba VERSION 1.0 LANGUAGES NONE)
set(PROJECT_DESCRIPTION "Install dependencies using micromamba directly from a CMake script")
set(PROJECT_HOMEPAGE_URL "https://github.com/flagarde/cmake-micromamba")

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

option(BUILD_TESTS "Build the tests" OFF)

include(Micromamba)

if(BUILD_TESTS)
  add_subdirectory(tests)
endif()

cmake_policy(POP)
