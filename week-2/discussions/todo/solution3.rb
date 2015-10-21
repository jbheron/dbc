# -------------------------------------------------------------------
# feature-level design
# -------------------------------------------------------------------

# classes:
# - Item: each item has its own class
# - List: collection of items
# - File: file operations
# - Viewer: rendering and output
# - Command: user input

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

# class DataFile
#   def read; end
#   def save; end
#   private
#   def exists?; end
#   def create!; end
# end

# class Viewer
#   def self.render(content); end
#   def self.prompt(content); end
# end

# class Command
#   def self.run!; end
#   # def self.list; end
#   # def self.add(item); end
#   # def self.complete(id); end
#   # def self.delete(id); end
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

  def initialize(args)
    @text = args[:text]
    @complete = args[:complete]
  end

  # assume format of incoming string: "complete, text of item"
  def self.from_string(string)
    flag, item = string.split(' ', 2)
    self.new(text: item, complete: flag.to_b)         # this is why we're monkey patching String (above)
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
    "%-5s - %s" % [self.complete?, self.text]
  end

end

class List
  def initialize(args)
    @items = args[:items]
  end

  def self.from_array(array)
    items = array.map{|item| Item.new(text: item.split(/,/).last, complete: item.split(/,/).first) }
    self.new(items: items )
  end

  def add(item, flag = false)
    @items << Item.new(text: item, complete: flag)
  end

  def delete(id)
    adjusted_id = id.to_i - 1
    return unless adjusted_id < @items.length
    @items.delete_at(adjusted_id)
  end

  def complete(id)
    adjusted_id = id.to_i - 1
    return unless adjusted_id < @items.length
    @items[adjusted_id].complete!
  end

  def serialize
    @items.map{|item| "#{item.serialize}\n" }.join('')
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
    create! unless exists?
  end

  def read
    File.readlines(self.name).map(&:chomp)
  end

  def save(list)
    File.open(self.name, 'w') do |file|
      file << list.serialize
    end
  end

  private

  def exists?
    File.exists?(@name)
  end

  def create!
    `touch #{@name}`
  end
end

class Viewer
  def self.render(content)
    puts content
    # File.open('output.txt', 'a') do |file|
    #   file << content
    #   file << "-"*50 + "\n"
    # end
  end
end

class Command
  attr_reader :file, :list, :view

  def initialize(args)
    @file, @list, @view = args[:file], args[:list], args[:view]
  end

  def self.execute
    raise NotImplementedError
  end
end

class ListCommand < Command
  def self.execute(_, config)
    cmd = self.new(config)
    cmd.view.render(cmd.list)
  end
end

class AddCommand < Command
  def self.execute(text, config)
    cmd = self.new(config)
    cmd.list.add(text)
    cmd.file.save(cmd.list)
    cmd.view.render(cmd.list)
  end
end

class CompleteCommand < Command
  def self.execute(id, config)
    cmd = self.new(config)
    cmd.list.complete(id)
    cmd.view.render(cmd.list)
    cmd.file.save(cmd.list)
  end
end

class DeleteCommand < Command
  def self.execute(id, config)
    cmd = self.new(config)
    cmd.list.delete(id)
    cmd.view.render(cmd.list)
    cmd.file.save(cmd.list)
  end
end

class TodoList

  def self.run!(args, config = {})
    cmd, text = args.shift, args.join(' ')
    Module.const_get(cmd.capitalize + 'Command').execute(text, config) rescue puts "command not supported"
  end

end



# -------------------------------------------------------------------
# driver code
# -------------------------------------------------------------------

config = {
           file: (file = DataFile.new('todo.csv')),
           list: List.from_array(file.read),
           view: Viewer
         }

TodoList.run!($*, config)

# -------------------------------------------------------------------
# making changes
# -------------------------------------------------------------------

# it's easy to add commands


class DanceCommand < Command
  def self.execute(id, config)
    cmd = self.new(config)
    cmd.view.render("dance!!")
  end
end
