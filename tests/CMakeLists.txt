message(STATUS "Test \"Standard\"")
add_subdirectory(Standard)

message(STATUS "Test \"PreProject\"")
execute_process(COMMAND ${CMAKE_COMMAND} -B "${CMAKE_CURRENT_BINARY_DIR}/PreProject" -S "${CMAKE_CURRENT_SOURCE_DIR}/PreProject")
execute_process(COMMAND ${CMAKE_COMMAND} --build "${CMAKE_CURRENT_BINARY_DIR}/PreProject")
