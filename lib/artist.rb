class Artist
  extend Concerns::Findable
  
  
  @@all = []
  attr_accessor :name, :songs

  
  def initialize(name)
    @name = name 
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
      new_artist = self.new(name)
      new_artist.save
      new_artist
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
    
  
  def genres 
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
    end
  
  
end