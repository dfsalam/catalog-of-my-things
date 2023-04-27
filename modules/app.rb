require_relative './book_module'
require_relative './music_album_module'
require_relative './genre_module'

class App
  include BookListing
  include Music
  include GenreModule
  def initialize()
    @books = []
    @music = []
    @genres = []
    load_music_data
    load_genre_data
  end
end
