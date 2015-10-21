All of the following challenges ask you to do the same thing: design a relational data model in order of increasing difficulty, more or less.

####Intro Databases (Week 2)
- Student roster
- Forum database design
- Family tree database design
- Address book schema

####Intermediate Databases (Week 3)
- Poll database design
- Reddit JR database design
- IMDB database design
- University course database design


## Basic SQL

Designing the database is the easy part!  

For each of the challenges above you should also come up with 3-5 meaningful questions you want to answer about the data and then write the SQL statements to answer thosequestions.

For just one example, in `Part 1: Student roster` you might wonder how to answer the following questions and then take the time to answer them using SQL.

*Note that to actually try the SQL code you write you'll have to take the time to implement the design in some relational database management system (RDBMS) like sqlite (if you want to use a local file), postgresql (if you want to use a local or remote server) or some other technology.*

When reading the following statements, consider that they all fall into the 4 basic operations you would use when manipulating data in a database: CRUD

- create: `INSERT`
- retrieve / read: `SELECT`
- update: `UPDATE`
- delete / destroy: `DELETE`


```sql
--------------------------------------
-- asking questions using INSERT
--------------------------------------

-- can i add a student to the students table?
INSERT INTO students
(first_name, last_name, gender, birthday, email, phone)
VALUES
('jane', 'smith', 'female', '1997-7-20', 'abc@hi.com', '123.321.2323')

-- can i add a student with no email or phone?
INSERT INTO students
(first_name, last_name, gender, birthday)
VALUES
('jane', 'smith', 'female', '1997-7-20')

-- can i change the order of the columns in my insert statement?
INSERT INTO students
(gender, first_name, last_name)
VALUES
('female', 'jane', 'smith')


--------------------------------------
-- asking questions using SELECT
--------------------------------------

-- can i get a list of the women in this table?
SELECT *
FROM students
WHERE gender = 'female'

-- can i get a list of the men ...?
SELECT *
FROM students
WHERE gender = 'male'

-- can i get a list of students born in 1994?
SELECT *
FROM students
WHERE birthday LIKE '1994%'

-- can i get a list of students whose last name starts with the letter 'S'?
SELECT *
FROM students
WHERE last_name LIKE 'S%'

-- can i get a sorted list of students with emails ending in .biz?
SELECT *
FROM students
WHERE email LIKE '%biz'
ORDER BY last_name, first_name


--------------------------------------
-- changing data using UPDATE
--------------------------------------

-- can i change the email address of a student if i know their id?
UPDATE students
SET email = '123@abc.com'
WHERE id = 1

-- can i change the email address of a student without their id?
UPDATE students
SET email = '123@abc.com'
WHERE email = 'agustina_braun@wintheiser.info'

-- can i change the email address of several students at once?
UPDATE students
SET email = '123@abc.com'
WHERE last_name LIKE 'S%'


--------------------------------------
-- deleting data using DELETE
--------------------------------------

-- can i delete a student record if i know their id?
DELETE from students
WHERE id = 1

-- can i delete a student record without their id?
DELETE from students
WHERE email = '123@abc.com'

-- can i delete everything from the table?
DELETE from students
WHERE 1 = 1

```

So, if you enjoyed reading that list of examples, imagine reading a list like that for every one of the challenges in this repo as created by other students.  I know, magic, right?  Take the time to ask meaningful questions of your design and answer them using SQL.

## Making it real

If you get bored of imagining data and want to use a real world database, you'll find simple examples that help you get up and running on a real database of your choice (as long as that choice is postgresql or sqlite).  Some of the examples include Ruby code to connect your own programs to the database as well.

#### SQLite

> http://www.sqlite.org
>
> example: https://gist.github.com/amgando/7b6cd0319aa48ce66ee6

SQLite is a software library that implements a self-contained, serverless, zero-configuration, transactional SQL database engine. SQLite is the most widely deployed SQL database engine in the world. The source code for SQLite is in the public domain.


#### PostgreSQL

> http://www.postgresql.org
>
> example: https://gist.github.com/amgando/610a035cd5a74c7e0eae

PostgreSQL is a powerful, open source object-relational database system. It has more than 15 years of active development and a proven architecture that has earned it a strong reputation for reliability, data integrity, and correctness. It runs on all major operating systems, including Linux, UNIX (AIX, BSD, HP-UX, SGI IRIX, Mac OS X, Solaris, Tru64), and Windows. It is fully ACID compliant, has full support for foreign keys, joins, views, triggers, and stored procedures (in multiple languages). It includes most SQL:2008 data types, including INTEGER, NUMERIC, BOOLEAN, CHAR, VARCHAR, DATE, INTERVAL, and TIMESTAMP. It also supports storage of binary large objects, including pictures, sounds, or video. It has native programming interfaces for C/C++, Java, .Net, Perl, Python, Ruby, Tcl, ODBC, among others, and exceptional documentation.

An enterprise class database, PostgreSQL boasts sophisticated features such as Multi-Version Concurrency Control (MVCC), point in time recovery, tablespaces, asynchronous replication, nested transactions (savepoints), online/hot backups, a sophisticated query planner/optimizer, and write ahead logging for fault tolerance. It supports international character sets, multibyte character encodings, Unicode, and it is locale-aware for sorting, case-sensitivity, and formatting. It is highly scalable both in the sheer quantity of data it can manage and in the number of concurrent users it can accommodate. There are active PostgreSQL systems in production environments that manage in excess of 4 terabytes of data.

PostgreSQL has won praise from its users and industry recognition, including the Linux New Media Award for Best Database System and five time winner of the The Linux Journal Editors' Choice Award for best DBMS.



## Intermediate SQL

Once you've got the basics of CRUD against a single relation (table, entity, etc), connecting relations will be less surprising.  in the image below are the various types of joins.  Inner joins are by far the most common.  The others are important as well, of course, and learning them by association with the Venn diagrams below will help you remember them.

Consider that any two related tables can be represented as A and B in the diagrams below. Whats more, a single table can often be joined to itself to yield interesting results.

Take a look at chapters 4 and 7 in [Beginning Databases with PostgreSQL](https://www.dropbox.com/s/w2jxyygvmre9te3/Beginning%20Databases%20With%20PostgreSQL.pdf) for more on joins as well as aggregate functions like `count()` and `sum()`.

---

![SQL joins](http://f.cl.ly/items/393r1B431Y432i0R2Z3E/sql_joins.jpg)


