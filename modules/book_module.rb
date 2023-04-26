require_relative '../classes/label'
require_relative '../classes/book'

module BookListing
  def list_all_books
    if @books.empty?
      puts "
      ----------------------
      | No books in catalog
      ----------------------"
    else
      @books.each do |book|
        puts "
       ---------------------------------------------------
       | Title: #{book.label.title}
       | Publisher: #{book.publisher}
       | Published date: #{book.published_date}
       | Color: #{book.label.color}
       | Cover state: #{book.cover_state}
       ---------------------------------------------------"
      end
    end
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    print 'Published date: '
    published_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state (IS good or bad?): '
    cover_state = gets.chomp
    label = Label.new(title, color)
    book = Book.new(published_date, publisher, cover_state)
    label.add_item(book)
    @books << book
    @labels << label
  end

  def list_all_labels
    if @labels.empty?
      puts "
      ----------------------
      | No labels in catalog
      ----------------------"
    else
      @labels.each do |label|
        puts "
      ---------------------------------------------------
      | ID: #{label.id}
      | Title: #{label.title}
      | Color: #{label.color}
      ---------------------------------------------------"
      end
    end
  end
end
