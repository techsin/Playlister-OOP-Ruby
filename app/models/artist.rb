

class Artist
  # code here
  attr_accessor :name
  def self.reset_all
  end
   @@artists = []
  def initialize
	@genres = []
	@songs = []
  	@@artists << self
  end

  def self.reset_all
  	@@artists = []
  end
  def self.count
  	@@artists.count
  end
  def self.all
  	@@artists
  end
  def self.find_by_name(n)
  	@@artists.each do |x|
  		return x if x.name == n
  	end
  end
  def self.create_by_name(n)
  	 s = self.new
  	 s.name = n
  	 s
  end

  def add_song(s)
  	@songs << s
  	@songs.flatten!

  	@songs.each do |x|
  		if ((defined? x.genre )&& !x.genre.nil?)
  			# binding.pry
  			add_genre(x.genre)
  			x.genre.add_artist(self)
  		end
	end
  end
  def add_songs(s)
  	add_song(s)
  end  
  def add_genre(s)
  	@genres << s
  	@genres.flatten!
  	@genres.uniq!
  end
  def add_genres(s)
  	add_genres(s)
  end
  def songs
  	@songs
  end  
  def genres
  	@genres
  end
end