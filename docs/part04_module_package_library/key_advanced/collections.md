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

collections 中，最常用的是 defaultdict 和 namedtuple。

## tuple 的功能

### 不可变（immutable），可迭代（iterable）

### 通过拆包的方式来访问数据

### tuple 的不可变也不是绝对的

保证其中元素的 id 不变即可，但是一般不将可变对象放在 tuple 中

### tuple 比 list 好的地方

主要是 immutable 的特性：

- 性能安全：指出元素全部为 immutable 的 tuple 会作为常量在编译时确定，因此产生了如此显著的速度差异
- 线程安全
- **可以作为 dict 的 key**：只有 hashable 的对象，才能作为 dict 的 key
- 拆包特性

!!! tip
    如果用 C 语言来类比，tuple 对应的是 struct，而 list 对应的是 array

## namedtuple 的功能
## defaultdict 的功能
## deque 的功能
## Counter 功能
## OrderedDict 功能
## ChainMap 功能
## 总结
## 拓展阅读

