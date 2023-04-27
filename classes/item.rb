require 'date'

class Item
  attr_reader :genre, :author, :label, :source
  attr_accessor :published_date, :archived, :id

  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    now = Date.today
    date = Date.parse(@published_date)
    difference_in_years = (now - date).to_i / 365
    difference_in_years > 10
  end

  def move_to_archived
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end
