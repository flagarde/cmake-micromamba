cmake_minimum_required(VERSION 3.0...${CMAKE_VERSION} FATAL_ERROR)

project(FetchContentTest LANGUAGES NONE)

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

micromamba(VERSION 1.5.7-0)
micromamba_environment(CHANNELS conda-forge DEPENDENCIES fmt)

find_package(fmt REQUIRED)

add_executable(cmake-micromamba_fetchcontent.test main.cpp)
target_link_libraries(cmake-micromamba_fetchcontent.test fmt::fmt)

install(TARGETS cmake-micromamba_fetchcontent.test RUNTIME DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/install")

cmake_policy(POP)
