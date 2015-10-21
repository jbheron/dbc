This document corresponds to 5 separate challenges

- Part 1: Dictionary Sort: learn a little bit about sorting
- Part 2: Linear Search: implement the simplest of all searches, front to back
- Part 3: Binary Search: implement the fastest of all searches, divide and conquer
- Part 4: Binary vs Linear Search: compare and reason about these algorithms
- Part 5: Sort Yourself: implement a sorting algorithm of your choosing

Check out [this 4 minute video](https://class.coursera.org/algo-004/lecture/20) to help contextualize the study of algorithms in general.

And this [plain English explanation of Big O notation](http://stackoverflow.com/a/487278/2836874).

If you're getting excited, [this 15 minute video](https://class.coursera.org/algo-004/lecture/4) digs a little more into why we talk about things like measuring algorithm performance "in the worst case" using Big-O analysis.  You can safely ignore the mathy bits in this video and still get a lot out of it.

> There are also several links to books, videos, slides and other learning materials in the **Reading** section of the phase 1 guide.  Check those out too if you want to keep digging deeper.


Algorithms perform differently depending on several factors.

It's fairly useless (because it's so confusing) to consider things like the developer who wrote the algorithm, the programming language it's written in, the machine it's run on, the year it was run (and technical limitations of the time), etc.

Instead of thinking about all that noise, analysis of algorithms makes a few simplifying assumptions and talks about best case, average case and worst case scenarios.  For reasons you can discover in a deeper study of algorithmic analysis, it's generally simpler and easier to only focus on the worst case scenarios.  Basically the math gets easier while the results of the analyis remain valuable when comparing different algorithms running under various conditions.

![best-average-worst](http://cl.ly/image/2o0N2f151e3H/Screen%20Shot%202014-01-28%20at%202.11.34%20PM.png "problem size vs number of steps")

To talk about new ideas, it helps to name them.  Worst-case scenarios are documented and discussed using something called "Big-O" notation, best-case with "Big-Omega" notation, and a performance envelope with "Big-Theta notation.  In this case think of "performance envelope" as "will always perform in between these two best and worst case limits", basically a combination of Big-O and Big-Omega.

- Big-O: my algorithm f(n) will, in the worst possible case, always be *better* than this.
- Big-Omega: my algorithm f(n) will, in the best possible case, always be *worse* than that.
- Big-Theta: my algorithm f(n) will, in all possible cases, always fall *between* this and that.

![bigO-bigOmega-bigTheta](http://cl.ly/image/2l2J2A1G2w11/Screen%20Shot%202014-01-28%20at%202.13.01%20PM.png "comparing upper bounds, lower bounds and a performance envelope")

It's also important to note that, when you talk about performance of an algorithm, there are 2 dimensions to consider: **time** and **space**.  An algorithm that performs quickly might consume a lot of memory or disk space, for example.  You can make trade-offs between these two to get the behavior you're looking for at the cost you can afford.  [This list](http://bigocheatsheet.com) includes both time and space complexities for running various algorithms and accessing data structures.

For a real world example of where knowing how to read and understand Big-O notation comes in handy, consider the [redis documentation](http://redis.io/commands) where each operation has a note about it's time complexity.  Redis is a database that stores your data using any of the data structures they've implemented on their platform like strings, hashes, [lists](http://redis.io/commands#list), [sets](http://redis.io/commands#set) and sorted sets.  Clicking on any of the commands in the lists or sets documentation will reveal the note about the time complexity (cost in terms of time) of the command.

To develop a basic awareness of how to reason about and make use of Big-O notation, the following chart and graph show how some of the more common growth rates perform with different input sizes.  Take a close look at the column headers in then table and the line labels in the chart.  Those are the functions that will *eventually* (for all inputs bigger than n) describe the behavior of, say, some algorithm you're investigating.

![growth rates table](http://cl.ly/image/2R192d1W3S1E/Screen%20Shot%202014-01-28%20at%202.15.00%20PM.png "common growth rates to recognize")

![growth rates chart](http://cl.ly/image/1o38443T1901/Screen%20Shot%202014-01-28%20at%202.44.02%20PM.png "common growth rates visualized")

