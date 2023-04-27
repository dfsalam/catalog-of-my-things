require_relative '../classes/music_album'

describe MusicAlbum do
  describe '#initialize' do
    it 'creates a new music album with a published date and genre, and sets on_spotify to false by default' do
      album = MusicAlbum.new('1985-01-01', 'Rock')
      expect(album.published_date).to eq('1985-01-01')
      expect(album.genre).to eq('Rock')
      expect(album.on_spotify).to be false
    end

    it 'allows on_spotify to be set to true on initialization' do
      album = MusicAlbum.new('1985-01-01', 'Pop', on_spotify: true)
      expect(album.on_spotify).to be true
    end

    it 'allows archived to be set to true on initialization' do
      album = MusicAlbum.new('1985-01-01', 'Classical', archived: true)
      expect(album.archived).to be true
    end
  end

  describe '#can_be_archived?' do
    it 'returns false if the album is not on Spotify or has been published less than 10 years ago' do
      album = MusicAlbum.new('2010-01-01', 'Electronic', on_spotify: false, archived: false)
      expect(album.can_be_archived?).to be false
    end

    it 'returns true if the album is on Spotify and has been published more than 10 years ago' do
      album = MusicAlbum.new('2010-01-01', 'Hip-hop', on_spotify: true, archived: false)
      expect(album.can_be_archived?).to be true
    end

    it 'returns false if the album is on Spotify but has been published less than 10 years ago' do
      album = MusicAlbum.new('2020-01-01', 'Jazz', on_spotify: true, archived: false)
      expect(album.can_be_archived?).to be false
    end
  end
end
