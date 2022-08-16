cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

cmake_policy(PUSH)

if(POLICY CMP0054)
  cmake_policy(SET CMP0054 NEW)
endif()

include(FetchContent)
FetchContent_Declare(cmake-micromamba
                     GIT_REPOSITORY https://github.com/flagarde/cmake-micromamba.git
                     GIT_TAG        main)
FetchContent_MakeAvailable(cmake-micromamba)

project(PreProject LANGUAGES NONE)

micromamba()
micromamba_environment(CHANNELS conda-forge DEPENDENCIES cxx-compiler)

enable_language(CXX)

add_executable(main main.cpp)
install(TARGETS main RUNTIME DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/PreProject")

cmake_policy(POP)
