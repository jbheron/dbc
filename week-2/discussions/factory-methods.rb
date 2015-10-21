require 'csv'

class List

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def self.from_file(thing, filename)
    unless thing.respond_to? :from_string
      raise ArgumentError, "[#{thing}] must respond to 'from_string'"
    end

    list = self.new

    CSV.foreach(filename, 'r') do |line|

      list.add thing.from_string(line.first)
    end
    list
  end

  def to_s
    @items.map(&:to_s).join("\n")
  end
end


class Item
  def initialize(args = {})
    @text = args[:item]
    @complete = args[:flag]
  end

  def self.from_string(string)
    # assuming string looks like this:
    # => 'complete, go get some milk or something'
    item, flag = string.split(',')
    self.new(item: item, flag: flag)
  end

  def to_s
    "#{@complete} - #{@text}"
  end
end

# quick test ...
# item = Item.from_string('complete, go get some milk or something')
# p item

# and shoot the moon ...
list = List.from_file(Item, "todo.csv")
puts list

########################################
# alternatively, we could trash the Factory Methods and just do this
# but what have we lost in the process?

# filename = ("todo.csv")

# list = List.new

# CSV.foreach(filename, 'r') do |line|
#   item, flag = line.first.to_s.split(',')
#   list.add Item.new(item: item, flag: flag)
# end

# puts list

