# collections 模块

## collections 模块简介

```python
from collections import * 
# 在 Pycharm 中查看源码，截取如下
# * namedtuple   factory function for creating tuple subclasses with named fields
# * deque        list-like container with fast appends and pops on either end
# * ChainMap     dict-like class for creating a single view of multiple mappings
# * Counter      dict subclass for counting hashable objects
# * OrderedDict  dict subclass that remembers the order entries were added
# * defaultdict  dict subclass that calls a factory function to supply missing values
# * UserDict     wrapper around dictionary objects for easier dict subclassing
# * UserList     wrapper around list objects for easier list subclassing
# * UserString   wrapper around string objects for easier string subclassing

__all__ = ['deque', 'defaultdict', 'namedtuple', 'UserDict', 'UserList',
            'UserString', 'Counter', 'OrderedDict', 'ChainMap']

# 抽象基类，类似于 java 中的 interface
from collections.abc import * 
```

其中，UserDict、UserList、UserString 实际上，是 python 的抽象基类使用到的，一般不会直接使用。
最常用的是 defaultdict 和 namedtuple

## tuple的功能
## namedtuple的功能
## defaultdict的功能
## deque的功能
## Counter功能
## OrderedDict功能
## ChainMap功能
## 总结
## 拓展阅读

