cmake_minimum_required (VERSION 3.5.1)

include(LibBoost)

# allow the source files to find headers in /src
include_directories(${PROJECT_SOURCE_DIR}/src)

file(GLOB
	SOURCE_FILES
	*.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/*.h
)

add_executable(tiodb ${SOURCE_FILES})
