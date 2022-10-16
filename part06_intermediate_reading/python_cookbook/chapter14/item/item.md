# 第十四章：测试、调试和异常

<!-- -------------------------------------------------------------------------- -->
## 01 测试 stdout 输出

!!! question "问题"
    给定一个输入，相应的输出能正常显示出来

    - 使用 `unittest.mock` 模块中的 `patch()` 函数，可以为单个测试模拟 sys.stdout 然后回滚， 并且不产生大量的临时变量或在测试用例直接暴露状态变量。

??? done "解决方案"

    作为一个例子，我们在 mymodule 模块中定义如下一个函数：

    ```python
    # mymodule.py

    def urlprint(protocol, host, domain):
        url = '{}://{}.{}'.format(protocol, host, domain)
        print(url)
    ```

    ```python
    from io import StringIO
    from unittest import TestCase
    from unittest.mock import patch
    import mymodule

    class TestURLPrint(TestCase):
        def test_url_gets_to_stdout(self):
            protocol = 'http'
            host = 'www'
            domain = 'example.com'
            expected_url = '{}://{}.{}\n'.format(protocol, host, domain)

            with patch('sys.stdout', new=StringIO()) as fake_out:
                mymodule.urlprint(protocol, host, domain)
                self.assertEqual(fake_out.getvalue(), expected_url)
    ```

??? summary "讨论"
    
<!-- -------------------------------------------------------------------------- -->
## 02 在单元测试中给对象打补丁

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
## 03 在单元测试中测试异常情况

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
## 04 将测试输出用日志记录到文件中

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
## 05 忽略或期望测试失败

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
## 06 处理多个异常

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
## 07 捕获所有异常

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
## 08 创建自定义异常

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
## 09 捕获异常后抛出另外的异常

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
## 10 重新抛出被捕获的异常

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
## 11 输出警告信息

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
## 12 调试基本的程序崩溃错误

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
## 13 给你的程序做性能测试

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
## 14 加速程序运行

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