require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../song")

class SongTest < MiniTest::Test

def setup
@song_1 = Song.new("Led Zeppelin", "Kashmir")
@song_2 = Song.new("Foo Fighters", "One by one")
end

def test_get_song_artist
  assert_equal("Led Zeppelin", @song_1.artist)
end

def test_get_song_title
  assert_equal("Kashmir", @song_1.title)
end



end
