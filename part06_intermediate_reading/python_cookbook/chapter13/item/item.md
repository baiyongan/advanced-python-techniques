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

    ```python

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
## 05 获取终端的大小

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
## 06 执行外部命令并获取它的输出

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
## 总结

!!! example "总结"