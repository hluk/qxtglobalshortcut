target_sources(${bin} PRIVATE src/qxtglobalshortcut_mac.cpp)

# On Macs we must ensure Carbon and Cocoa are linked
#
# We do this using a macro taken from:
# http://stackoverflow.com/questions/12547624/cant-link-macos-frameworks-with-cmake?rq=1

#macro(ADD_FRAMEWORK fwname appname)
#    find_library(FRAMEWORK_${fwname}
#    NAMES ${fwname}
#    PATHS ${CMAKE_OSX_SYSROOT}/System/Library
#    PATH_SUFFIXES Frameworks
#    NO_DEFAULT_PATH)
#    if( ${FRAMEWORK_${fwname}} STREQUAL FRAMEWORK_${fwname}-NOTFOUND)
#        MESSAGE(ERROR ": Framework ${fwname} not found")
#    else()
#        TARGET_LINK_LIBRARIES(${appname} "${FRAMEWORK_${fwname}}/${fwname}")
#        MESSAGE(STATUS "Framework ${fwname} found at ${FRAMEWORK_${fwname}}")
#    endif()
#endmacro(ADD_FRAMEWORK)

#ADD_FRAMEWORK(Carbon ${bin})
#ADD_FRAMEWORK(Cocoa ${bin})

set(MAC_LIBS)

FIND_LIBRARY( CARBON_LIBRARY Carbon )
LIST( APPEND MAC_LIBS ${CARBON_LIBRARY} )

FIND_LIBRARY( COCOA_LIBRARY Cocoa )
LIST( APPEND MAC_LIBS ${COCOA_LIBRARY} )

TARGET_LINK_LIBRARIES(${bin} ${MAC_LIBS})
