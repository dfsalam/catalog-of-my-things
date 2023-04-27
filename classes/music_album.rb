require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre

  def initialize(published_date, genre, on_spotify: false, archived: false)
    super(published_date, archived: archived)
    @on_spotify = on_spotify
    @genre = genre
  end

  def can_be_archived?
    super && on_spotify
  end
end
