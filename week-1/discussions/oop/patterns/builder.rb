# some fake data to make things interesting
module Faker
  extend self
  def get_text(type)
    "#{type}: handle that thing on #{['N','S'].sample} #{rand(4..20)}th St in"
  end

  def get_date(at = :now)
    case at
    when :future
      Time.now + (60 * 60 * 24 * 7 * 2)
    else
      Time.now.utc
    end
  end

  def get_email
    'abc@123.com'
  end

  def get_priority
    [:low, :medium, :high].sample
  end
end

# the thing to be built, the "product"
class Item
  attr_reader :label, :created_at

  def initialize(label)
    @label, @created_at = label.to_s, Faker.get_date
    @custom_attributes = {}
  end

  def set_attribute(name, value)
    @custom_attributes[name] = value
  end

  def del_attribute(name)
    @custom_attributes.delete(name)
  end

  def to_s
    # add default representation of self as a string
    output = "#{self.label} (created on [#{self.created_at}])\n\n"
    return output if @custom_attributes.empty?

    # and keep building what we look like as a string if there's more
    @custom_attributes.each do |name, value|
      output += "%-12s: %s\n" % [name.to_s.gsub(/_/, ' '), value]
    end
    output += "-"*20
  end
end

# orchestrates building at the highest level
class Director
  def self.construct(builder)
    builder.build_text
    builder.build_timing
    builder.build_priority
    builder.build_notifications
  end
end

# handles building in an abstract sense
class Builder

  # this is a required part of the construction process
  def build_text
    raise NotImplementedError
  end

  # these are optional parts of the construction process
  def build_timing; end
  def build_priority; end
  def build_notifications; end

  # this is how all builders return their work product
  def get_result
    @product
  end
end

# builder that knows how to build tasks
class TaskBuilder < Builder
  def initialize
    @product = Item.new(:task)
  end

  def build_text
    @product.set_attribute(:text, Faker.get_text(:task))
  end

  def build_timing
    @product.set_attribute(:start_date, nil)
    @product.set_attribute(:due_date, :today)
  end

  def build_priority
    @product.set_attribute(:priority, Faker.get_priority)
  end

  def build_notifications
    @product.set_attribute(:email, Faker.get_email)
  end

end

# builder that knows how to build notes
class NoteBuilder < Builder
  def initialize
    @product = Item.new(:note)
  end

  def build_text
    @product.set_attribute(:text, Faker.get_text(:note))
  end
end


# builder that knows how to build goals
class GoalBuilder < Builder
  def initialize
    @product = Item.new(:goal)
  end

  def build_text
    @product.set_attribute(:text, Faker.get_text(:goal))
  end

  def build_timing
    @product.set_attribute(:due_date, Faker.get_date(:future))
  end

  def build_priority
    @product.set_attribute(:priority, Faker.get_priority)
  end

end


class ReminderBuilder < Builder
  def initialize
    @product = Item.new(:reminder)
  end

  def build_text
    @product.set_attribute(:text, Faker.get_text(:reminder))
  end

  def build_timing
    @product.set_attribute(:alarm_date, Faker.get_date(:future))
    @product.set_attribute(:snooze, true)
    @product.set_attribute(:snooze_delay, 600)
  end


end

# ===========================

task_builder = TaskBuilder.new
Director.construct(task_builder)
new_task = task_builder.get_result

puts new_task
puts

# ---------------------------

note_builder = NoteBuilder.new
Director.construct(note_builder)
new_note = note_builder.get_result

puts new_note
puts

# ---------------------------

goal_builder = GoalBuilder.new
Director.construct(goal_builder)
new_goal = goal_builder.get_result

puts new_goal

# ---------------------------

reminder_builder = ReminderBuilder.new
Director.construct(reminder_builder)
new_reminder = reminder_builder.get_result

puts new_reminder

