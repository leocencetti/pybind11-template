cmake_minimum_required(VERSION 3.16)
project(
  mylib
  VERSION 0.0.1
  LANGUAGES C CXX)

# Project options
# ==============================================================================

option(BUILD_SHARED_LIBS "Build using shared libraries" OFF)
option(PYTHON_BINDINGS "Build python bindings" ON)
option(BUILD_DOC "Enable building the documentation" ON)
option(BUILD_TESTING "Build C++ unit tests" ON)

# Always export compile commands
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Declare dependencies
# ==============================================================================

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
include(CTest)
include(FetchContent)
include(CMakePackageConfigHelpers)
include(code-coverage)

# Declare dependencies
# ==============================================================================

include(FetchContent_Declare_FormatCmake)
include(FetchContent_Declare_Eigen3)
include(FetchContent_Declare_gtest)

# Make dependencies available but disable testing for them
set(BUILD_TESTING_PREV ${BUILD_TESTING})
set(BUILD_TESTING OFF)
FetchContent_MakeAvailable(Format.cmake Eigen3)
set(BUILD_TESTING ${BUILD_TESTING_PREV})

# Configure global code coverage
# ==============================================================================

set(COVERAGE_EXCLUDE_PATTERNS /usr/* */tests/unit/*)
if(LOCAL_REPOSITORIES_BASE_DIR)
  list(APPEND COVERAGE_EXCLUDE_PATTERNS ${LOCAL_REPOSITORIES_BASE_DIR}/*)
endif()
add_code_coverage_all_targets(EXCLUDE ${COVERAGE_EXCLUDE_PATTERNS})

# Sub-directories
# ==============================================================================

add_subdirectory(mylib)
add_subdirectory(python)

# TODO: install
