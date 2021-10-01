# property 动态属性

## 模块的导入

```python
from datetime import date, datetime 
class User:
    def __init__(self, name, birthday):
        self.name = name
        self.birthday = birthday 

user = User("BYA", date(year=2000, month=1, day=1))
print ("in {} file" . format(__file__))

# 在另一个py文件中导入User类, 会连同 print 也一起被执行了
# 因此，在测试的时候，最好用 if '__name__' == '__main__':
from chapter07.text import User
```

## property装饰器(属性方法)

假如一个类有年龄属性, 我们需要设置值并能获取值

- 方法一: 在`__init__()`中设置 age, 但是问题是对于赋值无法添加处理或者校验
  
```python
class Student:
    def __init__(self,name,age):
        self.name=name
        self.age=age
stu = Student('Tom', 12)
stu.age = 20
```

- 方法二: 使用 set_age 方法 和 get_age 方法
  
```python
class Student:
    def __init__(self, name):
        self.name = name
        
    def set_age(self,age):
        if isinstance(age,int):
            if 0<age<120:
                self.age=age
        else:
            print("请输入合法的年龄")
            
    def get_age(self):
        return self.age

stu=Student("Jerry")
stu.age=120  #stu自己给自己添加了一个age 属性，所以不会报错。这个属性只是属于stu对象
print(stu.age)
```

为了让age更安全, 可以改成_age，这属于python 编码上的一种规范，并不能做到真正的隐藏。

- property 装饰起，则实现了上面的set_age和get_age的作用
  
```python
class Student:
    def __init__(self, name):
        self.name = name
        self._age = age

    @property
    def age(self):
        return self._age

    @age.setter
    def age(self,age):
        if isinstance(age,int):
            if 0<age<120:
                self._age=age
        else:
            print("请输入合法的年龄")

stu = Student("Jerry")
stu.age=10
print(stu.age)


1. get和set的方法名称都要一样（age）
2. set方法返回的属性前面加个"_"
3. @property是针对get方法
4. @age.setter是针对set方法，是@property本身又创建了另一个装饰器
5. 直接可以这样 stu.age = 10 对象名.方法名进行赋值，
6. 只定义getter方法，不定义setter方法是一个只读属性
```

## 最大特点
**属性值可动态获取**