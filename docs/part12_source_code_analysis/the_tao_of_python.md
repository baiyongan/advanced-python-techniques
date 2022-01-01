# Python 之道 —— 剖析 type 和 object

!!! note
    本文主要阐释了 type 和 object 之间的复杂关系，以及元类、类和实例之间的关系。
    
## Object-oriented 关系

1. **is a kind of** (实线表示)，也可描述为 **specialization** 或 **inheritance** ：当一个子类（subclass）是另一个父类（superclass）的特殊版本时，这两个对象之间即可称为这种关系。

常用术语：subclass of, superclass of, superclass-subclass 或者简单的 is a.

2. **is an instance of** (虚线表示)，也可描述为 **instantiation** ：当一个实例（instance）是另一个指定的类型（type）的具体示例时，这两个对象之间即可称为这种关系。
  
常用术语：instance of, type of.

## 关系法则

- 如果 A is a subclass of B, 且 B is a subclass of C, 那么 A is a subclass of C.
- 如果 X is an instance of A, 且 A is a subclass of B, 那么 X is an instance of B.
- 如果 B is an instance of M, 且 A is a subclass of B, 那么 A is an instance of M.

## Python object 是什么？

Python 中的 object 是具有以下特征属性的实体：

1. Identity：即给定两个名字，我们可以明确判定它们是否指的是同一个对象
2. A value：即可能包含一堆属性，我们可以通过 `objectname.attributename` 访问其他对象
3. A type：每个对象都只有一种类型。
4. One or more bases：base 类似于面向对象术语中的 super-class 或 base-class。

## Rule 1: Everything is an object

!!! tip
    在 Python 中，一切皆对象，即使是对于在其他语言中，被视为原始类型（"primitive types"）的对象。
    因此：

    - 可以将其存入变量中

    - 可以作为参数传递给函数
    
    - 可以作为函数的结果返回
    
    - 可以在运行时构造
    
    - 更重要的 —— 可以用一种统一且一致的方式，来处理每一个编程结构。

### Functions as objects

- 当使用 `def` 关键词定义一个函数时，Python 会创建一个函数对象
- 函数可以作为参数传递给其他函数
- 以其他函数为参数的函数称为高阶函数（**higher order functions**）

!!! example
    例如 map 函数，即接收一个函数和一个可迭代对象，并将该函数应用于可迭代对象中的每个 item。

### Classes as objects

- 当使用关键字 `class` 时，Python 会执行它并创建一个类对象
- 类（class）本身也能够创建对象——即实例（instance）
- 由于类是对象，那么它们必须由某些东西生成，而这就是元类（metaclass）
- 由于元类也是对象，它们也必须由某些东西生成，而这又是元类（metaclass）

因此，**对象是类的实例，类是元类的实例，元类是其自身的实例**。


### Metaclasses (元类也是对象)

元类创建了类，即类是元类的实例。

```python
MyClass = MetaClass()
MyObject = MyClass()
```

!!! note
    Metaclasses are deeper magic than 99% of users should ever worry about. If you wonder whether you need them, you don’t (the people who actually need them know with certainty that they need them, and don’t need an explanation about why). Tim Peters

## `type` 解释

`type`，可以用来查询一个对象的类型，它同样可以动态地创建类。`type` 可以将类的描述作为参数，并以 `type(name, bases, dct)` 返回一个类。

- `name` 是一个字符串，给出要构造的类的名称
- `bases` 是一个元组，给出要构造的类的父类
- `dct` 是要构造的类的属性和方法的字典

!!! tip
    为什么 `type` 不写成 `Type` 呢？其实是能与 `str` 和 `int` 等保持一致性。`str` 是一个可以创建字符串类型的类，`int` 是一个可以创建整型对象的类，而 `type` 是一个可以创建类对象的类。

```python
# 使用 class 关键字定义
class A:
    pass
a = A()
print(type(a))
print(type(A))
print(A.__bases__)
>>>
<class '__main__.A'>
<class 'type'>
(<class 'object'>,)

# 直接用原理定义
A = type('A', (), {})
a = A()
print(type(a))
print(type(A))
print(A.__bases__)
print(isinstance(a, A), isinstance(a, object), issubclass(A, object))
>>>
<class '__main__.A'>
<class 'type'>
(<class 'object'>,)
True True True
```

### `type` 的作用 

- 在 Python 中一切皆对象，它们都是类的实例或元类的实例。
- `type` 是 Python 用来创建（即实例化）所有类和元类的元类，包括 `type` 本身。
- type 实际上是它自己的元类。

!!! attention
    **type is actually its own metaclass** 
    
    This is not something you could reproduce in pure Python, and is done by cheating a little bit at the implementation level.

## `object` 解释

- `object` 是一个类，所有类都要继承它
- 包括 `object` 在内的所有类，都是它们自己的子类
- 包括 `object` 在内的所有类，都是 `object` 的子类。 `object.__bases__` 是一个空元组。
- 除 `object` 之外的所有类，都将在其继承层次结构中的类中的 `__bases__` 中有 `object`。

### `object` 的种类

- Python 中有两种对象:
    1. *Type objects*： 可以创建实例，可以被子类化，如 `type`、`object`、`int`、`str`、`list` 等
    2. *Non-type objects*： 无法创建实例，无法被子类化，如 1、"hello"、[1, 2, 3] 等
- type 和 object 是 Python 系统中的两个原始对象
- `objectname.__class__` 存在于每个对象，并指向对象的类型
- `objectname.__bases__` 存在于每个 type 对象，并指向对象的父类。只有对 `object` 时，值才为空。


## type 和 object 是如何关联的？

```python
# All classes and metaclasses including object are subclasses of object.
issubclass(type, object) 
issubclass(object, object)
issubclass(object, type)
>>>
True
True
False

# All classes and metaclasses including type are instances of type.
isinstance(object, type)
isinstance(type, type)
>>>
True
True

# All objects including object are instances of object.
isinstance(type, object) 
isinstance(object, object)
>>>
True
True
```

## The Python objects map


## 拓展阅读

[Python Types and Objects by Shalabh Chaturvedi](http://pythonic.zoomquiet.top/data/20070308094655/index.html)