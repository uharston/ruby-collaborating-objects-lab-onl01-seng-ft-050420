require 'pry'

class Song #describes the behavior of song instances
  attr_accessor :name, :artist #setter and getter methods for name and artist
    @@all = [] #keeps track of all song instances
  def initialize(name) #when song is created a name is mandatory
    @name = name #writes/sets a name to the song
    @@all << self #pushes all song instances into songs class array
  end

  def self.new_by_filename(file_name)
  song = file_name.split(" - ")[1]
  artist = file_name.split(" - ")[0]
  new_song = self.new(song)
  new_song.artist_name = artist
  new_song
end

  def self.all #class method that reveals all songs within -
    @@all
  end
  #redefine song.artist.name to song.artist_name
  #song => Song object; song.artist =>
  def artist_name=(name)
    #object attr
    self.artist = Artist.find_or_create_by_name(name)

     artist.add_song(self)

  end

end
