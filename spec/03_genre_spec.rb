describe Genre do
  before(:each) do
    Genre.reset_all
  end

  let(:genre){Genre.new}

  it "can initialize a genre" do
    expect(genre).to be_an_instance_of(Genre)
  end

  it "has a name" do
    genre.name = 'rap'
    expect(genre.name).to eq('rap')
  end

  describe "Class methods" do
    it "keeps track of all known genres" do
      expect(Genre.count).to eq(0)
      rap = Genre.new.tap{|g| g.name = 'rap'}
      electronica = Genre.new.tap{|g| g.name = 'electronica'}
      expect(Genre.count).to eq(2)
      expect(Genre.all).to include(rap)
      expect(Genre.all).to include(electronica)
    end

    it "can reset genres" do
      genres = (1..5).collect do |i|
        Genre.new
      end
      expect(Genre.count).to eq(5)
      Genre.reset_all
      expect(Genre.count).to eq(0)
    end

    it 'finds an genre by name' do
      genre.name = "Find Me"
      expect(Genre.find_by_name('Find Me')).to eq(genre)
    end

    it 'creates an genre by name' do
      expect(Genre.create_by_name('Find Me').name).to eq('Find Me')
    end
  end
end
