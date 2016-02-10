require 'pry'

class LibraryParser
  def initialize()
  	@files =  Dir["db/data/*"]
  end
  def files
  	@files
  end
  def parse_filename(name)
  	re = /(.+?)(?: - )(.+?)(?:\s\[)(.+?)(?:\])/
    (name.scan(re)).flatten
  end
  def build_song(artist, song, genre)
	s = Song.create_by_name(song)
	s.artist = Artist.create_by_name(artist)
	s.genre = Genre.create_by_name(genre)
	s
  end

  def call
  	lib = LibraryParser.new
  	lib.files.each do |x|
  		n = lib.parse_filename(x)
  		build_song(*n)
  	end
  end
end