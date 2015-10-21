# Developing an Intuition for Regex

## Overview

Here's everything you need to know about regular expressions in one pithy quote:

> Some people, when confronted with a problem, think “I know, I’ll use regular expressions.” Now they have two problems.
> - Jamie Zawinski

The goal of this investigation is to expose you to regular expressions from many sides.

Here's the funny side, a [diversion](http://xkcd.com/208/)

By the end you should have an intuitive sense of what regular expressions are, when (and when not) to use them and how to read and write them like a pro.

*Give yourself at least 1 hour for this work and be patient with yourself.  You can spend a whole day or more here if you want to but the fact is regular expressions are most often used for specialized cases so don't over do it.  When you really need to dig in, all this content, these tools, these ideas ... they're publicly available for you to come back to.*

Move around the content like an explorer. You do NOT need to work in order from top to bottom.  You *could* work from most interesting to least interesting, or, if you can swing it, try to work in whatever order you find that keeps you most focused and engaged on the learning, creating and resolving feelings of confusion, switching up as needed to keep yourself fresh and alert, wondering, at the edge of your seat, what's around the next corner -- with some bathroom breaks in between, of course.

Ok, enough chatter, here's the goods.

## Learning Competencies

- read and write regular expressions fluently
- recognize common regex patterns
- estimate regex complexity intuitively
- gain exposure to various tools and techniques for learning
- develop an intuitive understanding for a new topic through deep and varied exposure
- learn to recognize "good" learning resources from "bad" through massive, directed exposure
- gain an appreciation for multiple representations of a single concept
- develop a deeper self-awareness for maintaining your high performance learning edge
- become aware of various thought leaders and forums where thought leaders congregate

## Activities

- Step 1: scan this entire list
- Step 2: pick somewhere to start
- Step 3: you win!


### Read a few (!) books

Read [this chapter](http://regex.learncodethehardway.org/book/introduction.html) of a book you'll revisit in another activity.  This is a quick intro to regex.

Read [this chapter](http://eloquentjavascript.net/2nd_edition/preview/09_regexp.html) of a [great book](http://eloquentjavascript.net) that you WILL NOT be distracted by until you are asked to focus on Javascript because you know what's good for you.

Now, this will be a bit tricky because you should *ignore* the syntax that isn't related to regex.  how do you recognize a regex?  most systems use the forward slash (/) to start and end a regex.  here's one: /./  amazing huh?  it matches a single character.  any printable character actually.

Ok, now go read.  and look for those slashes!   pay attention to what's inside them.

### Watch a video

Did you read the last chapter?  If you didn't then make sure you don't forget to go back to at some point.  It's worth it!

Ok, here's a [video](http://www.youtube.com/watch?v=EkluES9Rvak) from [Fluent 2012](http://fluentconf.com/fluent2014) by [Lea Verou](http://lea.verou.me/about/).  She has a charming Greek accent which I'm sure you'll find distracting at first but -- check this out -- you'll probably start thinking about regex in a Greek accent!  Won't that be fun?!

Oh, there were 3 links in the previous paragraph -- go take a peek at the Fluent conference, you might want to attend this year or next.  And have a glance at Lea's web page.  What kind of work does she do?  What makes her qualified to give this talk?

Getting to know the people in **your** new community (yes! pinch yourself) is an important part of becoming a software developer.

### Identify the best tools

Check these out:

- http://rubular.com
- http://www.regexper.com


### Focus on the concept, not the syntax

Something that often happens with learning a new representation is we get all hung up on the details of the dits and dots and forget to practice a new way of thinking.

What you should be thinking about regex now, if your brain isn't fried, is this:

- there's no flow in regex, no movement of code.  they're basically a pattern (like an [apple corer](http://www.webstaurantstore.com/clean-cut-apple-corer/32711508.html?utm_source=Shopzilla&utm_medium=cse&utm_campaign=Shopzilla+Campaign)) that gets pressed up against some text (like an [apple](http://www.cricketbread.com/images/apple_cored.jpg)) and out comes the matches!

- with only a few bits of syntax i can do a lot -- i should probably keep it simple.  complex regex are hard to read, no?  imagine how hard that would be to debug.  consider this bit of wisdom:

> “Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.”
> - Brian Kernighan

If you liked that, go read [a few of these](http://www.hackification.com/2008/12/23/a-double-handful-of-programming-quotes/) and make sure to lookup all the accredited folks too, this is your new community after all.

- regex seems to require a parser of some kind, like an engine that knows how to interpret the syntax.  nice catch!  here's the [regex engine: Onigurama](http://www.geocities.jp/kosako3/oniguruma/) behind Ruby's regex implementation that I first read about [here](http://patshaughnessy.net/2012/4/3/exploring-rubys-regular-expression-algorithm).  Apparently Ruby 2.0 is using a fork of Onigurama called [Onigmo](https://github.com/k-takata/Onigmo).  Go figure.


### Get massive amounts of exposure

Read the following articles

- http://www.codinghorror.com/blog/2008/06/regular-expressions-now-you-have-two-problems.html
- http://net.tutsplus.com/tutorials/other/8-regular-expressions-you-should-know/

Read a book!  Yes, another.  Well, same one as above, but now there's more.

Well, you don't actually have to "read" it cover to cover, just scan the entire thing -- yes, all the content from end to end -- and, when you find something unfamiliar, stop and look closer.  If this is the first activity you do, you'll end up spending a lot of time on this book.  That may be a good thing or a bad thing, but I prefer to go for a couple quick hits like the links above or a video to get my bearings before I start scanning books.  Anyway, read the headers, look for new stuff, stop and read what catches your interest.  Keep up the pace!  Your goal is to expose yourself to a massive volume of content and, in this case, examples of regular expressions.

- http://regex.learncodethehardway.org/book/


### Play a game

Grab a pair (or two) and play this game against each other.  You can make up the rules but you've basically got all the ingredients you need for some serious competition -- points!

- http://regex.alf.nu/

Here's another one if you're feeling frisky

- http://regexcrossword.com/

### Stretch yourself into a painful new pose

Have you heard of Peter Norvig?

Check out this high brow geekery: http://nbviewer.ipython.org/url/norvig.com/ipython/xkcd1313.ipynb


### Consider a new representation

Have you heard of [Regexper](http://www.regexper.com/)? It's pretty sweet AND (bonus!) it's [written in Ruby](https://github.com/javallone/regexper)

Here's what it does: you give it a regex and it generates a bunch of SVG elements that make a [railroad diagram](http://en.wikipedia.org/wiki/Syntax_diagram) to help you interpret the regex.

Check it out: (these regex's are all taken from the Nettuts tutorial above)

---

**match a username:** `/^[a-z0-9_-]{3,16}$/`

![image of regex](http://f.cl.ly/items/2G290h0l0Y1i3j3k3U2r/Screen%20shot%202014-01-14%20at%2010.00.26%20PM.png "match a username")

---

**match a password:** `/^[a-z0-9_-]{6,18}$/`

![image of regex](http://f.cl.ly/items/0z031E1W0S3d132o3r35/Screen%20shot%202014-01-14%20at%2010.01.42%20PM.png "match a password")

---

**match a hex value:** `/^#?([a-f0-9]{6}|[a-f0-9]{3})$/`

![image of regex](http://f.cl.ly/items/043N3G2Z0c14160v1S3C/Screen%20shot%202014-01-14%20at%2010.02.07%20PM.png "match a hex value")

---

**match a slug:** `/^[a-z0-9-]+$/`

![image of regex](http://f.cl.ly/items/161g393v2u3D261Q1x0t/Screen%20shot%202014-01-14%20at%2010.02.28%20PM.png "match a slug")

---

**match an email:** `/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/`

![image of regex](http://f.cl.ly/items/2K2Q3N011R402w2p3o1z/Screen%20shot%202014-01-14%20at%2010.02.49%20PM.png "match an email")

---

**match a url:** `/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/`

![image of regex](http://f.cl.ly/items/411G1m3Q3r3R3M2X2m1V/Screen%20shot%202014-01-14%20at%2010.03.17%20PM.png "match a url")

---

**match an ip address:** `/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/`

![image of regex](http://f.cl.ly/items/411w1M2k2Y2e2P2v1a3p/Screen%20shot%202014-01-14%20at%2010.03.58%20PM.png "match an ip address")

---

**match an html tag:** `/^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$/`

![image of regex](http://f.cl.ly/items/3Q0B3L2E1Y192P2E443A/Screen%20shot%202014-01-14%20at%2010.04.30%20PM.png "match an html tag")


