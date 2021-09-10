# dict 的常用方法

!!! tip "提示"
    - Pycharm 中，点击菜单栏的 View -> Tool Windows -> Structure 可以查看源码中的的类、方法等。
    - 在一段代码后直接接个 pass 作为断点， 然后用 debug 模式调试，比较方便。

## clear

clear的功能是对dict的内容进行清除.没有任何的返回值

```python
a = {"bya1":{"school":"ustc1"},
     "bya2": {"school": "ustc2"}
     }
a.clear()
print(a)
>>> {}
```

## copy

### 浅copy

```python
a = {"bya1":{"school":"ustc1"},
     "bya2": {"school": "ustc2"}
     }
new_dict = a.copy()
new_dict["bya1"]["school"] = "ustc3"
print(new_dict)
print(a)
pass
>>>
{'bya1': {'school': 'ustc3'}, 'bya2': {'school': 'ustc2'}}
{'bya1': {'school': 'ustc3'}, 'bya2': {'school': 'ustc2'}}
```

### 深copy

```python
a = {"bya1":{"school":"ustc1"},
     "bya2": {"school": "ustc2"}
     }
import copy
new_dict = copy.deepcopy(a)
new_dict["bya1"]["school"] = "ustc3"
print(new_dict)
print(a)
pass
>>>
{'bya1': {'school': 'ustc3'}, 'bya2': {'school': 'ustc2'}}
{'bya1': {'school': 'ustc1'}, 'bya2': {'school': 'ustc2'}}
```

- dict 内置的 copy 方法返回浅拷贝（shallow copy）,对于嵌套的数据结构，并不会被拷贝
- copy 模块的 deepcopy 方法返回深拷贝（deep copy）, 会拷贝嵌套的数据结构

## fromkeys

首先这是一个静态方法, 可以直接使用类名调用

```python
@staticmethod # known case
def fromkeys(*args, **kwargs): # real signature unknown
    """ Returns a new dict with keys from iterable and values equal to value. """
    pass
```

```python
new_list = ["bya","bya2"]
new_dict = dict.fromkeys(new_list,"school")
print(new_dict)
>>> {'bya': 'school', 'bya2': 'school'}
```

## get

使用非常频繁，可以解决 key 没有对应的 value 而报错的问题

```python
a = {"bya1":{"school":"ustc1"},
     "bya2": {"school": "ustc2"}
     }
# print(a["bya3"]) 会提示 KeyError: 'bya3'
print(a.get("bya3",{}))  # a 没有 key bya3，会设置其 value 值为 ｛｝
print(a.get("bya1",{}))  # a 有 key bya1， 会取其 value 值 {'school': 'ustc1'}
>>>
{}
{'school': 'ustc1'}
```

## items, keys, values

使用 for 循环，进行元组拆包
```python
a = {"bya1":{"school":"ustc1"},
     "bya2": {"school": "ustc2"}
     }

for key, value in a.items():
     print(key, value)
>>>
bya1 {'school': 'ustc1'}
bya2 {'school': 'ustc2'}

```

## pop，popitem

删除并返回

## setdefault

如果key存在使用get方法, 如果key不存在使用set方法

使用 setdefault 方法，比我们自行判断并添加的步骤要少，故而性能更高效


```python
a = {"bya1":{"school":"ustc1"},
     "bya2": {"school": "ustc2"}
     }

default_value = a.setdefault("bya3", {"school": "ustc3"})
print(default_value)
print(a)
>>>  
{'school': 'ustc3'}
{'bya1': {'school': 'ustc1'}, 'bya2': {'school': 'ustc2'}, 'bya3': {'school': 'ustc3'}}
```

## update

```python
    def update(self, E=None, **F): # known special case of dict.update
        """
        D.update([E, ]**F) -> None.  Update D from dict/iterable E and F.
        If E is present and has a .keys() method, then does:  for k in E: D[k] = E[k]
        If E is present and lacks a .keys() method, then does:  for k, v in E: D[k] = v
        In either case, this is followed by: for k in F:  D[k] = F[k]
        """
        pass
```

update 方法，中间可以放可迭代的对象，因此 list，dict，tuple 都可以。

```python
a = {"bya1":{"school":"ustc1"},
     "bya2": {"school": "ustc2"}
     }
a.update({"bya3": {"school": "ustc3"}})
print(a)
# 关键词方式 key=value
a.update(bya4={"school": "ustc4"})  # 同时也可以传递多个 key=value, 使用 , 隔开即可
print(a)
# list 中 放置 tuple 也可以
a.update([("bya5", {"school":"ustc5"})])  # 当然，多个 tuple 也是可以的
print(a)
# tuple 中 放置 tuple 也可以，因为 tuple 也是可迭代的
a.update((("bya6", {"school":"ustc6"}), ))  # 注意要有一个 , 
print(a)
>>>
{'bya1': {'school': 'ustc1'}, 'bya2': {'school': 'ustc2'}, 'bya3': {'school': 'ustc3'}}
{'bya1': {'school': 'ustc1'}, 'bya2': {'school': 'ustc2'}, 'bya3': {'school': 'ustc3'}, 'bya4': {'school': 'ustc4'}}
{'bya1': {'school': 'ustc1'}, 'bya2': {'school': 'ustc2'}, 'bya3': {'school': 'ustc3'}, 'bya4': {'school': 'ustc4'}, 'bya5': {'school': 'ustc5'}}
{'bya1': {'school': 'ustc1'}, 'bya2': {'school': 'ustc2'}, 'bya3': {'school': 'ustc3'}, 'bya4': {'school': 'ustc4'}, 'bya5': {'school': 'ustc5'}, 'bya6': {'school': 'ustc6'}}
```

两个字典合并

```python
a={"person1":{"Roger":41},"person2":{"Rafa":36}}
b={"person1":{"Roger":41},"person3":{"Messi":34}}
print(b.update(a)) # 没有返回值
>>> None
print(b) # 如果key重复, 使用a的value
>>> {'person1': {'Roger': 41}, 'person3': {'Messi': 34}, 'person2': {'Rafa': 36}}
```
