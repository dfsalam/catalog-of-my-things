require_relative '../classes/book'

describe Book do
  before :each do
    @book = Book.new('2022-03-12', 'Biruk', 'good')
  end

  describe '#new' do
    it 'should return a book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe 'it shoudld return the correct value for property' do
    it 'should return the correct published date' do
      published_date = @book.published_date
      expect(published_date).to eql '2022-03-12'
    end

    it 'should return the correct publisher' do
      publisher = @book.publisher
      expect(publisher).to eql 'Biruk'
    end

    it 'should return the correct cover state' do
      cover_state = @book.cover_state
      expect(cover_state).to eql 'good'
    end
  end

  describe '#can_be_archived?' do
    it 'should return false' do
      expect(@book.send(:can_be_archived?)).to be false
    end

    it 'should return true' do
      @book2 = Book.new('2022-03-12', 'John', 'bad')
      expect(@book2.send(:can_be_archived?)).to be true
    end

    it 'should return true' do
      @book3 = Book.new('1990-03-12', 'John', 'good')
      expect(@book3.send(:can_be_archived?)).to be true
    end
  end
end
