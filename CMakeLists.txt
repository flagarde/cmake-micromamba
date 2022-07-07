cmake_minimum_required(VERSION 3.2)


set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_SOURCE_DIR}/cmake")

project(mamba-test LANGUAGES NONE)

include(Micromamba.cmake)
micromamba()
micromamba_environment(CHANNELS conda-forge DEPENDENCIES fmt)

enable_language(CXX)

find_package(fmt REQUIRED)

add_executable(test src/test.cpp)
target_link_libraries(test fmt::fmt)
