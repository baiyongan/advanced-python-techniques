# 加餐一 | 用一篇文章带你了解专栏中用到的所有Java语法

如果你熟悉的是 C/C++、C#、PHP,那几乎不用费多大力气,就能看懂 Java 代码。

如果你熟悉的是 Python、Go、Ruby、JavaScript,这些语言的语法可能跟 Java 的区别稍微有些大,但是,通过这篇文章,做到能看懂也不是难事儿。



## Hello World
在 Java 中,所有的代码都必须写在类里面,所以,定义一个 HelloWorld 类。main() 函数是程序执行的入口。

!!! tips
    Java 中有两种代码注释方式,第一种是“// 注释...”双斜杠,表示后面的字符串都是注释,第二种是“/* 注释... */”, 表示中间的内容都是注释。

```java
/*hello world 程序 */
public class HelloWorld {
    public static void main(String []args) {
        System.out.println("Hello World"); // 打印 Hello World
    }
}
```

## 基本数据类型

Java 语言中的基本数据类型,主要有下面几种:
- 整型类型:byte(字节)、short(短整型)、int(整型)、long(长整型) 
- 浮点类型:float(单精度浮点)、double(双精度浮点)
- 字符型:char
- 布尔型:boolean

除此之外,为了方便使用,Java 还提供了一些封装这些基本数据类型的类,这些类实现了一些常用的功能函数,可以直接拿来使用。常用的有下面几个类:
- Integer:对应封装了基本类型 int; 
- Long:对应封装了基本类型 long; 
- Float:对应封装了基本类型 float; 
- Double:对应封装了基本类型 double; 
- Boolean:对应封装了基本类型 boolean; 
- String:对应封装了字符串类型 char[]。

```java
// 定义一个基本类型变量
int a = 6;

// 定义一个 Integer 对象
Integer oa = new Integer(6);
```

## 数组

```java
int a[] = new int[10]; // 定义一个长度是 10 的 int 类型数组

a[1] = 3; // 将下标是 1 的数组元素赋值为 3
System.out.println(a[2]); // 打印下标是 2 的数组元素值
```

## 流程控制

### if-else

```java
// 用法一
int a;
if (a > 1) {
    // 执行代码块
} else {
    // 执行代码块
}

// 用法二
int a;
if (a >1) {
    // 执行代码块
} else if (a == 1) {
    // 执行代码块
} else {
    // 执行代码块
}
```

### switch-case

```java
int a;
switch (a) {
    case 1:
      // 执行代码块
      break;
    case 2:
      // 执行代码块 
      break;
    default:
      // 默认执行代码   
}
```

### for、while 循环

```java
for (int i = 0; i < 10; ++i) {
    // 循环执行 10 次此代码块
}

int i = 0;
while (i < 10) {
    // 循环执行 10 次此代码块
}
```

### continue、break、return

```java
for (int i = 0; i < 10; ++i) {
    if (i == 4) {
        continue; // 跳过本次循环，不会打印出 4 这个值
    }
    System.out.println(i);
}

for (int i =0; i < 10; ++i) {
    if (i == 4) {
        break; // 提前终止循环，只会打印 0、1、2、3
    }
    System.out.println(i);
}

public void func(int a) {
    if (a == 1) {
        return; // 结束一个函数，从此处返回
    }
    System.out.println(a);
}

```

## 类、对象


## 权限修饰符
权限修饰符可以修饰函数、成员变量。

## 继承


## 接口



## 容器


## 异常处理


## package 包


## 总结

