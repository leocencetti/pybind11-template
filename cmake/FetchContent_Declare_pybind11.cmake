if(LOCAL_REPOSITORIES_BASE_DIR)
  FetchContent_Declare(pybind11 SOURCE_DIR
                                ${LOCAL_REPOSITORIES_BASE_DIR}/pybind11)
else()
  FetchContent_Declare(
    pybind11
    GIT_REPOSITORY https://github.com/pybind/pybind11.git
    GIT_TAG v2.10.0
    GIT_SHALLOW ON)
endif()
