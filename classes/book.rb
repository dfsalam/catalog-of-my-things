require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(published_date, publisher = 'Unknown', cover_state = 'Unknown', archived: false)
    super(published_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end
