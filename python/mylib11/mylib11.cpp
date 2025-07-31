
#include "mylib/mylib.hpp"

#include <pybind11/eigen.h>
#include <pybind11/pybind11.h>

namespace py = pybind11;

PYBIND11_MODULE(mylib11, m) {
    m.doc() = "Python bindings for mylib C++ library";

    py::class_<MyClass>(m, "MyClass")
        .def(py::init<>())
        .def(py::init<int>(), py::arg("value"))
        .def_readwrite("value", &MyClass::value)
        .def_static("get_origin", &MyClass::get_origin);
}
