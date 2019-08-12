require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../room")
require_relative ("../guest")
require_relative ("../song")
require_relative ("../bar")

class RoomTest < MiniTest::Test

  def setup
    @room_1 = Room.new("Karaoke Room 1", 5, 6)

    @song_1 = Song.new("Led Zeppelin", "Kashmir")
    @song_2 = Song.new("Foo Fighters", "One by one")
    @song_3 = Song.new("Baby D", "Let me be your fantasy")
    @song_4 = Song.new("Oasis", "Wonderwall")

    @guest_1 = Guest.new("Ian")
    @guest_2 = Guest.new("Vic")
    @guest_3 = Guest.new("Alan")
    @guest_4 = Guest.new("Charlotte")
    @guest_5 = Guest.new("Tom")
    @guest_6 = Guest.new("Dick")
    @guest_7 = Guest.new("Harry")
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


#test check in works without using zero
  def test_check_in_guest()
    assert_equal(0, @room_1.check_in_count()) #check blank array
    @room_1.check_in_guest(@guest_1) #check one guest in should return 1
    assert_equal(1, @room_1.check_in_count()) #check guest has been added
    @room_1.check_in_guest(@guest_2) #check guest 2 in should return 2
    assert_equal(2, @room_1.check_in_count()) #check second guest can be added
  end

#check test is working by adding same guest checke in
  def test_check_in_guest_already_checked_in()
    @room_1.check_in_guest(@guest_1) #check guest 1 in should return 1
    @room_1.check_in_guest(@guest_1) # check same guest 1 in and should still return 1
    assert_equal(1, @room_1.check_in_count()) #1 should be output
  end

#check out guest works with multiple guests as zero cannot be trusted
  def test_check_out_guest()
    @room_1.check_in_guest(@guest_1) #add 1 guest
    @room_1.check_in_guest(@guest_2) # add 2nd guest to total 2
    @room_1.check_out_guest(@guest_1) #remove one guest to total 1
    assert_equal(1, @room_1.check_in_count()) #output shoudl be 1
    @room_1.check_out_guest(@guest_3) #checkout guest 3 who is not checked in so should still return 1
    assert_equal(1, @room_1.check_in_count()) #returns 1
    @room_1.check_out_guest(@guest_2) #check out guest 2 who is checked in
    assert_equal(0, @room_1.check_in_count()) #room should now be empty
  end

#same as test_check_in_guest above
  def test_add_song_to_playlist()
    assert_equal(0, @room_1.playlist_count())
    @room_1.add_song_to_playlist(@song_1)
    assert_equal(1, @room_1.playlist_count())
    @room_1.add_song_to_playlist(@song_2)
    assert_equal(2, @room_1.playlist_count())
  end

#same as test_check_in_guest_already_checked_in above
  def test_song_already_added_to_playlist()
    @room_1.add_song_to_playlist(@song_1)
    @room_1.add_song_to_playlist(@song_1)
    assert_equal(1, @room_1.playlist_count())
  end

#same as test_check_out_guest above
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

  #test too many guests checking in
  def test_too_many_guests_in_room__true()
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_in_guest(@guest_3)
    @room_1.check_in_guest(@guest_4)
    @room_1.check_in_guest(@guest_5)
    @room_1.check_in_guest(@guest_6)
    @room_1.check_in_guest(@guest_7)
    assert_equal(true, @room_1.too_many_guests_in_room)
    # @room_1.check_out_guest(@guest_7)
    # assert_equal(false, @room_1.too_many_guests_in_room)
  end


  def test_too_many_guests_in_room__false()
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    @room_1.check_in_guest(@guest_3)
    @room_1.check_in_guest(@guest_4)
    @room_1.check_in_guest(@guest_5)
    @room_1.check_in_guest(@guest_6)
    assert_equal(false, @room_1.too_many_guests_in_room)
  end


end
