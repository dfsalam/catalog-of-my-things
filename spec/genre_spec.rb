require_relative '../classes/genre'
require_relative '../classes/music_album'

describe Genre do
  describe "#initialize" do
    it "creates a new genre with a name and empty items list" do
      genre = Genre.new("Classic")
      expect(genre.genre_name).to eq("Classic")
      expect(genre.items).to eq([])
    end

    it "generates a random ID for each new genre" do
      genre1 = Genre.new("Rap")
      genre2 = Genre.new("Rock")
      expect(genre1.id).not_to eq(genre2.id)
    end
  end

  describe "#add_item" do
    it "adds an item to the genre's items list and sets the item's genre to itself" do
      genre = Genre.new('Rock')
      album = MusicAlbum.new('1985-01-01', 'Rock')
      genre.add_item(album)
      expect(genre.items).to eq([album])
      expect(album.genre).to eq(genre)
    end
  end
end