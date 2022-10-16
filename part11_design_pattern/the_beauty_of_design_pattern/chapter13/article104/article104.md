# 加餐三 | 聊一聊Google是如何做Code Review的

## 为什么国内企业不重视 Code Review?

国内的大部分公司都不怎么接受 Code Review，在开发中，根本没有 Code Review 的流程。

很多人会认为，主要原因是，项目工期紧，没时间做 Code Review。这只是表面的原因，最根本的原因还是缺少技术文化传承。

很多人不认可、不推行 Code Review，最直接的原因还是没有经历过 Code Review，没有有经验的人来带。

资深的工程师没有一手的 Code Review 的经验和感受，更无法了解到 Code Review 的好处，也更不会在团队、公司，甚至技术圈中去推行 Code Review 了。

如果站在团队协作的角度来看，对于一个长期维护、多人参与、代码比较多的项目来说，代码的可读性、可维护性等与质量相关的问题，是非常重要的。

## Google 是如何进行 Code Review 的?

在 Google，每次提交的代码片段叫做一个 CL，全称是 Change List。它就相当于 GitHub 中的 PR(Pull Request)。

每个 CL 都要至少一个 Owner 和一个具有 Readability 的同事 Approve，才能提交到代码仓库中。其中，Owner 一般都是技术 Leader 或者项目负责人，而 Readability 是一个证书，表示你具有了写出可读代码、符合编码规范代码的能力。Readability 会细化到每种编程语言，比如 Java Readability、C++ Readability 等。

在 Google，每种编程语言都有对应的编码规范。但是，Code Review 本身并没有统一的 Check list。在 Code Review 的时候，除了编码规范可以参考之外，大部分都是靠工程师自身的经验来 Review。

不过，Review 考虑的也无外乎这样几个常见的方面:

- 代码结构是否合理、
- 代码是否容易理解、
- 业务是否正确、
- 异常考虑是否全面、
- 是否有隐藏的 bug、
- 线程是否安全、
- 性能是否满足业务需求、
- 是否符合编码规范等等。

一个 CL 从提交 Review 到最终合并到代码仓库，一般也就需要一天的时间。当然，对于一些比较大的 CL、比较复杂的 CL、有比较多争议的 CL，以及一些新手的 CL，可能会花费比较多的时间。

不提倡太大的 CL。太大的 CL 对代码审查者来说是很大的负担，Review 过程会很慢，会导致代码迟迟提交不上去。

对于比较复杂的 CL，我们一般建议要写好文档，或者通过类似 Jira 这样的项目工具，详细描述 CL 的前因后果、上下文背景。这样，代码审查者就能一眼看懂代码包含的设计意图。

对于争议比较多的 CL，我们建议直接当面沟通，这样也更加有效率。

对于一些新手的 CL，因为他们对编码规范等不熟练，可能来来回回要改好几次，才能满足要求，但这个过程是每
个新人都要经历的，多改几次就好了。

## 拓展阅读

- [Google 官方公布的 Code Review 最佳实践](https://google.github.io/eng-practices/)
