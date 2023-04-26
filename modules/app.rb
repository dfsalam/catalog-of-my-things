require_relative './book_module'
require_relative './author'

class App
  include BookListing
  include AuthorModule
  def initialize()
    @books = []
    @authors = load_authors
  end
end
