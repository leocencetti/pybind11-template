from dataclasses import dataclass


@dataclass
class MyClass:
    value: int = 0

    @staticmethod
    def get_origin() -> str:
        return "python"
