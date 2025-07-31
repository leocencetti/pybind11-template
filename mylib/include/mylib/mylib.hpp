#pragma once

#include <Eigen/Core>
#include <Eigen/Geometry>

using Eigen::Quaterniond;
using Eigen::Vector3d;

class MyClass {
  public:
    MyClass();

    MyClass(int value);

    static std::string get_origin();

    int value;
};
