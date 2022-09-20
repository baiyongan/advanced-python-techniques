# 十三、开发大型项目

## 常用代码风格检查工具

### flake8

- flake8 的 PEP8 检查功能，是由集成在 flake8 内的另一个 Linter 工具 —— pycodestyle 实现的。
- flake8 还集成了另一个重要的 Linter —— pyflakes，它更专注于检查代码的正确性，比如语法错误、变量名未定义等等。
- flake8 为每类错误都定义了不同的错误代码，如 F401、E111 等，首字母代表了不同的错误来源。
- mccabe 模块可以扫描代码的圈复杂度。

!!! tips 
    ```python
    $ flake8 --max-complexity 8 flak8_error.py
    flake8_error.py:5:1 C901 'complex_func' is too complex (12)
    ```
    其中， `--max-complexity` 参数可以修改允许的最大圈复杂度，建议该值不要超过 10。

- flake8 支持用户自定义插件，可参考官网教程，可学习下 wemake-python-styleguide 这个插件。
### isort

### black

### pre-commit

### mypy

## 单元测试 

### unittest

### pytest


## 单元测试建议

### 写单元测试不是浪费时间

### 不要总想着补测试

### 难测试的代码就是烂代码

### 像应用代码一样对待测试代码

### 避免教条主义

!!! tips 
    要开发一个成功的大型项目（此处仅指工程意义上的成功，非商业意义上），不仅仅需要做好 Linter 工具和单元测试，还需要注重与团队成员间的沟通，积极推行代码审查，营造更好的合作氛围，等等。

    建议除了本章内容之外，继续深入学习一些敏捷编程、领域驱动设计、整洁架构等方面的内容。这些知识对于大型项目开发有着很好的启发作用。

