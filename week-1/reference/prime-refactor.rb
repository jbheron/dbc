require 'pry'
# pseudocode
# okay, so we find (literally) the lowest divisor in the range from 2 to our number
# then we put it in an array, then add to that array the result of recursively calling
# ourselves with the result of dividing our number by said divisor UNLESS we're already
# up to our number
#

def prime_factors(number)
  lowest_divisor = find_lowest_divisor(number)
  return_array = [lowest_divisor]
  if lowest_divisor == number
    return_array
  else
    return_array += prime_factors(composite(number, lowest_divisor))
  end
end

def find_lowest_divisor(number)
  possible_primes(number).find do |possible_divisor|
    divisible_by?(number, possible_divisor)
  end
end

def possible_primes(ceiling)
  2..ceiling
end

def divisible_by?(number, divisor)
  number % divisor == 0
end

def composite(number, divisor)
  number / divisor
end

# "lowest divisor: #{lowest_divisor}, return array: #{return_array}, number: #{number}"

def assert_equal(actual, expectation)
  if actual == expectation
    puts "win"
  else
    puts "fail"
  end
end

assert_equal prime_factors(3), [3]
assert_equal prime_factors(6), [2,3]
assert_equal prime_factors(8), [2,2,2]
assert_equal prime_factors(25), [5,5]
assert_equal prime_factors(123123123), [3, 3, 41, 333667]