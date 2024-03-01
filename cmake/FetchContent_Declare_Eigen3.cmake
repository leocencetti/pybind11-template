if(LOCAL_REPOSITORIES_BASE_DIR)
  FetchContent_Declare(Eigen3 SOURCE_DIR ${LOCAL_REPOSITORIES_BASE_DIR}/Eigen)
else()
  FetchContent_Declare(
    Eigen3
    GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
    GIT_TAG 3.4.0
    GIT_SHALLOW ON)
endif()
