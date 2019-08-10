require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../customer")


class CustomerTest < MiniTest::Test

def setup()
  @customer_1 = Customer.new("Ian", 41)
end

def test_customer_name
  assert_equal("Ian", @customer_1.name)
end

def test_customer_age
  assert_equal(41, @customer_1.age)
end



end
