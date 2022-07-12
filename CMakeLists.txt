cmake_minimum_required(VERSION 3.2)

project(mamba-test LANGUAGES NONE)

set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${PROJECT_SOURCE_DIR}/cmake")

option(BUILD_TESTS "Build the tests" OFF)

include(Micromamba.cmake)

if(BUILD_TESTS)
  micromamba()
  micromamba_environment(CHANNELS conda-forge DEPENDENCIES fmt)

  enable_language(CXX)

  find_package(fmt REQUIRED)

  add_executable(test src/test.cpp)
  target_link_libraries(test fmt::fmt)
endif()
