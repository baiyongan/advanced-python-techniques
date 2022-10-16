# Python Tuple Methods

## count()

!!! abstract ""
    === "Function"
    
        `count()` 方法返回指定元素(element)在元组中出现的次数

    === "Syntax"

        ```python
        tuple.count(element)
        ```

    === "Parameter"

        single argument: **element** - 要被计算的元素(element)

    === "Return Value"

        `count()` 方法返回元素 (element) 在元组中出现的次数

??? note ""
    === "Example 1"
        
        Use of Tuple count()

        ```python
        # 
        # vowels tuple
        vowels = ('a', 'e', 'i', 'o', 'i', 'u')

        # count element 'i'
        count = vowels.count('i')

        # print count
        print('The count of i is:', count)

        # count element 'p'
        count = vowels.count('p')

        # print count
        print('The count of p is:', count)
        ```

        Result 1

        ```python
        The count of i is: 2
        The count of p is: 0
        ```

    === "Example 2"
        
        Count List and Tuple Elements Inside Tuple
        
        ```python
        
        # random tuple
        random = ('a', ('a', 'b'), ('a', 'b'), [3, 4])

        # count element ('a', 'b')
        count = random.count(('a', 'b'))

        # print count
        print("The count of ('a', 'b') is:", count)

        # count element [3, 4]
        count = random.count([3, 4])

        # print count
        print("The count of [3, 4] is:", count)
        ```

        Result 2

        ```python
        The count of ('a', 'b') is: 2
        The count of [3, 4] is: 1
        ```

## index()

!!! abstract ""
    === "Function"

        `index()` 方法返回 `tuple` 中指定元素 (element) 的索引值 (index)

    === "Syntax"

        ```python
        tuple.index(element, start, end)
        ```

    === "Parameter"

        `index()` 方法最多接收三个输入参数：

        - `element`：被 search 的元素
        - `start` (optional)：从该 index 处开始查询
        - `end` (optional)：在该 index 处结束查询

    === "Return Value"

        - `index()` 方法返回在 `tuple` 中指定元素 (element) 的索引值
        - 如果指定的元素找不到，会抛出一个 `ValueError` 异常
        
        !!! attention ""
            `index()` 方法，只会返回被查询元素所匹配到的第一个索引值

??? note ""
    === "Example 1"
        
        Find the index of the element
        
        ```python
        # vowels tuple
        vowels = ('a', 'e', 'i', 'o', 'i', 'u')

        # index of 'e' in vowels
        index = vowels.index('e')
        print('The index of e:', index)

        # element 'i' is searched
        # index of the first 'i' is returned
        index = vowels.index('i')

        print('The index of i:', index)
        ```

        Result 1

        ```python
        The index of e: 1
        The index of e: 2
        ```

    === "Example 2"
        
        Index of the Element not Present in the Tuple
        
        ```python
        # vowels tuple
        vowels = ('a', 'e', 'i', 'o', 'u')

        # index of'p' is vowels
        index = vowels.index('p')
        print('The index of p:', index)
        ```

        Result 2

        ```python
        ValueError: tuple.index(x): x not in tuple
        ```

    === "Example 3"
        
        Working of index() With Start and End Parameters
        
        ```python
        # alphabets tuple
        alphabets = ('a', 'e', 'i', 'o', 'g', 'l', 'i', 'u')

        # index of 'i' in alphabets
        index = alphabets.index('e')   # 2
        print('The index of e:', index)

        # 'i' after the 4th index is searched
        index = alphabets.index('i', 4)   # 6
        print('The index of i:', index)

        # 'i' between 3rd and 5th index is searched
        index = alphabets.index('i', 3, 5)   # Error!
        print('The index of i:', index)
        ```

        Result 3

        ```python
        The index of e: 1
        The index of i: 6
        Traceback (most recent call last):
        File "<string>", line 13, in <module>
        ValueError: tuple.index(x): x not in tuple
        ```

## 拓展阅读
- [Programiz: Python Tuple Methods](https://www.programiz.com/python-programming/methods/tuple)
