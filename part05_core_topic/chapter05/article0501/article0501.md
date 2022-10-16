# dict 的 abc 继承关系

通过 collections 模块的抽象基类, 来理解 python 中 dict 的继承关系, 此处着重关注 Mapping 和 MutableMapping。

```python
from collections.abc import Mapping, MutableMapping
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

dict 其实是属于`MutableMapping`, 它继承`Mapping`, `Mapping`继承`Collection`, 里面包括`__len__`,`__iter__`, `__contains__`, 所以dict和序列有很多接近的地方。

```python
from collections.abc import Mapping, MutableMapping
#dict属于mapping类型

a = {}
print (isinstance(a, MutableMapping))
>>> True
```

!!! attention "注意"
    a是一个dict对象, 它并不是继承了`MutableMapping`, 而是实现了`MutableMapping`中的方法和魔法函数。源码中，是 `MutableMapping.register(dict)` 的方式实现的。