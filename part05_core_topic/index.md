# Overview

## 面向对象
- 鸭子类型
- 抽象基类
- 类变量、对象变量的查找顺序
- 静态方法、类方法、实例方法
- 数据封装和私有属性
- 对象的自省机制
- 上下文管理器
- contextlib实现上下文管理器
- super函数的查找顺序
- mixin继承模式的应用

# 元类
- property动态属性
- \_\_getattr\_\_、\_\_getattribute\_\_ 区别
- 属性描述符
- \_\_new\_\_ 和 \_\_init\_\_
- 元类实现ORM

## 多线程 
- GIL和多线程
- 线程通信-共享变量、Queue
- 线程同步-Lock、RLock、Condition、Semaphor
- 线程池和源码分析-ThreadPoolExecutor
- 多进程-multiprocessing
- 进程间通信

## 异步IO 
- IO多路复用-select、poll、epoll
- select+回调+事件循环模
- 生成器进阶-send、close、throw和yield from
- async和await


## asyncio并发编程
- 事件循环
- 协程嵌套
- call\_soon、call\_later、call\_at
- call\_soon\_threadsafe
- ThreadPoolExecutor+asyncio
- asyncio 模拟 http 请求
- future 和 task
- asyncio 同步和通信
- aiohttp 实现高并发爬虫

## 拓展阅读

- [Python3高级核心技术97讲](https://coding.imooc.com/class/200.html)