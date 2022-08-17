cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

cmake_policy(PUSH)

if(POLICY CMP0054)
  cmake_policy(SET CMP0054 NEW)
endif()

include(FetchContent)
FetchContent_Declare(cmake-micromamba GIT_REPOSITORY https://github.com/flagarde/cmake-micromamba.git GIT_TAG main)

if(${CMAKE_VERSION} VERSION_LESS 3.14)
  FetchContent_GetProperties(cmake-micromamba)
  if(NOT cmake-micromamba_POPULATED)
    FetchContent_Populate(cmake-micromamba)
    add_subdirectory(${cmake-micromamba_SOURCE_DIR} ${cmake-micromamba_BINARY_DIR})
  endif()
else()
  FetchContent_MakeAvailable(cmake-micromamba)
endif()

project(PreProject LANGUAGES NONE)

micromamba()
micromamba_environment(CHANNELS conda-forge DEPENDENCIES cxx-compiler fmt)

enable_language(CXX)

find_package(fmt REQUIRED)

find_package(fmt REQUIRED)
add_executable(cmake_mamba_fmt.test main.cpp)
target_link_libraries(cmake_mamba_fmt.test fmt::fmt)
install(TARGETS cmake_mamba_fmt.test RUNTIME DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/install")

cmake_policy(POP)
