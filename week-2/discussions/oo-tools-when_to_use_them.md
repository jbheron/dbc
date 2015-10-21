##Modules, Inheritance, Composition, Class Methods, and more
###When to use the right tools?


####Situation 1
We have a few Fish classes (see code below).  They seem to have a lot of repetitive code.

1) How can we optimize this code?  (look at the structure of the code use: command-k,command-2)  
2) Inheritance? Why?  
3) What if I deleted these attributes and methods?  (the unique ones?)  
4) What if I deleted the common attributes?  
5) If going to do inheritance, can we just go ahead and refactor?
   - ONLY IF THERE'S TEST CODE!  

####Refactor
- are there enough tests?
  - add an age attribute to goldy?
- be deliberate.  one step at a time.
  - add the methods to the super class first - does that work?
  - add the attributes next, what happens?  (the hash is great!)
- create the parent class, and test ONE subclass
- working? go ahead and refactor the others
- how is super working?  (what if there were separate args?  would this change things?)


WHAT RELATIONSHIP IS INHERITANCE?  "IS A" relationship

####PATTERNS AND ANTIPATTERNS
(which are correct?)
```ruby
class Orange < Tree ; end  		# does this make sense?
class Oven < Baker ; end   		# 
class SuperHero < Humanoid ; end   # 

-----------------

class Fruit
  attr_reader :diameter
  def initialize(diameter)
    @diameter = diameter
  end
end

class Orange < Fruit
end

class Apple < Fruit
end
```

####Situation 2
Now let's model an aquarium.  It's holding the fish.  So the aquarium and the fish are interacting.  How can we model this relationship?

- Add fish to the aquarium
- Watch fish in the aquarium
- Remove dead fish

We realize that an aquarium HAS fish.  It is composed of fish.  The methods on the fish can help us decipher this.

####PATTERNS AND ANTIPATTERNS
(which are correct?)
```ruby
class Orange
  def initialize(tree = Tree.new)
    @tree = tree 
  end
end

class Doctor
  def initialize(args)
    @hospital_employee = args[:hospital_employee] || Employee.new
  end
end

class DishWasher
  def initialize(args)
    @dishes = args.fetch(:dishes, [])
  end
end
```

###SUMMARY
"HAS A" relationship - composition (this emerges from analyzing the relationships)  
"IS A" relationship - inheritance  (this emerges from repetitive attributes and methods)  
"DOES THE SAME THINGS LIKE" - module (this emerges from repetitive methods)  


```ruby

class Goldfish 
  attr_reader :age,:stomach,:shininess

  def initialize(args)
    @stomach = args.fetch(:stomach, [])
    @age = args.fetch(:age, 0)
    @shininess = args[:shininess]  # scale of 1-5 
  end

  def breathe
    p "i get oxygen from the water!"
  end

  def swim
    p "<~~~~~~~~~~~~~~~~~~~~~>"
  end

  def eat(fish_food)
    @stomach << fish_food
  end
  
end

class Oscar
  attr_reader :age,:stomach,:aggressiveness

  def initialize(args)
    @stomach = args.fetch(:stomach, [])
    @age = args.fetch(:age, 0)
    @aggressiveness = args[:aggressiveness] 
  end

  def swim
    p "<~~~~~~~~~~~~~~~~~~~~~>"
  end

  def breathe
    p "i get oxygen from the water!"
  end

  def swallow(other_fish)
    @stomach << other_fish 
  end

end

class Suckerfish
  attr_reader :age,:stomach,:sq_inch_per_hour
  
  def initialize(args)
    @stomach = args.fetch(:stomach, [])
    @age = args.fetch(:age, 0)
    @sq_inch_per_hour = args[:sq_inch_per_hour] 
  end

  def swim
    p "<~~~~~~~~~~~~~~~~~~~~~>"
  end

  def breathe
    p "i get oxygen from the water!"
  end
  
  def suck(algae)
    @stomach << algae 
  end

end
 

# test suite
goldy = Goldfish.new({shininess: 5})
puts goldy.swim  == "<~~~~~~~~~~~~~~~~~~~~~>"
goldy.eat("goldfish food")
puts goldy.stomach == ["goldfish food"]

suckerz = Suckerfish.new({sq_inch_per_hour: 10})
puts suckerz.breathe == "i get oxygen from the water!"

oscarama = Oscar.new({aggressiveness: 10})
oscarama.swallow(goldy)
oscarama.swallow("another fish")
puts oscarama.stomach  == [goldy, "another fish"]
```
