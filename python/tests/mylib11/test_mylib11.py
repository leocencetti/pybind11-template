import pytest

import mylib11 as lib11


@pytest.fixture
def my_class() -> lib11.MyClass:
    return lib11.MyClass()


def test_myclass_init(my_class):
    assert my_class.value == 0
