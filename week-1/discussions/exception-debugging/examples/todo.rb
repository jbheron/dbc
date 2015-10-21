require_relative 'task'
class Todo
  attr_reader :tasks
  def initialize tasks
    @tasks = tasks
  end
end
todo = Todo.new [Task.new("wash dishes"), Task.new("buy food")]
