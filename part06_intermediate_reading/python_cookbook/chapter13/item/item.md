# 第十三章：脚本编程与系统管理

<!-- -------------------------------------------------------------------------- -->
## 01 通过重定向/管道/文件接受输入

!!! question "问题"
    如何让脚本接受任何用户认为最简单的输入方式。包括将命令行的输出通过管道传递给该脚本、 重定向文件到该脚本，或在命令行中传递一个文件名或文件名列表给该脚本。

    - 使用 Python 内置的 `fileinput` 模块

??? done "解决方案"

    ```python
    #!/usr/bin/env python3
    import fileinput

    with fileinput.input() as f_input:
        for line in f_input:
            print(line, end='')
    ```

    假设将此脚本保存为 `filein.py` 并将其变为可执行文件， 则可以像下面这样调用它，得到期望的输出：

    ```python
    $ ls | ./filein.py          # Prints a directory listing to stdout.
    $ ./filein.py /etc/passwd   # Reads /etc/passwd to stdout.
    $ ./filein.py < /etc/passwd # Reads /etc/passwd to stdout.
    ```

??? summary "讨论"

    `fileinput.input()` 创建并返回一个 `FileInput` 类的实例。该实例除了拥有一些有用的帮助方法外，它**还可被当做一个上下文管理器使用**。
    
    如果我们要写一个打印多个文件输出的脚本，那么我们需要在输出中包含文件名和行号，如下所示

    ```python
    >>> import fileinput
    >>> with fileinput.input('/etc/passwd') as f:
    >>>     for line in f:
    ...         print(f.filename(), f.lineno(), line, end='')
    ...
    /etc/passwd 1 ##
    /etc/passwd 2 # User Database
    /etc/passwd 3 #

    <other output omitted>
    ```

<!-- -------------------------------------------------------------------------- -->
## 02 终止程序并给出错误信息

!!! question "问题"
    如何向标准错误打印一条消息，并返回某个非零状态码来终止程序运行？

    - 在程序中抛出一个 `SystemExit` 异常，使用错误消息作为参数。

??? done "解决方案"

    ```python
    raise SystemExit('It failed!')
    ```

    它会将消息在 `sys.stderr` 中打印，然后程序以状态码 1 退出。

??? summary "讨论"

    当你想要终止某个程序时，你可能会像下面这样写：

    ```python
    import sys
    sys.stderr.write('It failed!\n')
    raise SystemExit(1)
    ```

    如果直接将消息作为参数传给 `SystemExit()` ，那么可以省略其他步骤， 比如 import 语句或将错误消息写入 `sys.stderr`。


<!-- -------------------------------------------------------------------------- -->
## 03 解析命令行选项

!!! question "问题"
    如何使脚本程序能够解析命令行选项?（位于sys.argv中）

    - 使用 `argparse` 模块来解析命令行选项
    - `argparse` 模块是标准库中最大的模块之一，拥有大量的配置选项。

??? done "解决方案"

    若使用 `argparse` 模块，为了解析命令行选项，首先要创建一个 `ArgumentParser` 实例， 并使用 `add_argument()` 方法声明想要支持的选项。

    在每个 `add_argument()` 调用中:
    
    - `dest` 参数指定解析结果被指派给属性的名字。 
    - `metavar` 参数被用来生成帮助信息。
    - `action` 参数指定跟属性对应的处理逻辑， 通常的值为 `store`，被用来存储某个值或将多个参数值收集到一个列表中。 

    ```python
    # search.py
    '''
    Hypothetical command-line tool for searching a collection of
    files for one or more text patterns.
    '''
    import argparse
    parser = argparse.ArgumentParser(description='Search some files')

    parser.add_argument(dest='filenames',metavar='filename', nargs='*')

    parser.add_argument('-p', '--pat',metavar='pattern', required=True,
                        dest='patterns', action='append',
                        help='text pattern to search for')

    parser.add_argument('-v', dest='verbose', action='store_true',
                        help='verbose mode')

    parser.add_argument('-o', dest='outfile', action='store',
                        help='output file')

    parser.add_argument('--speed', dest='speed', action='store',
                        choices={'slow','fast'}, default='slow',
                        help='search speed')

    args = parser.parse_args()

    # Output the collected arguments
    print(args.filenames)
    print(args.patterns)
    print(args.verbose)
    print(args.outfile)
    print(args.speed)
    ```

    该程序定义了一个如下使用的命令行解析器：

    ```python
    bash % python3 search.py -h
    usage: search.py [-h] [-p pattern] [-v] [-o OUTFILE] [--speed {slow,fast}]
                    [filename [filename ...]]

    Search some files

    positional arguments:
    filename

    optional arguments:
    -h, --help            show this help message and exit
    -p pattern, --pat pattern
                            text pattern to search for
    -v                    verbose mode
    -o OUTFILE            output file
    --speed {slow,fast}   search speed
    ```

    !!! tip ""
        对于选项值的进一步处理由程序来决定，可以用自己的逻辑来替代 `print()` 函数。

??? summary "讨论"

    === "示例1"
        下面的参数收集所有剩余的命令行参数到一个列表中。在本例中它被用来构造一个文件名列表：

        ```python
        parser.add_argument(dest='filenames',metavar='filename', nargs='*')
        ```

    === "示例2"
        下面的参数根据参数是否存在来设置一个 `Boolean` 标志：

        ```python
        parser.add_argument('-v', dest='verbose', action='store_true',
                            help='verbose mode')
        ```

    === "示例3"
        下面的参数接受一个单独值并将其存储为一个字符串：
        
        ```python
        parser.add_argument('-o', dest='outfile', action='store',
                            help='output file')
        ```

    === "示例4"
        下面的参数说明允许某个参数重复出现多次，并将它们追加到一个列表中去。 `required` 标志表示该参数至少要有一个。`-p` 和 `--pat` 表示两个参数名形式都可使用。

        ```python
        parser.add_argument('-p', '--pat',metavar='pattern', required=True,
                            dest='patterns', action='append',
                            help='text pattern to search for')
        ```

    === "示例5"
        下面的参数说明接受一个值，但是会将其和可能的选择值做比较，以检测其合法性：

        ```python
        parser.add_argument('--speed', dest='speed', action='store',
                            choices={'slow','fast'}, default='slow',
                            help='search speed')
        ```

    一旦参数选项被指定，就可以执行 `parser.parse()` 方法了。 它会处理 `sys.argv` 的值并返回一个结果实例。

    !!! danger ""
        还很多种其他方法解析命令行选项。
        
        - `getopt` vs `argparse`
        
        例如，可能会手动的处理 `sys.argv` 或者使用 `getopt` 模块。 但是，如果采用本节的方式，将会减少很多冗余代码，底层细节 argparse 模块已经帮你处理了。 
        
        - `optparse` vs `argparse`
        
        尽管 `optparse` 和 `argparse` 很像，但是后者更先进，因此在新的程序中你应该使用它。

<!-- -------------------------------------------------------------------------- -->
## 04 运行时弹出密码输入提示

!!! question "问题"
    交互式的脚本运行时，需要一个密码。因为不能将密码在脚本中硬编码， 所以需要弹出一个密码输入提示，让用户自己输入。

    - `getpass` 模块

??? done "解决方案"

    ```python
    import getpass

    user = getpass.getuser()
    passwd = getpass.getpass()

    if svc_login(user, passwd):    # You must write svc_login()
    print('Yay!')
    else:
    print('Boo!')
    ```

    在此代码中，svc_login() 是你要实现的处理密码的函数，具体的处理过程你自己决定。

??? summary "讨论"
    getpass.getuser() 不会弹出用户名的输入提示。 它会根据该用户的shell环境或者会依据本地系统的密码库（支持 pwd 模块的平台）来使用当前用户的登录名

    如果想显示的弹出用户名输入提示，使用内置的 `input` 函数：

    ```python
    user = input('Enter your username: ')
    ```

<!-- -------------------------------------------------------------------------- -->
## 05 获取终端的大小

!!! question "问题"
    如何获取当前终端的大小，以便正确的格式化输出？

    - 使用 os.get_terminal_size() 函数

??? done "解决方案"

    ```python
    >>> import os
    >>> sz = os.get_terminal_size()
    >>> sz
    os.terminal_size(columns=80, lines=24)
    >>> sz.columns
    80
    >>> sz.lines
    24
    >>>
    ```

??? summary "讨论"

    有太多方式来得知终端大小了，从读取环境变量到执行底层的 ioctl() 函数等等。 

<!-- -------------------------------------------------------------------------- -->
## 06 执行外部命令并获取它的输出

!!! question "问题"
    如何执行一个外部命令并以Python字符串的形式获取执行结果？

    - 使用 subprocess.check_output() 函数。

??? done "解决方案"

    ```python
    import subprocess
    out_bytes = subprocess.check_output(['netstat','-a'])
    ```

    这段代码执行一个指定的命令并将执行结果以一个字节字符串的形式返回。 如果需要文本形式返回，加一个解码步骤即可。例如：

    ```python
    out_text = out_bytes.decode('utf-8')
    ```

    如果被执行的命令以非零码返回，就会抛出异常。 下面的例子捕获到错误并获取返回码：

    ```python
    try:
        out_bytes = subprocess.check_output(['cmd','arg1','arg2'])
    except subprocess.CalledProcessError as e:
        out_bytes = e.output       # Output generated before error
        code      = e.returncode   # Return code
    ```

    默认情况下，check_output() 仅仅返回输入到标准输出的值。 如果你需要同时收集标准输出和错误输出，可以使用 stderr 参数：

    ```python
    out_bytes = subprocess.check_output(['cmd','arg1','arg2'],
                                        stderr=subprocess.STDOUT)
    ```

    如果要使用超时机制，可以添加 timeout 参数：
    
    ```python
    try:
        out_bytes = subprocess.check_output(['cmd','arg1','arg2'], timeout=5)
    except subprocess.TimeoutExpired as e:
        ...
    ```

    如果想让命令被一个shell执行，传递一个字符串参数，并设置参数 `shell=True`。当需要Python去执行一个复杂的shell命令的时候，这个就很有用了，比如管道流、I/O重定向和其他特性。

    ```python
    out_bytes = subprocess.check_output('grep python | wc > out', shell=True)
    ```

    !!! danger ""
        需要注意的是在shell中执行命令会存在一定的安全风险，特别是当参数来自于用户输入时。 这时候可以使用 `shlex.quote()` 函数来将参数正确的用双引用引起来。

??? summary "讨论"

    **使用 check_output() 函数是执行外部命令并获取其返回值的最简单方式。** 
    
    但是，如果你需要对子进程做更复杂的交互，比如给它发送输入，你得采用另外一种方法。 这时候可直接使用 subprocess.Popen 类。

    ```python
    import subprocess

    # Some text to send
    text = b'''
    hello world
    this is a test
    goodbye
    '''

    # Launch a command with pipes
    p = subprocess.Popen(['wc'],
            stdout = subprocess.PIPE,
            stdin = subprocess.PIPE)

    # Send the data and get the output
    stdout, stderr = p.communicate(text)

    # To interpret as text, decode
    out = stdout.decode('utf-8')
    err = stderr.decode('utf-8')
    ```

    !!! tips
        subprocess 模块对于依赖TTY的外部命令不合适用。
        
         例如，你不能使用它来自动化一个用户输入密码的任务（比如一个ssh会话）。 这时候，你需要使用到第三方模块了，比如基于著名的 expect 家族的工具（pexpect或类似的）

<!-- -------------------------------------------------------------------------- -->
## 07 复制或者移动文件和目录

!!! question "问题"

??? done "解决方案"

    ```python

    ```

    ```python

    ```

??? summary "讨论"

    ```python

    ```

    ```python

    ```

<!-- -------------------------------------------------------------------------- -->
## 08 创建和解压归档文件

!!! question "问题"

??? done "解决方案"

    ```python

    ```

    ```python

    ```

??? summary "讨论"

    ```python

    ```

    ```python

    ```

<!-- -------------------------------------------------------------------------- -->
## 09 通过文件名查找文件

!!! question "问题"

??? done "解决方案"

    ```python

    ```

    ```python

    ```

??? summary "讨论"

    ```python

    ```

    ```python

    ```

<!-- -------------------------------------------------------------------------- -->
## 10 读取配置文件

!!! question "问题"

??? done "解决方案"

    ```python

    ```

    ```python

    ```

??? summary "讨论"

    ```python

    ```

    ```python

    ```

<!-- -------------------------------------------------------------------------- -->
## 11 给简单脚本增加日志功能

!!! question "问题"

??? done "解决方案"

    ```python

    ```

    ```python

    ```

??? summary "讨论"

    ```python

    ```

    ```python

    ```

<!-- -------------------------------------------------------------------------- -->
## 12 给函数库增加日志功能

!!! question "问题"

??? done "解决方案"

    ```python

    ```

    ```python

    ```

??? summary "讨论"

    ```python

    ```

    ```python

    ```

<!-- -------------------------------------------------------------------------- -->
## 13 实现一个计时器

!!! question "问题"

??? done "解决方案"

    ```python

    ```

    ```python

    ```

??? summary "讨论"

    ```python

    ```

    ```python

    ```

<!-- -------------------------------------------------------------------------- -->
## 14 限制内存和CPU的使用量

!!! question "问题"

??? done "解决方案"

    ```python

    ```

    ```python

    ```

??? summary "讨论"

    ```python

    ```

    ```python

    ```

<!-- -------------------------------------------------------------------------- -->
## 15 启动一个WEB浏览器

!!! question "问题"
    如何通过脚本启动浏览器并打开指定的URL网页？

    - 使用与平台无关的 webbrowser 模块

??? done "解决方案"

    webbrowser.open() 会使用默认浏览器打开指定网页。

    ```python
    >>> import webbrowser
    >>> webbrowser.open('http://www.python.org')
    True
    >>>
    ```

    如果还想对网页打开方式做更多控制，还可以使用下面这些函数，打开一个新的浏览器窗口或者标签：

    ```python
    >>> # Open the page in a new browser window
    >>> webbrowser.open_new('http://www.python.org')
    True
    >>>

    >>> # Open the page in a new browser tab
    >>> webbrowser.open_new_tab('http://www.python.org')
    True
    >>>
    ```
    
    如果要指定浏览器类型，可以使用 webbrowser.get() 函数来指定某个特定浏览器。

    ```python
    >>> c = webbrowser.get('firefox')
    >>> c.open('http://www.python.org')
    True
    >>> c.open_new_tab('http://docs.python.org')
    True
    >>>
    ```

    对于支持的浏览器名称列表可查阅 [Python文档](http://docs.python.org/3/library/webbrowser.html)

    !!! danger ""
        可能会出现如下错误：

            ```python
            In [17]: c = webbrowser.get('firefox')
            ---------------------------------------------------------------------------
            Error                                     Traceback (most recent call last)
            <ipython-input-17-eabad5612d09> in <module>
            ----> 1 c = webbrowser.get('firefox')

            ~\Anaconda3\lib\webbrowser.py in get(using)
                63             elif command[0] is not None:
                64                 return command[0]()
            ---> 65     raise Error("could not locate runnable browser")
                66
                67 # Please note: the following definition hides a builtin function.

            Error: could not locate runnable browser
            ```

??? summary "讨论"
    **在脚本中打开浏览器有时候会很有用**。例如，某个脚本执行某个服务器发布任务， 你想快速打开一个浏览器来确保它已经正常运行了。
    
    或者是某个程序以HTML网页格式输出数据，你想打开浏览器查看结果。 不管是上面哪种情况，使用 `webbrowser` 模块都是一个简单实用的解决方案。






<!-- -------------------------------------------------------------------------- -->
## 总结

!!! example "总结"