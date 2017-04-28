cmake_minimum_required(VERSION 3.0)
project(qxtglobalshortcut VERSION 0.0.1)

# Library name
set(bin qxtglobalshortcut)

# Public headers
set(${bin}_public_headers
    src/qxtglobalshortcut.h
    )

# Source files common for all platforms
set(${bin}_sources
    src/qxtglobalshortcut.cpp
    ${${bin}_public_headers}
    )

# Files with Q_OBJECT macros to pass to moc utility
set(${bin}_moc
    src/qxtglobalshortcut.h
    )

# Required pkg-config packages
set(${bin}_pkg_config_requires)

include(cmake/cxx11.cmake)
include(cmake/library.cmake)
include(cmake/platform.cmake)
include(cmake/qt.cmake)
include(cmake/pkg-config.cmake)
