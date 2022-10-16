# Python 代码规范的重要性

## google 内部对编程规范的信仰

1. 每一个语言都有专门的委员会（Style Committee）制定全公司强制的编程规范，和负责在编程风格争议时的仲裁人（Style Arbiters）。
2. 在每个语言相应的编程规范群里，每天都有大量的讨论和辩论。新达成的共识会被写出“大字报”张贴在厕所里，以至于每个人甚至来访者都能用坐着的时候那零碎的 5 分钟阅读。
3. 每一个代码提交，类似于 Git 里 diff 的概念，都需要至少两次代码评审（code review），一次针对业务逻辑，一次针对可读性（readability review）。所谓的可读性评审，着重在代码风格规范上。只有通过考核的人，才能够成为可读性评审人（readability reviewer）。
4. 有大量的开发自动化工具，确保以上的准则得到强制实施。例如，代码提交前会有 linter 做静态规则检查，不通过是无法提交代码的。

## Python 编程规范如何帮助业务开发？

### Python 编程规范

《8 号 Python 增强规范》（Python Enhacement Proposal #8），简称 PEP8；

《Google Python 风格规范》（Google Python Style Guide），简称 Google Style，是源自 Google 内部的风格规范。公开发布的社区版本，是为了让 Google 旗下所有 Python 开源项目的编程风格统一。

!!! attention ""
    Google Style 是比 PEP8 更严格的一个编程规范。因为 **PEP8 的受众是个人和小团队开发者，而 Google Style 能够胜任大团队，企业级，百万行级别代码库**。

### 统一的编程规范如何提高开发效率

统一的编程规范能提高开发效率。而开发效率，关乎三类对象，也就是阅读者、编程者和机器。他们的优先级是 —— **阅读者的体验 >> 编程者的体验 >> 机器的体验。**

#### 阅读者的体验 >> 编程者的体验

软件工程中 80% 的时间都在阅读代码。所以，为了提高开发效率，要优化的，不是打字时间，而是团队阅读的体验。

不少的编程规范，本来就是为了优化读者体验而存在的。

例如，对于命名原则，PEP8 第 38 条规定命名必须有意义，不能是无意义的单字母。

```python
# 错误示例
if (a <= 0):
   return
elif (a > b):
   return
else:
  b -= a

# 正确示例
if (transfer_amount <= 0):
   raise Exception('...')
elif (transfer_amount > balance):
   raise Exception('...')
else:
  balance -= transfer_amount
```

又例如，Google Style 2.2 条规定，Python 代码中的 import 对象，只能是 package 或者 module。

```python
# 错误示例
from mypkg import Obj
from mypkg import my_func

my_func([1, 2, 3])

# 正确示例
import numpy as np
import mypkg

np.array([6, 7, 8])
```

以上错误示例在语法上完全合法（因为没有符号冲突 name collisions），但是对于读者来讲，它们的可读性太差了。因为 my_func 这样的名字，如果没有一个 package name 提供上下文语境，读者很难单独通过 my_func 这个名字来推测它的可能功能，也很难在 debug 时根据 package name 找到可能的问题。

反观正确示例，虽然 array 是如此大众脸的名字，但因为有了 numpy 这个 package 的暗示，读者可以很明确地知道，这是一个 numpy array。

#### 编程者的体验 >> 机器的体验

常常见到的一个错误倾向，就是过度简化自己的代码。一个典型的例子，就是盲目地使用 Python 的 list comprehension。

```python
# 错误示例
result = [(x, y) for x in range(10) for y in range(5) if x * y > 10]

# 正确示例
result = []
for x in range(10):
  for y in range(5):
     if x * y > 10:
       result.append((x, y))
```

#### 机器的体验

一些危险的编程风格，不仅会影响程序正确性，也容易成为代码效率的瓶颈。

##### is 和 == 的使用区别

```python
# 错误示例
x = 27
y = 27
print(x is y)

x = 721
y = 721
print(x is y)
```

看起来 is 是比较内存地址，那么两个结果应该都是一样的，可是实际上打印出来的，却分别是 True 和 False！

原因是在 CPython（Python 的 C 实现）的实现中，把 -5 到 256 的整数做成了 singleton，也就是说，这个区间里的数字都会引用同一块内存区域，所以上面的 27 和下面的 27 会指向同一个地址，运行结果为 True。

但是 -5 到 256 之外的数字，会因为你的重新定义而被重新分配内存，所以两个 721 会指向不同的内存地址，结果也就是 False 了。

!!! tip "建议"
    应该在代码风格中，避免去用 is 比较两个 Python 整数的地址。

```python
# 正确示例
x = 27
y = 27
print(x == y)

x = 721
y = 721
print(x == y)
```

##### 使用 is 和 None 值比较

```python
# 错误示例
x = MyObject()
print(x == None)
```

打印结果一定是 False 吗？不一定。因为对于类来说，== 的结果，取决于它的 __eq__() 方法的具体实现。

MyObject 的作者完全可能这样实现：
```python
class MyObject(object):
 def __eq__(self, other):
   if other:
     return self.field == other.field
   return True
```

正确的是在代码风格中，当你和 None 比较时候永远使用 is:

```python
# 正确示例
x = MyObject()
print(x is None)
```

##### 隐式布尔转换

```python
# 错误示例
def pay(name, salary=None):
 if not salary:
   salary = 11
 print(name, "is compensated", salary, "dollars")
```

如果有人调用 pay(“Andrew”, 0) ，会打印什么呢？“Andrew is compensated 11 dollars”。
因此，当明确想要比较对象是否是 None 时，一定要显式地用 is None。

```python
# 正确示例
def pay(name, salary=None):
 if salary is not None:
   salary = 11
 print(name, "is compensated", salary, "dollars")
``` 

以上就是，PEP8 和 Google Style 为什么都特别强调了，何时使用 is， 何时使用 ==，以及何时使用隐式布尔转换。

##### 程序效率问题

```python
# 错误示例
adict = {i: i * 2 for i in xrange(10000000)}

for key in adict.keys():
   print("{0} = {1}".format(key, adict[key]))
```

keys() 方法会在遍历前生成一个临时的列表，导致上面的代码消耗大量内存并且运行缓慢。

正确的方式，是使用默认的 iterator。默认的 iterator 不会分配新内存，也就不会造成上面的性能问题。

```python
# 正确示例
for key in adict:
```

## 保证贯彻编程规范的流程和工具

编程规范的终极目标是提高开发效率。如果每次写代码，都需要你在代码规范上额外花很多时间的话，就达不到我们的初衷了。那么哪些流程和工具，可以整合到已有的开发流程中，让编程规范强制自动执行？

首先，根据具体工作环境，选择或制定适合自己公司/团队的规范，可参考的有 PEP8 和 Google Style。并因地制宜。

!!! note "说明"
    例如在 Google，因为历史原因 C++ 不使用异常，引入异常对整个代码库带来的风险已经远大于它的益处，所以在它的 C++ 代码规范中，禁止使用异常。

其次，一旦确定了整个团队同意的代码规范，就一定要强制执行。**靠强制代码评审和强制静态或者动态 linter。**

“强制”，是把共识写进代码里，让机器来自动化这些流程。比如：

- 在代码评审工具里，添加必须的编程规范环节；
- 把团队确定的代码规范写进 Pylint 里（https://www.pylint.org/），能够在每份代码提交前自动检查，不通过的代码无法提交。

整合之后的团队工作流程如下：

![workflow.png](https://i.loli.net/2021/08/04/JQ76yiNSOB18RVT.png)

## 拓展阅读

[《8 号 Python 增强规范》（PEP8)](https://www.python.org/dev/peps/pep-0008/)

[《Google Python 风格规范》（Google Python Style Guide）](http://google.github.io/styleguide/pyguide.html)