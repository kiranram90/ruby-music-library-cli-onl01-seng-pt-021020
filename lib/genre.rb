class Genre
  extend Concerns::Findable 
  
  @@all = []
  
  attr_accessor :name 

  
  def initialize(name)
    @name = name 
    @@all << self
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
      new_genre = self.new(name)
      new_genre.save
      new_genre
  end
  
  def artists
    Song.all select do |artist| 
      artist.genre == self
    end
  end
  
  def songs
   @songs
  end
  
  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end
  
  def artists 
    artists = @songs.collect do |song|
      song.artist
  end
    artists.uniq
  end
end