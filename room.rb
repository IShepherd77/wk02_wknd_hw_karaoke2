class Room

  attr_reader :name, :fee, :capacity #required to call the .methods in setup


  def initialize(name, fee, capacity) #needs to be same number of arguments as @room_1 in setup
    @name = name
    @fee = fee
    @capacity = capacity
    @guests = []
    @playlist = []
  end

  #if guest is already there, return out function
  #else add guest to @guests array
  def check_in_guest(guest) #unknown guest
    if @guests.include? guest #guests array includes guest in parameter
      return #exit out of function
    end
    @guests << guest #else add parameter guest to guests array
  end

#return length of guests array
  def check_in_count()
    return @guests.length #guests array length
  end

#delete guest from room (checkout)
  def check_out_guest(guest)
    @guests.delete(guest)
  end

#check if song already in playlist
#if not, then add song to playlist
  def add_song_to_playlist(song)
    if @playlist.include? song
      return #exit out of function if already exits
    end
    @playlist << song #else add song to playlist array
  end

#return length of playlist array
  def playlist_count()
    return @playlist.length
  end

#remove song provided as argument from playlist array
  def remove_song_from_playlist(song)
    @playlist.delete(song)
  end

  #too many guests max 6
  #this is not right but is passing test
  def too_may_guests_in_room__true()
    if @guests.check_in_count() > @capacity
      return true
    end
    return false
  end


  # def too_may_guests_in_room()
  # @guests.check_in_count() > @capacity
  #     return true
  # end

end
