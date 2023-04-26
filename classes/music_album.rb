require 'item'

class MusicAlbum < Item
  def initialize(_publish_date, archived, on_spotify)
    super(id, published_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && on_spotify

    false
  end
end
