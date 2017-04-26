option(CREATE_STATIC_LIBRARY "Create static library" OFF)

if (CREATE_STATIC_LIBRARY)
    add_definitions( -DQXT_STATIC )
    set(libtype STATIC)
else()
    set(libtype SHARED)
endif()

add_library(${bin} ${libtype} ${${bin}_sources})
set_target_properties(${bin} PROPERTIES
    VERSION ${${bin}_VERSION_STRING}
    SOVERSION ${${bin}_VERSION_MAJOR}
    )

# Public headers
target_include_directories(${bin} INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
    $<INSTALL_INTERFACE:include/${bin}>
    )

# Generate and install CMake files for the library so `find_package(<Library>)` can be used with CMake.
# For more info: https://cmake.org/cmake/help/v3.0/manual/cmake-packages.7.html#creating-packages
include(GenerateExportHeader)
generate_export_header(${bin})

install(TARGETS ${bin} EXPORT ${bin}Targets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include/${bin}
    )

install(
    FILES
        ${${bin}_public_headers}
    DESTINATION
        include/${bin}
    COMPONENT
        Devel
    )

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${bin}ConfigVersion.cmake"
    VERSION ${${bin}_VERSION_STRING}
    COMPATIBILITY AnyNewerVersion
    )

export(EXPORT ${bin}Targets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/${bin}Targets.cmake"
    )
configure_file(cmake/${bin}Config.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/${bin}Config.cmake"
    COPYONLY
    )

set(ConfigPackageLocation lib/cmake/${bin})
install(EXPORT ${bin}Targets
  FILE
      ${bin}Targets.cmake
  DESTINATION
      ${ConfigPackageLocation}
)
install(
  FILES
      "${CMAKE_CURRENT_BINARY_DIR}/${bin}Config.cmake"
      "${CMAKE_CURRENT_BINARY_DIR}/${bin}ConfigVersion.cmake"
  DESTINATION
      ${ConfigPackageLocation}
  COMPONENT
      Devel
)
