# Declare dependencies
# ==============================================================================

include(GoogleTest)

# Build, link and auto-discover tests.
# ==============================================================================

set(XML_OUTPUT_DIR xml)

add_executable(test_mylib test_mylib.cpp)
target_link_libraries(test_mylib PRIVATE mylib_compiler_flags mylib gtest_main)
target_code_coverage(test_mylib ALL)
gtest_discover_tests(test_mylib XML_OUTPUT_DIR ${XML_OUTPUT_DIR})
