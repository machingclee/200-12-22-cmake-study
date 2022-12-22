add_executable(EXE_APP main.cpp)

target_link_libraries(EXE_APP PUBLIC 
    ${LIBRARY_MY_LIB}
    nlohmann_json
)

