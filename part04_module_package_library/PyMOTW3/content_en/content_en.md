# 目录

## 1 Text

??? abstract
    `str` 这个类是 Python 中最明显的文本处理工具，但是，其实内置标准库中，还有很多可以使高级文本操作变得简单的其他工具。
    
    `string.Template` 比 `str` 功能强，但没 web 框架提供的模板功能丰富，不过， 作为一个功能适中的工具，它可以满足将动态值插入其他静态文本的需求。

    `textwrap` 模块，可以限制输出宽度、添加缩进，插入换行符以一致换行来格式化段落文本等。

    标准库提供了两个对比文本数据的模块：`re` 和 `difflib`。re提供了一个完整的正则表达式库，用C实现以提高速度。正则匹配非常适用于在大数据集中查找子字符串，模式对比以及解析等。

    `difflib` 模块正相反，根据添加、删除或更改的部分，计算文本序列之间的实际差异。`difflib` 中比较函数的输出可用于向用户提供更详细的反馈，以了解两个输入中的更改位置、文档随时间的变化情况等。


- [ ] **`string`**        ---               Text Constants and Templates
- [ ] **`textwrap`**        ---                Formatting Text Paragraphs
- [ ] **`re`**        ---                Regular Expressions
- [ ] **`difflib`**        ---                Compare Sequences

##  2 Data Structures

??? abstract
 
- [ ] **`enum`**        ---                   Enumeration Type
- [ ] **`collections`**        ---                Container Data Types
- [ ] **`array`**        ---                Sequence of Fixed-type Data
- [ ] **`heapq`**        ---                  Heap Sort Algorithm
- [ ] **`bisect`**        ---                Maintain Lists in Sorted Order
- [ ] **`queue`**        ---                Thread-Safe FIFO Implementation
- [ ] **`struct`**        ---                Binary Data Structures
- [ ] **`weakref`**        ---                Impermanent References to Objects
- [ ] **`copy`**        ---                Duplicate Objects
- [ ] **`pprint`**        ---                Pretty-Print Data Structures

##  3 Algorithms

??? abstract
 
- [ ] **`functools`**        ---                Tools for Manipulating Functions
- [ ] **`itertools`**        ---                Iterator Functions
- [ ] **`operator`**        ---                Functional Interface to Built-in Operators
- [ ] **`contextlib`**        ---                Context Manager Utilities

##  4 Dates and Times

??? abstract
 
- [ ] **`time`**        ---                Clock Time
- [ ] **`datetime`**        ---                Date and Time Value Manipulation
- [ ] **`calendar`**        ---                Work with Dates

##  5 Mathematics

??? abstract
 
- [ ] **`decimal`**        ---                Fixed and Floating Point Math
- [ ] **`fractions`**        ---                Rational Numbers
- [ ] **`random`**        ---                Pseudorandom Number Generators
- [ ] **`math`**        ---                Mathematical Functions
- [ ] **`statistics`**        ---                Statistical Calculations

##  6 The File System

??? abstract
 
- [ ] **`os.path`**        ---                Platform-independent Manipulation of Filenames
- [ ] **`pathlib`**        ---                Filesystem Paths as Objects
- [ ] **`glob`**        ---                Filename Pattern Matching
- [ ] **`fnmatch`**        ---                Unix-style Glob Pattern Matching
- [ ] **`linecache`**        ---                Read Text Files Efficiently
- [ ] **`tempfile`**        ---                Temporary File System Objects
- [ ] **`shutil`**        ---                High-level File Operations
- [ ] **`filecmp`**        ---                Compare Files
- [ ] **`mmap`**        ---                Memory-map Files
- [ ] **`codecs`**        ---                String Encoding and Decoding
- [ ] **`io`**        ---                Text, Binary, and Raw Stream I/O Tools

##  7 Data Persistence and Exchange

??? abstract
 
- [ ] **`pickle`**        ---                Object Serialization
- [ ] **`shelve`**        ---                Persistent Storage of Objects
- [ ] **`dbm`**        ---                Unix Key-Value Databases
- [ ] **`sqlite3`**        ---                Embedded Relational Database
- [ ] **`xml.etree.ElementTree`**        ---               XML Manipulation API
- [ ] **`csv`**        ---                Comma-separated Value Files

##  8 Data Compression and Archiving

??? abstract
 
- [ ] **`zlib`**        ---                GNU zlib Compression
- [ ] **`gzip`**        ---                Read and Write GNU zip Files
- [ ] **`bz2`**        ---                bzip2 Compression
- [ ] **`tarfile`**        ---                Tar Archive Access
- [ ] **`zipfile`**        ---                ZIP Archive Access

##  9 Cryptography

??? abstract
 
- [ ] **`hashlib`**        ---                Cryptographic Hashing
- [ ] **`hmac`**        ---                Cryptographic Message Signing and Verification

##  10 Concurrency with Processes, Threads, and Coroutines

??? abstract
 
- [ ] **`subprocess`**        ---                Spawning Additional Processes
- [ ] **`signal`**        ---                Asynchronous System Events
- [ ] **`threading`**        ---                Manage Concurrent Operations Within a Process
- [ ] **`multiprocessing`**        ---                Manage Processes Like Threads
- [ ] **`asyncio`**        ---                Asynchronous I/O, event loop, and concurrency tools
- [ ] **`concurrent.futures`**        ---                Manage Pools of Concurrent Tasks

##  11 Networking

??? abstract
 
- [ ] **`ipaddress`**        ---                Internet Addresses
- [ ] **`socket`**        ---                Network Communication
- [ ] **`selectors`**        ---                I/O Multiplexing Abstractions
- [ ] **`select`**        ---                Wait for I/O Efficiently
- [ ] **`socketserver`**        ---                Creating Network Servers

##  12 The Internet

??? abstract
 
- [ ] **`urllib.parse`**        ---                Split URLs into Components
- [ ] **`urllib.request`**        ---                Network Resource Access
- [ ] **`urllib.robotparser`**        ---                Internet Spider Access Control
- [ ] **`base64`**        ---                Encode Binary Data with ASCII
- [ ] **`http.server`**        ---                Base Classes for Implementing Web Servers
- [ ] **`http.cookies`**        ---                HTTP Cookies
- [ ] **`webbrowser`**        ---                Displays web pages
- [ ] **`uuid`**        ---                Universally Unique Identifiers
- [ ] **`json`**        ---                JavaScript Object Notation
- [ ] **`xmlrpc.client`**        ---                Client Library for XML-RPC
- [ ] **`xmlrpc.server`**        ---                An XML-RPC server

##  13 Email

??? abstract
 
- [ ] **`smtplib`**        ---                Simple Mail Transfer Protocol Client
- [ ] **`smtpd`**        ---                Sample Mail Servers
- [ ] **`mailbox`**        ---                Manipulate Email Archives
- [ ] **`imaplib`**        ---                IMAP4 Client Library

##  14 Application Building Blocks

??? abstract
 
- [ ] **`argparse`**        ---                Command-Line Option and Argument Parsing
- [ ] **`getopt`**        ---                Command Line Option Parsing
- [ ] **`readline`**        ---                The GNU readline Library
- [ ] **`getpass`**        ---                Secure Password Prompt
- [ ] **`cmd`**        ---                Line-oriented Command Processors
- [ ] **`shlex`**        ---                Parse Shell-style Syntaxes
- [ ] **`configparser`**        ---                Work with Configuration Files
- [ ] **`logging`**        ---                Report Status, Error, and Informational Messages
- [ ] **`fileinput`**        ---                Command-Line Filter Framework
- [ ] **`atexit`**        ---                Program Shutdown Callbacks
- [ ] **`sched`**        ---                Timed Event Scheduler

##  15 Internationalization and Localization

??? abstract
 
- [ ] **`gettext`**        ---                Message Catalogs
- [ ] **`locale`**        ---                Cultural Localization API

##  16 Developer Tools

??? abstract
 
- [ ] **`pydoc`**        ---                Online Help for Modules
- [ ] **`doctest`**        ---                Testing Through Documentation
- [ ] **`unittest`**        ---                Automated Testing Framework
- [ ] **`trace`**        ---                Follow Program Flow
- [ ] **`traceback`**        ---                Exceptions and Stack Traces
- [ ] **`cgitb`**        ---                Detailed Traceback Reports
- [ ] **`pdb`**        ---                Interactive Debugger
- [ ] **`profile and pstats`**        ---                Performance Analysis
- [ ] **`timeit`**        ---                Time the execution of small bits of Python code.
- [ ] **`tabnanny`**        ---                Indentation validator
- [ ] **`compileall`**        ---                Byte-compile Source Files
- [ ] **`pyclbr`**        ---                Class Browser
- [ ] **`venv`**        ---                Create Virtual Environments
- [ ] **`ensurepip`**        ---                Install the Python Package Installer

##  17 Runtime Features

??? abstract
 
- [ ] **`site`**        ---                Site-wide Configuration
- [ ] **`sys`**        ---                System-specific Configuration
- [ ] **`os`**        ---                Portable access to operating system specific features
- [ ] **`platform`**        ---                System Version Information
- [ ] **`resource`**        ---                System Resource Management
- [ ] **`gc`**        ---                Garbage Collector
- [ ] **`sysconfig`**        ---                Interpreter Compile-time Configuration

##  18 Language Tools

??? abstract
 
- [ ] **`warnings`**        ---                Non-fatal Alerts
- [ ] **`abc`**        ---                Abstract Base Classes
- [ ] **`dis`**        ---                Python Bytecode Disassembler
- [ ] **`inspect`**        ---                Inspect Live Objects

##  19 Modules and Packages

??? abstract
 
- [ ] **`importlib`**        ---                Python’s Import Mechanism
- [ ] **`pkgutil`**        ---                Package Utilities
- [ ] **`zipimport`**        ---                Load Python Code from ZIP Archives

##  20 Unix-specific Services

??? abstract
 
- [ ] **`pwd`**        ---                Unix Password Database
- [ ] **`grp`**        ---                Unix Group Database

## 拓展阅读
- [Python 3 Module of the Week](https://pymotw.com/3/index.html)