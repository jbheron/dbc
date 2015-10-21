def make_it_quack(duck_like_thing)
  raise "wtf?!" unless duck_like_thing.respond_to? 'quack'
  puts duck_like_thing.quack
end

class A
  def quack
    puts "quaaaack!"
  end
end

class Array
  def quack
    puts "wa?"
  end
end

class Fixnum
  # def quack
  #   puts "yo, stop that!"
  # end
end

make_it_quack(A.new)
make_it_quack([1,2,3])
make_it_quack(3)

__END__

module A
  extend self

  def x
    puts "hi, i'm method x!"
  end

  def y
    puts "hi, i'm method y!"
  end
end

A.x
A.y

__END__


class B
  include A
end

class C
  extend A
end

# ----

# C.x


# bee = B.new
# bee.x
# bee.y





# # ordering a sandwich

# # i, the Customer, walked into the Store one day and a SandwichArtist asked me what I wanted
# # on my Sandwich.  I told him what kind of Item(s) i wanted on my Sandwhich
# # and he told me how much it cost.  then i paid for it.

# class Person
#   attr_reader :name

#   def initialize(args = {})
#     @name = args.fetch(:name, 'NO NAME')

#     @name = defaults.merge(args)[:name]

#     @nice = true || 'NO NAME'
#   end

#   def defaults
#     {name: 'NO NAME', ssn: '123-12-1234'}
#   end

#   def speak
#     puts "hello"
#   end
# end

# class Customer < Person

# end

# class SandwichArtist < Person
#   def greet(customer)
#     puts "hello, #{customer.name}"
#   end
# end

# class Sandwich
# end

# class Item
#   def initialize(args = {})
#     @name = args[:name]
#   end
# end

# class Store

#   class << self

#     def open!
#       @sa = SandwichArtist.new(name: 'Mary')
#       @status = :open
#     end

#     def close!
#       @status = :closed
#     end

#     def door_chime!
#       puts "ding!"
#     end

#     def detect_customer(customer)
#       @sa.greet(customer)
#     end

#   end

# end

# # ---

# Store.open!

# Store.door_chime!

# Store.detect_customer(Customer.new(name: "billy jean"))


