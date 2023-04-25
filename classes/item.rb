require 'date'

class Item
  attr_accessor :genre, :author, :label, :source    
  def initialize(archived, published_date)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived  
  end

  def can_be_archived?
    now = Date.today
    date = Date.parse(@published_date)
    difference_in_years = (now - date).to_i/365
    difference_in_years > 10
  end

  def mov_to_archived
    if can_be_archived?
      archived = true
    end
  end
end

item = Item.new(true, '2020-05-21')
item.can_be_archived?