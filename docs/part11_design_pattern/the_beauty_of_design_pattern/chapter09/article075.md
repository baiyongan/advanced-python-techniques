# 75 | 在实际的项目开发中，如何避免过度设计？又如何避免设计不足？

## 两种错误的设计方式

### 一种是过度设计

在开始编写代码之前，花很长时间做代码设计，在开发过程中应用各种设计模式，美其名曰未雨绸缪，希望代码更加灵活，为未来的扩展打好基础，实则过度设计，未来的需求并不一定会实现，实际上是增加了代码的复杂度，以后的所有开发都要在这套复杂的设计基础之上来完成。

### 一种是设计不足

怎么简单怎么来，写出来的代码能跑就可以，顶多算是 demo，看似在实践 KISS、YAGNI 原则，实则忽略了设计环节，代码毫无扩展性、灵活性可言，添加、修改一个很小的功能就要改动很多代码。

## 设计的初衷是提高代码质量

应用设计模式也是如此。应用设计模式只是方法，最终的目的，也就是初心，是提高代码的质量。具体点说就是，提高代码的可读性、可扩展性、可维护性等。所有的设计都是围绕着这个初心来做的。

!!! tips 
    在做代码设计的时候，你一定要先问下自己，为什么要这样设计，为什么要应用这种设计模式，这样做是否能真正地提高代码质量，能提高代码质量的哪些方面。如果自己很难讲清楚，或者给出的理由都比较牵强，没有压倒性的优势，那基本上就可以断定这是一种过度设计，是为了设计而设计。

实际上，**设计原则和思想是心法，设计模式只是招式。掌握心法，以不变应万变，无招胜有招**。所以，设计原则和思想比设计模式更加普适、重要。掌握了设计原则和思想，我们能更清楚地了解为什么要用某种设计模式，就能更恰到好处地应用设计模式，甚至我们还可以自己创造出来新的设计模式。

## 设计的过程是先有问题后有方案

如果我们把写出的代码看作产品，那做产品的时候，我们先要思考痛点在哪里，用户的真正需求在哪里，然后再看要开发哪些功能去满足，而不是先拍脑袋想出一个花哨的功能，再去东搬西凑硬编出一个需求来。

代码设计也是类似的。我们先要去分析代码存在的痛点，比如可读性不好、可扩展性不好等等，然后再针对性地利用设计模式去改善，而不是看到某个场景之后，觉得跟之前在某本书中看到的某个设计模式的应用场景很相似，就套用上去，也不考虑到底合不合适。

最重要的，是要培养分析问题、解决问题的能力。这样，看到某段代码之后，就能够自己分析，说出它好的地方、不好的地方，为什么好、为什么不好，不好的如何改善，可以应用哪种设计模式，应用了之后有哪些副作用要控制等等。

相反，如果只是掌握了理论知识，即便把 23 种设计模式的原理和实现背得滚瓜烂熟，不具备具体问题具体分析的能力，在面对真实项目的千变万化的代码的时候，反而很容易就会滥用设计模式，过度设计。

## 设计的应用场景是复杂代码

**设计模式要干的事情就是解耦**，也就是利用更好的代码结构将一大坨代码拆分成职责更单一的小类，让其满足高内聚低耦合等特性。

- 创建型模式是将创建和使用代码解耦，
- 结构型模式是将不同的功能代码解耦，
- 行为型模式是将不同的行为代码解耦。

解耦的主要目的是应对代码的复杂性。**设计模式就是为了解决复杂代码问题而产生的**。

因此，对于复杂代码，比如项目代码量多、开发周期长、参与开发的人员多，我们前期要多花点时间在设计上，越是复杂代码，花在设计上的时间就要越多。

不仅如此，每次提交的代码，都要保证代码质量，都要经过足够的思考和精心的设计，这样才能避免烂代码效应（每次提交的代码质量都不是太好，最终积累起来整个项目的质量就变得很差）。

相反，如果你参与的只是一个简单的项目，代码量不多，开发人员也不多，那简单的问题用简单的解决方案就好，不要引入过于复杂的设计模式，将简单问题复杂化。

## 持续重构能有效避免过度设计

**应用设计模式会提高代码的可扩展性，但同时也会带来代码可读性的降低，复杂度的升高**。一旦我们引入某个复杂的设计，之后即便在很长一段时间都没有扩展的需求，我们也不可能将这个复杂的设计删除，整个团队都要一直背负着这个复杂的设计前行。

为了避免错误的需求预判导致的过度设计，非常建议用持续重构的开发方法。持续重构不仅仅是保证代码质量的重要手段，也是避免过度设计的有效方法。**在真正有痛点的时候，我们再去考虑用设计模式来解决，而不是一开始就为不一定实现的未来需求而应用设计模式。**

当对要不要应用某种设计模式感到模棱两可的时候，你可以思考一下，如果暂时不用这种设计模式，随着代码的演进，当某一天不得不去使用它的时候，重构的代码是否很大。如果不是，那能不用就不用，怎么简单就怎么来。说句实话，对于 10 万行以内的代码，团队成员稳定，对代码涉及的业务比较熟悉的情况下，即便将所有的代码都推倒重写，也不会花太多时间，因此也不必为代码的扩展性太过担忧。

## 避免设计不足的 3 个必要条件

- 首先，**要有一定理论知识的储备**。

要熟练掌握各种设计原则、思想、编码规范、设计模式。理论知识是解决问题的工具，是前人智慧的结晶。没有理论知识，就相当于游戏中没有厉害的装备，虽然可以靠身手徒手打怪，但肯定会影响你最高水平的发挥。

- 其次，**还要有一定的刻意训练**。

理论知识都学过，但是很容易忘记，遇到问题也想不到对应的知识点。实际上，这就是缺乏理论结合实践的刻意训练。工作之后，我们自己看书学知识，别说拿几个场景来实践了，大部分都是走马观花地看看，**没有经过刻意的训练，知识积累不了，能力也锻炼不了，等于白学**。

- 最后，你一定要有代码质量意识、设计意识。

在写代码之前，要多想想未来会有哪些扩展的需求，哪部分是会变的，哪部分是不变的，这样写会不会导致之后添加新的功能比较困难，代码的可读性好不好等代码质量问题。有了这样的意识，实际上，就离写出高质量的代码不远了。


## 不要脱离具体的场景去谈设计

设计是一个非常主观的事情，如果要评判设计的好坏，则需要放到具体的场景中。脱离具体的场景去谈论设计是否合理，都是空谈。

比如，如果我们开发的是偏底层的、框架类的、通用的代码，那代码质量就比较重要，因为一旦出现问题或者代码改动，影响面就比较大。

相反，如果我们开发的是业务系统或者不需要长期维护的项目，那稍微放低点代码质量的要求，也是没问题的，而且，自己的代码跟其他项目没有太多耦合，即便出了问题，影响也不大。
