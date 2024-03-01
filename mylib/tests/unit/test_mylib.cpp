#include "mylib/mylib.hpp"
#include "gtest/gtest.h"

namespace {

TEST(MyClass, initDefault) {
    MyClass s = MyClass();
    EXPECT_EQ(s.value, 0);
}

} // namespace