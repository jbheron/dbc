def assert(test)
  fail "whoops!" unless test
  puts "ok!"
end

def assert_equal(actual, expected)
  fail "wat?" unless actual == expected
  puts "ok!"
end

def assert_raise(code, err_message)
  begin
    code.call
  rescue Exception => e
    assert_equal(e.message, err_message)
  end
end


# ---
def connect_to_db
  fail "all hell just broke loose" #if [1,2,1,1].sample > 1
  puts "we're good!"
end

my_code = ->{ connect_to_db }
msg = "all hell just broke loose"

assert_raise(my_code, msg)

