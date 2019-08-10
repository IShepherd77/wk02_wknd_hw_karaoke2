require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../room")

class RoomTest < MiniTest::Test

def setup
@room_1 = Room.new("Karaoke Room 1")
end

def test_room_name
  assert_equal("Karaoke Room 1", @room_1.name)
end



end
