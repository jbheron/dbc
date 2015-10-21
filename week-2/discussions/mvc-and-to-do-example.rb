

class Task
  attr_reader :content

  def initialize(content, completed = false)
    @content = content
    @completed = completed
  end

  def complete
    @completed = true
  end

  def to_s
    symbol_for_completeness + " " + content
  end

  def symbol_for_completeness
    @completed ? 'X' : '-'
  end

  def self.from_string(string)      
    # Expecting a string with format "[X|-] <Content for task...>"
    self.new(string[2..-1], string[0] == 'X')
  end
end

class List
  attr_reader :tasks

  def initialize(tasks = [], source_file = 'todo.txt')
    @tasks = tasks
    @source_file = source_file
    self.load
  end

  def add(task)
    @tasks << task
  end

  def delete(task_id)
    @tasks.delete_at(task_id)
  end

  def find(task_id)
    @tasks[task_id]
  end

  def save
    File.open(@source_file, 'w') do |file|
      @tasks.each do |task|
        file << task.to_s
      end
    end
  end

  def load
    File.readlines(@source_file).each do |task_line|
      @tasks << Task.from_string(task_line)
    end
  end
end

class Controller
  attr_reader :list, :view

  def initialize(list = List.new, view = View.new)
    @list = list
    @view = view
  end

  def run(command, args = nil)
    execute(command, args)
    persist_list
  end

private

  def execute(command, args)
    case command
    when 'list'
      view.render(list.tasks)
    when 'add'
      task_content = content_from(args)
      list.add(Task.new(task_content))
    when 'delete'
      list.delete(id_from(args))
    when 'complete'
      task = list.find(id_from(args))
      task.complete
    end
  end

  def persist_list
    @list.save
  end

  def content_from(args)
    args.join(' ')
  end

  def id_from(args)
    args.first.to_i
  end
end

class View
  def render(tasks)
    tasks.each_with_index do |task, index|
      puts "#{index} : #{task}"
    end
  end
end
 
 
command = ARGV[0]
args    = ARGV[1..-1]

todo_app = Controller.new
todo_app.run(command, args)



