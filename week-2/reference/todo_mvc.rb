# It should be able to add tasks to the list
# Next step: add tasks to _a_ list… This will require instances of List.

class View
  def self.run
    ListController.create ARGV[0]
  end
end

class ListController
  # TODO, make this work with instances of the list class
  def self.create(input)
    List.save input
  end
end

class List
  # TODO make this instantiate instances of the list.
  def self.file
    "todos.csv"
  end

  def self.save(task)
    File.open(file, 'a') { |file|  file.write(task + "\n") }
  end
end

# expected input: `ruby todo_mvc.rb "This is a new task."
# Should this be looping and requesting new tasks instead?
View.run