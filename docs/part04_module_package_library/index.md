# Overview

!!! tip "提示"
    1. 经常浏览下模块的源码，**有时候，我们想实现的功能，在标准库中可能已经实现**
    2. 其实很多工程实践的最好范例都在标准库中有体现

## 常用标准库

!!! attention "注意"
    主要依据个人目前对 Python 的掌握程度，并综合搜集的学习建议，截取了 Python 3.9 标准库中的部分常用库。

<style>
* {
  margin: 0;
  padding: 0;
}
#mindmap {
  display: block;
  width: 100vw;
  height: 100vh;
}
</style>

<body>
<svg id="mindmap"></svg>
<script src="https://cdn.jsdelivr.net/npm/d3@6.6.0"></script><script src="https://cdn.jsdelivr.net/npm/markmap-view@0.2.3"></script><script>((e,t,r)=>{const{Markmap:n}=e();window.mm=n.create("svg#mindmap",null==t?void 0:t(),r)})(()=>window.markmap,t=>{return t=t||window.d3,{color:(n=t.scaleOrdinal(t.schemeCategory10),t=>n(t.p.i))};var n},{"t":"heading","d":1,"p":{"lines":[0,1]},"v":"常用标准库","c":[{"t":"heading","d":2,"p":{"lines":[1,2]},"v":"文本处理","c":[{"t":"list_item","d":4,"p":{"lines":[2,3]},"v":"string --- 常见的字符串操作"},{"t":"list_item","d":4,"p":{"lines":[3,4]},"v":"re --- 正则表达式操作"},{"t":"list_item","d":4,"p":{"lines":[4,5]},"v":"readline --- GNU readline 接口"}]},{"t":"heading","d":2,"p":{"lines":[6,7]},"v":"数据类型","c":[{"t":"list_item","d":4,"p":{"lines":[7,8]},"v":"datetime --- 基本日期和时间类型"},{"t":"list_item","d":4,"p":{"lines":[8,9]},"v":"calendar --- 日历相关函数"},{"t":"list_item","d":4,"p":{"lines":[9,10]},"v":"collections --- 容器数据类型"},{"t":"list_item","d":4,"p":{"lines":[10,11]},"v":"collections.abc --- 容器的抽象基类"},{"t":"list_item","d":4,"p":{"lines":[11,12]},"v":"copy --- 浅层 (shallow) 和深层 (deep) 复制操作"},{"t":"list_item","d":4,"p":{"lines":[12,13]},"v":"pprint --- 数据美化输出"}]},{"t":"heading","d":2,"p":{"lines":[14,15]},"v":"数学","c":[{"t":"list_item","d":4,"p":{"lines":[15,16]},"v":"math --- 数学函数"},{"t":"list_item","d":4,"p":{"lines":[16,17]},"v":"random --- 生成伪随机数"}]},{"t":"heading","d":2,"p":{"lines":[18,19]},"v":"函数式","c":[{"t":"list_item","d":4,"p":{"lines":[19,20]},"v":"itertools --- 为高效循环而创建迭代器的函数"},{"t":"list_item","d":4,"p":{"lines":[20,21]},"v":"functools --- 高阶函数和可调用对象上的操作"}]},{"t":"heading","d":2,"p":{"lines":[22,23]},"v":"文件和目录访问","c":[{"t":"list_item","d":4,"p":{"lines":[23,24]},"v":"pathlib --- 面向对象的文件系统路径"},{"t":"list_item","d":4,"p":{"lines":[24,25]},"v":"os.path --- 常用路径操作"},{"t":"list_item","d":4,"p":{"lines":[25,26]},"v":"glob --- Unix 风格路径名模式扩展"},{"t":"list_item","d":4,"p":{"lines":[26,27]},"v":"fnmatch --- Unix 文件名模式匹配"},{"t":"list_item","d":4,"p":{"lines":[27,28]},"v":"shutil --- 高阶文件操作"}]},{"t":"heading","d":2,"p":{"lines":[29,30]},"v":"数据持久化","c":[{"t":"list_item","d":4,"p":{"lines":[30,31]},"v":"pickle --- Python 对象序列化"},{"t":"list_item","d":4,"p":{"lines":[31,32]},"v":"sqlite3 --- SQLite 数据库 DB-API 2.0 接口模块"}]},{"t":"heading","d":2,"p":{"lines":[33,34]},"v":"数据压缩和存档","c":[{"t":"list_item","d":4,"p":{"lines":[34,35]},"v":"zipfile --- 使用ZIP存档"},{"t":"list_item","d":4,"p":{"lines":[35,36]},"v":"tarfile --- 读写tar归档文件"}]},{"t":"heading","d":2,"p":{"lines":[37,38]},"v":"文件格式","c":[{"t":"list_item","d":4,"p":{"lines":[38,39]},"v":"csv --- CSV 文件读写"},{"t":"list_item","d":4,"p":{"lines":[39,40]},"v":"configparser --- 配置文件解析器"}]},{"t":"heading","d":2,"p":{"lines":[41,42]},"v":"加密服务","c":[{"t":"list_item","d":4,"p":{"lines":[42,43]},"v":"hashlib --- 安全哈希与消息摘要"}]},{"t":"heading","d":2,"p":{"lines":[44,45]},"v":"通用操作系统服务","c":[{"t":"list_item","d":4,"p":{"lines":[45,46]},"v":"os --- 多种操作系统接口"},{"t":"list_item","d":4,"p":{"lines":[46,47]},"v":"io --- 处理流的核心工具"},{"t":"list_item","d":4,"p":{"lines":[47,48]},"v":"time --- 时间的访问和转换"},{"t":"list_item","d":4,"p":{"lines":[48,49]},"v":"argparse --- 命令行选项、参数和子命令解析器"},{"t":"list_item","d":4,"p":{"lines":[49,50]},"v":"getopt --- C 风格的命令行选项解析器"},{"t":"list_item","d":4,"p":{"lines":[50,51]},"v":"logging --- Python 的日志记录工具"},{"t":"list_item","d":4,"p":{"lines":[51,52]},"v":"logging.config --- 日志记录配置"},{"t":"list_item","d":4,"p":{"lines":[52,53]},"v":"logging.handlers --- 日志处理程序"},{"t":"list_item","d":4,"p":{"lines":[53,54]},"v":"platform --- 获取底层平台的标识数据"}]},{"t":"heading","d":2,"p":{"lines":[55,56]},"v":"并发执行","c":[{"t":"list_item","d":4,"p":{"lines":[56,57]},"v":"threading --- 基于线程的并行"},{"t":"list_item","d":4,"p":{"lines":[57,58]},"v":"multiprocessing --- 基于进程的并行"},{"t":"list_item","d":4,"p":{"lines":[58,59]},"v":"multiprocessing.shared_memory --- 可从进程直接访问的共享内存"},{"t":"list_item","d":4,"p":{"lines":[59,60]},"v":"concurrent 包"},{"t":"list_item","d":4,"p":{"lines":[60,61]},"v":"concurrent.futures --- 启动并行任务"},{"t":"list_item","d":4,"p":{"lines":[61,62]},"v":"subprocess --- 子进程管理"},{"t":"list_item","d":4,"p":{"lines":[62,63]},"v":"queue --- 一个同步的队列类"}]},{"t":"heading","d":2,"p":{"lines":[64,65]},"v":"网络和进程间通信","c":[{"t":"list_item","d":4,"p":{"lines":[65,66]},"v":"asyncio --- 异步 I/O"},{"t":"list_item","d":4,"p":{"lines":[66,67]},"v":"socket --- 底层网络接口"}]},{"t":"heading","d":2,"p":{"lines":[68,69]},"v":"互联网数据处理","c":[{"t":"list_item","d":4,"p":{"lines":[69,70]},"v":"json --- JSON 编码和解码器"}]},{"t":"heading","d":2,"p":{"lines":[71,72]},"v":"互联网协议和支持","c":[{"t":"list_item","d":4,"p":{"lines":[72,73]},"v":"urllib --- URL 处理模块"},{"t":"list_item","d":4,"p":{"lines":[73,74]},"v":"urllib.request --- 用于打开 URL 的可扩展库"},{"t":"list_item","d":4,"p":{"lines":[74,75]},"v":"urllib.response --- urllib 使用的 Response 类"},{"t":"list_item","d":4,"p":{"lines":[75,76]},"v":"urllib.parse 用于解析 URL"},{"t":"list_item","d":4,"p":{"lines":[76,77]},"v":"urllib.error --- urllib.request 引发的异常类"},{"t":"list_item","d":4,"p":{"lines":[77,78]},"v":"urllib.robotparser --- robots.txt 语法分析程序"}]},{"t":"heading","d":2,"p":{"lines":[79,80]},"v":"开发工具","c":[{"t":"list_item","d":4,"p":{"lines":[80,81]},"v":"typing --- 类型提示支持"},{"t":"list_item","d":4,"p":{"lines":[81,82]},"v":"pydoc --- 文档生成器和在线帮助系统"},{"t":"list_item","d":4,"p":{"lines":[82,83]},"v":"unittest --- 单元测试框架"},{"t":"list_item","d":4,"p":{"lines":[83,84]},"v":"unittest.mock --- mock对象库"},{"t":"list_item","d":4,"p":{"lines":[84,85]},"v":"unittest.mock 上手指南"}]},{"t":"heading","d":2,"p":{"lines":[86,87]},"v":"调试和分析","c":[{"t":"list_item","d":4,"p":{"lines":[87,88]},"v":"pdb --- Python 的调试器"},{"t":"list_item","d":4,"p":{"lines":[88,89]},"v":"timeit --- 测量小代码片段的执行时间"}]},{"t":"heading","d":2,"p":{"lines":[90,91]},"v":"软件打包和分发","c":[{"t":"list_item","d":4,"p":{"lines":[91,92]},"v":"distutils --- 构建和安装 Python 模块"},{"t":"list_item","d":4,"p":{"lines":[92,93]},"v":"venv --- 创建虚拟环境"}]},{"t":"heading","d":2,"p":{"lines":[94,95]},"v":"python 运行时服务","c":[{"t":"list_item","d":4,"p":{"lines":[95,96]},"v":"sys --- 系统相关的参数和函数"},{"t":"list_item","d":4,"p":{"lines":[96,97]},"v":"builtins --- 内建对象"},{"t":"list_item","d":4,"p":{"lines":[97,98]},"v":"__main__ --- 顶层脚本环境"},{"t":"list_item","d":4,"p":{"lines":[98,99]},"v":"traceback --- 打印或检索堆栈回溯"},{"t":"list_item","d":4,"p":{"lines":[99,100]},"v":"gc --- 垃圾回收器接口"},{"t":"list_item","d":4,"p":{"lines":[100,101]},"v":"inspect --- 检查对象"}]}]})</script>
</body>

<!-- ### 文本处理
- string --- 常见的字符串操作
- re --- 正则表达式操作
- readline --- GNU readline 接口

### 数据类型
- datetime --- 基本日期和时间类型
- calendar --- 日历相关函数
- collections --- 容器数据类型
- collections.abc --- 容器的抽象基类
- copy --- 浅层 (shallow) 和深层 (deep) 复制操作
- pprint --- 数据美化输出

### 数学
- math --- 数学函数
- random --- 生成伪随机数

### 函数式
- itertools --- 为高效循环而创建迭代器的函数
- functools --- 高阶函数和可调用对象上的操作

### 文件和目录访问
- pathlib --- 面向对象的文件系统路径
- os.path --- 常用路径操作
- glob --- Unix 风格路径名模式扩展
- fnmatch --- Unix 文件名模式匹配
- shutil --- 高阶文件操作

### 数据持久化
- pickle --- Python 对象序列化
- sqlite3 --- SQLite 数据库 DB-API 2.0 接口模块

### 数据压缩和存档
- zipfile --- 使用ZIP存档
- tarfile --- 读写tar归档文件

### 文件格式
- csv --- CSV 文件读写
- configparser --- 配置文件解析器

### 加密服务
- hashlib --- 安全哈希与消息摘要

### 通用操作系统服务
- os --- 多种操作系统接口
- io --- 处理流的核心工具
- time --- 时间的访问和转换
- argparse --- 命令行选项、参数和子命令解析器
- getopt --- C 风格的命令行选项解析器
- logging --- Python 的日志记录工具
- logging.config --- 日志记录配置
- logging.handlers --- 日志处理程序
- platform --- 获取底层平台的标识数据

### 并发执行
- threading --- 基于线程的并行
- multiprocessing --- 基于进程的并行
- multiprocessing.shared_memory --- 可从进程直接访问的共享内存
- concurrent 包
- concurrent.futures --- 启动并行任务
- subprocess --- 子进程管理
- queue --- 一个同步的队列类

### 网络和进程间通信
- asyncio --- 异步 I/O
- socket --- 底层网络接口

### 互联网数据处理
- json --- JSON 编码和解码器

### 互联网协议和支持
- urllib --- URL 处理模块
- urllib.request --- 用于打开 URL 的可扩展库
- urllib.response --- urllib 使用的 Response 类
- urllib.parse 用于解析 URL
- urllib.error --- urllib.request 引发的异常类
- urllib.robotparser --- robots.txt 语法分析程序

### 开发工具
- typing --- 类型提示支持
- pydoc --- 文档生成器和在线帮助系统
- unittest --- 单元测试框架
- unittest.mock --- mock对象库
- unittest.mock 上手指南

### 调试和分析
- pdb --- Python 的调试器
- timeit --- 测量小代码片段的执行时间
  
### 软件打包和分发
- distutils --- 构建和安装 Python 模块
- venv --- 创建虚拟环境

### python 运行时服务
- sys --- 系统相关的参数和函数
- builtins --- 内建对象
- \_\_main\_\_ --- 顶层脚本环境
- traceback --- 打印或检索堆栈回溯
- gc --- 垃圾回收器接口
- inspect --- 检查对象 -->

## 常用第三方模块

### 数据分析
- openpyxl
- numpy
- pandas
- matplotlib
- plotly

## 拓展阅读

- [Python Standart Library](https://docs.python.org/3/library/)
- [Python HOWTOs](https://docs.python.org/3.9/howto/index.html)
- [PyMOTW3](https://pymotw.com/3/)

<!-- 
sh
argparse
collections
functools
glob
multiprocessing
os
Queue
SimpleHTTPServer
subprocess
threading 
-->

<!-- 
##### standard libs:

itertools 
functools 
re 正则
subprocess 调用shell命令的神器
pdb 调试
traceback 调试
pprint 漂亮的输出
logging 日志
threading 和 multiprocessing  多线程
urllib/urllib2/httplib  http库，httplib底层一点，推荐第三方的库requests
os/sys 系统，环境相关
Queue 队列
pickle/cPickle 序列化工具
hashlib md5, sha等hash算法
cvs
json/simplejson  python的json库，据so上的讨论和benchmark，simplejson的性能要高于json
timeit 计算代码运行的时间等等
cProfile python性能测量模块
glob 类似 listfile，可以用来查找文件
atexit 有一个注册函数，可用于正好在脚本退出运行前执行一些代码
dis python 反汇编，当对某条语句不理解原理时，可以用dis.dis 函数来查看代码对应的python 解释器指令等等。

##### 3th libs:

paramiko ssh python 库
selenium 浏览器自动化测试工具selenium的python 接口
lxml python 解析html,xml 的神器
mechanize Stateful programmatic web browsing
pycurl  cURL library module for Python
Fabric  Fabric is a Python (2.5 or higher) library and command-line tool for streamlining the use of SSH for application deployment or systems administration tasks.xmltodict xml 转 dict，真心好用
urllib3 和 requests: 当然其实requests就够了 Requests: HTTP for Humans
flask web 微框架 
ipdb 调试神器，同时推荐ipython！结合ipython使用
redis redis python接口
pymongo mongodbpython接口
PIL python图像处理
mako  python模版引擎numpy ， scipy 科学计算
matplotlib 画图
scrapy 爬虫
django/tornado/web.py/web2py/uliweb/flask/twisted/bottle/cherrypy.等等 python web框架/服务器
sh 1.08 — sh v1.08 documentation 用来运行shell 模块的 极佳选择 
-->