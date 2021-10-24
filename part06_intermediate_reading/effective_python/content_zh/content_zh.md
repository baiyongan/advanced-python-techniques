# 目录

## Chapter 1: 培养 Pythonic 思维

??? abstract
    Pythonic 风格的代码，是开发者在使用 Python 语言编程并相互协作的过程中逐渐形成的。本章讲解如何采用这样的风格编写常见的Python代码。 

- [x] 1 Know Which Version of Python You’re Using
- [x] 2 Follow the PEP 8 Style Guide
- [x] 3 Know the Differences Between bytes and str
- [ ] 4 Prefer Interpolated F-Strings Over C-style Format Strings and str.format
- [ ] 5 Write Helper Functions Instead of Complex Expressions
- [ ] 6 Prefer Multiple Assignment Unpacking Over Indexing
- [ ] 7 Prefer enumerate Over range
- [ ] 8 Use zip to Process Iterators in Parallel
- [ ] 9 Avoid else Blocks After for and while Loops
- [ ] 10 Prevent Repetition with Assignment Expressions

## Chapter 2: 列表与字典

??? abstract
    在Python语言中h处理信息时，最常用的方法是把一系列数值保存到列表（list）中。另外一种跟它互补的结构，是字典（dict），字典可以把它存储的查找键（key）映射到对应的值（value）上。本章讲解如何采用这些数据结构来编写程序。

- [ ] 11 Know How to Slice Sequences
- [ ] 12 Avoid Striding and Slicing in a Single Expression
- [ ] 13 Prefer Catch-All Unpacking Over Slicing
- [ ] 14 Sort by Complex Criteria Using the key Parameter
- [ ] 15 Be Cautious When Relying on dict Insertion Ordering
- [ ] 16 Prefer get Over in and KeyError to Handle Missing Dictionary Keys
- [ ] 17 Prefer defaultdict Over setdefault to Handle Missing Items in Internal State
- [ ] 18 Know How to Construct Key-Dependent Default Values with \_\_missing\_\_

## Chapter 3: 函数

??? abstract
    Python中的函数具备多种特性，这有助于简化编程工作。Python函数的某些性质与其他编程语言中函数的类似，但也有很多是Python独有的。本章介绍如何使用函数来表达开发者的意图，如何让代码更容易复用，以及如何减少bug。

- [ ] 19 Never Unpack More Than Three Variables When Functions Return Multiple Values
- [ ] 20 Prefer Raising Exceptions to Returning None
- [ ] 21 Know How Closures Interact with Variable Scope
- [ ] 22 Reduce Visual Noise with Variable Positional Arguments
- [ ] 23 Provide Optional Behavior with Keyword Arguments
- [ ] 24 Use None and Docstrings to Specify Dynamic Default Arguments
- [ ] 25 Enforce Clarity with Keyword-Only and Position-Only Arguments
- [ ] 26 Define Function Decorators with functools.wraps

## Chapter 4: 推导与生成

??? abstract
    Python有一种特殊的语法，可以迅速迭代列表（list）、字典（dict）与集合（set），并据此生成相应的数据结构，这也使得在函数返回的这种结构上，逐个访问根据原结构所派生出来的一系列值。本章讲解怎样利用这种机制来提升程序效率并降低内存用量，同时提高代码可读性。

- [ ] 27 Use Comprehensions Instead of map and filter
- [ ] 28 Avoid More Than Two Control Subexpressions in Comprehensions
- [ ] 29 Avoid Repeated Work in Comprehensions by Using Assignment Expressions
- [ ] 30 Consider Generators Instead of Returning Lists
- [ ] 31 Be Defensive When Iterating Over Arguments
- [ ] 32 Consider Generator Expressions for Large List Comprehensions
- [ ] 33 Compose Multiple Generators with yield from
- [ ] 34 Avoid Injecting Data into Generators with send
- [ ] 35 Avoid Causing State Transitions in Generators with throw
- [ ] 36 Consider itertools for Working with Iterators and Generators

## Chapter 5: 类与接口

??? abstract
    Python是面向对象的语言。用Python编程时，经常要编写新的类，而且还要定义这些类应该如何通过其接口以及继承体系与其他代码相交互。本章讲解怎样使用类来表达对象所应具备的行为。

- [ ] 37 Compose Classes Instead of Nesting Many Levels of Built-in Types
- [ ] 38 Accept Functions Instead of Classes for Simple Interfaces
- [ ] 39 Use @classmethod Polymorphism to Construct Objects Generically
- [ ] 40 Initialize Parent Classes with super
- [ ] 41 Consider Composing Functionality with Mix-in Classes
- [ ] 42 Prefer Public Attributes Over Private Ones
- [ ] 43 Inherit from collections.abc for Custom Container Types

## Chapter 6: 元类与属性

??? abstract
    元类（metaclass）与动态属性（dynamic attribute）都是很强大的Python特性，但它们也有可能会让程序出现古怪的行为与意外的效果。本章讲解这些机制的习惯用法，确保最终写出来的代码遵循最小惊讶原则（rule of least surprise）。

- [ ] 44 Use Plain Attributes Instead of Setter and Getter Methods
- [ ] 45 Consider @property Instead of Refactoring Attributes
- [ ] 46 Use Descriptors for Reusable @property Methods
- [ ] 47 Use \_\_getattr\_\_, \_\_getattribute\_\_, and \_\_setattr\_\_ for Lazy Attributes
- [ ] 48 Validate Subclasses with \_\_init_subclass\_\_
- [ ] 49 Register Class Existence with \_\_init_subclass\_\_
- [ ] 50 Annotate Class Attributes with \_\_set_name\_\_
- [ ] 51 Prefer Class Decorators Over Metaclasses for Composable Class Extensions

## Chapter 7: 并发与并行

??? abstract
    用Python很容易写并发程序，这种程序可以在同一时刻做许多件不同的事情。Python也可以通过系统调用、子进程以及C语言扩展来实现并行处理。本章介绍在这些不同情况下，如何充分利用 Python 的相关特性。

- [ ] 52 Use subprocess to Manage Child Processes
- [ ] 53 Use Threads for Blocking I/O, Avoid for Parallelism
- [ ] 54 Use Lock to Prevent Data Races in Threads
- [ ] 55 Use Queue to Coordinate Work Between Threads
- [ ] 56 Know How to Recognize When Concurrency Is Necessary
- [ ] 57 Avoid Creating New Thread Instances for On-demand Fan-out
- [ ] 58 Understand How Using Queue for Concurrency Requires Refactoring
- [ ] 59 Consider ThreadPoolExecutor When Threads Are Necessary for Concurrency
- [ ] 60 Achieve Highly Concurrent I/O with Coroutines
- [ ] 61 Know How to Port Threaded I/O to asyncio
- [ ] 62 Mix Threads and Coroutines to Ease the Transition to asyncio
- [ ] 63 Avoid Blocking the asyncio Event Loop to Maximize Responsiveness
- [ ] 64 Consider concurrent.futures for True Parallelism

## Chapter 8: 稳定与性能

??? abstract
    Python内置了一些功能与模块，可以让程序变得更加可靠。另外，Python还提供了一些工具，可以让我们轻松地提升程序的性能。本章讲解怎样用Python优化程序，让这些程序在正式的运行环境中表现得更加稳定、更加高效。

- [ ] 65 Take Advantage of Each Block in try/except/else/finally
- [ ] 66 Consider contextlib and with Statements for Reusable try/finally Behavior
- [ ] 67 Use datetime Instead of time for Local Clocks
- [ ] 68 Make pickle Reliable with copyreg
- [ ] 69 Use decimal When Precision Is Paramount
- [ ] 70 Profile Before Optimizing
- [ ] 71 Prefer deque for Producer–Consumer Queues
- [ ] 72 Consider Searching Sorted Sequences with bisect
- [ ] 73 Know How to Use heapq for Priority Queues
- [ ] 74 Consider memoryview and bytearray for Zero-Copy Interactions with bytes

## Chapter 9: 测试与调试

??? abstract
    不管使用哪种语言编程，都应该把写出来的代码测试一下。但对于Python来说，还有个特殊的问题，那就是它所提供的动态机制可能会增加程序在运行时出现错误的风险。好在Python也让我们可以比较容易地编写测试代码和故障诊断程序。本章讲解怎样用Python内置的工具来测试并调试程序。

- [ ] 75 Use repr Strings for Debugging Output
- [ ] 76 Verify Related Behaviors in TestCase Subclasses
- [ ] 77 Isolate Tests from Each Other with setUp, tearDown, setUpModule, and tearDownModule
- [ ] 78 Use Mocks to Test Code with Complex Dependencies
- [ ] 79 Encapsulate Dependencies to Facilitate Mocking and Testing
- [ ] 80 Consider Interactive Debugging with pdb
- [ ] 81 Use tracemalloc to Understand Memory Usage and Leaks

## Chapter 10: 协作开发

??? abstract
    如果许多人要协作开发Python程序，那就得仔细商量代码的写法了。即便只是个人独立开发，也需要了解如何使用其他人所写的模块。本章介绍标准的工具以及业界总结出来的最佳方法，来说明怎样协作开发Python程序。

- [ ] 82 Know Where to Find Community-Built Modules
- [ ] 83 Use Virtual Environments for Isolated and Reproducible Dependencies
- [ ] 84 Write Docstrings for Every Function, Class, and Module
- [ ] 85 Use Packages to Organize Modules and Provide Stable APIs
- [ ] 86 Consider Module-Scoped Code to Configure Deployment Environments
- [ ] 87 Define a Root Exception to Insulate Callers from APIs
- [ ] 88 Know How to Break Circular Dependencies
- [ ] 89 Consider warnings to Refactor and Migrate Usage
- [ ] 90 Consider Static Analysis via typing to Obviate Bugs

## 拓展阅读

- [Effective PYTHON The Book: Second Edition](https://effectivepython.com/)
- [Github: bslatkin/effectivepython](https://github.com/bslatkin/effectivepython)