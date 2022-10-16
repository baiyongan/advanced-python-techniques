# 鸭子类型和多态

!!! note "说明"
    **`当看到一只鸟走起来像鸭子、游泳起来像鸭子、叫起来也像鸭子，那么这只鸟就可以被称为鸭子。`**

    鸭子类型（英语：duck typing）在程序设计中是动态类型的一种风格。在这种风格中，一个对象有效的语义，不是由继承自特定的类或实现特定的接口，而是由"当前方法和属性的集合"决定。

```python
class Cat(object):
    def say(self):
        print("I am a cat")


class Fish(object):
    def say(self):
        print("I am a fish")


class Horse(object):
    def say(self):
        print("I am a horse")


animal_list = [Cat, Fish, Horse]
for animal in animal_list:
    animal().say()

#------------------------------------------------
I am a cat
I am a fish
I am a horse
```

在 java 中，若要实现多态，就需要继承同一个父类，覆盖父类的一些方法，而在 python 中，不需要继承任何父类，只要实现共同的方法名即可。


```python
a = ["bya"]
name_list = ["bya1", "bya2"]

name_tuple = ["bya3", "bya4"]
name_set = set()
name_set.add("bya5")
name_set.add("bya6")
a.extend(name_list)
print("a + name_list\n", a)
a.extend(name_tuple)
print("a + name_list + name_tuple\n", a)
a.extend(name_set)
print("a + name_list + name_tuple + name_set\n", a)  # 注意这里的 set 没有顺序
#------------------------------------------------
a + name_list
 ['bya', 'bya1', 'bya2']
a + name_list + name_tuple
 ['bya', 'bya1', 'bya2', 'bya3', 'bya4']
a + name_list + name_tuple + name_set
 ['bya', 'bya1', 'bya2', 'bya3', 'bya4', 'bya6', 'bya5']
```

```python
# extend 方法的源码
def extend(self, *args, **kwargs): # real signature unknown
    """ Extend list by appending elements from the iterable. """
    pass
```

如上源码，extend 只要求传入其中的参数，是可迭代的对象，没有限制一定是 list or set or tuple 等，因此，如果我们自定义一个可迭代的类，便可同样使用 extend 方法。

!!! tip "提示"
    extend 方法，会隐含地调用对象里面的迭代器，即 \_\_iter\_\_ 方法，或是 \_\_getitem\_\_ 方法。


```python
# 自定义一个有 __getitem__ 方法的类，可以使用 extend 方法
class Company(object):
    def __init__(self, employee_list):
        self.employee = employee_list

    def __getitem__(self, item):
        return self.employee[item]

    def __len__(self):
        return len(self.employee)

a = ["bya"]
company = Company(["tom", "jerry", "bya"])

a.extend(company)
print("a + company\n", a)
#------------------------------------------------
a + company
 ['bya', 'tom', 'jerry', 'bya']
```

如此一来，say 方法，和 \_\_getitem\_\_ 方法的特性就比较像了，即并不一定非要继承某个类，才能使用该方法，这就是鸭子类型，魔法函数即是充分利用了动态语言的鸭子类型特性。

