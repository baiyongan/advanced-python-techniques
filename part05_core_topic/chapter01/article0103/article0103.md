# 常见的内置类型

## 对象的三个特征

### 身份

可以理解为对象在内存中的地址，可以通过 id() 函数，来查看对象的身份

```python
a = 1
print(id(a))
#------------------------------------
140708090126736
```

### 类型

每个对象，在内存中，都有一个类型

### 值

## None (全局只有一个)

```python
a = None
b = None

print(id(a))
print(id(b))

print(id(a) == id(b))
#------------------------------------
140708089650400
140708089650400
True
```

## 数值

- int
- float
- complex (复数)
- bool

## 迭代类型

可以用 for 循环遍历

## 序列类型

- list
- bytes、bytearray、memoryview (二进制序列)
- range
- tuple
- str
- array

## 映射 (dict)

有 key 和 map

## 集合

- set
- fronzenset

!!! tip "提示"
    dict 和 set 在 python 中的实现原理，几乎一致，效率很高。因此，在做数据处理或者 in 判断时，最好用 set 或 dict 实现。

## 上下文管理类型

with 语句

## 其他 (深入到 python 源码级别，较少用到)

- 模块类型
- class 和实例
- 函数类型
- 方法类型
- 代码类型

python 代码本身，也会被 python 解释器，解释为一个对象类型

- object 对象
- type 类型
- ellipsis 类型

即省略号类型

- notimplemented 类型

面向对象的高级设计中会用到

