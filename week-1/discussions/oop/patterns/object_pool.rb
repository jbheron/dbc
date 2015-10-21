INSTANTIATION_COST = 0.3

# items are expensive to make
class Item
  def initialize
    sleep(INSTANTIATION_COST)
    print "."
  end
end

class Task < Item
  attr_accessor :label
  def initialize(label = nil)
    super() # tasks are expensive to create!
    @label = label
  end

  def clear!
    @label = nil
    self
  end

end

class TaskPool

  def self.get_instance
    @instance ||= self.new
  end

  def get_task
    @tasks.shift unless @tasks.empty?
  end

  def return_task(task)
    raise ArgumentError, "the pool is full, fool!" if @tasks.size >= @maxsize
    @tasks.push(task.clear!)
  end

  def set_maxsize(size)
    @maxsize = size
  end

  def size
    @tasks.size
  end

  private
  def initialize
    puts "building pool. please wait."
    @maxsize = 10
    @tasks = []
    @maxsize.times do
      @tasks << Task.new
    end
  end
end

# ---------------------------

pool = TaskPool.get_instance
t1 = pool.get_task
t2 = pool.get_task
t3 = pool.get_task
t4 = pool.get_task

puts
t1.label = 'here is my first task'
p t1

p pool
p pool.size

pool.return_task(t1)

p pool
p pool.size