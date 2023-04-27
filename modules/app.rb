require_relative './book_module'
require_relative './author'
require_relative './game'
require_relative './music_album_module'
require_relative './genre_module'

class App
  include BookListing
  include AuthorModule
  include GameModule
  include Music
  include GenreModule
  def initialize()
    @books = []
    @authors = load_authors
    @games = load_games
    @music = []
    @genres = []
    load_music_data
    load_genre_data
  end
end
