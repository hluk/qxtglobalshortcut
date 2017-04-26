target_sources(${bin} PRIVATE src/qxtglobalshortcut_x11.cpp)
target_include_directories(${bin} SYSTEM PRIVATE ${X11_INCLUDE_DIR})
target_link_libraries(${bin} ${X11_LIBRARIES})
