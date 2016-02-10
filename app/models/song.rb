class Song
  # code here
  attr_accessor :name, :artist
  @@songs = []
  def initialize
  	@genre
  	@@songs << self
  end
  def self.reset_all
  	@@songs = []
  end
  def self.count
  	@@songs.count
  end
  def self.all
  	@@songs
  end
  def self.find_by_name(n)
  	@@songs.each do |x|
  		return x if x.name == n
  	end
  end
  def self.create_by_name(n)
  	 s = self.new
  	 s.name = n
  	 s
  end
  def to_s
  	"#{@artist.name} - #{@name} [#{@genre.name}]"  	
  end

   def genre
   	@genre
   end

   def genre=(g)
   		@genre = g
   		g.addSong(self)
   end
end