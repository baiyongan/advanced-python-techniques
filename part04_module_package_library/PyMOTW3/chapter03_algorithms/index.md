# 章节简介

Python includes several modules for implementing algorithms elegantly and concisely using whatever style is most appropriate for the task. It supports purely procedural, object oriented, and functional styles and all three styles are frequently mixed within different parts of the same program.

functools includes functions for creating function decorators, enabling aspect oriented programming and code reuse beyond what a traditional object oriented approach supports. It also provides a class decorator for implementing all of the rich comparison APIs using a short-cut, and partial objects for creating references to functions with their arguments included.

The itertools module includes functions for creating and working with iterators and generators used in functional programming. The operator module eliminates the need for many trivial lambda functions when using a functional programming style by providing function-based interfaces to built-in operations such as arithmetic or item lookup.

And no matter what style is used in a program, contextlib makes resource management easier, more reliable, and more concise. Combining context managers and the with statement reduces the number of try:finally blocks and indentation levels needed, while ensuring that files, sockets, database transactions, and other resources are closed and released at the right time.