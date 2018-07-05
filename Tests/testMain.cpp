//
// Unit tests using the Catch(2) framework.
//
// This file serves as a placeholder for main(), which is generated by Catch.
// General unit tests could be added here.
//
// See the tutorial for an overview: https://github.com/catchorg/Catch2/blob/master/docs/tutorial.md
// This also links to the reference pages.
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"
#include <cstdlib>

//
// get the base directory right for calling AutoTest
//
#ifdef DEBUG
	#define POSTFIX_DEBUG "-debug"
#else
	#define POSTFIX_DEBUG ""
#endif

#ifdef QPU_MODE
	#define POSTFIX_QPU "-qpu"
#else
	#define POSTFIX_QPU ""
#endif

//
// This is a good place to put simple, global tests
//
const char *AUTOTEST_PATH = "obj" POSTFIX_DEBUG POSTFIX_QPU "/bin/AutoTest";


TEST_CASE("Check random specifications for interpreter and emulator2", "[specs]") {
	REQUIRE(system(AUTOTEST_PATH) == 0);
}
