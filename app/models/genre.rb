class Genre
  attr_accessor :name
   @@genre = []
  def initialize
  	@artists = []
  	@songs = []
  	@@genre << self
  end

  def self.reset_all
  	@@genre = []
  end
  def self.count
  	@@genre.count
  end
  def self.all
  	@@genre
  end
  def self.find_by_name(n)
  	@@genre.each do |x|
  		return x if x.name == n
  	end
  end
  def self.create_by_name(n)
  	 s = self.new
  	 s.name = n
  	 s
  end
  def songs
  	@songs
  end
  def addSong(s)
  	@songs.push(s).uniq!
  end
  def artists
  	@artists
  end
  def add_artist(a)
  	@artists << a
  	@artists.uniq!
  end
end