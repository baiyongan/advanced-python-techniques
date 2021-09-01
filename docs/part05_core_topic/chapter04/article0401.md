# 序列类型的分类

## 依据存储数据的类型区别

### 容器序列
- list
- tuple
- deque
  
### 扁平序列
- str 
- bytes
- bytearray
- array.array

## 依据序列的可变性区分

### 可变序列
- list
- deque
- bytearray
- array

### 不可变序列
- str 
- tuple
- bytes

!!! tip
    容器序列(可以放置任意类型数据)，而扁平序列中的数据类型需统一。

```python
my_list = []
my_list.append(1)
my_list.append("a")
```

