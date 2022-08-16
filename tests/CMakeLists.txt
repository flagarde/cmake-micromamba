if(${CMAKE_VERSION} VERSION_LESS 3.11)
else()
  message(STATUS "Test \"PreProject\"")
  execute_process(COMMAND ${CMAKE_COMMAND} -B "${CMAKE_CURRENT_BINARY_DIR}/PreProject" -S "${CMAKE_CURRENT_SOURCE_DIR}/PreProject")
  execute_process(COMMAND ${CMAKE_COMMAND} --build "${CMAKE_CURRENT_BINARY_DIR}/PreProject")
endif()

# Some bug with CMake 3.11 and 3.12 that mix the two tests so skip this one !
if(${CMAKE_VERSION} VERSION_LESS 3.11 OR ${CMAKE_VERSION} VERSION_GREATER 3.12.99)
  message(STATUS "Test \"Standard\"")
  add_subdirectory(Standard)
endif()
