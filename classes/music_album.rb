require './item'

class MusicAlbum < Item
  def initialize(published_date, archived: false, on_spotify: false)
    super(published_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end
end
