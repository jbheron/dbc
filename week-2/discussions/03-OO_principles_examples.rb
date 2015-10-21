





#DON'T BE RUDE TO OBJECTS!

# Given a Person class with a stomach:

class Person 

  def initialize
    @stomach = []     
  end

  def last_meal
    @stomach.last 
  end
end



renee = Person.new
p renee.stomach[-1]


















#
#
#
#
#
#
#
#
#############################################################

# Objects with Sovereignty are naturally decoupled!


class Person 


  def initialize
    stomach = []     
  end

  def last_meal
    stomach.last[:lunch]
    stomach.last 
  end

end

renee.last_meal


{lunch: "sushirito"}
# what if the stomach is turned into an object that has its
# own attributes? or if we want to keep track of the name 
# of a meal by using a hash?

#
#
#
#
#
#
#
#
#
#
#
#
#
#############################################################

##WHAT VS HOW - EXPECTATION VS IMPLEMENTATION 


cj = Person.new
cj.stomach << "dessert"
cj.stomach.pop until cj.stomach.empty?  # this is the process of digesting food!

# Instead of telling HOW to add stuff to a stomach and digest it, 
# tell WHAT you want


class Person

  def eat_dessert(dessert)

    @stomach << dessert 
  end
#
#
#
#
#
#
#
#
#
#
#
#
#
#############################################################

class Person 

  ...  # initialize and other methods omitted

  def eat(food)
    @stomach << food 
  end
   
  def digest
    @stomach.pop until @stomach.empty?  # digesting!
 end 

end



cj.eat   
cj.digest

















# or simply



class Person 

  ...  # initialize and other methods omitted

  def eat(food)
    @stomach << food 
    digest
  end

  private
   
  def digest
    @stomach.pop until @stomach.empty?  # digesting!
  end 

end

cj.eat("food") # the #digest method could be called by the #eat method

#
#
#
#
#
#
#
#
#
#
#
#
#
#############################################################


#Another Example, how to refactor according to what vs how?:

my_car = Car.new
my_car.drive    #drive goes at a randomly changing speed
until my_car.below_limit?(65)
  my_car.brake
end



class Car

  def initialize
    @speed = 0 
    @acc = 0 
  end

  def brake
    @speed -= 5
  end

  def below_limit?(limit)
    @speed < limit
  end
    
end




































class Car 
  ...

  def under_speed_limit?
    until @speed < 65
      decelerate
    end
  end

private 
  def decelerate
    @speed -= 5 
  end
end


# my_car.follow_speed_limit(top_speed)

my_car = Car.new
my_car.drive
until my_car.under_speed_limit?
  my_car.decelerate
end

#
#
#
#
#
#
#
#
#
#
#
#
#
#############################################################


MAX_SPEED = 65
DECELERATE_DECREMENT = 5

class Car 
  ...

  def under_speed_limit?(limit = MAX_SPEED)
    @speed < limit
  end

  def reduce_speed(decrement = DECELERATE_DECREMENT)
    @speed -= decrement 
  end
end

my_car = Car.new
my_car.drive
until my_car.under_speed_limit?(35)
  my_car.decelerate
end

# 

#
#
#
#
#
#
#
#
#
#
#############################################################

####Implement Tell Don't Ask 
MAX_SPEED = 65
DECELERATE_DECREMENT = 5

class Car 
  #...

  def drive_safely(limit)
    until speed_is_under_limit?(limit)
      reduce_speed
    end
  end

private

  def speed_is_under_limit?(limit = MAX_SPEED)
    @speed < limit 
  end

  def reduce_speed(decrement = DECELERATE_DECREMENT)
    @speed -= decrement 
  end

end


my_car = Car.new
my_car.drive_safely(65)
my_car.drive_safely(35)




#
#
#
#
#
#
#
#
#
#
#
#
#############################################################


# how is the autonomy of the task object here?

current_task = my_list.tasks[2]
current_task.complete = true
















###############################################################################




class Task 

   # .....

   def complete!
    # update the count of completed items
    @complete = true
   end
end


current_task = my_list.tasks[2]
current_task.complete!












###LAW OF DEMETER

# What if we wanted all the ripe oranges in an orchard?

orchard = Orchard.new
orchard.add_trees(trees)
orchard.trees.each.oranges.select { |orange| orange.yummimess > 7 }



#
#
#
#
#
#
#
#
#
#
#
#
#
#############################################################




orchard.all_ripe_oranges



# LIKE THIS? 

class Orchard
  ...

  def all_ripe_oranges
    @trees.each.oranges.select { |orange| orange.yummy? }
  end

end


#
#
#
#
#
#
#
#
#
#
#
#
#
#############################################################


orchard.all_ripe_oranges


class Orchard
  ...

  def all_ripe_oranges
    @trees.ripe_oranges
  end

end


class Tree
  ...

  def ripe_oranges
    @oranges.select { |orange| orange.yummy? }
  end
end


#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#############################################################


orchard.all_ripe_fruit


class Orchard
  ...

  def all_ripe_fruit
    @trees.ripe_fruit
  end

end


class Tree
  ...

  def ripe_fruit
    @fruit.select { |fruit| fruit.yummy? }
  end
end


# what can be inferred about the OrangeTree class?

class OrangeTree < Tree

end

class Fruit 
  def yummy?
    
  end
end

#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#############################################################
