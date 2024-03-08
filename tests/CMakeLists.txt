project(cmake-micromamba LANGUAGES C CXX)

micromamba(VERSION 1.0.0-1)
micromamba_environment(CHANNELS conda-forge DEPENDENCIES fmt)

find_package(fmt REQUIRED)
add_executable(cmake-micromamba-1.0.test "${CMAKE_CURRENT_SOURCE_DIR}/FetchContent/main.cpp")
target_link_libraries(cmake-micromamba-1.0.test fmt::fmt)
install(TARGETS cmake-micromamba-1.0.test RUNTIME DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/install")

micromamba(VERSION 1.5.0-0)
micromamba_environment(CHANNELS conda-forge DEPENDENCIES fmt)

find_package(fmt REQUIRED)
add_executable(cmake-micromamba-1.5.test "${CMAKE_CURRENT_SOURCE_DIR}/FetchContent/main.cpp")
target_link_libraries(cmake-micromamba-1.5.test fmt::fmt)
install(TARGETS cmake-micromamba-1.5.test RUNTIME DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/install")

if("${CMAKE_VERSION}" VERSION_GREATER 3.11)
  add_subdirectory(FetchContent)
endif()
