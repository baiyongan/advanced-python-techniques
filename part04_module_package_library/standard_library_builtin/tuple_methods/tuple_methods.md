# Python Tuple Methods

## count()

!!! abstract ""
    === "Function"
    
        `count()` 方法返回指定元素(element)在元组中出现的次数。

    === "Syntax"

        ```python
        tuple.count(element)
        ```

    === "Parameter"

        single argument: **element** - 要被计算的元素(element)

    === "Return Value"

        `count()` 方法返回元素 (element) 在元组中出现的次数。

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

        Result

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
    
        

    === "Syntax"

        ```python
        
        ```

    === "Parameter"

        

    === "Return Value"

        

??? note ""
    === "Example 1"
        

        ```python

        ```

        Result

        ```python

        ```

    === "Example 2"
        
        
        ```python
        
        ```

        Result 2

        ```python

        ```

    === "Example 3"
        
        
        ```python
        

        ```

        Result 3

        ```python

        ```


## 拓展阅读
- [Programiz: Python Tuple Methods](https://www.programiz.com/python-programming/methods/tuple)
