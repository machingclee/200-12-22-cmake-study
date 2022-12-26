if(${ENABLE_TESTING})
  set(TEST_SOURCE "main.cpp")
  set(TEST_EXE "unit_tests")
  set(TEST_INCLUDES "./")

  add_executable(${TEST_EXE} ${TEST_SOURCE})
  target_include_directories(${TEST_EXE} PUBLIC ${TEST_INCLUDES})
  target_link_libraries(${TEST_EXE} PUBLIC ${LIBRARY_MY_LIB} Catch2::Catch2)
endif()



