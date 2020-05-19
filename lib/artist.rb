class Artist #many Artist instances live here

  attr_accessor :name, :songs #artist.name to access artist instance name

  @@all = []#keeps track of all the artist

  def initialize(name) #when an artist is created the name is mandatory
    @name = name #writes/sets a name attribute to the new artist
    @@all << self #pushes that artist into all array. all artist instances go here
  end

  def self.all #class method reveals all the artist instances within the class
    @@all
  end

  def add_song(song) #allow an artist instance to add a song to the collection
    song.artist = self #by associating the artist with the song
  end

  def songs
    Song.all.select { |n| n.artist == self }
  end
     #Artist.find_or_create_by_name("Drake")
  def self.find_or_create_by_name(artist_name)
    #searches for artist_name with @@all and returns it
    #if it doesn't exist it creates the artist
    found = Artist.all.find {|n| n.name == artist_name }#.find returns the first artist to match or nil
    if found
      found #return if the artist exist
    else
      new_artist = self.new(artist_name) #create new artist because it doesn't exist
      new_artist
    end
  end

  def print_songs #iterates through songs array and returns song names of artist
    puts self.songs.map {|n| n.name }
  end


end
