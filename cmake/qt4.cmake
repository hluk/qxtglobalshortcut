find_package(Qt4)
if (NOT QT4_FOUND)
    # Try different executable name.
    set(QT_QMAKE_EXECUTABLE "qmake-qt4")
    find_package(Qt4)
    if (NOT QT4_FOUND)
        message(FATAL_ERROR "Qt 4 is unavailable. To compile with Qt 5 use -DWITH_QT5=ON.")
    endif()
endif()
message(STATUS "Building with Qt 4.")

include_directories(${QT_INCLUDES})
add_definitions(${QT_DEFINITIONS})
include(${QT_USE_FILE})
target_link_libraries(${bin} ${QT_LIBRARIES})

qt4_wrap_cpp(${bin}_mocced ${${bin}_moc})
target_sources(${bin} PRIVATE ${${bin}_mocced})

set(${bin}_pkg_config_requires ${${bin}_pkg_config_requires} QtGui)
