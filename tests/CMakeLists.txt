if(${CMAKE_VERSION} VERSION_LESS 3.11)
else()
  message(STATUS "Test \"PreProject\"")
  execute_process(COMMAND ${CMAKE_COMMAND} -B "${CMAKE_CURRENT_BINARY_DIR}/PreProject" -S "${CMAKE_CURRENT_SOURCE_DIR}/PreProject")
  execute_process(COMMAND ${CMAKE_COMMAND} --build "${CMAKE_CURRENT_BINARY_DIR}/PreProject")
endif()

message(STATUS "Test \"Standard\"")
add_subdirectory(Standard)
