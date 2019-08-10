require ("minitest/autorun")
require ("minitest/rg")
require_relative("../bar.rb")

class BarTest < MiniTest::Test

  def setup(name)
    @name = "Harry Cokie's Karaoke Bar"  
  end


end
