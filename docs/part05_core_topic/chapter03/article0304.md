# 类变量和实例变量

```python
# 创建一个类A
class A:
    aa = 1 # 类变量
    def __init__(self, x, y):
        self.x = x # 实例变量
        self.y = y
```

```python
# 接上，实例化类A为一个实例a
a = A(2,3) 

print(a.x, a.y, a.aa)  # a.aa 首先会去实例a的内存中找是否有aa, 如果没有再去类A的内存中找
print(A.aa) # 去类A 的内存中找 aa
#---------------------------------------
2 3 1
1
```

```python
# 接上，更改类A的 aa 属性，以及实例a的 aa 属性
A.aa = 11 # 会将类A内存中的的aa修改为11
a.aa = 22 # 会在实例a内存中创建一个变量aa赋值22, 类A内存中的aa还是11
print(a.x, a.y, a.aa)  # a.aa 首先会去实例a的内存中找是否有aa, 如果没有再去类A的内存中找
print(A.aa) # 去类A 的内存中找 aa
#---------------------------------------
2 3 100
11
```

```python
# 接上，实例化类A 为另一个实例b
b = A(3,5)
print(b.aa) # 类A内存中aa已经修改为11
#---------------------------------------
11
```

!!! tip "提示"
    - 类变量与实例变量相互独立
    - 类变量是实例共享的