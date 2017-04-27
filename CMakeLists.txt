cmake_minimum_required(VERSION 2.8.8)
project(qxtglobalshortcut)

# Library name
set(bin qxtglobalshortcut)

# Library version
set(${bin}_VERSION_MAJOR 0)
set(${bin}_VERSION_MINOR 0)
set(${bin}_VERSION_PATCH 1)
set(${bin}_VERSION_STRING ${${bin}_VERSION_MAJOR}.${${bin}_VERSION_MINOR}.${${bin}_VERSION_PATCH})

# Public headers
set(${bin}_public_headers
    src/qxtglobal.h
    src/qxtglobalshortcut.h
    )

# Source files common for all platforms
set(${bin}_sources
    src/qxtglobal.cpp
    src/qxtglobalshortcut.cpp
    ${${bin}_public_headers}
    )

# Files with Q_OBJECT macros to pass to moc utility
set(${bin}_moc
    src/qxtglobalshortcut.h
    )

add_definitions("-DBUILD_QXT_GUI")

include(cmake/cxx11.cmake)
include(cmake/library.cmake)
include(cmake/platform.cmake)
include(cmake/qt.cmake)
