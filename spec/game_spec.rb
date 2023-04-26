require_relative '../classes/game'

describe Game do
  before :each do
    @game = Game.new('Multi-player', '2023-04-13', '2020-05-14')
  end

  describe '#new' do
    it 'Should return a Game object' do
      expect(@game).to be_an_instance_of Game
    end
  end

  describe '#multiplayer' do
    it 'Should return the correct multiplayer' do
      multiplayer = @game.multiplayer

      expect(multiplayer).to eql 'Multi-player'
    end
  end

  describe '#last_play_at' do
    it 'Should return the correct last_play_at' do
      last_play_at = @game.last_play_at

      expect(last_play_at).to eql '2023-04-13'
    end
  end

  describe '#published_date' do
    it 'Should return the correct published_date' do
      published_date = @game.published_date

      expect(published_date).to eql '2020-05-14'
    end
  end

  describe '#can_be_archived?' do
    it 'Should return true' do
      can_be_archived = @game.can_be_archived?

      expect(can_be_archived).to be false
    end
  end
end
