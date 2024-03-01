# Declare dependencies
# ==============================================================================

# Make dependencies available but disable testing for them
set(BUILD_TESTING_PREV ${BUILD_TESTING})
set(BUILD_TESTING OFF)
FetchContent_MakeAvailable(gtest)
set(BUILD_TESTING ${BUILD_TESTING_PREV})

# Sub-directories
# ==============================================================================

add_subdirectory(unit)
