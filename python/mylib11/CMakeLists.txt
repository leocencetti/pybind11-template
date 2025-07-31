# Declare dependencies
# ==============================================================================

include(FetchContent_Declare_pybind11)
FetchContent_MakeAvailable(pybind11)

set(PYBIND11_FINDPYTHON ON)
find_package(pybind11 CONFIG REQUIRED)

# Pybind 11 module
# ==============================================================================

pybind11_add_module(mylib11 mylib11.cpp)
# request access to private headers
set_target_properties(mylib11 PROPERTIES MYLIB_PRIVATE TRUE)
target_link_libraries(mylib11 PRIVATE mylib)

# Install library file
install(TARGETS mylib11 DESTINATION .)
