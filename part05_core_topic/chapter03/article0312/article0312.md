# contextlib 实现上下文管理器

contextmanager可以简化上下文管理器，不需要我们编写`__enter__`和`__exit__`函数。

它可以让我们把一个之前不是上下文管理器的函数，变成一个上下文管理器，而不需要我们去修改这个函数的源代码。

其中的 yield 的作用，是中断当前函数执行流程，先去执行 yield 出去部分的代码的执行流程。


```python
import contextlib


@contextlib.contextmanager
def file_open(file_name):
    print("file open")
    yield {}  # contextlib 修饰的函数需要是一个生成器
    print("file close")


with file_open("bya.txt") as f_opened:
    print("file processing")
#-----------------------------------
file open
file processing
file close
```
