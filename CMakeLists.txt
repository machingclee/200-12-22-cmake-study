cmake_minimum_required(VERSION 3.22)

set(This SuperHelloWorld)

project(
    ${This}
    VERSION 1.0.0
    LANGUAGES C CXX
)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARDCONFIGURED_FILE_INCLUDE_DIR_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(LIBRARY_MY_LIB my_lib)
set(EXE_APP app)

set(CONFIGURED_FILE_INCLUDE_DIR ${CMAKE_BINARY_DIR}/configured_files/include)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

include(AddGitSubModule)
include(FetchContent)

option(COMPILE_EXECUTABLE "Whether to compile to executable" ON)
option(ENABLE_TESTING "Enable a unit testing build" OFF)
option(USE_CONAN "Whether to use conan" ON)
option(USE_VCPKG "Whether ot use vcpkg" OFF)

add_subdirectory(src)
add_subdirectory(configured)
add_subdirectory(tests)



if(COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("W/o ext. compiling")
endif()

if(USE_CONAN)
    message("Using Conan")
    include(${CMAKE_BINARY_DIR}/conan_paths.cmake)
    find_package(nlohmann_json)
    find_package(fmt)
    find_package(spdlog)
    find_package(Catch2)
    find_package(cxxopts)
elseif(USE_VCPKG)
    message("Using VCPKG")
    include(${CMAKE_SOURCE_DIR}/external/vcpkg/scripts/buildsystems/vcpkg.cmake)
    find_package(nlohmann_json)
    find_package(fmt)
    find_package(spdlog)
    find_package(Catch2)
    find_package(cxxopts)
else()
    message("Using FetchContent")
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
endif()
