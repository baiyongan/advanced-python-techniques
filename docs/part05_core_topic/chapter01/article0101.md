# Python 中一切皆对象

## 动态语言与静态语言的区别

- python 的面向对象更加彻底

## 函数和类也是对象，属于 Python 中的一等公民

### 可以赋值给一个变量

```python
# 将函数赋值给一个变量
def ask_name(name):
    print(name)


my_func = ask_name
my_func("bya")

#------------------------------------
bya

Process finished with exit code 0

# 将类赋值给一个变量

class Person():
    def __init__(self, name):
        print(name)


my_class = Person
my_class("Robert")

#------------------------------------
Robert

Process finished with exit code 0

```
### 可以添加到集合对象中

```python
obj_list = []
obj_list.append(ask_name)
obj_list.append(Person)
for item in obj_list:
    print(item)
print("------")
for value in obj_list:
    print(value("jerry"))

#------------------------------------
<function ask_name at 0x000002B8387A6048>
<class '__main__.Person'>
------
jerry  # 调用了 ask_name 的函数
None  # 函数没有 return，默认返回一个 None 值
jerry  # 调用了 Person 类的 __init__ 函数
<__main__.Person object at 0x000002B83884E848>  # __init__ 函数实例化时，会返回一个类的对象

Process finished with exit code 0
```

### 可以作为参数传递给函数

不言自明，略过举例

### 可以当做函数的返回值

!!! tip "提示"
    Python 中装饰器的实现原理

```python
def decorator_func():
    print("Your Name is")
    return ask_name

my_decorated_func = decorator_func()
my_decorated_func("BYA")

#------------------------------------
Your Name is
BYA

Process finished with exit code 0

```