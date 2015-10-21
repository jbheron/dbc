###ANTIPATTERN PUZZLES 

Why are the following not returning the expected result?

Input: [1,2,3,4,5,6,7,8,9]  
Expected Output: [12,14,16,18] 

```ruby
new_array = [1,2,3,4,5,6,7,8,9].each { |element| puts element + 10 if element % 2 == 0}
p new_array

new_array = [1,2,3,4,5,6,7,8,9].map { |element| puts element + 10 if element % 2 == 0}
p new_array

new_array = [1,2,3,4,5,6,7,8,9].select { |element| element = element + 10 if element % 2 == 0}
p new_array
```
