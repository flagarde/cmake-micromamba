cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

cmake_policy(PUSH)

if(POLICY CMP0054)
  cmake_policy(SET CMP0054 NEW)
endif()

project(cmake-micromamba LANGUAGES NONE)

set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${PROJECT_SOURCE_DIR}/cmake" "${PROJECT_SOURCE_DIR}")

option(BUILD_TESTS "Build the tests" OFF)

include(Micromamba)

if(BUILD_TESTS)
  add_subdirectory(tests)
endif()

cmake_policy(POP)
