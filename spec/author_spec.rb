require_relative '../classes/author'

describe Author do
  before :each do
    @author = Author.new('Kender', 'Romain')
  end

  describe '#new' do
    it 'Should return a Author object' do
      expect(@author).to be_an_instance_of Author
    end
  end

  describe '#first_name' do
    it 'Should return the correct first_name' do
      first_name = @author.first_name

      expect(first_name).to eql 'Kender'
    end
  end

  describe '#last_name' do
    it 'Should return the correct last_name' do
      last_name = @author.last_name

      expect(last_name).to eql 'Romain'
    end
  end

  describe '#add_item' do
    it 'Should return an empty array' do
      game = Game.new('Multi-player', '2023-04-13', '2020-05-14')

      @author.add_item(game)
      items = @author.items

      expect(items).to be_an_instance_of Array
      expect(items.include?(game)).to be true
    end
  end
end
