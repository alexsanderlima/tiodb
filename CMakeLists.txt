cmake_minimum_required (VERSION 3.5.1)
project (tiodb CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

add_subdirectory(src)