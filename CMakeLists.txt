cmake_minimum_required(VERSION 3.22)

set(This SuperHelloWorld)

project(
    ${This}
    VERSION 1.0.0
    LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARDCONFIGURED_FILE_INCLUDE_DIR_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(LIBRARY_MY_LIB my_lib)
set(EXE_APP app)
set(CONFIGURED_FILE_INCLUDE_DIR ${CMAKE_BINARY_DIR}/configured_files/include)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

include(AddGitSubModule)
include(FetchContent)

FetchContent_Declare(
    nlohmann_json 
    GIT_REPOSITORY https://github.com/nlohmann/json.git
    GIT_TAG v3.11.2
    GIT_SHALLOW TRUE
)
FetchContent_Declare(
    fmt 
    GIT_REPOSITORY https://github.com/fmtlib/fmt
    GIT_TAG 9.1.0
    GIT_SHALLOW TRUE
)
FetchContent_Declare(
    spdlog 
    GIT_REPOSITORY https://github.com/gabime/spdlog
    GIT_TAG v1.11.0
    GIT_SHALLOW TRUE
)
FetchContent_Declare(
    cxxopts 
    GIT_REPOSITORY https://github.com/jarro2783/cxxopts
    GIT_TAG v3.0.0
    GIT_SHALLOW TRUE
)
FetchContent_Declare(
    Catch2 
    GIT_REPOSITORY https://github.com/catchorg/Catch2
    GIT_TAG v2.13.9
    GIT_SHALLOW TRUE
)

FetchContent_MakeAvailable(nlohmann_json)
FetchContent_MakeAvailable(fmt)
FetchContent_MakeAvailable(spdlog)
FetchContent_MakeAvailable(cxxopts)
FetchContent_MakeAvailable(Catch2)



option(COMPILE_EXECUTABLE "Whether to compile to executable" ON)

add_subdirectory(src)
# add_subdirectory(external/json)
# add_git_submodule("external/json")
add_subdirectory(configured)


if(COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("W/o ext. compiling")
endif()
