require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../guest")


class GuestTest < MiniTest::Test

def setup()
  @guest_1 = Guest.new("Ian", 41)
end

def test_guest_name
  assert_equal("Ian", @guest_1.name)
end

def test_guest_age
  assert_equal(41, @guest_1.age)
end



end