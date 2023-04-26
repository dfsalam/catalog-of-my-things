require_relative './item'
require_relative '../modules/helper'

class Game < Item
  include Helper
  attr_accessor :multiplayer, :last_play_at, :published_date,:archived 
  
  def initialize(multiplayer, last_play_at, published_date, archived: false)
    super(published_date, archived: archived)
    @multiplayer = multiplayer
    @last_play_at = last_play_at
  end

  def can_be_archived?
    super && nb_years_passed(@last_play_at) > 2
  end
end
