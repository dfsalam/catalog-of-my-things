require 'date'

class Item
  attr_accessor :genre, :published_date, :archived
  attr_reader :author, :label, :source

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
  
  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end
