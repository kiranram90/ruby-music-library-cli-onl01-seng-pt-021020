class Song 
  extend Concerns::Findable
  
  @@all = []
  attr_accessor :name, :artist

  
  def initialize(name, artist=nil, genre=nil)
    
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end
  

  
  def self.all 
    @@all
  end
  
  def save
    @@all <<  self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
      new_song = self.new(name)
      new_song.save
      new_song
  end
  
  def self.find_by_name(name)
    @@all.find do |song| 
     song.name == name 
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(file)
    self.new(file)
  end
  
  def self.create_from_filename(file)
    self.new(file)
    @@all << self
  end
  
  def genre 
    @genre
    end
end