cmake_minimum_required(VERSION 2.8.8)
project(qxtglobalshortcut_test)

find_package(qxtglobalshortcut REQUIRED)
find_package(Qt5Widgets REQUIRED)

set(bin qxtglobalshortcut_test)
add_executable(${bin} src/main.cpp)

target_link_libraries(${bin} qxtglobalshortcut)
target_link_libraries(${bin} Qt5::Widgets)
