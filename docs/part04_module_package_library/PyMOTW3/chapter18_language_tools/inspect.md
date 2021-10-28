# inspect 模块

!!! note
    inspect 模块提供了对活动对象及其源代码进行内省的功能。

    inspect 模块提供了了解活动对象的途径，包括模块、类、实例、函数和方法。 此模块中的函数可用于检索函数的原始源代码，查看堆栈上方法的参数，并提取对生成源代码的库文档有用的信息。

## Inspecting Modules

可以直接对模块进行 inspect，一般用 `inspect.getmember()`，返回值是由一系列 tuple 值组成的 list， tuple 中分成员名称和成员类型。

!!! tip
    一般可以在输出中，过滤掉以双下划线开头的私有属性

## Inspecting Classes

也可以直接对模块中的类进行 inspect

`inspect.isfunction` 和 `inspect.ismethod` 的区别是，前者查找类中的方法，后者只查找一个类的实例所绑定的方法。

如果某个被 inspect 的类继承父类，那么父类中被继承的方法，也会被显示出来

## Inspecting Instances

见上小节 `inspect.isfunction` 和 `inspect.ismethod` 的区别

## Documentation Strings

`inspect.getdoc()` 会解析 `__doc__` 属性, 将 tabs 键扩展为空格后返回。

`inspect.getcomments()` 一般会返回 module 的第一个 comment，遇到空行则停止返回

## Retriving Source

`getsource()` 和 `getsourcelines()` 会返回模块中的代码，前者直接返回源码，后者返回一个 tuple，tuple 由一系列源代码的 string 组成的一个 list，和一个代码的起始位置号码而组成。

## Method and Function Signatures

## Class Hierarchies

## Method Resolution Order

## The Stack and Frames

## COmmand Line Interface


## 拓展阅读

