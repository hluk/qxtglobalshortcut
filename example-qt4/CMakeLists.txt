cmake_minimum_required(VERSION 2.8.8)
project(qxtglobalshortcut_test)

include(../cmake/cxx11.cmake)

find_package(qxtglobalshortcut REQUIRED)

find_package(Qt4 REQUIRED)
include_directories(${QT_INCLUDES})
add_definitions(${QT_DEFINITIONS})
include(${QT_USE_FILE})

set(bin qxtglobalshortcut_test)
add_executable(${bin} src/main.cpp)
target_link_libraries(${bin} qxtglobalshortcut)
target_link_libraries(${bin} ${QT_LIBRARIES})
