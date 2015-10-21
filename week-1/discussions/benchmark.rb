ceiling = 5000

def benchmark(string = "")
  now = Time.now
  yield
  difference = Time.now - now
  p "#{string} – #{difference}"
end

def binary(array)
  until array.length <= 1
    halfway_point = array.length / 2
    array.shift(halfway_point)
  end
end

def linear(array)
  until array.length <= 1
    array.shift
  end
end

array = (1..ceiling).to_a
benchmark "Linear walkthrough" do
  linear array
end

array = (1..ceiling).to_a
benchmark "Binary walkthrough" do
  binary array
end

array = (1..ceiling).to_a
benchmark "combinations of two" do
  # The code below uses #to_a because Array#combination is lazily evaluated,
  # which means the result is not calculated until it is explicitly asked for.
  array.combination(2).to_a
end
