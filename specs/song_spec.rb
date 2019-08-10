require ("minitest/autorun")
require ("minitest/rg")
require relative ("../song.rb")

class SongTest < MiniTest::Test

def setup
@song_1 = Song.new("Led Zeppelin", "Kasmir")
end



end
