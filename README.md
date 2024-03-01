# Template library


## Directory structure

```bash
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
        ├── mylib11         # tests for C++/pybind11 module
        └── mylib           # tests for python module
```


## Usage

### Python module

You can then install the `mylib` package with pip:

```bash
    pip install .
```


### Build C++ library

```bash
# build using cmake 
cmake -S . -B build -G Ninja
cmake --build build
```

### Code formatting

#### Python

```
black .
```

#### C++ / cmake

```bash
cmake -S . -B build -G Ninja
cmake --build build --target check-format   # check formatting only
cmake --build build --target format         # show differences between current and reformatted code
cmake --build build --target fix-format     # apply reformatting
```

### Testing
Pure python module:
```
pip install -e .[TEST]
pytest -vv python/tests
```

Bindings module:

```
pip install -e .[TEST]
cmake -S . -B build -G Ninja
cmake --build build
PYTHONPATH=build/python/mylib11 pytest -vv python/tests/mylib11
```

C++ code:
```
cmake -S . -B build -G Ninja
cmake --build build --target test
```

### Code coverage

Once the python tests are running properly you can get a code coverage report
with:

```bash
coverage run --source=python -m pytest python/tests/mylib && coverage report -m
```

For a detailed analysis of which code sections are covered you can generate an
HTML report. Then open the file `python/tests/coverage/index.html`.

```bash
coverage html -d python/tests/coverage
```
