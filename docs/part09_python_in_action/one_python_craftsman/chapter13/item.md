# 十三、开发大型项目

## 常用代码风格检查工具

### flake8

flake8 作为代码 Linter 工具，可以检验代码是否遵循 PEP8 规范，保持项目风格统一。

- flake8 的 PEP8 检查功能，是由集成在 flake8 内的另一个 Linter 工具 —— pycodestyle 实现的。
- flake8 还集成了另一个重要的 Linter —— pyflakes，它更专注于检查代码的正确性，比如语法错误、变量名未定义等等。
- flake8 为每类错误都定义了不同的错误代码，如 F401、E111 等，**首字母代表了不同的错误来源**。
- mccabe 模块集成在 flake8 里面，可以扫描代码的圈复杂度。

!!! tips 
    ```python
    $ flake8 --max-complexity 8 flak8_error.py
    flake8_error.py:5:1 C901 'complex_func' is too complex (12)
    ```
    其中， `--max-complexity` 参数可以修改允许的最大圈复杂度，建议该值不要超过 10。

- flake8 支持用户自定义插件，可参考官网教程，可学习下 **wemake-python-styleguide** 这个插件，非常严格。
  
### isort

isort 工具，可用来整理 import 语句。

!!! tips
    PEP8 关于 import 语句的建议：
    1. 导入 Python 标准库的 import 语句；
    2. 导入相关联的第三方包的 import 语句；
    3. 与当前应用（或当前库）相关的 import 语句

    其中，不同的 import 语句组之间，应该用空格分开。

源码文件：isort_demo.py 
```python
import os
import requests
import myweb.models 
from myweb.views import menu
from urllib import parse
import django
```

执行 `isort isort_demo.py` 之后，import 语句会被排列整齐：

- 第一部分：标准库包
- 第二部分：第三方包
- 第三部分：本地包

```python
import os 
from urllib import parse

import django 
import requests

import myweb.models 
from myweb.views import menu
```

### black

black 是一款更为激进的代码格式化工具。

black 的最大特点，在于其不可配置。它能让开发者不需要在各种编码风格之间纠结，整体来看，大型项目中引入 black，利大于弊。

### pre-commit

pre-commit 是一个基于钩子功能开发的工具，专门用于预提交阶段。

如要最大限度地发挥工具地能力，必须让其融入到所有人地开发流程里。

但是，统一 IDE 不现实，不过对版本控制工具—— git 可以进行配置，git 有个特殊的钩子功能，它允许你给每个仓库配置一些钩子程序（hook）。

配置文件 —— `pre-commit-config.yaml`

```python
fail_fast: true
repos:
- repo: https://github.com/timothycrosley/isort
  rev: 5.7.0
  hooks:
  - id: isort
    additional_dependencies: [toml]
- repo: https://github.com/psf/black
  rev: 20.8b1
  hooks:
  - id: black
    args: [--config=./pyproject.toml]
- repo: https://github.com/pre-commit/pre-commit-hooks
  rev: v2.4.0
  hooks:
  - id: flake8
```

  如此一来，每次 git commit、git push 时，都会需要触发定义的 isort、black、flake8 三个插件，完成代码检查及格式化工作，否则就会提交中断。


### mypy

mypy 是一款静态类型检查工具。

Python 是一门动态类型语言。它让我们不必声明每个变量的类型，不用关心太多类型问题，只专注于用代码实现功能就好。但**现实情况是，我们写的程序里的许多bug和类型系统息息相关**。

!!! tips
    在大型项目中，类型注解与mypy的组合能大大提升项目代码的可读性与正确性。

    mypy 让动态类型的 Python 拥有了部分静态类型语言才有的能力，值得在大型项目中推广使用。


---

## 单元测试 

根据关注点的不同，自动化测试可分为不同的类型，比如UI测试、集成测试、单元测试等。不同类型的测试，各自关注着不同的领域，覆盖了不一样的场景。

在所有测试中，单元测试数量最多、测试成本最低，是整个自动化测试的基础和重中之重。

### unittest

### pytest

---

## 单元测试建议

### 写单元测试不是浪费时间

缺少单元测试的帮助，你需要耐心找到改动可能会影响到的每个模块，手动验证它们是否正常工作。所有这些事所花费的时间，足够你写好几十遍单元测试。

在项目上线新功能，和对项目做大规模重构时，尤其能体现单元测试的价值。

### 不要总想着补测试

### 难测试的代码就是烂代码

### 像应用代码一样对待测试代码

### 避免教条主义

!!! tips 
    要开发一个成功的大型项目（此处仅指工程意义上的成功，非商业意义上），不仅仅需要做好 Linter 工具和单元测试，还需要注重与团队成员间的沟通，积极推行代码审查，营造更好的合作氛围，等等。

    建议除了本章内容之外，继续深入学习一些敏捷编程、领域驱动设计、整洁架构等方面的内容。这些知识对于大型项目开发有着很好的启发作用。

