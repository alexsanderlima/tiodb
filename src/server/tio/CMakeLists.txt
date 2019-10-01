cmake_minimum_required (VERSION 3.15)

include(LibBoost)

set(CMAKE_CXX_STANDARD 11)
set(Boost_USE_STATIC_LIBS ON)
set(BOOST_ROOT ${CMAKE_SOURCE_DIR}/third_party/boost/boostlib)

find_package(Boost 1.70 REQUIRED COMPONENTS filesystem regex program_options system date_time thread)

# allow the source files to find headers in /src
include_directories(${PROJECT_SOURCE_DIR}/src/server/tio)

file(GLOB
	SOURCE_FILES
	*.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/*.h
	${TIOCLIENT_INCLUDE}
)

add_executable(tio ${SOURCE_FILES})
target_link_libraries(tio
	PUBLIC
		Boost::filesystem
		Boost::regex
		Boost::program_options
		Boost::system
		Boost::date_time
		Boost::thread
		tioclient
)