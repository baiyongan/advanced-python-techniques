# type、object 和 class 的关系

## type 的两种用法

- 生成一个类
- 返回一个对象的类型

## type -> class -> object

```python
# type -> int -> 1
Python 3.7.6 (default, Jan  8 2020, 20:23:39) [MSC v.1916 64 bit (AMD64)] :: Anaconda, Inc. on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> a = 1
>>> type(1)
<class 'int'>
>>> type(int)
<class 'type'>
```

```python
# type -> str -> abc
>>> b = "abc"
>>> type(b)
<class 'str'>
>>> type(str)
<class 'type'>
```

```python
# type -> self-defined class -> 类实例
>>> class Student:
...     pass
...
>>> stu = Student()
>>> type(stu)
<class '__main__.Student'>
>>> type(Student)
<class 'type'>
```

```python
# type -> list -> [1,2]
>>> c = [1,2]
>>> type(c)
<class 'list'>
>>> type(list)
<class 'type'>

```

!!! attention "重要"
    object 是所有类最顶层的基类，所有的类的父类到最后都是 object 类。

```python
>>> class Student:
...     pass
...
>>> Student.__bases__
(<class 'object'>,)
>>> class MyStudent(Student):
...     pass
...
>>> MyStudent.__bases__
(<class '__main__.Student'>,)
```

## type 与 object 的关系

!!! attention "重要"
    **type 也是一个类 class，同时 type 也是一个对象 object，是自身的 object**

```python
# type -> type -> type
>>> type(type)
<class 'type'>
>>> type.__bases__  # type 的基类为 object ！！！
(<class 'object'>,)
```

```python
# type -> type -> object
>>> type(object)
<class 'type'>  # object 是 type 的一个实例
>>> object.__bases__  ## object 的基类为 空
()

```

!!! tip "提示"
    其实内部是由指针来实现的。

## type、object 和 class 的关系图
![chapter01_type_object_class.png](https://i.loli.net/2021/08/03/rFeYlzPBZG4XNKd.png)