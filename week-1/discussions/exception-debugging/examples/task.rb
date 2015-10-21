require 'debugger'
class Task
  attr_reader :name
  def initialize name
    @name = name
    self.make_incomplete
  end

  def make_incomplete
    # puts "I was called from: #{caller}"
    # debugger
    self.attributes[:complete] = false
  end
end
