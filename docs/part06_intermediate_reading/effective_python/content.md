# 目录

## Chapter 1: Pythonic Thinking

The Python community has come to use the adjective **Pythonic** to describe code that follows a particular style. The idioms of Python have emerged over time through experience using the language and working with others. This chapter covers the best way to do the most common things in Python.

### 1. Know Which Version of Python You’re Using
### 2. Follow the PEP 8 Style Guide
### 3. Know the Differences Between bytes and str
### 4. Prefer Interpolated F-Strings Over C-style Format Strings and str.format
### 5. Write Helper Functions Instead of Complex Expressions
### 6. Prefer Multiple Assignment Unpacking Over Indexing
### 7. Prefer enumerate Over range
### 8. Use zip to Process Iterators in Parallel
### 9. Avoid else Blocks After for and while Loops
### 10. Prevent Repetition with Assignment Expressions

## Chapter 2: Lists and Dictionaries

In Python, the most common way to organize information is in a sequence of values stored in a list. A list‘s natural complement is the dict that stores lookup keys - mapped to corresponding values. This chapter covers how to build programs with these versatile building blocks.

### Know How to Slice Sequences
### Avoid Striding and Slicing in a Single Expression
### Prefer Catch-All Unpacking Over Slicing
### Sort by Complex Criteria Using the key Parameter
### Be Cautious When Relying on dict Insertion Ordering
### Prefer get Over in and KeyError to Handle Missing Dictionary Keys
### Prefer defaultdict Over setdefault to Handle Missing Items in Internal State
### Know How to Construct Key-Dependent Default Values with \_\_missing\_\_

## Chapter 3: Functions

Functions in Python have a variety of extra features that make a programmer’s life easier. Some are similar to capabilities in other programming languages, but many are unique to Python. This chapter covers how to use functions to clarify intention, promote reuse, and reduce bugs.

### Never Unpack More Than Three Variables When Functions Return Multiple Values
### Prefer Raising Exceptions to Returning None
### Know How Closures Interact with Variable Scope
### Reduce Visual Noise with Variable Positional Arguments
### Provide Optional Behavior with Keyword Arguments
### Use None and Docstrings to Specify Dynamic Default Arguments
### Enforce Clarity with Keyword-Only and Position-Only Arguments
### Define Function Decorators with functools.wraps

## Chapter 4: Comprehensions and Generators

Python has special syntax for quickly iterating through lists, dictionaries, and sets to generate derivative data structures. It also allows for a stream of iterable values to be incrementally returned by a function. This chapter covers how these features can provide better performance, reduced memory usage, and improved readability.

### Use Comprehensions Instead of map and filter
### Avoid More Than Two Control Subexpressions in Comprehensions
### Avoid Repeated Work in Comprehensions by Using Assignment Expressions
### Consider Generators Instead of Returning Lists
### Be Defensive When Iterating Over Arguments
### Consider Generator Expressions for Large List Comprehensions
### Compose Multiple Generators with yield from
### Avoid Injecting Data into Generators with send
### Avoid Causing State Transitions in Generators with throw
### Consider itertools for Working with Iterators and Generators

## Chapter 5: Classes and Interfaces

Python is an object-oriented language. Getting things done in Python often requires writing new classes and defining how they interact through their interfaces and hierarchies. This chapter covers how to use classes to express your intended behaviors with objects.

### Compose Classes Instead of Nesting Many Levels of Built-in Types
### Accept Functions Instead of Classes for Simple Interfaces
### Use @classmethod Polymorphism to Construct Objects Generically
### Initialize Parent Classes with super
### Consider Composing Functionality with Mix-in Classes
### Prefer Public Attributes Over Private Ones
### Inherit from collections.abc for Custom Container Types

## Chapter 6: Metaclasses and Attributes

Metaclasses and dynamic attributes are powerful Python features. However, they also enable you to implement extremely bizarre and unexpected behaviors. This chapter covers the common idioms for using these mechanisms to ensure that you follow the rule of least surprise.

### Use Plain Attributes Instead of Setter and Getter Methods
### Consider @property Instead of Refactoring Attributes
### Use Descriptors for Reusable @property Methods
### Use \_\_getattr\_\_, \_\_getattribute\_\_, and \_\_setattr\_\_ for Lazy Attributes
### Validate Subclasses with \_\_init_subclass\_\_
### Register Class Existence with \_\_init_subclass\_\_
### Annotate Class Attributes with \_\_set_name\_\_
### Prefer Class Decorators Over Metaclasses for Composable Class Extensions

## Chapter 7: Concurrency and Parallelism

Python makes it easy to write concurrent programs that do many different things seemingly at the same time. Python can also be used to do parallel work through system calls, subprocesses, and C extensions. This chapter covers how to best utilize Python in these subtly different situations.

### Use subprocess to Manage Child Processes
### Use Threads for Blocking I/O, Avoid for Parallelism
### Use Lock to Prevent Data Races in Threads
### Use Queue to Coordinate Work Between Threads
### Know How to Recognize When Concurrency Is Necessary
### Avoid Creating New Thread Instances for On-demand Fan-out
### Understand How Using Queue for Concurrency Requires Refactoring
### Consider ThreadPoolExecutor When Threads Are Necessary for Concurrency
### Achieve Highly Concurrent I/O with Coroutines
### Know How to Port Threaded I/O to asyncio
### Mix Threads and Coroutines to Ease the Transition to asyncio
### Avoid Blocking the asyncio Event Loop to Maximize Responsiveness
### Consider concurrent.futures for True Parallelism

## Chapter 8: Robustness and Performance

Python has built-in features and modules that aid in hardening your programs so they are dependable. Python also includes tools to help you achieve higher performance with minimal effort. This chapter covers how to use Python to optimize your programs to maximize their reliability and efficiency in production.

### Take Advantage of Each Block in try/except/else/finally
### Consider contextlib and with Statements for Reusable try/finally Behavior
### Use datetime Instead of time for Local Clocks
### Make pickle Reliable with copyreg
### Use decimal When Precision Is Paramount
### Profile Before Optimizing
### Prefer deque for Producer–Consumer Queues
### Consider Searching Sorted Sequences with bisect
### Know How to Use heapq for Priority Queues
### Consider memoryview and bytearray for Zero-Copy Interactions with bytes

## Chapter 9: Testing and Debugging

You should always test your code, regardless of what language it’s written in. However, Python’s dynamic features can increase the risk of runtime errors in unique ways. Luckily, they also make it easier to write tests and diagnose malfunctioning programs. This chapter covers Python’s built-in tools for testing and debugging.

### Use repr Strings for Debugging Output
### Verify Related Behaviors in TestCase Subclasses
### Isolate Tests from Each Other with setUp, tearDown, setUpModule, and tearDownModule
### Use Mocks to Test Code with Complex Dependencies
### Encapsulate Dependencies to Facilitate Mocking and Testing
### Consider Interactive Debugging with pdb
### Use tracemalloc to Understand Memory Usage and Leaks

## Chapter 10: Collaboration

Collaborating on Python programs requires you to be deliberate about how you write your code. Even if you’re working alone, you’ll want to understand how to use modules written by others. This chapter covers the standard tools and best practices that enable people to work together on Python programs.

### Know Where to Find Community-Built Modules
### Use Virtual Environments for Isolated and Reproducible Dependencies
### Write Docstrings for Every Function, Class, and Module
### Use Packages to Organize Modules and Provide Stable APIs
### Consider Module-Scoped Code to Configure Deployment Environments
### Define a Root Exception to Insulate Callers from APIs
### Know How to Break Circular Dependencies
### Consider warnings to Refactor and Migrate Usage
### Consider Static Analysis via typing to Obviate Bugs

## 拓展阅读

- [Effective PYTHON The Book: Second Edition](https://effectivepython.com/)
- [Github: bslatkin/effectivepython](https://github.com/bslatkin/effectivepython)