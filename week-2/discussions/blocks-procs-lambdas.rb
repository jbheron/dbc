# puts "hello"

# ---

# def say_hi
#   puts "hi!"
# end

# say_hi
# say_hi
# say_hi
# say_hi

# ---

# def say(text)
#   puts text
# end

# say("yo")
# say "weee"

# ---

# def say(text)
#   puts text
#   yield
# end

# say("yo") { puts "hi from the block! "}

# ---

# def say(text, &banana)
#   p banana
#   puts text
#   # banana.call if block_given?
#   yield if block_given?
# end

# # say("yo") { puts "hi from the block! "}
# say("yo") do
#   # say "waaa?"
#   puts "hi from the block! "

# end


# ---

# puts "#{__LINE__} before method definition"

# def say(text)
#   puts "#{__LINE__} #{text}"
#   2.times { yield }
#   puts "#{__LINE__} hey again"
# end

# puts "#{__LINE__} after method definition"

# # puts "#{__LINE__} before method call"

# say "hi" do
#   puts "#{__LINE__} in the block!"

#   say "hey" do
#     puts "#{__LINE__} in the inside in thing"
#   end
# end

# puts "#{__LINE__} after method call"

# ---

# a = ->(text){ puts text }
# a = proc{ puts "hi" }

# # a.call('hi there')

# machines = Array.new(10) { a }

# p machines

# # machines.each(&:call)
# machines.each {|m| p m.call}

# ---

# a = lambda { puts "hi from lambda" }

# a = lambda{|x, *y| puts "#{x} eats a #{y.first} from lambda" }

# # b = ->{ puts "hi from ->" }

# b = ->(a, *b ){ puts "#{a} lays a #{b.last} inside ->" }

# c = proc{ |c, d| puts "#{c} dances with #{d} inside a proc" }

# d = Proc.new{ |e, f| puts "#{e} smokes a #{f} inside a Proc.new" }


# machines = [a,b,c,d]

# # machines.each(&:call)

# machines.first.call('elephant', 'cigar', 'wa?')

# machines.each {|proc| proc.call('elephant', 'cigar', 'wa?')}

formal_clothing = [:jacket, :blazer, :tie, :tux]
casual_clothing = [:jeans, :flipflops, :shorts, :tshirt]

formal = proc { "wearing a #{formal_clothing.sample} today" }
casual = -> { "wearing a #{casual_clothing.sample} today" }

dress_me = ->(style){ "wearing a #{style.sample} today" }

# p [formal, casual].sample.call

# 10.times do |i|
#   p dress_me.call([formal_clothing, casual_clothing][i % 2])
# end

# puts "hi"

# a = -> do
#   puts "yo"
#   return 0
# end

# p a.call

def meth(a)
  p a
  # a
end

meth(puts "hi")


__END__
def do_something(proc)
  puts "inside do_something"
  p proc.call
  puts "leaving do_something"
end

def make_a_lambda
  puts "ENTERING the make_a_lambda method"
  a = lambda { puts "wa?"; return 123 }
  do_something(a)
  b = a.call
  puts "LEAVING the make_a_lambda method"
  return b
end

p make_a_lambda

puts "---"

def make_a_proc
  puts "ENTERING the make_a_proc method"
  c = proc { puts "wa?"; return 555 }
  d = c.call # d is never assigned!
  puts "LEAVING the make_a_proc method"
  return d
end

p make_a_proc

# def my_context
#   c = make_a_proc
#   c.call
#   puts "inside the method"
#   return
#   puts "you'll never see this"
# end

# p my_context

# formal_clothing = [:jacket, :blazer, :tie, :tux]
# casual_clothing = [:jeans, :flipflops, :shorts, :tshirt]

# formal = -> { "wearing a #{formal_clothing.sample} today" }
# casual = -> { "wearing a #{casual_clothing.sample} today" }

# p [formal, casual].sample.call

