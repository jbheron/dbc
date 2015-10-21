While you're working on your first few object oriented challenges, don't forget about the [style guide](https://github.com/airbnb/ruby#classes)!  There's some goodies in there that you'll recognize now that you've spent some more time with Ruby.

---

[Zed Shaw says](http://ruby.learncodethehardway.org/book/ex44.html) ...

**When To Use Inheritance Or Composition**

The question of "inheritance vs. composition" comes down to an attempt to solve the problem of reusable code. You don't want to have duplicated code all over your code, since that's not clean and efficient. Inheritance solves this problem by creating a mechanism for you to have implied features in base classes. Composition solves this by giving you modules and the ability to simply call functions in other classes.

If both solutions solve the problem of reuse, then which one is appropriate in which situations? The answer is incredibly subjective, but I'll give you my three guidelines for when to do which:

- Avoid meta-programming at all costs, as it's too complex to be useful reliably. If you're stuck with it, then be prepared to spend time finding where everything is coming from.
- Use composition to package up code into modules that is used in many different unrelated places and situations.
- Use inheritance only when there are clearly related reusable pieces of code that fit under a single common concept, or if you have to because of something you're using.

However, do not be a slave to these rules. The thing to remember about object oriented programming is that it is entirely a social convention programmers have created to package and share code. Because it's a social convention, but one that's codified in Ruby, you may be forced to avoid these rules because of the people you work with. In that case, find out how they use things and then just adapt to the situation.


---

Finally, get yourself acquainted with [approaches to refactoring code](http://sourcemaking.com/refactoring) and the names developers use to talk about the decisions they make when refactoring.

> **Refactoring (noun)**: a change made to the internal structure of software to make it easier to understand and cheaper to modify without changing its observable behavior.
>
> **Refactor (verb)**: to restructure software by applying a series of refactorings without changing its observable behavior.

For a quick tour of the site, read the pages about [Defining Refactoring](http://sourcemaking.com/refactoring/defining-refactoring), [Why Should You Refactor?](http://sourcemaking.com/refactoring/why-should-you-refactor) and [When Should You Refactor?](http://sourcemaking.com/refactoring/when-should-you-refactor)

Although the whole site is full of golden nuggets, here's a quick tour of the refactoring strategies:

- Composing Methods: [extract method](http://sourcemaking.com/refactoring/extract-method)
- Moving Features Between Objects: [move method](http://sourcemaking.com/refactoring/move-method)
- Organizing Data: [Replace Magic Number with Constant](http://sourcemaking.com/refactoring/replace-magic-number-with-symbolic-constant)
- Simplifying Conditional Expressions: [Replace Nested Conditional with Guard Clauses](http://sourcemaking.com/refactoring/replace-nested-conditional-with-guard-clauses)
- Making Method Calls Simpler: [Replace Constructor with Factory Method](http://sourcemaking.com/refactoring/replace-constructor-with-factory-method)
- Dealing with Generalization: [Pull Up Field](http://sourcemaking.com/refactoring/pull-up-field), [Pull Up Method](http://sourcemaking.com/refactoring/pull-up-method), [Push Down Field](http://sourcemaking.com/refactoring/push-down-field), [Push Down Method](http://sourcemaking.com/refactoring/push-down-method)
- Big Refactorings: [Separate Domain from Presentation](http://sourcemaking.com/refactoring/separate-domain-from-presentation)

Time well spent, for sure.