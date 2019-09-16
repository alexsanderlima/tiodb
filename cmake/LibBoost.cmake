message("VS version: ${MSVC_VERSION}")
message("${boost_toolset}")

if(MSVC_VERSION EQUAL 1916) #VS2017
    set(BOOST_TOOLSET "msvc-14.1")
endif()

# Download and unpack lib boost at configure time
configure_file(${PROJECT_SOURCE_DIR}/cmake/LibBoost.cmake.in ${PROJECT_SOURCE_DIR}/third_party/boost/CMakeLists.txt @ONLY)

execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" -S . -B build
        RESULT_VARIABLE result
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/third_party/boost/
)

if(result)
        message(FATAL_ERROR "CMake step for libboost failed: ${result}")
endif()
