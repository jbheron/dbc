# -------------------------------------------------------------------
# feature-level design
# -------------------------------------------------------------------

# classes:
# - List: a list of items handles everything

# driver code to handle user interactions

# -------------------------------------------------------------------
# object-level design
# -------------------------------------------------------------------

# class List
#   def self.load_from_file(filename); end
#   def save!; end
#   def show; end
#   def add(item); end
#   def complete(id); end
#   def delete(id); end
# end

# -------------------------------------------------------------------
# implementation
# -------------------------------------------------------------------

class List
  attr_accessor :filename

  def initialize(file, args = {})
    @filename = file
    @items = args[:items]
  end

  def self.load_from_file(filename)
    list_of_items = File.readlines(filename)                # read the file as an array of lines
                        .map(&:chomp)                       # remove the newline ("\n") from each line
                        .map{|line| line.split(',').last}   # split each line into 2 elements [status, text]
                                                            #    and just ignore status for now
    self.new(filename, items: list_of_items)
  end

  def save!
    File.write(@filename, @items.join("\n"))
  end

  def add(item)
    @items << item
  end

  def complete(id)
    raise NotImplementedError, "the [complete] command is not yet implemented"
  end

  def delete(id)
    raise NotImplementedError, "the [delete] command is not yet implemented"
  end

  def to_s
    output = ''
    @items.each.with_index do |item, idx|
      output += "[%3s] %s\n" % [idx + 1, item]
    end
    output
  end
  alias_method :show, :to_s

end

# -------------------------------------------------------------------

# gather command line input
command = $*.shift
text    = $*.join(' ')

# create a new list to work with
list = List.load_from_file 'todo.csv'

case command
  when 'list'
    puts list
  when 'add'
    list.add text
    list.save!
    puts list
  when 'delete'
    list.delete(text)
    list.save!
    puts list
  when 'complete'
    list.complete(text)
    list.save!
    puts list
  else
    puts "command [#{command}] not supported"
    puts "usage:"
    puts "\truby #{__FILE__} list"
    puts "\truby #{__FILE__} add 'new item text'"
    puts "\truby #{__FILE__} complete 1"
    puts "\truby #{__FILE__} delete 1"
end

