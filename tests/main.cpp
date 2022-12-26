#define CATCH_CONFIG_MAIN
#include "catch2/catch.hpp"
#include "my_lib/my_lib.h"
#include <iostream>

TEST_CASE("Factorials are computed.", "[factorial]") {
    REQUIRE(factorial(0) == 1);
    REQUIRE(factorial(3) == 6);
}
