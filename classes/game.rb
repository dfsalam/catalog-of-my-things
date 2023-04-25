require_relative './item'
require_relative '../modules/helper'

class Game< Item
  include Helper

    def initialize(multiplayer,last_play_at,archived=false, published_date)
      super(archived=false, published_date)
      @multiplayer = multiplayer
      @last_play_at = last_play_at
    end

    def can_be_archived?
      super && nb_years_passed(@last_play_at)>2
    end
end