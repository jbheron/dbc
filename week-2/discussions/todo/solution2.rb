# -------------------------------------------------------------------
# feature-level design
# -------------------------------------------------------------------

# classes:
# - Item: each item has it's own class
# - List: collection of items
# - File: file operations

# driver code to handle user interactions

# -------------------------------------------------------------------
# object-level design
# -------------------------------------------------------------------

# class Item
#   def self.from_string(string); end
#   def complete?; end
#   def complete!; end
# end

# class List
#   def self.from_file(filename); end
#   def show; end
#   def add(item); end
#   def delete(id); end
#   def complete(id); end
# end

# class File
#   def read; end
#   def save; end
#   private
#   def exists?; end
#   def create!; end
# end

# -------------------------------------------------------------------
# implementation
# -------------------------------------------------------------------

# monkey patch String to help us convert words to Boolean values
class String
  def to_b
    !!(self =~ /^(true|t|yes|y|1)$/i)
  end
end

class Item
  attr_reader :text

  def initialize(args = {})
    @text = args[:item]
    @complete = args.fetch(:complete, false)
  end

  # assuming string is in the format: "complete_flag, item_text"
  def self.from_string(string, delim = ',')
    flag, text = string.split(delim, 2).map(&:strip)
    self.new(item: text, complete: flag.to_b)         # this is why we're monkey patching String (above)
  end

  def complete?
    @complete
  end

  def complete!
    @complete = true
  end

  def serialize
    "#{self.complete?},#{self.text}"
  end

  def to_s
    "%-5s - %s" % [self.complete?, self.text]  # Kernel#sprintf
  end

end

class List
  attr_reader :items

  def initialize(args)
    @items = args[:items]
  end

  def self.from_file(file)
    self.from_array(file.read)
  end

  def self.from_array(array)
    self.new(items: array.map{|string| Item.from_string(string) })
  end

  def add(item, flag = false)
    @items << Item.new(item: item, complete: flag)
  end

  def complete(id)
    @items[id.to_i - 1].complete!
  end

  def delete(id)
    raise NotImplementedError, "the [delete] command is not yet implemented"
  end

  def serialize
    @items.map{|item| "#{item.serialize}\n" }.join('')
    # @items.map(&:serialize).join("\n")
  end

  def to_s
    output = ''
    @items.each.with_index do |item, idx|
      output += "[%2s] %s\n" % [idx + 1, item]
    end
    output
  end
  alias_method :show, :to_s

end

class DataFile
  attr_reader :name

  def initialize(filename)
    @name = filename
  end

  def read
    File.readlines(self.name).map(&:chomp)
  end

  def save(list)
    File.open(self.name, 'w') do |file|
      file << list.serialize
    end
  end

end

# -------------------------------------------------------------------

# gather command line input
command, text = $*.shift, $*.join(' ')  # [$*] is a synonym for [ARGV]

# create a new list to work with
file = DataFile.new('todo.csv')
list = List.from_file(file)

case command
  when 'list'
    puts list
  when 'add'
    list.add text
    file.save(list)
    puts list
  when 'delete'
    list.delete(text)
    file.save(list)
    puts list
  when 'complete'
    list.complete(text)
    file.save(list)
    puts list
  else
    puts "command [#{command}] not supported"
    puts "usage:"
    puts "\truby #{__FILE__} list"
    puts "\truby #{__FILE__} add 'new item text'"
    puts "\truby #{__FILE__} complete 1"
    puts "\truby #{__FILE__} delete 1"
end

