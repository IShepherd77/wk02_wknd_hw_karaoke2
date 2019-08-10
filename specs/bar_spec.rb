require ("minitest/autorun")
require ("minitest/rg")
require ('pry')
require_relative("../bar")

class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new("Harry Cokie's Karaoke Bar", 100)
  end

  def test_bar_name
    assert_equal("Harry Cokie's Karaoke Bar", @bar.name)
  end

def test_till_amount
  assert_equal(100, @bar.till)
  # p @bar.till
end

end
