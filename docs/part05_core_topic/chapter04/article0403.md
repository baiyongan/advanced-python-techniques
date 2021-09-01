# 序列的 +、+= 和 extend 的区别

这三种方式，都可以把 list 进行连接

## 区别一: + 和 += 占用空间不一样

```python
a = [1,2,3]
b = [4,5,6]

c = a + b
print("a: ", a)
print("c: ", c)  # c是产生的新的list

a += b
print("a: ", a)  # a还是原来那个list
#----------------------------------
a:  [1, 2, 3]
c:  [1, 2, 3, 4, 5, 6]
a:  [1, 2, 3, 4, 5, 6]
```

## 区别二: + 两边的数据类型要一致

```python
a = [1,2,3]
b = (4,5,6)

a += b
print("a: ", a)  # 正常执行  
#----------------------------------
a:  [1, 2, 3, 4, 5, 6]

c = a + b
print("c: ", c)  # 错误退出
#----------------------------------
# TypeError: can only concatenate list (not "tuple") to list
```

原因是因为 += 是调用`MutableSequence`中的`__iadd__`魔法方法, 它是调用`extend`, 接收一个`iterable`并通过for循环append.

## extend 和 append 的区别


```python
a1 = [1,2,3]
b1 = (4,5,6)

a1.extend(b1)  # 调用 extend 方法，会利用for循环，遍历被extend 的对象，extend 方法没有返回值，会直接对调用它的变量进行修改。
print(a1)

a2 = [1,2,3]
b2 = (4,5,6)
a2.append(b2)  # 调用 append 方法， 会直接连接的是整体，不会for 循环迭代
print(a2)
#----------------------------------
[1, 2, 3, 4, 5, 6]
[1, 2, 3, (4, 5, 6)]
```
