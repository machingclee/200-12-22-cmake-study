#include "my_lib/my_lib.h"
#include "nlohmann/json.hpp"
// #include "config.h"

/**
 * @brief Prints out hello world and test the json library.
 *
 */
void print_hello_world()
{
    std::cout
        << "major version!"
        << NLOHMANN_JSON_VERSION_MAJOR
        << std::endl;
}
