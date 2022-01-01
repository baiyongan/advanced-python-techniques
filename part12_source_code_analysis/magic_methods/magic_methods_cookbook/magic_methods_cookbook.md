# Python magic methods cookbook 

## 魔法方法简介

**定义**：Python 中的魔法方法是指以双下划线开头和结尾的特殊方法，比如 `__init__` 、 `__abs__` 等。

**应用**：Python 中的内置类定义了非常多的魔法方法。比如 `int` 类。

**查询**：可以用 `dir()` 函数来查看具体有哪些魔法方法。例如：

```python
In [1]: dir(int)
Out[1]:
['__abs__',
 '__add__',
 '__and__',
 '__bool__',
 '__ceil__',
 '__class__',
 '__delattr__',
 '__dir__',
 '__divmod__',
 '__doc__',
 '__eq__',
 '__float__',
 '__floor__',
 '__floordiv__',
 '__format__',
 '__ge__',
 '__getattribute__',
 '__getnewargs__',
 '__gt__',
 '__hash__',
 '__index__',
 '__init__',
 '__init_subclass__',
 '__int__',
 '__invert__',
 '__le__',
 '__lshift__',
 '__lt__',
 '__mod__',
 '__mul__',
 '__ne__',
 '__neg__',
 '__new__',
 '__or__',
 '__pos__',
 '__pow__',
 '__radd__',
 '__rand__',
 '__rdivmod__',
 '__reduce__',
 '__reduce_ex__',
 '__repr__',
 '__rfloordiv__',
 '__rlshift__',
 '__rmod__',
 '__rmul__',
 '__ror__',
 '__round__',
 '__rpow__',
 '__rrshift__',
 '__rshift__',
 '__rsub__',
 '__rtruediv__',
 '__rxor__',
 '__setattr__',
 '__sizeof__',
 '__str__',
 '__sub__',
 '__subclasshook__',
 '__truediv__',
 '__trunc__',
 '__xor__',
 'bit_length',
 'conjugate',
 'denominator',
 'from_bytes',
 'imag',
 'numerator',
 'real',
 'to_bytes']
```

**调用方式**：魔法方法可以直接被调用，但更多的时候，它会在特定情况下被自动调用。

=== "示例1"
    Python 中整数相加的本质
    ```python
    >>> num = 1
    >>> num + 2
    3
    >>> num.__add__(2)
    3
    ```

=== "示例2"
    自定义的类实现 `__add__` 魔法方法

    ```python
    class Vector:
        def __init__(self, x, y):
            self.x = x
            self.y = y
            
        def __add__(self, other):
            new_x = self.x + other.x
            new_y = self.y + other.y
            return Vector(new_x, new_y)
            
    >>> v1 = Vector(1, 2)
    >>> v2 = Vector(3, 4)

    >>> v3 = v1 + v2

    >>> v3.x
    4
    >>> v3.y
    6
    ```

**功能**：魔法方法在 Python 中占有重要的地位，并且**涵盖了你想得到的几乎全部基础功能**，灵活运用可以让你的代码更加简洁高效。