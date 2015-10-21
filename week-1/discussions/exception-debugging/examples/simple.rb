require 'debugger'
def method_1
  method_2
end

def method_2
  method_3
end

def method_3
  im_undefined
end

# method_1

# def hello(name)
#   raise NameMustBeAStringDamnIt.new("stop doing that!") unless name.is_a? String
#   puts name
# end

# begin
#   hello 1
# rescue Exception => e
#   debugger;1
# end
# class NameMustBeAStringDamnIt < ArgumentError
# end

# hello 1
