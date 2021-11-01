# Python 之道 —— 解析 type 和 object

!!! note
    本文主要阐释了 type 和 object 之间的负载关系，以及元类、类和实例之间的关系。
    
## Object-oriented relationships

1. is a kind of (实线表示)，也可描述为 specialization 或 inheritance：当一个子类（subclass）是另一个父类（superclass）的特殊版本时，这两个对象之间即可称为这种关系。
- 常用术语：subclass of, superclass of, superclass-subclass 或者简单的 is a.

2. is an instance of (虚线表示)，也可描述为 instantiation：当一个实例（instance）是另一个指定的类型（type）的具体示例时，这两个对象之间即可称为这种关系。
- 常用术语：instance of, type of.

## Relationship rules

图片 here
- If A is a subclass of B, and B is a subclass of C, then A is a subclass of C.
- If X is an instance of A, and A is a subclass of B, then X is an instance of B.
- If B is an instance of M, and A is a subclass of B, then A is an instance of M.

## What is a Python object?

object 是具有以下特征属性的实体：

1. Identity：即给定两个名字，我们可以明确判定它们是否指的是同一个对象
2. A value：即可能包含一堆属性，我们可以通过 objectname.attributename 访问其他对象
3. A type：每个对象都只有一种类型。
4. One or more bases：base 类似于面向对象术语中的 super-class 或 base-class。

## Rule 1: Everything is an object

### Functions as objects

### Classes as objects

### Metaclasses (these are objects too!)

## What is type?

## The power of type 

## What is object?

## Kinds of objects

## How are type and object related?

## The Python objects map


## 拓展阅读

[Python Types and Objects by Shalabh Chaturvedi](http://pythonic.zoomquiet.top/data/20070308094655/index.html)