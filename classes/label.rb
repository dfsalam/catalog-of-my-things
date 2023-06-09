class Label
  attr_accessor :title, :color, :id
  attr_reader :items, :labels

  def initialize(title, color)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = []
    @labels = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def add_label(label)
    return if @labels.include?(label)

    @labels.push(label)
  end
end
