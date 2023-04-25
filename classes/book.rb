require_relative './item'

class Book < Item
  def initialize(archived, published_date, publisher, cover_state)
    super(archived, published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'
    false
  end
end
