# Version information
# ==============================================================================

configure_file(src/mylib_version.h.in mylib_version.h)

# Compiler flags
# ==============================================================================

add_library(mylib_compiler_flags INTERFACE)

# Create target and set properties
# ==============================================================================
# A (test) target (e.g. test_foo) linking against mylib, may request access to
# private headers by setting the property MYLIB_PRIVATE to TRUE:
# `set_property(TARGET test_foo PROPERTY MYLIB_PRIVATE TRUE)` See:
# https://gitlab.kitware.com/cmake/cmake/-/issues/19048

# Main C++ mylib library
# ------------------------------------------------------------------------------
add_library(mylib)
target_code_coverage(mylib)

set(MYLIB_PUBLIC_HEADERS include/mylib/mylib.hpp)
target_sources(mylib PRIVATE ${MYLIB_PUBLIC_HEADERS} src/mylib.cpp)
set_target_properties(
  mylib
  PROPERTIES
    PUBLIC_HEADER "${MYLIB_PUBLIC_HEADERS}"
    VERSION
    "${mylib_VERSION_MAJOR}.${mylib_VERSION_MINOR}.${mylib_VERSION_PATCH}"
    SOVERSION "${mylib_VERSION_MAJOR}")
target_include_directories(
  mylib PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)
target_link_libraries(
  mylib
  PUBLIC Eigen3::Eigen
  PRIVATE mylib_compiler_flags)

# Install instructions
# ==============================================================================

install(
  TARGETS mylib mylib_compiler_flags
  EXPORT mylibTargets
  LIBRARY DESTINATION lib
  PUBLIC_HEADER DESTINATION include/mylib)

# Add tests
# ==============================================================================

if(BUILD_TESTING)
  add_subdirectory(tests)
endif()
