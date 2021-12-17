# 第十章：模块与包

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
    你可能有大量的代码，由不同的人来分散地维护。每个部分被组织为文件目录，如一个包。然而，你希望能用共同的包前缀将所有组件连接起来，不是将每一个部分作为独立的包来安装。

    - 从本质上讲，要定义一个顶级Python包，作为一个大集合分开维护子包的命名空间。

??? done "解决方案"
    这个问题经常出现在大的应用框架中，框架开发者希望鼓励用户发布插件或附加包。

    如果要将单独的目录统一到一个公共的命名空间下，可以把代码像普通的 Python 包那样组织起来，但是要删去用来将组件联合起来的 `__init__.py` 文件。

    ```python
    foo-package/
        spam/
            blah.py

    bar-package/
        spam/
            grok.py
    ```

    在这2个目录里，都有着共同的命名空间 `spam` 。在任何一个目录里都没有 `__init__.py` 文件。

    如果将 foo-package 和 bar-package 都加到 python 模块路径，则两个不同的包目录被合并到一起，你可以导入spam.blah和spam.grok，并且它们能够工作。

    ```python
    >>> import sys
    >>> sys.path.extend(['foo-package', 'bar-package'])
    >>> import spam.blah
    >>> import spam.grok
    >>>
    ```

??? summary "讨论"
    从本质上讲，**包命名空间是一种特殊的封装设计**，为合并不同的目录的代码到一个共同的命名空间。
    
    对于大的框架，这可能是有用的，因为它允许一个框架的部分被单独地安装下载。它也使人们能够轻松地为这样的框架编写第三方附加组件和其他扩展。

    包命名空间的关键是确保顶级目录中没有 `__init__.py` 文件来作为共同的命名空间。

    包命名空间的一个重要特点是任何人都可以用自己的代码来扩展命名空间。

    一个包是否被作为一个包命名空间的主要方法是检查其 `__file__` 属性。如果没有，那包是个命名空间。这也可以由其字符表现形式中的 “namespace” 这个词体现出来。

    ```python
    >>> spam.__file__
    Traceback (most recent call last):
        File "<stdin>", line 1, in <module>
    AttributeError: 'module' object has no attribute '__file__'
    >>> spam
    <module 'spam' (namespace)>
    >>>
    ```


<!-- -------------------------------------------------------------------------- -->
## 06 重新加载模块

!!! question "问题"
    你想重新加载已经加载的模块，因为你对其源码进行了修改。

    - 使用 `imp.reload()` 来重新加载先前加载的模块。

??? done "解决方案"
    ```python
    >>> import spam
    >>> import imp
    >>> imp.reload(spam)
    <module 'spam' from './spam.py'>
    >>>
    ```

??? summary "讨论"
    重新加载模块在开发和调试过程中常常很有用。但在生产环境中的代码使用会不安全，因为它并不总是像您期望的那样工作。

    !!! attention 
        `reload()` 擦除了模块底层字典的内容，并通过重新执行模块的源代码来刷新它。模块对象本身的身份保持不变。因此，该操作在程序中所有已经被导入了的地方更新了模块。

        尽管如此，reload()没有更新像”from module import name”这样使用import语句导入的定义。

    ```python
    # spam.py
    def bar():
        print('bar')

    def grok():
        print('grok')
    ```

    现在启动交互式会话：
    ```python
    >>> import spam
    >>> from spam import grok
    >>> spam.bar()
    bar
    >>> grok()
    grok
    >>>
    ```

    不退出Python修改spam.py的源码，将grok()函数改成这样：

    ```python
    def grok():
        print('New grok')
    ```

    现在回到交互式会话，重新加载模块:

    ```python
    >>> import imp
    >>> imp.reload(spam)
    <module 'spam' from './spam.py'>
    >>> spam.bar()
    bar
    >>> grok() # Notice old output
    grok
    >>> spam.grok() # Notice new output
    New grok
    >>>
    ```

    !!! danger
        看到有2个版本的grok()函数被加载。通常来说，这不是你想要的，而是令人头疼的事。

        因此，在生产环境中可能需要避免重新加载模块。在交互环境下调试，解释程序并试图弄懂它。

<!-- -------------------------------------------------------------------------- -->
## 07 运行目录或压缩文件

!!! question "问题"
    一个已成长为包含多个文件的应用，已远不再是一个简单的脚本，如何向用户提供一些简单的方法运行这个程序？

    - 如果应用程序已经有多个文件，可以把应用程序放进它自己的目录，并添加一个 `__main__.py` 文件。
  
??? done "解决方案"
    ```python
    myapplication/
        spam.py
        bar.py
        grok.py
        __main__.py
    ```

    如果 `__main__.py` 存在，可以简单地在顶级目录运行Python解释器：


    ```python
    bash % python3 myapplication

    ```

    如果你将你的代码打包成zip文件，这种技术同样也适用，举个例子：

    ```python
    bash % ls
    spam.py bar.py grok.py __main__.py
    bash % zip -r myapp.zip *.py
    bash % python3 myapp.zip
    ... output from __main__.py ...
    ```

??? summary "讨论"
    创建一个目录或zip文件并添加`__main__.py`文件来将一个更大的Python应用打包是可行的。这只是让别人执行的代码包。

    !!! tip ""
        由于目录和zip文件与正常文件有一点不同，你可能还需要增加一个shell脚本，使执行更加容易。例如，如果代码文件名为myapp.zip，你可以创建这样一个顶级脚本：
        ```python
        #!/usr/bin/env python3 /usr/local/bin/myapp.zip
        ```

<!-- -------------------------------------------------------------------------- -->
## 08 读取位于包中的数据文件

!!! question "问题"
    你的包中包含代码需要去读取的数据文件。你需要尽可能地用最便捷的方式来做这件事。

    - 使用 `pkgutil` 模块

??? done "解决方案"

    假设 spam.py 文件需要读取 somedata.dat 文件中的内容。

    ```python
    mypackage/
        __init__.py
        somedata.dat
        spam.py
    ```

    如下，由此产生的变量是包含该文件的原始内容的字节字符串。

    ```python
    # spam.py
    import pkgutil
    data = pkgutil.get_data(__package__, 'somedata.dat')
    ```

??? summary "讨论"
    为什么不用内置的 open() 函数？

    - 首先，**一个包对解释器的当前工作目录几乎没有控制权。** 因此，编程时任何I/O操作都必须使用绝对文件名。由于每个模块包含有完整路径的 `__file__` 变量，弄清楚它的路径不是不可能，但它很凌乱。

    - 第二，包通常安装作为 `.zip` 或 `.egg` 文件，这些文件并不像在文件系统上的一个普通目录里那样被保存。因此，你试图用open()对一个包含数据文件的归档文件进行操作，它根本不会工作。

    为什么用 pkgutil.get_data() ？
    
    - pkgutil.get_data() 函数是一个读取数据文件的高级工具，不用管包是如何安装以及安装在哪。它只是工作并将文件内容以字节字符串返回给你

    - get_data() 的第一个参数是包含包名的字符串。你可以直接使用包名，也可以使用特殊的变量，比如 `__package__`。第二个参数是包内文件的相对名称。如果有必要，可以使用标准的Unix命名规范到不同的目录，只要最后的目录仍然位于包中。

<!-- -------------------------------------------------------------------------- -->
## 09 将文件夹加入到sys.path

!!! question "问题"
    如果无法导入你的 Python 代码，因为它所在的目录不在 sys.path 里。那么如何将其添加新目录到Python路径，但是不硬链接到你的代码。

    - 第一种：使用 PYTHONPATH 变量添加
    - 第二种：创建一个 .pth 文件，将目录列在其中

??? done "解决方案"
    - 第一种：使用 PYTHONPATH 环境变量添加
    
    在自定义应用程序中，这样的环境变量可在程序启动时设置或通过shell脚本设置。

    ```python
    bash % env PYTHONPATH=/some/dir:/other/dir python3
    Python 3.3.0 (default, Oct 4 2012, 10:17:33)
    [GCC 4.2.1 (Apple Inc. build 5666) (dot 3)] on darwin
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import sys
    >>> sys.path
    ['', '/some/dir', '/other/dir', ...]
    >>>
    ```

    - 第二种：.pth 文件

    ```python
    # myapplication.pth
    /some/dir
    /other/dir
    ```

    !!! attention ""
        这个 .pth 文件需要放在某个Python的site-packages目录，通常位于/usr/local/lib/python3.3/site-packages 或者 ~/.local/lib/python3.3/sitepackages。当解释器启动时，.pth文件里列举出来的存在于文件系统的目录将被添加到sys.path。安装一个.pth文件可能需要管理员权限，如果它被添加到系统级的Python解释器。

??? summary "讨论"

    如果使用模块级的变量来精心构造一个适当的绝对路径，则可以解决硬编码目录的问题，比如`__file__`。

    ```python
    import sys
    from os.path import abspath, join, dirname
    sys.path.insert(0, join(abspath(dirname(__file__)), 'src'))
    ```

    这将 src 目录添加到 path 里，和执行插入步骤的代码在同一个目录里。

    !!! tips ""
        site-packages 目录是第三方包和模块安装的目录。如果手动安装你的代码，它将被安装到site-packages目录。

        虽然用于配置path的.pth文件必须放置在site-packages里，但它配置的路径可以是系统上任何你希望的目录。因此，你可以把你的代码放在一系列不同的目录，只要那些目录包含在.pth文件里。

<!-- -------------------------------------------------------------------------- -->
## 10 通过字符串名导入模块

!!! question "问题"
    你想导入一个模块，但是模块的名字在字符串里。如何对字符串调用导入命令？

    - 使用 `importlib.import_module()` 函数来手动导入名字为字符串给出的一个模块或者包的一部分。

??? done "解决方案" 
    ```python
    >>> import importlib
    >>> math = importlib.import_module('math')
    >>> math.sin(2)
    0.9092974268256817
    >>> mod = importlib.import_module('urllib.request')
    >>> u = mod.urlopen('http://www.python.org')
    >>>
    ```

    !!! tips ""
        import_module只是简单地执行和import相同的步骤，但是返回生成的模块对象。你只需要将其存储在一个变量，然后像正常的模块一样使用。

        **如果你正在使用的包，import_module()也可用于相对导入**。但是，你需要给它一个额外的参数。例如：

        ```python
        import importlib
        # Same as 'from . import b'
        b = importlib.import_module('.b', __package__)
        ```

??? summary "讨论"
    使用 import_module() 手动导入模块的问题，通常出现在以某种方式编写修改或覆盖模块的代码时候。例如，也许你正在执行某种自定义导入机制，需要通过名称来加载一个模块，通过补丁加载代码。

    !!! attention ""
        在旧的代码，有时你会看到用于导入的内建函数 `__import__()`。尽管它能工作，但是 `importlib.import_module()` 通常更容易使用。

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