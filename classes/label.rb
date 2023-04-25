class Label
  attr_accessor :title
  attr_reader :items

  def initialize(_id, title, color, _items)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items.push(item)
    item.label = self
  end
end
