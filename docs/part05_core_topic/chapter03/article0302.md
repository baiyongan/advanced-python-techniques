# 抽象基类（abc 模块）

!!! tip "提示"
    abc —— abstract base class 抽象基类

- 抽象基类是一个虚拟的类, 相当于一个模板, 定义一些方法, 所有继承这个基类的类必须覆盖抽象基类里面的方法
- 抽象基类是无法用来实例化的

## 为什么要有抽象基类?
因为 python 是基于鸭子类型的, 所以其实只要实现某些方法就可以了, 那为什么还要抽象基类呢?

### 用途一: 可以去检查某个类是否有某一种方法

某些情况之下希望判定某个对象的类型，可以使用`hasattr`判断是否实现某方法，或者使用`isinstance`(推荐)去判断一个类是否是指定的类型，`Sized`就是一个实现`__len__`的抽象基类。

#### hassttr & isinstance 两种方法
```python
class Company(object):
    def __init__(self, employee_list):
        self.employee = employee_list

    def __len__(self):
        return len(self.employee)

com = Company(["apple","orange"])

# 使用 hasattr 判断是否有 求长度 的方法
print("Method1: (hasattr)", hasattr(com, "__len__"))

# 使用 isinstance 判断是否有 求长度 的方法
from collections.abc import Sized
print("Method2: (isinstance)", isinstance(com, Sized))
#-------------------------------------------
Method1: (hasattr) True
Method2: (isinstance) True
```

#### isinstane 方法的内部实现方式

Q：为什么 com 没有继承 Sized，但是 isinstance 却能判断出 com 是 Sized 类型？

A：Sized 内部的类方法, 在调用 isinstance(com, Sized) 时 cls 就是 Sized 对象, C 就是 com 对象, 然后判断 com 对象有没有实现 \_\_len\_\_ 方法，同时，isinstance 是 python 中的内置函数，其内部还会做很多的尝试。

```python
# collections.abc.Sized 部分源码
@classmethod
def __subclasshook__(cls, C):
    if cls is Sized:
        return _check_methods(C, "__len__")
    return NotImplemented

# isinstance 还会找到继承链去进行判断
class A:
    pass

class B(A):
    pass

b = B()
print(isinstance(b, A))
#-------------------------------------------
True
```

### 用途二: 做一些接口的强制规定，强制某个子类必须实现某些方法

```python
# 模拟抽象基类, 只有在调用 set 方法的时候才会抛出异常
class CacheBase():
    def get(self, key):
        raise NotImplementedError
    def set(self, key, value):
        raise NotImplementedError

class RedisCache(CacheBase):
    def set(self, key, value):
        pass

redis_cache = RedisCache()
redis_cache.set("key", "value")

# 使用 abc 模块, 在初始化的时候就会去判断有没有重载基类的方法,没有就抛异常
import abc

class CacheBase(metaclass=abc.ABCMeta):
    @abc.abstractmethod
    def get(self, key):
        pass

    @abc.abstractmethod
    def set(self, key, value):
        pass

class RedisCache(CacheBase):
    def set(self, key, value):
        pass
    def get(self, key):
        pass

redis_cache = RedisCache()
```

## collection.abc 模块

在这个模块中定义了很多通用的抽象基类, 比如 Sized. 但是这些抽象基类定义出来并不是用来继承的, python 内部这么做，更多的是让我们理解其继承关系，以及一些接口的一些定义，可以理解成一种代码的文档。

!!! attention "注意"
    鸭子类型是 python 语言的一个根本，在实际编码中，尽量使用 python 的鸭子类型，比较灵活。如果一定要继承某些接口的话，推荐使用多继承(Mixin)方式实现, 而不是使用抽象基类的方式，因为后者很容易设计过度。

```python
# Pycharm 中 Ctrl＋鼠标左键，点击跳转，查看源码
# from collections.abc import Sized (点击 abc)
# from _collections_abc import __all__ （点击 __all__）

__all__ = ["Awaitable", "Coroutine",
           "AsyncIterable", "AsyncIterator", "AsyncGenerator",
           "Hashable", "Iterable", "Iterator", "Generator", "Reversible",
           "Sized", "Container", "Callable", "Collection",
           "Set", "MutableSet",
           "Mapping", "MutableMapping",
           "MappingView", "KeysView", "ItemsView", "ValuesView",
           "Sequence", "MutableSequence",
           "ByteString",
           ]
# This module has been renamed from collections.abc to _collections_abc to
# speed up interpreter startup. Some of the types such as MutableMapping are
# required early but collections module imports a lot of other modules.
# See issue #19218
__name__ = "collections.abc"
```

## 声明抽象基类

- metaclass = abc.ABCMeta
- @abc.abstractmethod

