# 使用 isinstance 而不是 type

## type 与 isinstance 的区别

- type 用于求一个未知数据类型的对象，isinstance 用于判断一个对象是否是已知类型。
- type 不认为子类是父类的一种类型，isinstance 认为子类是父类的一种类型，即子类对象也属于父类对象。

```python
# A 是 B 的父类，isinstance 内部会检查类的继承链关系
class A:
    pass

class B(A):
    pass

b = B()

print("判断对象类型的正确用法：使用 isinstance 判断")
print("b 是否为 class B 类型：", isinstance(b, B))
print("b 是否为 class A 类型：", isinstance(b, A))
print("\n判断对象类型的正确用法：使用 type 判断")
print("b 是否为 class B 类型：", type(b) is B)
print("b 是否为 class A 类型：", type(b) is A)
#--------------------------------------------------
判断对象类型的正确用法：使用 isinstance 判断
b 是否为 class B 类型： True
b 是否为 class A 类型： True

判断对象类型的正确用法：使用 type 判断
b 是否为 class B 类型： True
b 是否为 class A 类型： False
```


```python
# 使用 type 查询位置数据类型的对象
class A:
    pass

class B(A):
    pass

b = B()

print(type(b))  # <class '__main__.B'>
#--------------------------------------------------
<class '__main__.B'>
```

## == 与 is 的区别

- is 是去判断这两个是不是一个对象, 即id是否相同
- == 是判断值是否相等
