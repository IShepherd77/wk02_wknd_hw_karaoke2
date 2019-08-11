require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../room")
require_relative ("../guest")
require_relative ("../song")
require_relative ("../bar")

class RoomTest < MiniTest::Test

  def setup
    @room_1 = Room.new("Karaoke Room 1", 5, 6)

    @guest_1 = Guest.new("Ian")
    @guest_2 = Guest.new("Vic")
    @guest_3 = Guest.new("Alan")
    @guest_4 = Guest.new("Charlotte")

    @song_1 = Song.new("Led Zeppelin", "Kashmir")
    @song_2 = Song.new("Foo Fighters", "One by one")
    @song_3 = Song.new("Let me be your fantasy", "Baby D")
    @song_4 = Song.new("Oasis", "Wonderwall")


  end

  def test_room_name()
    assert_equal("Karaoke Room 1", @room_1.name)
  end

  def test_fee_amount()
    assert_equal(5, @room_1.fee)
  end

  def test_capacity()
    assert_equal(6, @room_1.capacity)
  end

  def test_check_in_guest()
    assert_equal(0, @room_1.check_in_count())
    @room_1.check_in_guest(@guest_1)
    assert_equal(1, @room_1.check_in_count())
    @room_1.check_in_guest(@guest_2)
    assert_equal(2, @room_1.check_in_count())
  end

  def test_check_in_guest_already_checked_in()
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_1)
    assert_equal(1, @room_1.check_in_count())
  end

  def test_check_out_guest()
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_out_guest(@guest_1)
    assert_equal(1, @room_1.check_in_count())
    @room_1.check_out_guest(@guest_3)
    assert_equal(1, @room_1.check_in_count())
    @room_1.check_out_guest(@guest_2)
    assert_equal(0, @room_1.check_in_count())
  end

  def test_add_song_to_playlist()
    assert_equal(0, @room_1.playlist_count())
    @room_1.add_song_to_playlist(@song_1)
    assert_equal(1, @room_1.playlist_count())
    @room_1.add_song_to_playlist(@song_2)
    assert_equal(2, @room_1.playlist_count())
  end

  def test_song_already_added_to_playlist()
    @room_1.add_song_to_playlist(@song_1)
    @room_1.add_song_to_playlist(@song_1)
    assert_equal(1, @room_1.playlist_count())
  end

  def test_remove_song_from_playlist()
    @room_1.add_song_to_playlist(@song_1)
    @room_1.add_song_to_playlist(@song_2)
    @room_1.remove_song_from_playlist(@song_1)
    assert_equal(1, @room_1.playlist_count())
    @room_1.remove_song_from_playlist(@song_4)
    assert_equal(1, @room_1.playlist_count())
    @room_1.remove_song_from_playlist(@song_2)
    assert_equal(0, @room_1.playlist_count)
  end

end
