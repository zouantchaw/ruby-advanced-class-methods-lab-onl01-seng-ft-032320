class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
      song = self.new 
      self.all << song 
      song 
  end 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    self.all << song 
    song 
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil 
      create_by_name(name)
    else 
      find_by_name(name)
    end 
  end
  
  def self.alphabetical
    sorted = all.sort {|a, b| a.name <=> b.name}
    sorted
  end
  
  def self.new_from_filename(mp3_data)
    rows = mp3_data.split(/ - |.mp3/)
    name = rows[1]
    artist_n = rows[0]
    
    song = self.new 
    song.name = name 
    song.artist_name = artist_n
    song 
  end
  
  def self.create_from_filename(mp3_data)
    all << new_from_filename(mp3_data)
  end

end
