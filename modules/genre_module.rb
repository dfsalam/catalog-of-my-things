module GenreModule
  def list_all_genres
    if @genres.empty?
      puts "
      ----------------------
      | No genres in catalog
      ----------------------"
    else
      puts '--------Genres--------'
      @genres.each do |genre|
        puts "
       ---------------------------------------------------
       | Name: #{genre.genre_name}
       | Id: #{genre.id}
       ---------------------------------------------------"
      end
    end
  end

  def verify_genre(genre)
    @genres.each do |item|
      return item if item.genre_name == genre
    end
    nil
  end

  # This is optional because I think the genre is created when an album, game, or book is created"
  def add_genre
    puts 'Please enter the genre name.'
    name = gets.chomp
    genre_item = verify_genre(name)
    if genre_item.nil?
      create_genre(name, nil)
    else
      puts "The genre #{name} already exists."
    end
  end

  def create_genre(genre, id)
    new_genre = Genre.new(genre)
    new_genre.id = id unless id.nil?
    temp_items = []
    @music.each do |album|
      temp_items.push(album) if album.genre.genre_name == genre && !temp_items.include?(album)
      new_genre.items = temp_items
    end
    @genres.push(new_genre)
    save_genre_data
  end

  def load_genre_data
    genre_json = 'db/genre.json'
    return [] unless File.exist?(genre_json)

    genre_data = JSON.parse(File.read(genre_json))
    genre_data.each do |genre|
      create_genre(genre['Name'], genre['Id']) if genre['Items'].nil?
    end
  end

  def save_genre_data
    genre_json = []
    temp = {}
    @genres.each do |genre|
      next if genre.nil?

      items = save_genre_items(genre)
      temp = { Name: genre.genre_name, Id: genre.id, Items: items }
      genre_json.push(temp)
    end
    File.write('db/genre.json', JSON.generate(genre_json))
  end

  def save_genre_items(genre)
    output = []
    genre.items.each do |item|
      output.push(item.id)
    end
    output
  end
end
