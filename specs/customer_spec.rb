require ("minitest/autorun")
require ("minitest/rg")
require_relative("../customer.rb")


class CustomerTest < MiniTest::Test

def setup()
  @customer_1 = Customer.new("Ian", 41)
end



end
