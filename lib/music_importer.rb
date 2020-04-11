class MusicImporter
  
  @@all = []
  
  attr_accessor :path
  
  def initialize(path)
    @path = path 
    @@all << path
  end
  
  def files
    
  end

  def import()
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end