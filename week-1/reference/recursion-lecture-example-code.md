

## Examples of Recursion

### Unravelling the Zen of Recursion
Yoda:
http://marcykennedy.com/warp10/wp-content/uploads/2013/01/Yoda.jpg

Yoda had deep thoughts about recursion:
"To understand recursion, you must first understand recursion."
OR, in Yoda speak:
"To understand recursion, understand recursion you must first."

###DIFFERENT CASES OF RECURSION

```ruby
def recurse_me_simple(times)
  if times == 0  
    puts "we hit the base case! times = 0!"
  else
    puts "before calling recurse_me_simple.  times=#{times}"
    recurse_me_simple(times-1)
  end
end

recurse_me_simple(10)
```

####LESSON 
All recursive programs must have a base case and a way that the base case is actually reached.

What happens when the base case is non-existant, or is never 
reached?  (show it in the terminal).  

"Stack level too deep."  This is a Stack Overflow.  Look familiar?  StackOverflow.com!


-------------------------------------------------- 


What does the following method do?

```ruby
def mystery(a, b) 
  if b == 1
    return a  
  else 
    return a + mystery(a, b-1); 
  end
end

puts mystery(10, 3)
```


####LESSON
The above example uses the interpreter's stack to make 
the calculation.  How can this be visualized?

What does the following method do?

```ruby
def recurse_me(times) 
  if times == 0  
    puts "we hit the base case! times = 0!"
  else
    puts "before calling recurse_me.  times=#{times}"
    recurse_me(times-1)
    puts "after calling recurse_me.  times=#{times}"
  end
end

recurse_me(10)
```

####LESSON 
Strange things happen when you have logic 
appearing after a recursive call.  This also uses the 
stack, and is another implementation of recursion.

