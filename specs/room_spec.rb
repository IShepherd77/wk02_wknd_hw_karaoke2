require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../room")

class RoomTest < MiniTest::Test

def setup
@room_1 = Room.new("Karaoke Room 1", 5)
end

def test_room_name
  assert_equal("Karaoke Room 1", @room_1.name)
end

def test_fee_amount
  assert_equal(5, @room_1.fee)
end




end
