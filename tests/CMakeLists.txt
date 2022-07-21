micromamba()
micromamba_environment(CHANNELS conda-forge DEPENDENCIES fmt)

enable_language(CXX)

find_package(fmt REQUIRED)

add_executable(cmake_mamba_fmt.test src/test.cpp)
target_link_libraries(cmake_mamba_fmt.test fmt::fmt)
