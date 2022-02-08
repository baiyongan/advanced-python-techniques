# 第一章：数据结构和算法
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
    程序包含了大量无法直视的硬编码切片，如何清理一下代码？

    - `slice()` 内置函数

??? done "解决方案"

    ```python
    ######    0123456789012345678901234567890123456789012345678901234567890'
    record = '....................100 .......513.25 ..........'
    # 原方式
    cost = int(record[20:23]) * float(record[31:37])

    # 命名切片方式
    SHARES = slice(20, 23)
    PRICE = slice(31, 37)
    cost = int(record[SHARES]) * float(record[PRICE])
    ```

    使用命名切片的方式，可以避免在代码中出现大量难以理解的硬编码下标，可以提升代码的可读性。

??? summary "讨论"
    内置的 `slice()` 函数，会创建一个切片对象。所有使用切片的地方，都可以使用切片对象。

    如果现有一个切片对象 a，可以分别调用它的 `a.start` , `a.stop` , `a.step` 属性来获取更多的信息。
    ```python
    >>> a = slice(5, 50, 2)
    >>> a.start
    5
    >>> a.stop
    50
    >>> a.step
    2
    >>>
    ```

    可以通过调用切片的 `indices(size)` 的方法，将它映射到一个已知大小的序列上。 这个方法返回一个三元组 `(start, stop, step)` ，所有的值都会被缩小，直到适合这个已知序列的边界为止。 这样，使用的时就不会出现 `IndexError` 异常。

    ```python
    >>> s = 'HelloWorld'
    >>> a.indices(len(s))
    (5, 10, 2)
    >>> for i in range(*a.indices(len(s))):
    ...     print(s[i])
    ...
    W
    r
    d
    >>>
    ```

<!-- -------------------------------------------------------------------------- -->
## 12 序列中出现次数最多的元素

!!! question "问题"
    怎样找出一个序列中出现次数最多的元素呢？

    - `collections.Counter` 类中的 `most_common()` 方法

??? done "解决方案"
    假设你有一个单词列表并且想找出哪个单词出现频率最高。

    ```python 
    words = [
    'look', 'into', 'my', 'eyes', 'look', 'into', 'my', 'eyes',
    'the', 'eyes', 'the', 'eyes', 'the', 'eyes', 'not', 'around', 'the',
    'eyes', "don't", 'look', 'around', 'the', 'eyes', 'look', 'into',
    'my', 'eyes', "you're", 'under'
    ]
    from collections import Counter
    word_counts = Counter(words)
    # 出现频率最高的3个单词
    top_three = word_counts.most_common(3)
    print(top_three)
    # Outputs [('eyes', 8), ('the', 5), ('look', 4)]
    ```

??? summary "讨论"
    作为输入， `Counter` 对象可以接受任意的由可哈希（`hashable`）元素构成的序列对象。 在底层实现上，一个 `Counter` 对象就是一个字典，将元素映射到它出现的次数上。

    除了可以用加减法，来手动变更计数外，还可以用 `update()` 方法来更新。

    `Counter` 实例也可以很容易地和数学运算操作相结合，实现 `+` 、`-` 等操作。 

    !!! tip
        `Counter` 对象在几乎所有需要制表或者计数数据的场合是非常有用的工具。 在解决这类问题的时候你应该优先选择它，而不是手动的利用字典去实现。

<!-- -------------------------------------------------------------------------- -->
## 13 通过某个关键字排序一个字典列表

!!! question "问题"
    现有一个字典列表，如何根据某个或某几个字典字段来排序这个列表？

    - 使用 `operator` 模块的 `itemgetter` 函数

??? done "解决方案"
    ```python
    rows = [
        {'fname': 'Brian', 'lname': 'Jones', 'uid': 1003},
        {'fname': 'David', 'lname': 'Beazley', 'uid': 1002},
        {'fname': 'John', 'lname': 'Cleese', 'uid': 1001},
        {'fname': 'Big', 'lname': 'Jones', 'uid': 1004}
    ]

    # 根据任意的字典字段来排序输入结果行
    from operator import itemgetter
    rows_by_fname = sorted(rows, key=itemgetter('fname'))
    rows_by_uid = sorted(rows, key=itemgetter('uid'))
    print(rows_by_fname)
    print(rows_by_uid)
    
    >>>
    [{'fname': 'Big', 'uid': 1004, 'lname': 'Jones'},
    {'fname': 'Brian', 'uid': 1003, 'lname': 'Jones'},
    {'fname': 'David', 'uid': 1002, 'lname': 'Beazley'},
    {'fname': 'John', 'uid': 1001, 'lname': 'Cleese'}]
    [{'fname': 'John', 'uid': 1001, 'lname': 'Cleese'},
    {'fname': 'David', 'uid': 1002, 'lname': 'Beazley'},
    {'fname': 'Brian', 'uid': 1003, 'lname': 'Jones'},
    {'fname': 'Big', 'uid': 1004, 'lname': 'Jones'}]
    ```

    # `itemgetter()` 函数也支持多个 keys
    ```python
    rows_by_lfname = sorted(rows, key=itemgetter('lname','fname'))
    print(rows_by_lfname)
    >>>
    [{'fname': 'David', 'uid': 1002, 'lname': 'Beazley'},
    {'fname': 'John', 'uid': 1001, 'lname': 'Cleese'},
    {'fname': 'Big', 'uid': 1004, 'lname': 'Jones'},
    {'fname': 'Brian', 'uid': 1003, 'lname': 'Jones'}]
    ```

??? summary "讨论"
    在上例中， rows 被传递给接受一个关键字参数的 `sorted()` 内置函数。 这个参数是 `callable` 类型，并且从 rows 中接受一个单一元素，然后返回被用来排序的值。 `itemgetter()` 函数就是负责创建这个 `callable` 对象的。

    !!! attention
        `operator.itemgetter()` 函数有一个被 rows 中的记录用来查找值的索引参数。可以是一个字典键名称， 一个整形值或者任何能够传入一个对象的 `__getitem__()` 方法的值。 如果你传入多个索引参数给 `itemgetter()` ，它生成的 `callable` 对象会返回一个包含所有元素值的元组， 并且 `sorted()` 函数会根据这个元组中元素顺序去排序。这对于同时在几个字段上面进行排序的情形会很有用。

    `itemgetter()` 有时候也可以用 `lambda` 表达式代替，但是，使用 `itemgetter()` 方式会运行的稍微快点。

    这节中展示的技术也同样适用于 `min()` 和 `max()` 等函数。

<!-- -------------------------------------------------------------------------- -->
## 14 排序不支持原生比较的对象

!!! question "问题"
    如果想排序类型相同的对象，但是它们不支持原生的比较操作，怎么办？

    - 内置的 `sorted()` 函数有一个关键字参数 `key`
    - 使用 `operator.attrgetter()` 来代替 `lambda` 函数

??? done "解决方案"
    内置的 `sorted()` 函数有一个关键字参数 `key` ，可以传入一个 `callable` 对象给它， 这个 `callable` 对象对每个传入的对象返回一个值，这个值会被 `sorted` 用来排序这些对象。 

    如下，提供来一个以 `User` 实例作为输入，并输出对应 `user_id` 值的 `callable` 对象:

    ```python
    class User:
        def __init__(self, user_id):
            self.user_id = user_id

        def __repr__(self):
            return 'User({})'.format(self.user_id)


    def sort_notcompare():
        users = [User(23), User(3), User(99)]
        print(users)
        print(sorted(users, key=lambda u: u.user_id))
    ```

    另外一种方式是使用 `operator.attrgetter()` 来代替 `lambda` 函数：

    ```python
    >>> from operator import attrgetter
    >>> sorted(users, key=attrgetter('user_id'))
    [User(3), User(23), User(99)]
    >>>
    ```

??? summary "讨论"
    !!! tip ""
        `attrgetter()` 函数通常会运行的快点，并且还能同时允许多个字段进行比较。例如，如果 `User` 实例还有一个 `first_name` 和 `last_name` 属性，那么可以向下面这样排序：
        
        ```python
        by_name = sorted(users, key=attrgetter('last_name', 'first_name'))
        ```

        这节中展示的技术也同样适用于 `min()` 和 `max()` 等函数。

<!-- -------------------------------------------------------------------------- -->
## 15 通过某个字段将记录分组

!!! question "问题"
    有一个字典或者实例的序列，如何根据某个特定的字段比如 `date` 来分组迭代访问 ?

    - `itertools.groupby()` 函数

??? done "解决方案"
    假设有下列的字典列表，需要在按 `date` 分组后的数据块上进行迭代。

    ```python 
    rows = [
        {'address': '5412 N CLARK', 'date': '07/01/2012'},
        {'address': '5148 N CLARK', 'date': '07/04/2012'},
        {'address': '5800 E 58TH', 'date': '07/02/2012'},
        {'address': '2122 N CLARK', 'date': '07/03/2012'},
        {'address': '5645 N RAVENSWOOD', 'date': '07/02/2012'},
        {'address': '1060 W ADDISON', 'date': '07/02/2012'},
        {'address': '4801 N BROADWAY', 'date': '07/01/2012'},
        {'address': '1039 W GRANVILLE', 'date': '07/04/2012'},
    ]
    ```
    首先需要按照指定的字段(这里就是 date )排序， 然后调用 itertools.groupby() 函数：

    ```python 
    from operator import itemgetter
    from itertools import groupby

    # Sort by the desired field first
    rows.sort(key=itemgetter('date'))
    # Iterate in groups
    for date, items in groupby(rows, key=itemgetter('date')):
        print(date)
        for i in items:
            print(' ', i)
    ```

    运行结果：
    ```python
    07/01/2012
    {'date': '07/01/2012', 'address': '5412 N CLARK'}
    {'date': '07/01/2012', 'address': '4801 N BROADWAY'}
    07/02/2012
    {'date': '07/02/2012', 'address': '5800 E 58TH'}
    {'date': '07/02/2012', 'address': '5645 N RAVENSWOOD'}
    {'date': '07/02/2012', 'address': '1060 W ADDISON'}
    07/03/2012
    {'date': '07/03/2012', 'address': '2122 N CLARK'}
    07/04/2012
    {'date': '07/04/2012', 'address': '5148 N CLARK'}
    {'date': '07/04/2012', 'address': '1039 W GRANVILLE'}
    ```

??? summary "讨论"
    `groupby(`) 函数扫描整个序列并且查找连续相同值（或者根据指定 `key` 函数返回值相同）的元素序列。 在每次迭代的时候，它会返回一个值和一个迭代器对象， 这个迭代器对象可以生成元素值全部等于上面那个值的组中所有对象。

    !!! attention 
        `groupby()` 仅仅检查连续的元素，如果事先并没有排序完成的话，分组函数将得不到想要的结果。

    如果仅仅只是想根据 `date` 字段将数据分组到一个大的数据结构中去，并且允许随机访问， 那么最好使用 `defaultdict()` 来构建一个多值字典，关于多值字典已经在 1.6 小节有过详细的介绍。比如：

    ```python
    from collections import defaultdict
    rows_by_date = defaultdict(list)
    for row in rows:
        rows_by_date[row['date']].append(row)
    ```

    如此，可以很轻松的就能对每个指定日期访问对应的记录：

    ```python 
    >>> for r in rows_by_date['07/01/2012']:
    ... print(r)
    ...
    {'date': '07/01/2012', 'address': '5412 N CLARK'}
    {'date': '07/01/2012', 'address': '4801 N BROADWAY'}
    >>>
    ```

    在上面这个例子中，没有必要先将记录排序。因此，**如果对内存占用不是很关心， 这种方式会比先排序然后再通过 groupby() 函数迭代的方式运行得快一些。**
    
<!-- -------------------------------------------------------------------------- -->
## 16 过滤序列元素

!!! question "问题"
    有一个数据序列，如何利用一些规则从中提取出需要的值或者是缩短序列?

    - 使用列表推导
    - 使用生成器表达式迭代产生
    - 自定义过滤函数，并结合 `filter()` 函数使用
    - `itertools.compress()`

??? done "解决方案"

    最简单的过滤序列元素的方式是使用列表推导

    ```python
    >>> mylist = [1, 4, -5, 10, -7, 2, 3, -1]
    >>> [n for n in mylist if n > 0]
    [1, 4, 10, 2, 3]
    >>> [n for n in mylist if n < 0]
    [-5, -7, -1]
    >>>
    ```

    !!! tips ""
        列表推导的潜在缺陷就是如果输入非常大的时候会产生一个非常大的结果集，占用大量内存。 如果对内存比较敏感，那么可以使用生成器表达式迭代产生过滤的元素。

    ```python
    >>> pos = (n for n in mylist if n > 0)
    >>> pos
    <generator object <genexpr> at 0x1006a0eb0>
    >>> for x in pos:
    ... print(x)
    ...
    1
    4
    10
    2
    3
    >>>
    ```

    假设过滤的时候需要处理一些异常或者其他复杂情况，可以将过滤代码放到一个函数中， 然后使用内建的 `filter()` 函数。

    ```python
    values = ['1', '2', '-3', '-', '4', 'N/A', '5']
    def is_int(val):
        try:
            x = int(val)
            return True
        except ValueError:
            return False
    ivals = list(filter(is_int, values))
    print(ivals)
    # Outputs ['1', '2', '-3', '4', '5']
    ```

    `filter()` 函数创建了一个迭代器，因此如果想得到一个列表的话，就得像示例那样使用 `list()` 去转换。

??? summary "讨论"

    列表推导和生成器表达式通常情况下是过滤数据最简单的方式。 

    - 在过滤时转换数据
    ```python
    >>> mylist = [1, 4, -5, 10, -7, 2, 3, -1]
    >>> import math
    >>> [math.sqrt(n) for n in mylist if n > 0]
    [1.0, 2.0, 3.1622776601683795, 1.4142135623730951, 1.7320508075688772]
    >>>
    ```

    - 将不符合条件的值用新的值代替，而不是丢弃它们。

    ```python
    >>> clip_neg = [n if n > 0 else 0 for n in mylist]
    >>> clip_neg
    [1, 4, 0, 10, 0, 2, 3, 0]
    >>> clip_pos = [n if n < 0 else 0 for n in mylist]
    >>> clip_pos
    [0, 0, -5, 0, -7, 0, 0, -1]
    >>>
    ```
    
    - 以另一个相关联的序列来过滤某序列
    
    使用 `itertools.compress()`这个过滤工具，它以一个 `iterable` 对象和一个相对应的 `Boolean` 选择器序列作为输入参数。 然后输出 `iterable` 对象中对应选择器为 `True` 的元素。

    ```python
    addresses = [
        '5412 N CLARK',
        '5148 N CLARK',
        '5800 E 58TH',
        '2122 N CLARK',
        '5645 N RAVENSWOOD',
        '1060 W ADDISON',
        '4801 N BROADWAY',
        '1039 W GRANVILLE',
    ]
    counts = [ 0, 3, 10, 4, 1, 7, 6, 1]
    ```

    想将那些对应 count 值大于5的地址全部输出，可以这样做：

    ```python
    >>> from itertools import compress
    >>> more5 = [n > 5 for n in counts]
    >>> more5
    [False, False, True, False, False, True, True, False]
    >>> list(compress(addresses, more5))
    ['5800 E 58TH', '1060 W ADDISON', '4801 N BROADWAY']
    >>>
    ```
    !!! attention
        关键点在于先创建一个 `Boolean` 序列，指示哪些元素符合条件。 然后 `compress()` 函数根据这个序列去选择输出对应位置为 `True` 的元素。

        和 `filter()` 函数类似， `compress()` 也是返回的一个迭代器。因此，如果需要得到一个列表， 则需要使用 `list()` 来将结果转换为列表类型。

<!-- -------------------------------------------------------------------------- -->
## 17 从字典中提取子集

!!! question "问题"
    你想构造一个字典，它是另外一个字典的子集。

    - 字典推导

??? done "解决方案"
    最简单的方式是使用字典推导。比如：

    ```python
    prices = {
        'ACME': 45.23,
        'AAPL': 612.78,
        'IBM': 205.55,
        'HPQ': 37.20,
        'FB': 10.75
    }
    # Make a dictionary of all prices over 200
    p1 = {key: value for key, value in prices.items() if value > 200}
    # Make a dictionary of tech stocks
    tech_names = {'AAPL', 'IBM', 'HPQ', 'MSFT'}
    p2 = {key: value for key, value in prices.items() if key in tech_names}
    ```

??? summary "讨论"
    大多数情况下字典推导能做到的，通过创建一个元组序列然后把它传给 `dict()` 函数也能实现。比如：

    ```python
    p1 = dict((key, value) for key, value in prices.items() if value > 200)
    ```

    但是，字典推导方式表意更清晰，并且实际上也会运行的更快些 （在这个例子中，实际测试几乎比 `dict()` 函数方式快整整一倍）。

    有时候完成同一件事会有多种方式。比如，第二个例子程序也可以像这样重写：

    ```python
    # Make a dictionary of tech stocks
    tech_names = { 'AAPL', 'IBM', 'HPQ', 'MSFT' }
    p2 = { key:prices[key] for key in prices.keys() & tech_names }
    ```

    !!! attention
        但是，运行时间测试结果显示这种方案大概比第一种方案慢 1.6 倍。 如果对程序运行性能要求比较高的话，需要花点时间去做计时测试。

<!-- -------------------------------------------------------------------------- -->
## 18 映射名称到序列元素

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 19 转换并同时计算数据

!!! question "问题"
    你需要在数据序列上执行聚集函数（比如 `sum()` , `min()` , `max()` ）， 但是首先你需要先转换或者过滤数据

    - 使用一个生成器表达式参数去结合数据计算与转换

??? done "解决方案"
    例如计算平方和：

    ```python
    nums = [1, 2, 3, 4, 5]
    s = sum(x * x for x in nums)
    ```

    又例如：
    
    ```python
    # Determine if any .py files exist in a directory
    import os
    files = os.listdir('dirname')
    if any(name.endswith('.py') for name in files):
        print('There be python!')
    else:
        print('Sorry, no python.')
    # Output a tuple as CSV
    s = ('ACME', 50, 123.45)
    print(','.join(str(x) for x in s))
    # Data reduction across fields of a data structure
    portfolio = [
        {'name':'GOOG', 'shares': 50},
        {'name':'YHOO', 'shares': 75},
        {'name':'AOL', 'shares': 20},
        {'name':'SCOX', 'shares': 65}
    ]
    min_shares = min(s['shares'] for s in portfolio)
    ```

??? summary "讨论"
    下面这些语句是等效的：

    ```python
    s = sum((x * x for x in nums)) # 显式的传递一个生成器表达式对象
    s = sum(x * x for x in nums) # 更加优雅的实现方式，省略了括号
    ```

    !!! tips 
        使用一个生成器表达式作为参数会比先创建一个临时列表更加高效和优雅。

    ```python
    nums = [1, 2, 3, 4, 5]
    s = sum([x * x for x in nums])
    ```

    以上这个方式可以达到想要的效果，但是它会多一个步骤，先创建一个额外的列表。 对于小型列表可能没什么关系，但是如果元素数量非常大的时候， 它会创建一个巨大的仅仅被使用一次就被丢弃的临时数据结构。而生成器方案会以迭代的方式转换数据，因此更省内存。

    在使用一些聚集函数比如 `min()` 和 `max()` 的时候，更加倾向于使用生成器版本，它们接受的一个 key 关键字参数或许会很有帮助。 
    
    比如，在上面的证券例子中，你可能会考虑下面的实现版本：

    ```python
    # Original: Returns 20
    min_shares = min(s['shares'] for s in portfolio)
    # Alternative: Returns {'name': 'AOL', 'shares': 20}
    min_shares = min(portfolio, key=lambda s: s['shares'])
    ```
<!-- -------------------------------------------------------------------------- -->
## 20 合并多个字典或映射

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 总结

!!! example "总结"