# 静态方法、类方法以及对象方法及参数

```python
class Date:
    # 构造函数
    def __init__(self, year, month, day):
        self.year = year
        self.month = month
        self.day = day

    def __str__(self):
        return "{year}/{month}/{day}".format(year=self.year, month=self.month, day=self.day)

    def tomorrow(self):  # 实例方法，很常见。创建时，Pycharm 会自动补全一个 self 的实例
        self.day += 1

    @staticmethod  # 静态方法，不需要接收 self 或 cls，调用必须用 Date，因为它已经进入到 Date 的命名空间了。
    def parse_from_string(date_str):
        year, month, day = tuple(date_str.split("-"))
        return Date(int(year), int(month), int(day))  # 但是静态方法是用的硬编码的方式，如果 Date 类名字改变，它内部也需要变。

    @classmethod  # 类方法，创建时，Pycharm 会自动补全一个 cls ，即类本身。（其实名称无所谓，只是一种默认规范）
    def from_string(cls, date_str):
        year, month, day = tuple(date_str.split("-"))
        return cls(int(year), int(month), int(day))  # 这里使用类方法，避免了硬编码的方式。

    @staticmethod  # 如果一种功能不需要把类变量传递进来，就没必要用类方法，使用静态方法即可。
    def valid_string(date_str):
        year, month, day = tuple(date_str.split("-"))
        if int(year) > 0 and (0 < int(month) <= 12) and (0 < int(day) <= 31):  # 粗略判断，非实际情况
            return True
        else:
            return False


if __name__ == "__main__":
    new_day = Date(2021, 8, 31)
    new_day.tomorrow()  # Python 内部会直接把 new_day.tomorrow() 转换成 tommorow(new_day) 这种调用形式，参数为 self 实例，即 new_day。
    print(new_day)

    # 2021-8-31
    date_str = "2021-8-31"
    year, month, day = tuple(date_str.split("-"))  # 每次传参前，都要解析，可以放在类中，用静态方法调用
    new_day = Date(int(year), int(month), int(day))
    print(new_day)

    # 用 staticmethod 完成初始化
    new_day = Date.parse_from_string(date_str)
    print(new_day)

    # 用 classmethod 完成初始化
    new_day = Date.from_string(date_str)  # 直接传递 cls，避免了硬编码
    print(new_day)

    print(Date.valid_string("2021-8-32"))
```




