# - multiple ways to parse file (using CSV & File)
# - sorting todo list by various criteria
# - communications between classes
# - breaking up parts of the design


require 'csv'

class Database # model

  def initialize(file)
    @file = file
  end

  def save!
    CSV.open(@file, 'w') do |csv|
      @items.each do |item|
        csv << item
      end
    end
  end

  def load!
    @items = CSV.readlines(@file)
  end
end

class TodoList  # model

  def initialize(items)
    @items = items
  end

  def show
    str = ""
    @items.each.with_index do |item, idx|
      # puts "[#{idx + 1}] #{item.join('...')}"
      str += "[%3s] ( %-10s ) %s\n" % [idx + 1, item.last, item.first.capitalize]
    end
    str
  end

  alias_method :to_s, :show

  def add(item)
    @items << [item, 'incomplete']
  end

  def complete(id)
    @items[id.to_i - 1][1] = 'complete'
  end

  def delete(id)
    @items.delete_at(id.to_i - 1)
  end

end

module UI # view
  extend self

  def render(content)
    puts content
  end
end

class Application
  def run!(args = {})
    cmd, params = args[:input]
    db, list, ui = args[:db], args[:list], args[:ui]

    db = db.new('todo.txt')
    list = list.new(db.load!)

    case cmd
    when 'list'
    when 'add'
      list.add(params)
    when 'delete'
      list.delete(params)
    when 'complete'
      list.complete(params)
    end

    db.save!
    ui.render(list)
  end
end

# ---

conf = {db: Database, list: TodoList, ui: UI}
input = [ARGV.shift, ARGV.join(' ')]

Application.run!(config: conf, input: input)

__END__
... here's what the data.txt file looks like ...
read and write code,complete
talk with others,complete
ask questions,incomplete
eat,complete
learn,complete
nap,incomplete
another item,incomplete
another item,incomplete


