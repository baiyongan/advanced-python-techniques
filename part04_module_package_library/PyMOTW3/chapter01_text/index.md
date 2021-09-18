# 章节简介 

The str class is the most obvious text processing tool available to Python programmers, but there are plenty of other tools in the standard library to make advanced text manipulation simple.

Programs may use string.Template as a simple way to parameterize strings beyond the features of str objects. While not as feature-rich as templates defined by many of the web frameworks or extension modules available from the Python Package Index, string.Template is a good middle ground for user-modifiable templates in which dynamic values need to be inserted into otherwise static text.

The textwrap module includes tools for formatting text from paragraphs by limiting the width of output, adding indentation, and inserting line breaks to wrap lines consistently.

The standard library includes two modules for comparing text values that go beyond the built-in equality and sort comparison supported by string objects. re provides a complete regular expression library, implemented in C for speed. Regular expressions are well suited for finding substrings within a larger data set, comparing strings against a pattern more complex than another fixed string, and mild parsing.

difflib, in contrast, computes the actual differences between sequences of text in terms of the parts added, removed, or changed. The output of the comparison functions in difflib can be used to provide more detailed feedback to the user about where changes occur in two inputs, how a document has changed over time, and so on.