require_relative './book_module'
require_relative './author'
require_relative './game'

class App
  include BookListing
  include AuthorModule
  include GameModule
  def initialize()
    @books = []
    @authors = load_authors
    @games = load_games
  end
end
