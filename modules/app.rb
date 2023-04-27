require_relative './book_module'

class App
  include BookListing
  def initialize()
    @books = load_books
    @labels = load_labels
  end
end
