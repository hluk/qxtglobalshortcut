option(WITH_QT5 "Use Qt 5 (disable to use Qt 4 instead)" ON)

if (WITH_QT5)
    include(${CMAKE_CURRENT_LIST_DIR}/qt5.cmake)
else()
    include(${CMAKE_CURRENT_LIST_DIR}/qt4.cmake)
endif()
