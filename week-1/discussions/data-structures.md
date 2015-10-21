This document corresponds to 5 separate challenges:

- Part 1 - Nested Arrays:  get to know nested arrays
- Part 2 - Nested Arrays 2:  learn more about arrays and hashes
- Part 3 - Stack and Queue:  meeting two new data structures
- Part 4 - Linked List:  meet one more data structure
- Part 5 - Abstract Data Structures:  into the wild


Check out this [5 minute video](https://class.coursera.org/algo-004/lecture/61) introducing data structures at a high level and why we care about the performance of operations like reading, inserting and deleting elements on those data structures.

[Here are a few data structures](http://bigocheatsheet.com/#data-structures) and their time and space complexities represented using Big-O notation.


**note 1:**
Most of the following text is shamelessly cut and paste from various sections of [this good book](http://w3.cs.jmu.edu/spragunr/CS240/ConciseNotes.pdf) on the subject to give you a quick overview.  Less than 5% of this is original writing, the rest is in the book.  Some simplifications were made for clarity.

**note 2:**
Some of the terms used in the following paragraphs might be different when you read or talk about them elsewhere.  Knowing the "right" name isn't as important as knowing the "preferred" name.  Since it's natural for the names of ideas and things to change over time, across space and among different groups of people, if you ever find yourself in an argument about naming, just surrender to their opinion until you feel strongly enough about your own to enjoy having the argument in the first place.


## Understanding Data

There are three ideas that must come together to help you make sense of the rest of this page.  This list of three ideas is a good thing to invest a few minutes reading and re-reading until it's clear.

- Abstract Data Types (ADTs)
  - simply: an idea about sets of things and the rules for manipulating them.
  - example: Boolean, the set of {true, false} and operations like negation, conditional, is equal to
  - example: Integer, the set of {..., -2, -1, 0, 1, 2, ...} and operations like +, -, * and /

- Data Type
  - simply: a real implementation of an ADT for single values.
  - examples: Boolean, Integer, Fixnum, Symbol classes in Ruby
  - examples: bool in C++, boolean in Java

- Data Structure
  - simply: a real implementation of an ADT for collections of many, often related values.
  - examples: array, stack, queue, list


*note that "set of things" is really called a "carrier set" in the literature, but whatever.*


### Simple and Structured Types

Virtually all programming languages have implementations of several ADTs built into them, thus providing the set of "types" provided by the language.  We can distinguish two sorts of built-in types:

> **Simple types:** The values of the set of things in an ADT are atomic, that is, they cannot be divided into parts. Common examples of simple types are integers, Booleans, floating point numbers, enumerations, and characters. Some languages also provide strings as built-in types.

> **Structured types:** The values of the set of things in an ADT are not atomic, consisting instead of several atomic values arranged in some way. Common examples of structured types are arrays, records, classes, and sets. Some languages treat strings as structured types.

Note that both simple and structured types are implementations of ADTs, it is simply a question of how the programming language treats the set of things in the ADT in its implementation.

Ruby has many *simple types*, including numeric classes such as Integer, Fixnum, Bignum, Float, BigDecimal, Rational, and Complex, textual classes such as String, Symbol, and Regexp, and many more.

Ruby has a several *structured types*, including arrays, hashes, sets, classes, streams, and ranges.


### Arrays

A structured type of fundamental importance in almost every procedural programming language is the array.

> Array: A fixed length, ordered collection of values of the same type stored in contiguous memory locations; the collection may be ordered in several dimensions.


![array](http://cl.ly/image/320l2G0P0r2M/img575.gif)


The values stored in an array are called elements. Elements are accessed by indexing into the array: an integer value is used to indicate the ordinal value of the element. For example, if a is an array with 20 elements, then a[6] is the element of a with ordinal value 6. Indexing may start at any number, but generally it starts at 0. In the example above a[6] is the seventh value in a when indexing start at 0.

Arrays are important because they allow many values to be stored in a single data structure while providing very fast access to each value. This is made possible by the fact that (a) all values in an array are the same type, and hence require the same amount of memory to store, and that (b) elements are stored in contiguous memory locations. Accessing element a[i] requires finding the location where the element is stored. This is done by computing b + (i × m) where m is the size of an array element, and b is the base location of the array a. This computation is obviously very fast. Furthermore, access to all the elements of the array can be done by starting a counter at b and incrementing it by m, thus yielding the location of each element in turn, which is also very fast.

#### Related

**map** — an unordered collection whose elements (called values) are accessible using a key; also called a table, dictionary, or associative array.

**dictionary** — an unordered collection that allows insertion, deletion, and test of membership.

**static array** — an array whose size is established at program design time and cannot change during execution

**string** - a finite sequence of characters drawn from some alphabet.

**set** — an unordered collection in which an element may appear at most once.

**vector** — a finite ordered collection of values of the same type.

**record** — a finite collection of named values of arbitrary type called fields or members; a record is also called a struct


### Stacks

Stacks have many physical metaphors: shirts in a drawer, plates in a plate holder, box-cars in a dead-end siding, and so forth.  The essential features of a stack are that it is ordered and that access to it is restricted to one end.

> Stack: A dispenser holding a sequence of elements that can be accessed, inserted, or removed at only one end, called the top.

![stack](http://cl.ly/image/1C1c243R3J1Z/Stack.png)

Stacks are also called last-in-first-out (LIFO) lists.  Stacks are important in computing because of their applications in recursive processing, such as language parsing, expression evaluation, runtime function call management, and so forth.


### Queues

Queues are what we usually refer to as lines, as in "please get in line for a free lunch."  The essential features of a queue are that it is ordered and that access to it is restricted to its ends: things can enter a queue only at the rear and leave the queue only at the front.

> Queue: A dispenser holding a sequence of elements that allows insertions only at one end, called the back or rear, and deletions and access to elements at the other end, called the front.

![queue](http://cl.ly/image/2d2v1M0Y2B3v/Queue.png)

Queues are also called first-in-first-out, or FIFO, lists.  Queues are important in computing because of the many cases where resources provide service on a first-come-first-served basis, such as jobs sent to a printer, or processes waiting for the CPU in a operating system.

#### Related

**priority queue** — a queue whose elements each have a non-negative integer priority used to order the elements of the priority queue such that the highest priority elements are at the front and the lowest priority elements are at the back.

**dequeue** — a dispenser whose elements can be accessed, inserted, or removed only at its ends.


### Lists

Lists are simple linearly ordered collections.  Some things we refer to in everyday life as lists, such as shopping lists or laundry lists, are really sets because their order doesn’t matter.  Order matters in lists.  A to-do list really is a list if the tasks to be done are in the order in which they are supposed to be completed (or some other order).

> List: An ordered collection.

![list](http://cl.ly/image/3i0t190r092d/ListPushPop.png)

Because order matters in lists, we must specify a location, or index, of elements when we modify the list.  Indices can start at any number, but we will follow convention and give the first element of a list index 0, the second index 1, and so forth.


#### Related

**node** — an aggregate variable composed of data and link or pointer fields.

**linked data structure** — a collection of nodes formed into a whole through its constituent node link fields.

**singly linked list** — a linked data structure whose nodes each have a single link field used to form the nodes into a sequence. Each node link but the last contains a pointer to the next node in the list; the link filed of the last node contains null.

**doubly linked list** — a linked structure whose nodes each have two pointer fields used to form the nodes into a sequence. Each node but the first has a predecessor link field containing a pointer to the previous node in the list, and each node but the last has a successor link containing a pointer to the next node in the list.


