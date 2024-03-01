if(LOCAL_REPOSITORIES_BASE_DIR)
  FetchContent_Declare(gtest SOURCE_DIR ${LOCAL_REPOSITORIES_BASE_DIR}/gtest)
else()
  FetchContent_Declare(
    gtest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.11.0
    GIT_SHALLOW ON)
endif()
