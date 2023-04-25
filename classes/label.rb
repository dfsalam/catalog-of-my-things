class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialize(title, color, items)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items.push(item)
    @item.label = self
  end
end
