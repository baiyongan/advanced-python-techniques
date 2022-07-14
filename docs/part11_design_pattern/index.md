# Overview

## 设计模式学习导读 (3讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter01/article001">为什么说每个程序员都要尽早地学习并掌握设计模式相关知识？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter01/article002">从哪些维度评判代码质量的好坏？如何具备写出高质量代码的能力？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter01/article003">面向对象、设计原则、设计模式、编程规范、重构，这五者有何关系？</a></li>
    </ul>
  </div>
</div>

## 设计原则与思想

### 面向对象 (11讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article004">理论一：当谈论面向对象的时候，我们到底在谈论什么？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article005">理论二：封装、抽象、继承、多态分别可以解决哪些编程问题？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article006">理论三：面向对象相比面向过程有哪些优势？面向过程真的过时了吗？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article007">理论四：哪些代码设计看似是面向对象，实际是面向过程的？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article008">理论五：接口vs抽象类的区别？如何用普通的类模拟抽象类和接口？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article009">理论六：为什么基于接口而非实现编程？有必要为每个类都定义接口吗？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article010">理论七：为何说要多用组合少用继承？如何决定该用组合还是继承？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article011">实战一（上）：业务开发常用的基于贫血模型的MVC架构违背OOP吗？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article012">实战一（下）：如何利用基于充血模型的DDD开发一个虚拟钱包系统？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article013">实战二（上）：如何对接口鉴权这样一个功能开发做面向对象分析？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter02/article014">实战二（下）：如何利用面向对象设计和编程开发接口鉴权功能？</a></li>
    </ul>
  </div>
</div>

### 设计原则 (12讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article015">理论一：对于单一职责原则，如何判定某个类的职责是否够“单一”？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article016">理论二：如何做到“对扩展开放、修改关闭”？扩展和修改各指什么？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article017">理论三：里式替换（LSP）跟多态有何区别？哪些代码违背了LSP？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article018">理论四：接口隔离原则有哪三种应用？原则中的“接口”该如何理解？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article019">理论五：控制反转、依赖反转、依赖注入，这三者有何区别和联系？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article020">理论六：我为何说KISS、YAGNI原则看似简单，却经常被用错？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article021">理论七：重复的代码就一定违背DRY吗？如何提高代码的复用性？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article022">理论八：如何用迪米特法则（LOD）实现“高内聚、松耦合”？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article023">实战一（上）：针对业务系统的开发，如何做需求分析和设计？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article024">实战一（下）：如何实现一个遵从设计原则的积分兑换系统？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article025">实战二（上）：针对非业务的通用框架开发，如何做需求分析和设计？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter03/article026">实战二（下）：如何实现一个支持各种统计规则的性能计数器？</a></li>
    </ul>
  </div>
</div>

### 规范与重构 (11讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article027">理论一：什么情况下要重构？到底重构什么？又该如何重构？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article028">理论二：为了保证重构不出错，有哪些非常能落地的技术手段？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article029">理论三：什么是代码的可测试性？如何写出可测试性好的代码？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article030">理论四：如何通过封装、抽象、模块化、中间层等解耦代码？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article031">理论五：让你最快速地改善代码质量的20条编程规范（上）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article032">理论五：让你最快速地改善代码质量的20条编程规范（中）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article033">理论五：让你最快速地改善代码质量的20条编程规范（下）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article034">实战一（上）：通过一段ID生成器代码，学习如何发现代码质量问题</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article035">实战一（下）：手把手带你将ID生成器代码从“能用”重构为“好用”</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article036">实战二（上）：程序出错该返回啥？NULL、异常、错误码、空对象？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter04/article037">实战二（下）：重构ID生成器项目中各函数的异常处理代码</a></li>
    </ul>
  </div>
</div>

### 总结课 (3讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter05/article038">总结回顾面向对象、设计原则、编程规范、重构技巧等知识点</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter05/article039">运用学过的设计原则和思想完善之前讲的性能计数器项目（上）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter05/article040">运用学过的设计原则和思想完善之前讲的性能计数器项目（下）</a></li>
  </div>
</div>


## 设计模式与范式

### 创建型 (7讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter06/article041">单例模式（上）：为什么说支持懒加载的双重检测不比饿汉式更优？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter06/article042">单例模式（中）：我为什么不推荐使用单例模式？又有何替代方案？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter06/article043">单例模式（下）：如何设计实现一个集群环境下的分布式单例模式？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter06/article044">工厂模式（上）：我为什么说没事不要随便用工厂模式创建对象？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter06/article045">工厂模式（下）：如何设计实现一个Dependency Injection框架？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter06/article046">建造者模式：详解构造函数、set方法、建造者模式三种对象创建方式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter06/article047">原型模式：如何最快速地clone一个HashMap散列表？</a></li>
    </ul>
  </div>
</div>

### 结构型 (8讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter07/article048">代理模式：代理在RPC、缓存、监控等场景中的应用</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter07/article049">桥接模式：如何实现支持不同类型和渠道的消息推送系统？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter07/article050">装饰器模式：通过剖析Java IO类库源码学习装饰器模式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter07/article051">适配器模式：代理、适配器、桥接、装饰，这四个模式有何区别？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter07/article052">门面模式：如何设计合理的接口粒度以兼顾接口的易用性和通用性？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter07/article053">组合模式：如何设计实现支持递归遍历的文件系统目录树结构？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter07/article054">享元模式（上）：如何利用享元模式优化文本编辑器的内存占用？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter07/article055">享元模式（下）：剖析享元模式在Java Integer、String中的应用</a></li>
    </ul>
  </div>
</div>

### 行为型 (18讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article056">观察者模式（上）：详解各种应用场景下观察者模式的不同实现方式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article057">观察者模式（下）：如何实现一个异步非阻塞的EventBus框架？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article058">模板模式（上）：剖析模板模式在JDK、Servlet、JUnit等中的应用</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article059">模板模式（下）：模板模式与Callback回调函数有何区别和联系？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article060">策略模式（上）：如何避免冗长的if-else/switch分支判断代码？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article061">策略模式（下）：如何实现一个支持给不同大小文件排序的小程序？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article062">职责链模式（上）：如何实现可灵活扩展算法的敏感信息过滤框架？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article063">职责链模式（下）：框架中常用的过滤器、拦截器是如何实现的？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article064">状态模式：游戏、工作流引擎中常用的状态机是如何实现的？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article065">迭代器模式（上）：相比直接遍历集合数据，使用迭代器有哪些优势？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article066">迭代器模式（中）：遍历集合的同时，为什么不能增删集合元素？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article067">迭代器模式（下）：如何设计实现一个支持“快照”功能的iterator？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article068">访问者模式（上）：手把手带你还原访问者模式诞生的思维过程</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article069">访问者模式（下）：为什么支持双分派的语言不需要访问者模式？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article070">备忘录模式：对于大对象的备份和恢复，如何优化内存和时间的消耗？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article071">命令模式：如何利用命令模式实现一个手游后端架构？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article072">解释器模式：如何设计实现一个自定义接口告警规则功能？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter08/article073">中介模式：什么时候用中介模式？什么时候用观察者模式？</a></li>
    </ul>
  </div>
</div>

### 总结课 (2讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter09/article074">总结回顾23种经典设计模式的原理、背后的思想、应用场景等</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter09/article075">在实际的项目开发中，如何避免过度设计？又如何避免设计不足？</a></li>
    </ul>
  </div>
</div>

## 开源与项目实战

### 开源实战 (14讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article076">开源实战一（上）：通过剖析Java JDK源码学习灵活应用设计模式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article077">开源实战一（下）：通过剖析Java JDK源码学习灵活应用设计模式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article078">开源实战二（上）：从Unix开源开发学习应对大型复杂项目开发</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article079">开源实战二（中）：从Unix开源开发学习应对大型复杂项目开发</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article080">开源实战二（下）：从Unix开源开发学习应对大型复杂项目开发</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article081">开源实战三（上）：借Google Guava学习发现和开发通用功能模块</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article082">开源实战三（中）：剖析Google Guava中用到的几种设计模式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article083">开源实战三（下）：借Google Guava学习三大编程范式中的函数式编程</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article084">开源实战四（上）：剖析Spring框架中蕴含的经典设计思想或原则</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article085">开源实战四（中）：剖析Spring框架中用来支持扩展的两种设计模式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article086">开源实战四（下）：总结Spring框架用到的11种设计模式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article087">开源实战五（上）：MyBatis如何权衡易用性、性能和灵活性？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article088">开源实战五（中）：如何利用职责链与代理模式实现MyBatis Plugin？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter10/article089">开源实战五（下）：总结MyBatis框架中用到的10种设计模式</a></li>
    </ul>
  </div>
</div>

### 项目实战 (9讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article090">项目实战一：设计实现一个支持各种算法的限流框架（分析）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article091">项目实战一：设计实现一个支持各种算法的限流框架（设计）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article092">项目实战一：设计实现一个支持各种算法的限流框架（实现）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article093">项目实战二：设计实现一个通用的接口幂等框架（分析）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article094">项目实战二：设计实现一个通用的接口幂等框架（设计）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article095">项目实战二：设计实现一个通用的接口幂等框架（实现）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article096">项目实战三：设计实现一个支持自定义规则的灰度发布组件（分析）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article097">项目实战三：设计实现一个支持自定义规则的灰度发布组件（设计）</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter11/article098">项目实战三：设计实现一个支持自定义规则的灰度发布组件（实现）</a></li>
    </ul>
  </div>
</div>

### 总结课 (2讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter12/article099">总结回顾：在实际软件开发中常用的设计思想、原则和模式</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter12/article100">如何将设计思想、原则、模式等理论知识应用到项目中？</a></li>
    </ul>
  </div>
</div>

## 补充扩展 (11讲)

<div class="cards">
  <div class="card pattern">
    <strong>  </strong>
    <ul class="card-items">
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article101">用一篇文章带你了解专栏中用到的所有Java语法</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article102">设计模式、重构、编程规范等相关书籍推荐</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article103">王争：如何学习《设计模式之美》专栏？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article104">聊一聊Google是如何做Code Review的</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article105">聊一聊Google那些让我快速成长的地方</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article106">听一听小争哥对Google工程师文化的解读</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article107">什么才是所谓的编程能力？如何考察一个人的编程能力？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article108">基础学科的知识如何转化成实际的技术生产力？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article109">程序员怎么才能让自己走得更高、更远？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article110">作为面试官或候选人，如何面试或回答设计模式问题？</a></li>
      <li><a href="/part11_design_pattern/the_beauty_of_design_pattern/chapter13/article111">如何接手一坨烂业务代码？如何在烂业务代码中成长？</a></li>
    </ul>
  </div>
</div>

## 拓展阅读

- [设计模式之美](https://time.geekbang.org/column/intro/100039001)
- [Refactoringguru](https://refactoringguru.cn/design-patterns/catalog)
- [Head First 设计模式（中文版）](https://book.douban.com/subject/2243615/)
- [Java设计模式](https://book.douban.com/subject/30173863/)
- [研磨设计模式](https://book.douban.com/subject/5343318/)
- [设计模式之禅（第2版）](https://book.douban.com/subject/25843319/)
- [设计模式-基于C#的工程化实现及扩展](https://book.douban.com/subject/3288728/)
- [设计模式：可复用面向对象软件的基础](https://book.douban.com/subject/34262305/)
