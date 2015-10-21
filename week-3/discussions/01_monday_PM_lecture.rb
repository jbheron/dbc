# agenda

# -----------------------------------------------------
# 15 - closures (blocks, procs, lambdas)
# -----------------------------------------------------

# def x
#   yield
# end

# x do
#   puts "hi"
# end

# ---

# def x(&block)
#   block.call
# end

# x do
#   puts "hi"
# end

# ---

# we're going to model a random song based on a name generator using ruby
# we'll define each "random name" strategy as a closure
# choose the strategy somehow

# reminder:
#
# lambda   {|x,y| puts "i received #{x} and #{y}"}
# ->(x,y)  {      puts "i received #{x} and #{y}"}
# # ---
# proc     {|x,y| puts "i received #{x} and #{y}"}
# Proc.new {|x,y| puts "i received #{x} and #{y}"}

module LyricGenerator

  extend self

  def random(name)

    strategies = {
      fred_astair:    ->(a) {"shup bop ba doo bop, #{a}"},
      barney:         ->(b) {"#{b} b#{b.downcase} fo f#{b.downcase}"},
      happy_birthday: ->(c) {"happy birthday dear #{c}, happy birthday to you!"}
    }

    File.readlines('strategies.txt').map(&:chomp).map{ |row| row.split(',')}.each do |name, code|
      strategies[name.to_sym] = ->(name) { eval(code) }
    end

    get_strategy(strategies).call(name)
    # strategies.sort.first.last.call(name)

    # case [1,2,3].sample
    #   when 1 then barney(name)
    #   when 2 then fred_astair(name)
    #   when 3 then happy_birthday(name)
    # end
  end

  def get_strategy(strategies, name = nil)
    return strategies[name.to_sym] if name
    strategies.values.sample
  end

  # def barney(name)
  #   "#{name} b#{name.downcase} fo f#{name.downcase}"
  # end

  # def fred_astair(name)
  #   "shup bop ba doo bop, #{name}"
  # end

  # def happy_birthday(name)
  #   "happy birthday dear #{name}, happy birthday to you!"
  # end

end


name = 'Anna'

# p LyricGenerator.barney(name) # => 'anna banna fo fanna'
# p LyricGenerator.fred_astair(name) # => 'shup bop ba doo bop, anna'
# p LyricGenerator.happy_birthday(name) # => 'happy birthday dear anna, happy birthday to you!'

p LyricGenerator.random(name)


# -----------------------------------------------------
# 13 - composition vs inheritance in OOP
# -----------------------------------------------------

class List
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << Task.new(task)
  end
end

class Task; end

# ---

class List
  def initialize(type)
    @type = type
    @items = []
  end

  def add(item)
    @items << @type.new(item)
  end

  def mixed_list?
    @items.map(&:class).uniq.length > 1
  end

end

class Task
  attr_reader :text
  def initialize(text)
    @text = text
  end
end

class ShoppingTask < Task; end
class ReadingTask < Task; end
class CleaningTask < Task; end

shopping_list = List.new(ShoppingTask)
shopping_list.add('buy milk')
shopping_list.add('buy eggs')
p shopping_list

reading_list = List.new(ReadingTask)
reading_list.add('chapter 1 of POODR')
p reading_list
# ---

class List
  def initialize
    @items = []
  end

  def add(item)
    raise NotImplementedError
  end
end

class ShoppingList < List
  def add(item)
    @items << Task.new(item)
  end
end
class ReadingList < List
  def add(item)
    @items << Task.new(item)
  end
end
class CleaningList < List
  def add(item)
    @items << Task.new(item)
  end
end

shopping_list = ShoppingList.new

# -----------------------------------------------------
# 11 - what is the Struct class in Ruby and how is it useful?
# -----------------------------------------------------

task_attrs = %i[text time priority owner completed]

MyTask = Struct.new(*task_attrs)
t = MyTask.new('buy some milk', nil, 1)
p t
