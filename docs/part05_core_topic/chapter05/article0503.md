# dict 的子类

## 不建议直接继承 list 或 dict

dict 作为 python 中的内置类型，是一个类, 但是如果按照如下 method 1 方式直接继承它，发现值没有变化, 查看dict的源码, 并没有实现`__setitem__`, 这个方法没有做任何处理，并不适用继承。

```python
class MyDict(dict):
    def __setitem__(self, key, value):
        super().__setitem__(key,value*value)

# method 1
my_dict = MyDict(one=2)  # 直接实例化时，并没有调用 __setitem__ 方法
print(my_dict)
# method 2
my_dict["one"] = 2  # 赋值时，调用了 __setitem__ 方法
print(my_dict)
>>>
{'one': 2}
{'one': 4}
```

### collections 模块中的 UserDict

```python
def __setitem__(self, *args, **kwargs): # real signature unknown
    """ Set self[key] to value. """
    pass
```
这个时候我们需要继承 UserDict, 它是继承于`MutableMapping`:

```python
from collections import UserDict
class MyDict(UserDict):
    def __setitem__(self, key, value):
        super().__setitem__(key,value*value)

a = MyDict(one=2)
print(a["one"])
>>> 4
```
在UserDict的源码中是实现了:

```python
def __setitem__(self, key, item): self.data[key] = item
```
所以如果需要继承 dict, 应该去继承 UserDict. 可以理解为 dict 是使用 C 语言去实现, 而 UserDict 是使用 python 语言去实现了一遍 dict。

### collections 模块中的 defaultdict

defaultdict是dict的一个子类, 

我们来看一下`UserDict`中的`__getitem__`的:

```python
def __getitem__(self, key):
    if key in self.data:
        return self.data[key]
    if hasattr(self.__class__, "__missing__"):
        return self.__class__.__missing__(self, key)
    raise KeyError(key)
```

如果key不存在就查看有没有`__missing__`, 如果有就调用该方法, 而在`defaultdict`中重载了该方法。

```python
def __missing__(self, key): # real signature unknown; restored from __doc__
    """
    __missing__(key) # Called by __getitem__ for missing key; pseudo-code:
        if self.default_factory is None: raise KeyError((key,))
        self[key] = value = self.default_factory()
        return value
    """
    pass
```
使用:
```python
from collections import defaultdict

my_dict = defaultdict(dict)
my_value = my_dict["bobby"]
>>> defaultdict(<class 'dict'>, {'bobby': {}})

fruit=["apple","banana","orange"]
v=defaultdict(int)
for i in fruit:
    v[i]+=1
print(v)
>>> defaultdict(<class 'int'>, {'default_factory': 0, 'apple': 1, 'banana': 1, 'orange': 1})
```
