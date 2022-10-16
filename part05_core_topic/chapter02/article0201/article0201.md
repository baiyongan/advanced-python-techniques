# 什么是魔法函数？

## 魔法函数特性
- Python 里面的魔法函数，以双下划线开头和结尾；
- 魔法函数不依赖任何类，并且可以随时调用；
- 使用 Python 提供的魔法函数，而不要自己去自定义；
- 一旦类里面加上一些特定的魔法函数，整个类就被附加了一些特定的功能；
- 魔法函数定义之后，我们不需要显式地调用它，Python 解释器自己会知道什么情况下会调用，我们在使用相应的语法的时候就会自动调用；
- 魔法函数和本身的类没有关系，和类的父类，object也没有关系，可以理解为独立的存在，魔法函数可以写到任意一个类中，跟继不继承没有必然的关系。

!!! tip "提示"
    在 Pycharm IDE 编辑类方式时，输入双下划线，会自动弹出很多 Python 支持的魔法函数，以供选择。

## 实例

!!! note "说明"
    for循环的是可迭代对象, 首先通过\_\_iter\_\_得到一个迭代器, 然后不断调用迭代器的\_\_next\_\_, 但是如果对象没有实现 \_\_iter\_\_或\_\_next\_\_迭代器协议，Python的解释器就会去寻找\_\_getitem\_\_来迭代对象，如果连\_\_getitem\_\_都没有定义，这解释器就会报对象不是可迭代对象的错误。

### 没有魔法函数特性

```python
class Company(object):
    def __init__(self, employee_list):
        self.employee = employee_list

company = Company(["tom", "jerry", "bya"])

employee = company.employee  # 需要指定 class 里面的方法
for em in employee: 
    print(em)
```

魔法函数是能影响到语法本身的, 本来 company 实例是无法进行切片操作的, 但是由于实现了\_\_getitem\_\_, 所以在 python 的语法上，我们可以对实例化的对象进行切片操作.(列表也是 list 这个类实例化得到的一个对象)


### 有魔法函数特性

```python
class Company(object):
    def __init__(self, employee_list):
        self.employee = employee_list

    def __getitem__(self, item):
        return self.employee[item]
        
    def __len__(self):
        return len(self.employee)

company = Company(["tom", "jerry", "bya"])

for em in company:  # 加入了 魔法方法 __getitem__， 可视为 可迭代类型，可以直接对类进行 for 循环
    print(em)

for em in company[1:]:  # 加入了 魔法方法 __getitem__， 可视为 序列类型，可以切片操作
    print(em)

print(len(company))  # __len__
```