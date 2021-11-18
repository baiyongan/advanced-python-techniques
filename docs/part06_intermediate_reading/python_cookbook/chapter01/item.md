# 数据结构和算法
<!-- -------------------------------------------------------------------------- -->
## 01 将序列分解为单独的变量

!!! question "问题"
    有一个包含 N 个元素的元组或者是序列，怎样将它里面的值解压后同时赋值给 N 个变量？

    - **使用占位符如 `_`**

??? done "解决方案"
    任何的序列（或者是可迭代对象）可以通过一个简单的赋值操作来分解为单独的变量。 **唯一的要求就是变量的总数和结构必须与序列相吻合。**

    不仅仅只是元组或列表，只要对象是可迭代的，就可以执行分解操作。包括字符串，文件对象，迭代器和生成器。

??? summary "讨论"
    如果只想使用部分变量，可以将不需要的变量用占位符如 `_` 替代。

    ```python 
    >>> data = [ 'ACME', 50, 91.1, (2012, 12, 21) ]
    >>> _, shares, price, _ = data
    >>> shares
    50
    >>> price
    91.1
    >>>
    ```
<!-- -------------------------------------------------------------------------- -->
## 02 解压可迭代对象赋值给多个变量

!!! question "问题"
    如果一个可迭代对象的元素个数超过变量个数时，会抛出一个 `ValueError`。 那么怎样才能从这个可迭代对象中解压出 N 个元素出来？

    - **使用星号表达式 `*`**

??? done "解决方案"
    此时，可以分析要处理的数据结构，将变动的部分，用星号表达式 `*` 处理。其中，用 `*`代替的变量类型始终为 list，即使 list 长度为 0。

    ```python
    # 假设现在有一些用户的记录列表，每条记录包含一个名字、邮件，接着就是不确定数量的电话号码。
    >>> record = ('Dave', 'dave@example.com', '773-555-1212', '847-555-1212')
    >>> name, email, *phone_numbers = record
    >>> name
    'Dave'
    >>> email
    'dave@example.com'
    >>> phone_numbers
    ['773-555-1212', '847-555-1212']
    >>>
    ```

??? summary "讨论"
    **星号表达式可以用在可迭代对象的开头，中间，或结尾，以及结合占位符用于嵌套的结构。**

    扩展的迭代解压语法是专门为解压不确定个数或任意个数元素的可迭代对象而设计的。 通常，这些可迭代对象的元素结构有确定的规则（比如第 1 个元素后面都是电话号码）， 星号表达式让开发人员可以很容易的利用这些规则来解压出元素来。 

    ### 星号表达式的常用场景

    - 迭代元素为可变长元组的序列

    ```python
    records = [
        ('foo', 1, 2),
        ('bar', 'hello'),
        ('foo', 3, 4),
    ]

    def do_foo(x, y):
        print('foo', x, y)

    def do_bar(s):
        print('bar', s)

    for tag, *args in records:
        if tag == 'foo':
            do_foo(*args)
        elif tag == 'bar':
            do_bar(*args)
    ```

    - 字符串的分割

    ```python
    >>> line = 'nobody:*:-2:-2:Unprivileged User:/var/empty:/usr/bin/false'
    >>> uname, *fields, homedir, sh = line.split(':')
    ```

    - 结合占位符，如 `_` 或 `ign`（ignore），丢弃不需要的元素

    ```python
    >>> record = ('ACME', 50, 123.45, (12, 18, 2012))
    >>> name, *_, (*_, year) = record
    ```

    - 列表的分割

    ```python
    >>> items = [1, 10, 7, 4, 5, 9]
    >>> head, *tail = items
    ```
<!-- -------------------------------------------------------------------------- -->
## 03 保留最后N个元素

!!! question "问题"
    在迭代操作或者其他操作的时候，怎样只保留最后有限几个元素的历史记录？

    - **使用 `collections.deque`**

??? done "解决方案"
    在迭代操作或者其他操作的时候，可以使用 `collections.deque` 来实现只保留最后有限几个元素的历史记录。

??? summary "讨论"
    使用 `deque(maxlen=N)` 构造函数会新建一个固定大小的队列。当新的元素加入并且这个队列已满的时候， 最老的元素会自动被移除掉。

    相对于手动在一个列表上实现这一的操作（比如增加、删除等等）。使用 `collections.deque` 会更加优雅并且运行得更快。

    `deque` 类可以被用在任何只需要一个简单队列数据结构的场合，并且可以在队列的两端执行添加和弹出元素的操作。

    ```python
    from collections import deque
    >>> q = deque()
    >>> q.append(1)
    >>> q.append(2)
    >>> q.append(3)
    >>> q
    deque([1, 2, 3])
    >>> q.appendleft(4)
    >>> q
    deque([4, 1, 2, 3])
    >>> q.pop()
    3
    >>> q
    deque([4, 1, 2])
    >>> q.popleft()
    4
    ```

    在队列两端插入或删除元素时间复杂度都是 O(1) ，区别于列表，在列表的开头插入或删除元素的时间复杂度为 O(N)。

<!-- -------------------------------------------------------------------------- -->
## 04 查找最大或最小的N个元素

!!! question "问题"
    怎样从一个集合中获得最大或者最小的 N 个元素列表？

    - **使用 `heapq` 模块的两个函数：`nlargest()` 和 `nsmallest()`。**

??? done "解决方案"
    使用 `heapq` 模块的两个函数：`nlargest()` 和 `nsmallest()`。

    **除了基本用法，两个函数都能接受一个关键字参数，用于更复杂的数据结构中**
    ```python
        portfolio = [
        {'name': 'IBM', 'shares': 100, 'price': 91.1},
        {'name': 'AAPL', 'shares': 50, 'price': 543.22},
        {'name': 'FB', 'shares': 200, 'price': 21.09},
        {'name': 'HPQ', 'shares': 35, 'price': 31.75},
        {'name': 'YHOO', 'shares': 45, 'price': 16.35},
        {'name': 'ACME', 'shares': 75, 'price': 115.65}
    ]
    cheap = heapq.nsmallest(3, portfolio, key=lambda s: s['price'])
    expensive = heapq.nlargest(3, portfolio, key=lambda s: s['price'])
    ```

??? summary "讨论"
    堆数据结构最重要的特征是 `heap[0]` 永远是最小的元素。并且剩余的元素可以很容易的通过调用 `heapq.heappop()` 方法得到，

    ```python
    >>> nums = [1, 8, 2, 23, 7, -4, 18, 23, 42, 37, 2]
    >>> import heapq
    >>> heap = list(nums)
    >>> heapq.heapify(heap)
    >>> heap
    [-4, 2, 1, 23, 7, 2, 18, 23, 42, 37, 8]
    # 如果想要查找最小的 3 个元素，可以使用如下操作
    >>> heapq.heappop(heap)
    -4
    >>> heapq.heappop(heap)
    1
    >>> heapq.heappop(heap)
    2
    ```

    当要查找的元素个数相对比较小的时候，函数 `nlargest()` 和 `nsmallest()` 是很合适的。

    如果仅需要查找唯一的最小或最大（N=1）的元素的话，那么使用 `min()` 和 `max()` 函数会更快些。 

    如果 N 的大小和集合大小接近的时候，通常先排序这个集合然后再使用切片操作会更快点 （`sorted(items)[:N]` 或者是 `sorted(items)[-N:]`）
    
    !!! tip
        `heapq` 模块的官方文档里面也详细的介绍了堆数据结构底层的实现细节。

<!-- -------------------------------------------------------------------------- -->
## 05 实现一个优先级队列

!!! question "问题"
    怎样实现一个按优先级排序的队列？ 并且在这个队列上面每次 pop 操作总是返回优先级最高的那个元素
    
??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 06 字典中的键映射多个值

!!! question "问题"
    怎样实现一个键对应多个值的字典（也叫 `multidict`）？

    - **用 `colllections` 模块中的 `defaultdict` 来构造**
  
??? done "解决方案"
    `dict` 就是一个 key 对应一个 value 的映射。如果需要一个 key 映射多个 values，就需要将 values 放入一个 `container` 中，例如 `list` 或 `set`。
    
    - 如果需要保持元素的插入顺序，请用 `list`

    ```python
    d = {
        'a' : [1, 2, 3],
        'b' : [4, 5]
    }
    ```
   
    - 如果需要去除重复元素，且不关系元素的顺序问题，请用 `set`

    ```python
    e = {
        'a' : {1, 2, 3},
        'b' : {4, 5}
    }
    ```

    - 可以用 `colllections` 模块中的 `defaultdict` 来构造该类型的字典。 `defaultdict` 的一个特征是它会自动初始化每个 key 刚开始对应的值，所以只需要关注添加元素操作即可。

    ```python
    from collections import defaultdict

    d = defaultdict(list)
    d['a'].append(1)
    d['a'].append(2)
    d['b'].append(4)

    d = defaultdict(set)
    d['a'].add(1)
    d['a'].add(2)
    d['b'].add(4)
    ```

??? summary "讨论"
    通过自己实现多值映射字典，初始化是需要注意：

    ```python
    d = {}
    for key, value in pairs:
        if key not in d:
            d[key] = []
        d[key].append(value)
    ```
    
    相较而言， `defaultdict` 则更简洁（前提是知道标准库中有这个实现方式）

    ```python
    d = defaultdict(list)
    for key, value in pairs:
        d[key].append(value)
    ```

<!-- -------------------------------------------------------------------------- -->
## 07 字典排序

!!! question "问题"
    如何创建一个字典，并且在迭代或序列化这个字典的时候能够控制元素的顺序？

    - **使用 `collections` 模块中的 `OrderedDict` 类**

??? done "解决方案"
    `collections` 模块中的 `OrderedDict` 类，在迭代操作的时候会保持元素被插入时的顺序。

    当想要构建一个将来需要序列化或编码成其他格式的映射的时候，比如，想精确控制以 JSON 编码后字段的顺序，可以先使用 OrderedDict 来构建这样的数据。

    ```python
    from collections import OrderedDict

    d = OrderedDict()
    d['foo'] = 1
    d['bar'] = 2
    d['spam'] = 3
    d['grok'] = 4
    # Outputs "foo 1", "bar 2", "spam 3", "grok 4"
    for key in d:
        print(key, d[key])

    >>> import json
    >>> json.dumps(d)
    '{"foo": 1, "bar": 2, "spam": 3, "grok": 4}'
    ```

??? summary "讨论"
    `OrderedDict` 内部维护着一个根据键插入顺序排序的双向链表。每次当一个新的元素插入进来的时候， 它会被放到链表的尾部。对于一个已经存在的键的重复赋值不会改变键的顺序。

    !!! attention
        **一个 `OrderedDict` 的大小是一个普通字典的两倍，因为它内部维护着另外一个链表。** 如果你要构建一个需要大量 `OrderedDict` 实例的数据结构的时候（比如读取 100,000 行 CSV 数据到一个 `OrderedDict` 列表中去）， 那么你就得仔细权衡一下是否使用 Ord`eredDict 带来的好处要大过额外内存消耗的影响。

<!-- -------------------------------------------------------------------------- -->
## 08 字典的运算

!!! question "问题"
    怎样在数据字典中执行一些计算操作（比如求最小值、最大值、排序等等）？

    - **使用 `zip()` 函数**

??? done "解决方案"
    为了对字典值执行计算操作，通常需要使用 `zip()` 函数先将键和值反转过来。

    ```python
    prices = {
        'ACME': 45.23,
        'AAPL': 612.78,
        'IBM': 205.55,
        'HPQ': 37.20,
        'FB': 10.75
    }
    ```

    - 求字典中 value 的最大最小值

    ```python
    min_price = min(zip(prices.values(), prices.keys()))
    # min_price is (10.75, 'FB')
    max_price = max(zip(prices.values(), prices.keys()))
    # max_price is (612.78, 'AAPL')
    ```

    - 对字典中 value 进行排序

    ```python
    prices_sorted = sorted(zip(prices.values(), prices.keys()))
    # prices_sorted is [(10.75, 'FB'), (37.2, 'HPQ'),
    #                   (45.23, 'ACME'), (205.55, 'IBM'),
    #                   (612.78, 'AAPL')]
    ```
  
    !!! attention
        需要注意的是 `zip()` 函数创建的是一个只能访问一次的迭代器。 

        ```python
        prices_and_names = zip(prices.values(), prices.keys())
        print(min(prices_and_names)) # OK
        print(max(prices_and_names)) # ValueError: max() arg is an empty sequence
        ```

??? summary "讨论"
    `zip()` 函数方案会将字典”反转”为 (值，键) 元组序列。当比较两个元组的时候，值会先进行比较，然后才是键。 这样的话，通过一条简单的语句就能很轻松地实现在字典上的求最值和排序操作了。

    !!! attention
        当多个实体拥有相同的值的时候，键会决定返回结果。 比如，在执行 `min()` 和 `max()` 操作的时候，如果恰巧最小或最大值有重复的，那么拥有最小或最大键的实体会返回。
        
        ```python
        >>> prices = { 'AAA' : 45.23, 'ZZZ': 45.23 }
        >>> min(zip(prices.values(), prices.keys()))
        (45.23, 'AAA')
        >>> max(zip(prices.values(), prices.keys()))
        (45.23, 'ZZZ')
        >>>
        ```

<!-- -------------------------------------------------------------------------- -->
## 09 查找两字典的相同点

!!! question "问题"
    怎样在两个字典中寻找相同点（比如相同的键、相同的值等等）？

    - 在两字典的 `keys()` 或者 `items()` 方法返回结果上执行集合操作: `&`, `-` 

??? done "解决方案"
    ```python
    a = {
        'x' : 1,
        'y' : 2,
        'z' : 3
    }

    b = {
        'w' : 10,
        'x' : 11,
        'y' : 2
    }

    # Find keys in common
    a.keys() & b.keys() # { 'x', 'y' }
    # Find keys in a that are not in b
    a.keys() - b.keys() # { 'z' }
    # Find (key,value) pairs in common
    a.items() & b.items() # { ('y', 2) }
    ```

    !!! tip
        这些操作也可以用于修改或者过滤字典元素。 比如，假如你想以现有字典构造一个排除几个指定键的新字典。 下面利用字典推导来实现这样的需求：

        ```python
        # Make a new dictionary with certain keys removed
        c = {key:a[key] for key in a.keys() - {'z', 'w'}}
        # c is {'x': 1, 'y': 2}
        ```

??? summary "讨论"
    一个字典就是一个键集合与值集合的映射关系。 
    
    字典的 `keys()` 方法返回一个展现键集合的键视图对象。 键视图也支持集合操作，比如集合并、交、差运算。 所以，如果想对集合的键执行一些普通的集合操作，可以直接使用键视图对象而不用先将它们转换成一个 set。

    字典的 `items()` 方法返回一个包含 (键，值) 对的元素视图对象。 这个对象同样也支持集合操作，并且可以被用来查找两个字典有哪些相同的键值对。

    字典的 `values()` ，并不支持这里介绍的集合操作。 某种程度上是因为值视图不能保证所有的值互不相同，这样会导致某些集合操作会出现问题。 不过，如果你硬要在值上面执行这些集合操作的话，可以先将值集合转换成 set，然后再执行集合运算。

<!-- -------------------------------------------------------------------------- -->
## 10 删除序列相同元素并保持顺序

!!! question "问题"
    怎样在一个序列上面保持元素顺序的同时消除重复的值？

    - hashable 类型
    - unhashable 类型

??? done "解决方案"

    - 方式一：如果序列上的值都是 `hashable` 类型，可以利用集合或者生成器来解决这个问题。
    ```python
    def dedupe(items):
        seen = set()
        for item in items:
            if item not in seen:
                yield item
                seen.add(item)

    >>> a = [1, 5, 2, 1, 9, 1, 5, 10]
    >>> list(dedupe(a))
    [1, 5, 2, 9, 10]
    ```

    - 方式二：如果要消除元素不可哈希（比如 dict 类型）的序列中重复元素，需要将上述代码稍微改变一下
    ```python
    def dedupe(items, key=None):
        seen = set()
        for item in items:  # key 参数指定了一个函数，将序列元素转换成 hashable 类型
            val = item if key is None else key(item)
            if val not in seen:
                yield item
                seen.add(val)

    >>> a = [ {'x':1, 'y':2}, {'x':1, 'y':3}, {'x':1, 'y':2}, {'x':2, 'y':4}]
    >>> list(dedupe(a, key=lambda d: (d['x'],d['y'])))
    [{'x': 1, 'y': 2}, {'x': 1, 'y': 3}, {'x': 2, 'y': 4}]
    >>> list(dedupe(a, key=lambda d: d['x']))
    [{'x': 1, 'y': 2}, {'x': 2, 'y': 4}]
    >>>
    ```

    **想基于单个字段、属性或者某个更大的数据结构来消除重复元素，第二种方案同样可以胜任。**

??? summary "讨论"

    - `set()` 可以用来消除重复元素，但是不能维护元素的顺序
    - 方式二中使用了生成器函数，让我们的函数更加通用，不仅仅是局限于列表处理。 如果想读取一个文件，消除重复行，可以这样做：

    ```python
    with open(somefile,'r') as f:
    for line in dedupe(f):
        ...
    ```

    !!! tip
        上述 `key` 函数参数模仿了 `sorted()` , `min()` 和 `max()` 等内置函数的相似功能。

<!-- -------------------------------------------------------------------------- -->
## 11 命名切片

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 12 序列中出现次数最多的元素

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 13 通过某个关键字排序一个字典列表

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 14 排序不支持原生比较的对象

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 15 通过某个字段将记录分组

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 16 过滤序列元素

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 17 从字典中提取子集

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 18 映射名称到序列元素

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 19 转换并同时计算数据

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 20 合并多个字典或映射

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 总结

!!! example "总结"