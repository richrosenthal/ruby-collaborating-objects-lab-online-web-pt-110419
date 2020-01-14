class Artist 
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name 
    @songs = []
    @save = save 
  end 
  def self.all
    @@all
  end 
   def songs 
     Song.all.select{|song| song.artist == self}
   end   
  def add_song(song)
    song.artist = self 
    song 
  end 
  def self.find_or_create_by_name(name)
     self.all.detect {|artist| artist.name == name} || Artist.new(name)
end 
 def save
    @@all << self
  end
def print_songs
   songs.each {|x| puts x.name}
end   
end 