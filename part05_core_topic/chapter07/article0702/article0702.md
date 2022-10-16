# \_\_getattr\_\_ 、\_\_getattribute\_\_ 魔法函数的区别

## \_\_getattr\_\_

当实例化对象调用的属性不存在的时候调用

```python
class A:
    def __init__(self):
        pass

a = A()
print(a.age)
>>> AttributeError: 'A' object has no attribute 'age'
```

```python
class A:
    def __init__(self):
        pass
    def __getattr__(self, item):
        return "Specifoed attribute not found"

a = A()
print(a.age)
>>> Specifoed attribute not found
```

!!! tip
    我们可以指定在找不到该属性的时候实现的操作, 比如修改查找的名称, 重新指定查找的区域等

## \_\_getattribute\_\_

执行查找, 无条件进入该魔法函数, 即使所查找的属性不存在

```python
# __getattr__ 对于调用 info 中存在的键值，正常返回，没有的则报错
class User:
    def __init__(self,info={}):
        self.info = info

    def __getattr__(self, item):
        return self.info[item]

    # def __getattribute__(self, item):
    #     return "some result"

if __name__ == "__main__":
    user = User(info={"gender":"male", "name":"Tom"})
    print(user.gender)
    print(user.name)
    print(user.test)
>>> male
>>> Tom
>>> KeyError: 'test'
```

```python
class User:
    def __init__(self,info={}):
        self.info = info

    def __getattr__(self, item):
        return self.info[item]

    def __getattribute__(self, item):
        return "some result"

if __name__ == "__main__":
    user = User(info={"gender":"male", "name":"Tom"})
    print(user.gender)
    print(user.name)
    print(user.test)
>>> some result
>>> some result
>>> some result
```

!!! tip
    \_\_getattribute\_\_ 尽量不要去重写它，一旦设计不当，很容易将属性访问搞杂。当然，在写框架时，会用到这个魔法方法，以便控制类的实例化的过程，以及属性访问的过程。

















