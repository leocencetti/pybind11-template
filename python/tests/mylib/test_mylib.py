import pytest

import mylib as lib


@pytest.fixture
def my_class() -> lib.MyClass:
    return lib.MyClass()


def test_myclass_init(my_class):
    assert my_class.value == 0
