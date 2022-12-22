#include <iostream>
#include "my_lib/my_lib.h"
#include "nlohmann/json.hpp"
#include "cxxopts.hpp"
#include "fmt/format.h"
#include "spdlog/spdlog.h"
#include "catch2/catch.hpp"

int main()
{
    std::cout << "JSON Lib Version:"
              << NLOHMANN_JSON_VERSION_MAJOR << "."
              << NLOHMANN_JSON_VERSION_MINOR << "."
              << NLOHMANN_JSON_VERSION_PATCH << std::endl;

    print_hello_world();
}