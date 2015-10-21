module Prototypical
  def clone
    self.new
  end
end

class ConfigurableItem
  def initialize(config)
    self.configure(config)
  end

  def configure(cfg)
    cfg.each do |attribute|
      self.class.send(:attr_accessor, attribute)
    end
  end
end

class Task < ConfigurableItem
  extend Prototypical

  def initialize
    super [:text, :status]
  end
end

class Goal < ConfigurableItem
  extend Prototypical

  def initialize
    super [:text, :start, :due, :priority]
  end
end

class Note
  extend Prototypical

  def initialize
    @default_text = 'hello'
  end
end

class ItemFactory
  def initialize
    @registry = {task: Task,
                 note: Note,
                 goal: Goal}
  end

  def register(type, klass)
    @registry[type] = klass
  end

  def create(type)
    @registry[type].clone
  end
end

# ===========================

# we have a factory that makes things
factory = ItemFactory.new

# it starts up with a bunch of prototypes built in
# and we can make as many of these as we want
t1 = factory.create(:task)
t2 = factory.create(:task)
t3 = factory.create(:task)
g1 = factory.create(:goal)
# n1 = factory.create(:note)

stuff = [t1, t2, t3, g1]#, n1]


stuff.each {|s| s.text = "hi there #{rand(1..20)}"}
p stuff


# ---------------------------
puts "-"*10
# ---------------------------

# making a new prototype for our factory is easy
class Reminder < ConfigurableItem
  extend Prototypical

  def initialize
    super [:text, :datetime]
  end
end

# registering it with the factory is important, of course
factory.register(:reminder, Reminder)

# and now we can use it! making as many as we want.
r1 = factory.create(:reminder)

stuff << r1

p stuff

