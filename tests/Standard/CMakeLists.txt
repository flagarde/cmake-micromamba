project(fmt-tests LANGUAGES C CXX)

micromamba()
micromamba_environment(CHANNELS conda-forge DEPENDENCIES fmt)

find_package(fmt REQUIRED)

add_executable(cmake_mamba_fmt.test src/test.cpp)
target_link_libraries(cmake_mamba_fmt.test fmt::fmt)
