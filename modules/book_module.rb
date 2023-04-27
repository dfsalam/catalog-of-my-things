require_relative '../classes/label'
require_relative '../classes/book'
require 'json'

module BookListing
  DB_BOOKS = './db/books.json'.freeze
  DB_LABELS = './db/labels.json'.freeze

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
       | Publisher: #{book.publisher}
       | Published date: #{book.published_date}
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
    print 'Please enter the published date (YYYY-MM-DD)'
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
    preserve_book
    puts 'Book added successfully!!'
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

  def preserve_book
    books_object = []

    @books.each do |book|
      books_object << { id: book.id, publisher: book.publisher, published_date: book.published_date,
                        cover_state: book.cover_state, archived: book.archived }
    end

    File.write(DB_BOOKS, books_object.to_json)

    labels_object = []
    @labels.each do |label|
      labels_object << { id: label.id, title: label.title, color: label.color }
    end
    File.write(DB_LABELS, labels_object.to_json)
  end

  def load_books
    books = []
    if File.exist?(DB_BOOKS) && !File.empty?(DB_BOOKS)
      books_object = JSON.parse(File.read(DB_BOOKS))
      books_object.each do |book|
        new_book = Book.new(book['published_date'], book['publisher'], book['cover_state'], archived: book['archived'])
        new_book.id = book['id']
        books << new_book
      end
    end
    books
  end

  def load_labels
    labels = []
    if File.exist?(DB_LABELS) && !File.empty?(DB_LABELS)
      labels_object = JSON.parse(File.read(DB_LABELS))
      labels_object.each do |label|
        new_label = Label.new(label['title'], label['color'])
        new_label.id = label['id']
        labels << new_label
      end
    end
    labels
  end
end
