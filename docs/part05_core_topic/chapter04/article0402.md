# 序列的abc继承关系


## collections.abc 

和容器相关的数据结构的抽象基类,都在 `from collections import abc` 这个模块，打开`from _collections_abc import all`，在`_collections_abc.py`模块里面可以看到内容如下：

```python
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
```

!!! note "提示"
    在 \_\_all\_\_ 中，着重关注 “Sequence”, “MutableSequence”, Sequence 是不可变序列类型，MutableSequence 是可变序列类型

## Sequence

```python
# Sequence 继承了两个类 Reversible, Collection
class Sequence(Reversible, Collection):
    # 抽象方法的标识，如果用它必须重写这个方法    
    @abstractmethod            
```

### Reversible 类

Reversible是序列的翻转，例如ABC变成CBA

### Collection 类

Collection 继承了 Sized，Iterable 和 Container 三个抽象基类
```python
class Collection(Sized, Iterable, Container):   
    # Sized 里面有魔法函数__len__,可以计算序列的长度
    # Iterable 是个迭代器, 有了它可以进行for循环
    # Container里面有魔法函数__contains__，因此可以用in这个字段，例如 if i in list()   

    __slots__ = ()

    @classmethod
    def __subclasshook__(cls, C):
        if cls is Collection:
            return _check_methods(C,  "__len__", "__iter__", "__contains__")
        return NotImplemented
```

Sequence的所有魔法函数构成了序列的协议,	打开Sequence类，可以看到里面重写了所继承的抽象基类的方法,包括`__len__`,`__iter__`和`__contains__`.

## MutableSequence

MutableSequence是可变的序列, 它继承了Sequence，并新加了一些特性。如 setitem, delitem, insert, append, clear, reverse, extend, pop, remove, iadd等, 这些都是可变序列的特性。

```python
class MutableSequence(Sequence):

    __slots__ = ()

    """All the operations on a read-write sequence.

    Concrete subclasses must provide __new__ or __init__,
    __getitem__, __setitem__, __delitem__, __len__, and insert().

    """

    @abstractmethod
    def __setitem__(self, index, value):
        raise IndexError

    @abstractmethod
    def __delitem__(self, index):
        raise IndexError

    @abstractmethod
    def insert(self, index, value):
        'S.insert(index, value) -- insert value before index'
        raise IndexError
```
