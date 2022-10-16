# Levels of Python code

What makes Python different?

When comparing Python to other languages, what do you look at?

In fact, I've identified four separate levels of detail and abstraction, and it's interesting to look at each separately:

## 1) Syntax level
This is the most basic level. Python uses indentation for block structure, and not braces. Its "for" loop doesn't have parentheses (like C's does, for example).

In the transition from Python 2 to Python 3, this is also the level where differences were (a) easiest to point out, and (b) of least real importance. It honestly doesn't matter much whether you have to write "print x" or "print(x)".

## 2) Idiom level
These are the building blocks of your program's code structures. They start to show a bit of complexity, but apply to many common algorithmic tasks.

For example:

Imagine you have a list of strings, and you need to find the first in that list which starts with "test". Unless it's not there, then you default to None.

How you do that in Python:

```python
item = None
for candidate in sequence:
    if candidate.startswith("test"):
        item = candidate
        break
```

That's an idiom. It's a small pattern you can use in many scenarios.

Different languages have different idioms for different tasks, depending on the features of that language.

## 3) Design pattern level
Here's where it starts to get complex enough to be interesting.

Design patterns are less precisely defined than idioms, but help you in more realistic and difficult coding situations.

From creational design patterns, like the factory patterns...

To structural patterns like Adapter or Proxy...

To behavioral patterns like Visitor or Strategy...

The really interesting thing is that most patterns apply to most general-purpose programming languages. The same patterns useful for C# are also, in most cases, useful for Python.

What is different is how they are expressed in code - again, because different languages have different sets of features.

But in any language, you can look at the code at a high level, and say: "yeah, I recognize that design pattern."

## 4) Architectural level
This is about the large-scale structure of your software system.

At this level, the language itself doesn't much matter. An application will have about the same architecture, regardless of whether it's written in Python, Java, or even C.

The interfaces between different subsystems, modules, etc. will often look different. But "organs" of the "body" will be essentially the same, no matter what language you use.

. . .

You'll find most books and articles about Python tend to focus on the first two levels. That's partly because it's easier to write about those levels, but also because it's where the differences from other languages are greater.

But it's worth studying Python at each of these levels. It'll make you not only a better Python programmer, but a better programmer overall.

## 拓展阅读

- [Levels of Python code](https://powerfulpython.com/blog/levels-of-python-code/)