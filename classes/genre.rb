class Genre
  attr_accessor :genre_name, :items, :id  

  def initialize(genre_name)
    @id = Random.rand(1..100)
    @genre_name = genre_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
