class Room

  attr_reader :name, :fee, :capacity


  def initialize(name, fee, capacity)
    @name = name
    @fee = fee
    @capacity = capacity
    @guests = []
    @playlist = []
  end

  #if guest is already there, return out function
  #else add guest to @guests array
  def check_in_guest(guest)
    if @guests.include? guest
      return
    end
    @guests << guest
  end

  def check_in_count()
    return @guests.length
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def add_song_to_playlist(song)
    if @playlist.include? song
      return
    end
    @playlist << song
  end

  def playlist_count()
    return @playlist.length
  end

  def remove_song_from_playlist(song)
    @playlist.delete(song)
  end

end
