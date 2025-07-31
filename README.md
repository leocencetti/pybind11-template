# Template library

## Directory structure

```shell
.
├── cmake
├── mylib
│   ├── include             # header files of C++ library
│   │   └── mylib
│   ├── src                 # source files of C++ library
│   └── tests               # tests for C++ library
│       └── unit
└── python
    ├── mylib               # python module
    ├── mylib11             # python bindings for C++ library
    └── tests               # tests suites, results and coverage reports
        ├── mylib           # tests for python module
        └── mylib11         # tests for C++/pybind11 module
```

## Usage

### Python module and bindings

You can then install the `mylib` and `mylib11` package with pip:

```shell
    pip install .
```

### Build C++ library

```shell
# build using cmake 
cmake -S . -B build -G Ninja
cmake --build build
```

### Code formatting

#### Python

```shell
black .
```

#### C++ / Cmake

```shell
cmake -S . -B build -G Ninja
cmake --build build --target check-format   # check formatting only
cmake --build build --target format         # show differences between current and reformatted code
cmake --build build --target fix-format     # apply reformatting
```

### Testing

Pure python module:

```shell
pip install -e .[test]
pytest -vv python/tests/mylib
```

Bindings module:

```shell
pip install -e .[test]
pytest -vv python/tests/mylib11
```

C++ code:

```shell
cmake -S . -B build -G Ninja
cmake --build build
cmake --build build --target test
```

### Code coverage

Once the python tests are running properly you can get a code coverage report
with:

```shell
coverage run --source=python -m pytest python/tests/mylib && coverage report -m
```

For a detailed analysis of which code sections are covered you can generate an
HTML report. Then open the file `python/tests/coverage/index.html`.

```shell
coverage html -d python/tests/coverage
```
