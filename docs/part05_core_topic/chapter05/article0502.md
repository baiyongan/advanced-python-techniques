# dict 的常用方法

!!! tip "提示"
    - Pycharm 中，点击菜单栏的 View -> Tool Windows -> Structure 可以查看源码中的的类、方法等。
    - 在一段代码后直接接个 pass 作为断点， 然后用 debug 模式调试，比较方便。

## clear

clear的功能是对dict的内容进行清除.没有任何的返回值

```python
a = {"bya":{"school":"ustc"},
     "bya2": {"school": "ustc2"}
     }
a.clear()
print(a)
>>> {}
```

## copy

### 浅copy和深copy
- dict 内置的 copy 方法返回浅拷贝（shallow copy）
- copy 模块的 deepcopy 方法返回深拷贝（deep copy）

## fromkeys

首先这是一个静态方法, 可以直接使用类名调用

```python
@staticmethod # known case
def fromkeys(*args, **kwargs): # real signature unknown
    """ Returns a new dict with keys from iterable and values equal to value. """
    pass
```

```python
a = ["bya","bya2"]
b = dict.fromkeys(a,"school")
print(b)
>>> {'bya': 'school', 'bya2': 'school'}
```

## get

解决key没有对应的value报错的问题

```python
print(a.get("person",{}))
```

## items, keys, values

取值

## pop，popitem

删除并返回

## setdefault

如果key存在使用get方法, 如果key不存在使用set方法

## update

两个字典合并
```python
a={"person1":{"Roger":41},"person2":{"Rafa":36}}
b={"person1":{"Roger":41},"person3":{"Messi":34}}
print(b.update(a)) # 没有返回值
>>> None
print(b) # 如果key重复, 使用a的value
>>> {'person1': {'Roger': 41}, 'person3': {'Messi': 34}, 'person2': {'Rafa': 36}}
```
