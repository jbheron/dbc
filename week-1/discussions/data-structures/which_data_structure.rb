# Only work on 1 test at a time, comment out the rest of the tests and work your way down.
def assert_equals actual, expected
  puts actual == expected || raise("expected #{expected} but got #{actual}")
end

# replace this comment with your code that makes this test past
assert_equals params[:user][:address][:zip], "94607"

# replace this comment with your code that makes this test past
assert_equals params[:user]["address"][:zip], "94607"

# replace this comment with your code that makes this test past
assert_equals params[:user][:address][0], "94607"

# replace this comment with your code that makes this test past
assert_equals params[:user][:address].first, "94607"

# replace this comment with your code that makes this test past
assert_equals params[0], "94607"

# replace this comment with your code that makes this test past
assert_equals params.first, "94607"

# replace this comment with your code that makes this test past
assert_equals params.first, {:zip => "94607"}

# replace this comment with your code that makes this test past
assert_equals params[:user].first[:zip], "94607"

# replace this comment with your code that makes this test past
assert_equals params[:user].first.first[:zip], "94607"

# replace this comment with your code that makes this test past
assert_equals params[2], {:zip => "94607"}

# replace this comment with your code that makes this test past
assert_equals params[2][0].last, "94607"
