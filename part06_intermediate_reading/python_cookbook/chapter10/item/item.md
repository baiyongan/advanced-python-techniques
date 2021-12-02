# 模块与包

<!-- -------------------------------------------------------------------------- -->
## 01 构建一个模块的层级包

!!! question "问题"
    如何将代码组织成由很多分层模块构成的包？

    - `__init__.py`

??? done "解决方案"
    在文件系统上组织好代码，并确保每个目录都定义了一个 `__init__.py` 文件，之后，就可以执行相应的 import 语句。

    ```python
    graphics/
        __init__.py
        primitive/
            __init__.py
            line.py
            fill.py
            text.py
        formats/
            __init__.py
            png.py
            jpg.py
    ```

??? summary "讨论"

    文件 `__init__.py` 的目的是要包含不同运行级别的包的可选的初始化代码。举个例子，如果你执行了语句 `import graphics`， 文件 `graphics/__init__.py`将被导入,建立graphics 命名空间的内容。

    绝大部分时候让 `__init__.py` 空着就好。但是有些情况下可能包含代码。 举个例子，能够用 `__init__.py` 来自动加载子模块。
    ```python
    # graphics/formats/__init__.py
    from . import jpg
    from . import png
    ```
    用户可以仅仅通过 import grahpics.formats 来代替 import graphics.formats.jpg 以及 import graphics.formats.png。

    `__init__.py` 的其他常用用法包括将多个文件合并到一个逻辑命名空间

<!-- -------------------------------------------------------------------------- -->
## 02 控制模块被全部导入的内容

!!! question "问题"
    当使用 `from module import *` 语句时，如何对从模块或包导出的符号进行精确控制？

    - 在模块中定义一个变量 `__all__` 来明确指出需要导出的内容。

??? done "解决方案"
    ```python
    # somemodule.py
    def spam():
        pass

    def grok():
        pass

    blah = 42
    # Only export 'spam' and 'grok'
    __all__ = ['spam', 'grok']
    ```

??? summary "讨论"
    - 强烈反对使用 `from module import *` 这种写法，如果不做任何事，这样的方式将会导入所有不以下划线开头的方法。而如果定义了 `__all__`，则只有被其列出的方法才会被导出。

    !!! warning
        如果将 `__all__`定义为空列表，则没有东西会被导入，如果 `__all__` 包含未定义的名字，在导入时，会引起 `AttributeError`。

<!-- -------------------------------------------------------------------------- -->
## 03 使用相对路径名导入包中子模块

!!! question "问题"
    将代码组织成包,想用import语句从另一个包名没有硬编码过的包中导入子模块。

    - 使用包的相对导入，使一个模块导入同一个包的另一个模块。

??? done "解决方案"
    
    ```python
    mypackage/
        __init__.py
        A/
            __init__.py
            spam.py
            grok.py
        B/
            __init__.py
            bar.py
    ```
    
    在模块 mypackage.A.spam 中导入同目录下的模块 grok：
    
    ```python
    # mypackage/A/spam.py
    from . import grok
    ```

    在模块 mypackage.A.spam 中导入不同目录下的模块 B.bar
    
    ```python
    # mypackage/A/spam.py
    from ..B import bar
    ```

??? summary "讨论"
    在包内，既可以使用相对路径也可以使用绝对路径来导入。 
    
    ```python
    # mypackage/A/spam.py
    from mypackage.A import grok # OK
    from . import grok # OK
    import grok # Error (not found)
    ```

    像 mypackage.A 这样使用绝对路径名的不利之处是这将顶层包名硬编码到你的源码中。硬编码的名称会使移动代码变得困难。

    !!! attention
        ```python
        from . import grok # OK
        import .grok # ERROR
        ```

        - import 语句的 `.` 和 `..`，其中 `.` 为当前目录，`..B` 为目录 `../B`。这种语法只适用于import。
        - 尽管使用相对导入看起来像是浏览文件系统，但是不能到定义包的目录之外。
        - 如果包的部分被作为脚本直接执行，相对导入方式将不起作用。
        ```python
        % python3 mypackage/A/spam.py # Relative imports fail
        ```
        - 使用Python的 -m 选项来执行先前的脚本，相对导入将会正确运行。
        ```python
        % python3 -m mypackage.A.spam # Relative imports work
        ```

<!-- -------------------------------------------------------------------------- -->
## 04 将模块分割成多个文件

!!! question "问题"
    如何将一个模块分割成多个文件，但同时再将分离的文件统一成一个逻辑模块时，可以不使已有的代码遭到破坏？

    - module --> n packages 即程序模块可以通过变成包来分割成多个独立的文件。
    - 合并多个文件成一个单一的逻辑命名空间，关键是创建一个包目录，使用 `__init__.py` 文件将各部分粘合到一起。 

??? done "解决方案"
    ```python
    # mymodule.py
    class A:
        def spam(self):
            print('A.spam')

    class B(A):
        def bar(self):
            print('B.bar')
    ```

    如果想将上述 mymodule.py 分成两个文件，每个文件定义一个类。可以先用 mymodule 目录替换原来的 mymodule.py 文件，再分别在 a.py 和 b.py 中插入对应类的代码。最后，再在 `__init__.py` 文件中，将两个文件粘合到一起。

    ```python
    # mymodule.py --> mymodule 文件夹
    mymodule/
    __init__.py
    a.py
    b.py

    # a.py 内容
    class A:
    def spam(self):
        print('A.spam')

    # b.py 内容
    from .a import A
    class B(A):
        def bar(self):
            print('B.bar')
    ```

    以上步骤所产生的包 mymodule，将作为一个单一的逻辑模块：
    ```python
    >>> import mymodule
    >>> a = mymodule.A()
    >>> a.spam()
    A.spam
    >>> b = mymodule.B()
    >>> b.bar()
    B.bar
    >>>
    ```

??? summary "讨论"
    这个问题主要是一个设计问题，在大型代码库中，如果将一切都分割成独立的文件，用户需要使用大量的 import 语句，前提是他们要清楚不同的部分在哪里，这增加了用户的负担。

    ```python
    from mymodule.a import A
    from mymodule.b import B
    ...
    ```

    !!! tip ""
        通常情况下，让 mymodule 成为一个大的源文件是最常见的，这样，使用一条 import 将更容易
        ```python
        from mymodule import A, B
        ```
    
    !!! attention ""
        当模块被分割，需要特别注意交叉引用，需要使用相对导入的方式来获取，来避免将顶层模块名硬编码到源代码中，如此，可以使得重命名模块或者转移位置更容易。

    **延迟导入**：之前 `__init__.py` 文件一次导入所有必须的组件，但是，对于一个很大的模块，指向在组件被需要时才加载，如何做到**延迟导入**呢？

    !!! tip ""
        如下，将类 A 和类 B 替换为在第一次访问时加载所需的类的函数。
        ```python
        # __init__.py
        def A():
            from .a import A
            return A()

        def B():
            from .b import B
            return B()
        ```
    
    !!! danger ""
        延迟加载的主要缺点是继承和类型检查可能会中断。可能会需要稍微改变你之前的代码（？？？）：

        ```python
        if isinstance(x, mymodule.A): # Error
        ...

        if isinstance(x, mymodule.a.A): # Ok
        ...
        ```

        延迟加载的真实例子, 见标准库 `multiprocessing/__init__.py` 的源码。

<!-- -------------------------------------------------------------------------- -->
## 05 利用命名空间导入目录分散的代码

!!! question "问题"

??? done "解决方案"

??? summary "讨论"


<!-- -------------------------------------------------------------------------- -->
## 06 重新加载模块

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 07 运行目录或压缩文件

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 08 读取位于包中的数据文件

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 09 将文件夹加入到sys.path

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 10 通过字符串名导入模块

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 11 通过钩子远程加载模块

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 12 导入模块的同时修改模块

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 13 安装私有的包

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 14 创建新的Python环境

!!! question "问题"

??? done "解决方案"

??? summary "讨论"

<!-- -------------------------------------------------------------------------- -->
## 15 分发包

!!! question "问题"

??? done "解决方案"

??? summary "讨论"


<!-- -------------------------------------------------------------------------- -->
## 总结

!!! example "总结"