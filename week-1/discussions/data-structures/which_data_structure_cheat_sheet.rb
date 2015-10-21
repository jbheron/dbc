# Only work on 1 test at a time, comment out the rest of the tests and work your way down.
def assert_equals actual, expected
  puts actual == expected || raise("expected #{expected} but got #{actual}")
end

params = {:user => {:address => {:zip => "94607"}}}
assert_equals params[:user][:address][:zip], "94607"

params = {:user => {"address" => {:zip => "94607"}}}
assert_equals params[:user]["address"][:zip], "94607"

params = {:user => {:address => {0 => "94607"}}}
#OR params = {:user => {:address => ["94607"]}}
assert_equals params[:user][:address][0], "94607"

params = {:user => {:address => ["94607"]}}
assert_equals params[:user][:address].first, "94607"

params = {0 => "94607"}
# OR params = ["94607"]
assert_equals params[0], "94607"

params = ["94607"]
assert_equals params.first, "94607"

params = [{:zip => "94607"}]
assert_equals params.first, {:zip => "94607"}

params = {:user => [{:zip => "94607"}]}
assert_equals params[:user].first[:zip], "94607"

params = {:user => [[{:zip => "94607"}]]}
assert_equals params[:user].first.first[:zip], "94607"

params = {2 => {:zip => "94607"}}
# OR params = [{},{},{:zip => "94607"}]
assert_equals params[2], {:zip => "94607"}

params = [1,2,[["94607"]]]
assert_equals params[2][0].last, "94607"
