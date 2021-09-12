# 一个经典的参数错误

### 传入int值

```python
def add(a,b):
    a+=b
    return a
a=1
b=2
c=add(a,b)

print(a,b,c)
>>> 1 2 3
```

### 传入list

```python
def add(a,b):
    a+=b
    return a
a=[1]
b=[2]
c=add(a,b)

print(a,b,c)
>>> [1, 2] [2] [1, 2]

```
内部使用的是+=, 所以内存地址不变, 所以在执行`a+=b`的前后a指向的是同一个地址, 只不过地址里面的内容发生改变.

### 传入元组

```python
def add(a,b):
    a+=b
    return a
a=(1)
b=(2)
c=add(a,b)

print(a,b,c)
>>> 1 2 3
```

### 总结

在**传入参数为列表等可变序列**时要注意传入参数有可能在函数内部被改变。