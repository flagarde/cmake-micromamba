project(cmake-micromamba LANGUAGES C CXX)

micromamba(VERSION 1.0.0-1)
micromamba_environment(CHANNELS conda-forge DEPENDENCIES fmt)

find_package(fmt REQUIRED)
add_executable(cmake-micromamba.test "${CMAKE_CURRENT_SOURCE_DIR}/PreProject/main.cpp")
target_link_libraries(cmake-micromamba.test fmt::fmt)
install(TARGETS cmake-micromamba.test RUNTIME DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/install")

if("${CMAKE_VERSION}" VERSION_GREATER 3.11)
  add_subdirectory(FetchContent)
endif()
