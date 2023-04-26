require_relative './book_module'
require_relative './music_album_module'

class App
  include BookListing
  include Music
  def initialize()
    @books = []
    @music = []
    @genre = []
    load_music_data
  end
end
