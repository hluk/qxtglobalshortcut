find_package(Qt5Widgets)
if (NOT Qt5Widgets_FOUND)
    message(FATAL_ERROR "Qt 5 is unavailable. To compile with Qt 4 use -DWITH_QT5=OFF.")
endif()
message(STATUS "Building with Qt 5.")

include_directories(${Qt5Gui_PRIVATE_INCLUDE_DIRS})
target_link_libraries(${bin} Qt5::Widgets)

qt5_wrap_cpp(${bin}_mocced ${${bin}_moc})
target_sources(${bin} PRIVATE ${${bin}_mocced})
