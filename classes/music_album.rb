require './item'

class MusicAlbum < Item
  def initialize(archived: false, published_date, on_spotify: false)
    super(archived, published_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && on_spotify

    false
  end
end

