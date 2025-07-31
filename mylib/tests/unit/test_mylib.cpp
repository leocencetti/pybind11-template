#include "mylib/mylib.hpp"
#include "gtest/gtest.h"

namespace {

TEST(MyClass, initDefault) {
    MyClass s = MyClass();
    EXPECT_EQ(s.value, 0);
}

TEST(MyClass, getOrigin) {
    MyClass s = MyClass();
    EXPECT_EQ(s.get_origin(), "cpp");
}

} // namespace