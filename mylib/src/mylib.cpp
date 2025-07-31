#include "mylib/mylib.hpp"

MyClass::MyClass() : value(0) {}

MyClass::MyClass(int value) : value(value) {}

std::string MyClass::get_origin() { return std::string("cpp"); }