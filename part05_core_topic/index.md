# Overview

<!-- 
<div class="cards">
  <div class="card core">
    <strong>面向对象</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">鸭子类型</a></li>
      <li><a href="/part05_core_topic/  ">抽象基类</a></li>
      <li><a href="/part05_core_topic/  ">类变量、对象变量的查找顺序</a></li>
      <li><a href="/part05_core_topic/  ">静态方法、类方法、实例方法</a></li>
      <li><a href="/part05_core_topic/  ">数据封装和私有属性</a></li>
      <li><a href="/part05_core_topic/  ">对象的自省机制</a></li>
      <li><a href="/part05_core_topic/  ">上下文管理器</a></li>
      <li><a href="/part05_core_topic/  ">contextlib实现上下文管理器</a></li>
      <li><a href="/part05_core_topic/  ">super函数的查找顺序</a></li>
      <li><a href="/part05_core_topic/  ">mixin继承模式的应用</a></li>
    </ul>
  </div>
  <div class="card core">
    <strong>元类</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">property动态属性</a></li>
      <li><a href="/part05_core_topic/  ">__getattr__、__getattribute__ 区别</a></li>
      <li><a href="/part05_core_topic/  ">属性描述符</a></li>
      <li><a href="/part05_core_topic/  ">__new__ 和 __init__</a></li>
      <li><a href="/part05_core_topic/  ">元类实现ORM</a></li>
    </ul>
  </div>
</div>

<div class="cards">
  <div class="card core">
    <strong>多线程</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">GIL和多线程</a></li>
      <li><a href="/part05_core_topic/  ">线程通信-共享变量、Queue</a></li>
      <li><a href="/part05_core_topic/  ">线程同步-Lock、RLock、Condition、Semaphor</a></li>
      <li><a href="/part05_core_topic/  ">线程池和源码分析-ThreadPoolExecutor</a></li>
      <li><a href="/part05_core_topic/  ">多进程-multiprocessing</a></li>
      <li><a href="/part05_core_topic/  ">进程间通信</a></li>
    </ul>
  </div>
  <div class="card core">
    <strong>异步IO</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">IO多路复用-select、poll、epoll</a></li>
      <li><a href="/part05_core_topic/  ">select+回调+事件循环模</a></li>
      <li><a href="/part05_core_topic/  ">生成器进阶-send、close、throw和yield from</a></li>
      <li><a href="/part05_core_topic/  ">async和await</a></li>
    </ul>
  </div>
</div>

<div class="cards">
  <div class="card core">
    <strong>asyncio并发编程</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">事件循环</a></li>
      <li><a href="/part05_core_topic/  ">协程嵌套</a></li>
      <li><a href="/part05_core_topic/  ">call_soon、call_later、call_at</a></li>
      <li><a href="/part05_core_topic/  ">call_soon_threadsafe</a></li>
      <li><a href="/part05_core_topic/  ">ThreadPoolExecutor+asyncio</a></li>
      <li><a href="/part05_core_topic/  ">asyncio 模拟 http 请求</a></li>
      <li><a href="/part05_core_topic/  ">future 和 task</a></li>
      <li><a href="/part05_core_topic/  ">asyncio 同步和通信</a></li>
      <li><a href="/part05_core_topic/  ">aiohttp 实现高并发爬虫</a></li>
    </ul>
  </div>
  <div class="card empty">  
    <strong></strong>
    <ul class="card-items">
    </ul>
  </div>
</div> 
-->


<div class="cards">
  <div class="card core">
    <strong>一 python中一切皆对象</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 python中一切皆对象</a></li>
      <li><a href="/part05_core_topic/  ">2 type、object和class之间的关系</a></li>
      <li><a href="/part05_core_topic/  ">3 python中的内置类型</a></li>
      <li><a href="/part05_core_topic/  ">4 本章小结</a></li>
    </ul>
  </div>
  <div class="card core">
    <strong>二 魔法函数</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 什么是魔法函数</a></li>
      <li><a href="/part05_core_topic/  ">2 python数据模型对python的影响</a></li>
      <li><a href="/part05_core_topic/  ">3 python魔法函数一览</a></li>
      <li><a href="/part05_core_topic/  ">4 len函数的特殊性</a></li>
      <li><a href="/part05_core_topic/  ">5 本章小结</a></li>
    </ul>
  </div>
</div>

<div class="cards">
  <div class="card core">
    <strong>三 深入类和对象</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 鸭子类型和多态</a></li>
      <li><a href="/part05_core_topic/  ">2 抽象基类(abc模块) - 1</a></li>
      <li><a href="/part05_core_topic/  ">3 抽象基类(abc模块) - 2</a></li>
      <li><a href="/part05_core_topic/  ">4 isinstance和type的区别</a></li>
      <li><a href="/part05_core_topic/  ">5 类变量和实例变量</a></li>
      <li><a href="/part05_core_topic/  ">6 类和实例属性的查找顺序—mro查找</a></li>
      <li><a href="/part05_core_topic/  ">7 类方法、静态方法和实例方法</a></li>
      <li><a href="/part05_core_topic/  ">8 数据封装和私有属性</a></li>
      <li><a href="/part05_core_topic/  ">9 python对象的自省机制</a></li>
      <li><a href="/part05_core_topic/  ">10 super真的是调用父类吗？</a></li>
      <li><a href="/part05_core_topic/  ">11 mixin继承案例-django rest framework</a></li>
      <li><a href="/part05_core_topic/  ">12 python中的with语句</a></li>
      <li><a href="/part05_core_topic/  ">13 contextlib简化上下文管理器</a></li>
      <li><a href="/part05_core_topic/  ">14 本章小结</a></li>
    </ul>
  </div>
  <div class="card core">
    <strong>四 自定义序列类</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 python中的序列分类</a></li>
      <li><a href="/part05_core_topic/  ">2 python中序列类型的abc继承关系</a></li>
      <li><a href="/part05_core_topic/  ">3 list中extend方法区别</a></li>
      <li><a href="/part05_core_topic/  ">4 实现可切片的对象</a></li>
      <li><a href="/part05_core_topic/  ">5 bisect维护已排序序列</a></li>
      <li><a href="/part05_core_topic/  ">6 什么时候我们不该使用列表</a></li>
      <li><a href="/part05_core_topic/  ">7 列表推导式、生成器表达式、字典推导式</a></li>
      <li><a href="/part05_core_topic/  ">8 本章小结</a></li>
    </ul>
  </div>
</div>

<div class="cards">
  <div class="card core">
    <strong>五 深入python的set和dict</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 dict的abc继承关系</a></li>
      <li><a href="/part05_core_topic/  ">2 dict的常用方法</a></li>
      <li><a href="/part05_core_topic/  ">3 dict的子类</a></li>
      <li><a href="/part05_core_topic/  ">4 set和frozenset</a></li>
      <li><a href="/part05_core_topic/  ">5 dict和set的实现原理</a></li>
      <li><a href="/part05_core_topic/  ">6 本章小结</a></li>
    </ul>
  </div>
  <div class="card core">
    <strong>六 对象引用、可变性和垃圾回收</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 python中的变量是什么</a></li>
      <li><a href="/part05_core_topic/  ">2 ==和is的区别</a></li>
      <li><a href="/part05_core_topic/  ">3 del语句和垃圾回收</a></li>
      <li><a href="/part05_core_topic/  ">4 一个经典的参数错误</a></li>
      <li><a href="/part05_core_topic/  ">5 本章小结</a></li>
    </ul>
  </div>
</div>

<div class="cards">
  <div class="card core">
    <strong>七 元类编程</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 property动态属性</a></li>
      <li><a href="/part05_core_topic/  ">2 __getattr__、__getattribute__魔法函数</a></li>
      <li><a href="/part05_core_topic/  ">3 属性描述符和属性查找过程</a></li>
      <li><a href="/part05_core_topic/  ">4 __new__和__init__的区别</a></li>
      <li><a href="/part05_core_topic/  ">5 自定义元类</a></li>
      <li><a href="/part05_core_topic/  ">6 通过元类实现orm-1</a></li>
      <li><a href="/part05_core_topic/  ">7 通过元类实现orm-2</a></li>
      <li><a href="/part05_core_topic/  ">8 本章小结</a></li>
    </ul>
  </div>
  <div class="card core">
    <strong>八 迭代器和生成器</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 python中的迭代协议</a></li>
      <li><a href="/part05_core_topic/  ">2 什么是迭代器和可迭代对象</a></li>
      <li><a href="/part05_core_topic/  ">3 生成器函数的使用</a></li>
      <li><a href="/part05_core_topic/  ">4 python是如何实现生成器的</a></li>
      <li><a href="/part05_core_topic/  ">5 生成器在UserList中的应用</a></li>
      <li><a href="/part05_core_topic/  ">6 生成器如何读取大文件</a></li>
      <li><a href="/part05_core_topic/  ">7 本章小结</a></li>
    </ul>
  </div>
</div>

<div class="cards">
  <div class="card core">
    <strong>九 python socket编程</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 弄懂 HTTP、Socket、TCP 这几个概念</a></li>
      <li><a href="/part05_core_topic/  ">2 socket 和 server 实现通信</a></li>
      <li><a href="/part05_core_topic/  ">3 socket 实现聊天和多用户连接</a></li>
      <li><a href="/part05_core_topic/  ">4 socket 模拟 http请求</a></li>
      <li><a href="/part05_core_topic/  ">5 本章小结</a></li>
    </ul>
  </div>
  <div class="card core">
    <strong>十 多线程、多进程和线程池编程</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 python 中的 GIL</a></li>
      <li><a href="/part05_core_topic/  ">2 多线程编程 - threading</a></li>
      <li><a href="/part05_core_topic/  ">3 线程间通信 - 共享变量和 Queue</a></li>
      <li><a href="/part05_core_topic/  ">4 线程同步 - Lock、RLock</a></li>
      <li><a href="/part05_core_topic/  ">5 线程同步 - condition 使用以及源码分析</a></li>
      <li><a href="/part05_core_topic/  ">6 线程同步 - Semaphore 使用以及源码分析</a></li>
      <li><a href="/part05_core_topic/  ">7 ThreadPoolExecutor线程池</a></li>
      <li><a href="/part05_core_topic/  ">8 ThreadPoolExecutor源码分析</a></li>
      <li><a href="/part05_core_topic/  ">9 多线程和多进程对比</a></li>
      <li><a href="/part05_core_topic/  ">10 multiprocessing 多进程编程</a></li>
      <li><a href="/part05_core_topic/  ">11 进程间通信 - Queue、Pipe，Manager</a></li>
      <li><a href="/part05_core_topic/  ">12 本章小结</a></li>
    </ul>
  </div>
</div>

<div class="cards">
  <div class="card core">
    <strong>十一 协程和异步io</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 并发、并行、同步、异步、阻塞、非阻塞</a></li>
      <li><a href="/part05_core_topic/  ">2 IO 多路复用 (select、poll 和 epoll)</a></li>
      <li><a href="/part05_core_topic/  ">3 select+回调+事件循环获取html-1</a></li>
      <li><a href="/part05_core_topic/  ">4 select+回调+事件循环获取html-2</a></li>
      <li><a href="/part05_core_topic/  ">5 回调之痛</a></li>
      <li><a href="/part05_core_topic/  ">6 协程是什么</a></li>
      <li><a href="/part05_core_topic/  ">7 生成器进阶-send、close和throw方法</a></li>
      <li><a href="/part05_core_topic/  ">8 生成器进阶-yield from-1</a></li>
      <li><a href="/part05_core_topic/  ">9 生成器进阶-yield from-2</a></li>
      <li><a href="/part05_core_topic/  ">10 生成器实现协程</a></li>
      <li><a href="/part05_core_topic/  ">11 async和await</a></li>
      <li><a href="/part05_core_topic/  ">12 本章小节</a></li>
    </ul>
  </div>
  <div class="card core">
    <strong>十二 asyncio并发编程</strong>
    <ul class="card-items">
      <li><a href="/part05_core_topic/  ">1 事件循环-1</a></li>
      <li><a href="/part05_core_topic/  ">2 事件循环-2</a></li>
      <li><a href="/part05_core_topic/  ">3 task取消和子协程调用原理</a></li>
      <li><a href="/part05_core_topic/  ">4 call_soon、call_at、call_later、call_soon_threadsafe</a></li>
      <li><a href="/part05_core_topic/  ">5 ThreadPollExecutor 和 asycio 完成阻塞 IO 请求</a></li>
      <li><a href="/part05_core_topic/  ">6 asyncio 模拟 http 请求</a></li>
      <li><a href="/part05_core_topic/  ">7 future 和 task</a></li>
      <li><a href="/part05_core_topic/  ">8 asyncio同步和通信</a></li>
      <li><a href="/part05_core_topic/  ">9 aiohttp实现高并发爬虫 - 1</a></li>
      <li><a href="/part05_core_topic/  ">10 aiohttp实现高并发爬虫 - 2</a></li>
      <li><a href="/part05_core_topic/  ">11 aiohttp实现高并发爬虫 - 3</a></li>
      <li><a href="/part05_core_topic/  ">12 本章小节</a></li>
    </ul>
  </div>
</div>

<!-- 
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

## 元类
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
  
-->

## 拓展阅读

- [Python3高级核心技术97讲](https://coding.imooc.com/class/200.html)