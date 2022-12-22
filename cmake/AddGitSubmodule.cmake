function(add_git_submodule install_destination)
    find_package(Git REQUIRED)

    if (NOT EXISTS ${install_destination}/CMakeLists.txt)
        message("Update submodule: ${install_destination}")
        execute_process(COMMAND ${GIT_EXECUTABLE}
            submodule update --init --recursive -- ${install_destination}
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        )
    else()
        message("No update for suhmodule ${install_destination}")
    endif()

    add_subdirectory(${install_destination})
endfunction(add_git_submodule)