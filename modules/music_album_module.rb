require 'json'
require_relative '../classes/genre'
require_relative '../classes/music_album'
require_relative './genre_module'
module Music
  include GenreModule
  def list_all_music
    if @music.empty?
      puts 'There are no albums added. '
    else
      puts '--------Music Albums--------'
      @music.each do |music|
        print "Date: #{music.published_date}, Genre: #{music.genre.genre_name}, "
        print "Is in Spotify?: #{music.on_spotify}, Id: #{music.id} \n"
      end
    end
  end

  def add_music
    puts 'Please enter the published date (YYYY-MM-DD)'
    date = gets.chomp
    print 'Is on spotify? [y/n]: '
    spotify = gets.chomp
    puts 'What is the genre?'
    genre = gets.chomp
    create_music(date, genre, spotify, nil)
    puts 'Album added successfully!!'
  end

  def create_music(date, genre, spotify, id)
    temp = %w[y Y].include?(spotify)
    new_album = MusicAlbum.new(date, genre, on_spotify: temp)
    new_album.id = id unless id.nil?
    @music.push(new_album)
    genre_item = verify_genre(genre)
    if genre_item.nil?
      new_genre = Genre.new(genre)
      new_genre.add_item(new_album)
      @genres.push(new_genre)
    else
      genre_item.add_item(new_album)
    end
    save_genre_data
    save_music_data
  end

  def load_music_data
    music_json = 'DB/music.json'
    return [] unless File.exist?(music_json)

    music_data = JSON.parse(File.read(music_json))
    music_data.each do |music|
      create_music(music['Date'], music['Genre'], music['Spotify'], music['Id'])
    end
  end

  def save_music_data
    music_json = []
    temp = {}
    @music.each do |music|
      next if music.nil?

      temp = { Date: music.published_date, Genre: music.genre.genre_name, Spotify: music.on_spotify, Id: music.id }
      music_json.push(temp)
    end
    File.write('DB/music.json', JSON.generate(music_json))
  end
end
