if(LOCAL_REPOSITORIES_BASE_DIR)
  FetchContent_Declare(Format.cmake SOURCE_DIR
                                    ${LOCAL_REPOSITORIES_BASE_DIR}/Format.cmake)
else()
  FetchContent_Declare(
    Format.cmake
    GIT_REPOSITORY https://github.com/TheLartians/Format.cmake.git
    GIT_TAG v1.7.3
    GIT_SHALLOW ON)
endif()
