set(LIBRARY_SOURCES
    my_lib.cpp
)
set(
    LIBRARIES_INCLUDES
    ../../include
    ${CONFIGURED_FILE_INCLUDE_DIR}
)

add_library(${LIBRARY_MY_LIB} STATIC ${LIBRARY_SOURCES})
target_include_directories(${LIBRARY_MY_LIB} PUBLIC ${LIBRARIES_INCLUDES})

# naming convention: project_name::library_name
target_link_libraries(
    ${LIBRARY_MY_LIB} 
PUBLIC
    cxxopts::cxxopts
    nlohmann_json::nlohmann_json
    fmt::fmt
    spdlog::spdlog
    Catch2::Catch2
)