# Download and unpack lib boost at configure time
configure_file(${PROJECT_SOURCE_DIR}/cmake/LibBoost.cmake.in ${PROJECT_SOURCE_DIR}/third_party/boost/CMakeLists.txt @ONLY)

execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" -S . -B build
	RESULT_VARIABLE result
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/third_party/boost/
)

if(result)
	message(FATAL_ERROR "CMake step for libboost failed: ${result}")
endif()

execute_process(
	COMMAND ${CMAKE_COMMAND} --build build
	RESULT_VARIABLE result
	WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/third_party/boost/
)

if(result)
	message(FATAL_ERROR "Build step for libboost failed: ${result}")
endif()