# Python 魔法函数一览

## 非数学运算类型

### 字符串表示
- \_\_repr\_\_
- \_\_str\_\_

### 集合序列相关
- \_\_len\_\_
- \_\_getitem\_\_
- \_\_setitem\_\_
- \_\_delitem\_\_
- \_\_contains\_\_

### 迭代相关
- \_\_iter\_\_
- \_\_next\_\_

### 可调用
- \_\_call\_\_

### with 上下文管理器
- \_\_enter\_\_
- \_\_exit\_\_

### 数值转换
- \_\_abs\_\_
- \_\_bool\_\_
- \_\_int\_\_
- \_\_float\_\_
- \_\_hash\_\_
- \_\_index\_\_

### 元类相关
- \_\_new\_\_
- \_\_init\_\_

### 属性相关
- \_\_getattr\_\_
- \_\_setattr\_\_
- \_\_getattribute\_\_
- \_\_setattribute\_\_
- \_\_dir\_\_

### 属性描述符
- \_\_get\_\_
- \_\_set\_\_
- \_\_delete\_\_

### 协程
- \_\_await\_\_
- \_\_aiter\_\_
- \_\_anext\_\_
- \_\_aenter\_\_
- \_\_aexit\_\_

## 数学运算类型

### 一元运算符
- \_\_neg\_\_（-）
- \_\_pos\_\_（+）
- \_\_abs\_\_

### 二元运算符
- \_\_lt\_\_(<)
- \_\_le\_\_ <=  
- \_\_eq\_\_ == 
- \_\_ne\_\_ != 
- \_\_gt\_\_ > 
- \_\_ge\_\_ >=

### 算术运算符
- \_\_add\_\_ + 
- \_\_sub\_\_ - 
- \_\_mul\_\_ * 
- \_\_truediv\_\_ / 
- \_\_floordiv\_\_ // 
- \_\_mod\_\_ % 
- \_\_divmod\_\_ 或 divmod() 
- \_\_pow\_\_ 或 ** 或 pow() 
- \_\_round\_\_ 或 round()

### 反向算术运算符
- \_\_radd\_\_ 
- \_\_rsub\_\_ 
- \_\_rmul\_\_ 
- \_\_rtruediv\_\_ 
- \_\_rfloordiv\_\_ 
- \_\_rmod\_\_ 
- \_\_rdivmod\_\_ 
- \_\_rpow\_\_

### 增量赋值算术运算符
- \_\_iadd\_\_ 
- \_\_isub\_\_ 
- \_\_imul\_\_ 
- \_\_itruediv\_\_ 
- \_\_ifloordiv\_\_ 
- \_\_imod\_\_ 
- \_\_ipow\_\_

### 位运算符
- \_\_invert\_\_ ~ 
- \_\_lshift\_\_ << 
- \_\_rshift\_\_ >> 
- \_\_and\_\_ & 
- \_\_or\_\_ | 
- \_\_xor\_\_ ^

### 反向位运算符
- \_\_rlshift\_\_ 
- \_\_rrshift\_\_  
- \_\_rand\_\_ 
- \_\_rxor\_\_ 
- \_\_ror\_\_

### 增量赋值位运算符
- \_\_ilshift\_\_ 
- \_\_irshift\_\_ 
- \_\_iand\_\_ 
- \_\_ixor\_\_
- \_\_ior\_\_


## 调试工具
- notebook

首先使用 `pip install -i https://douban.com/simple notebook` 安装

然后运行 `ipython notebook`

## 字符串表示
- \_\_str\_\_

在打印一个实例化对象的时候, python 默认会调用 str (对象), 对应的魔法函数是 \_\_str\_\_

```python
class Company(object):
    def __init__(self, employee_list):
        self.employee = employee_list

company = Company(["tom", "jerry", "bya"])
print(company)
print(str(company))
#------------------------------------
<__main__.Company object at 0x000001AFBB114B88>
<__main__.Company object at 0x000001AFBB114B88>
```

- \_\_repr\_\_

**\_\_repr\_\_是在开发模式下调用的**

```python
class Company(object):
    def __init__(self, employee_list):
        self.employee = employee_list

company = Company(["tom", "jerry", "bya"])
print(company)
company
#------------------------------------
<__main__.Company object at 0x0000020A9D7672B0>
<__main__.Company at 0x20a9d7672b0>
```

再次强调, \_\_repr\_\_不是因为该类继承了某一个对象才能去写这个方法, 魔法函数可以写到任何一个定义的类中去, 然后 python 解释器识别出这个对象有该特性。接着，在调试模式下，company 会被解释器转换为 repr(company), 然后再去调用 company.\_\_repr\_\_().

```python
class Company(object):
    def __init__(self, employee_list):
        self.employee = employee_list

    def __str__(self):
        return ','.join(self.employee)

    def __repr__(self):
        return '.'.join(self.employee)

company = Company(["tom", "jerry", "bya"])
print(company) # str  输出
company        # repr 输出

tom,jerry,bya   # 打印对象
tom,jerry,bya   # 调试模式
```











