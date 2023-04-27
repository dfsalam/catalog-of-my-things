require_relative '../classes/game'
require_relative '../classes/author'
require 'json'
module GameModule
  DB_GAMES = './db/games.json'.freeze
  DB_AUTHORS = './db/authors.json'.freeze

  def list_all_games
    puts "\n============ GAMES LIST =============\n\n"
    if @games.empty?
      puts 'Game list is empty...'
    else
      @games.each do |game|
        puts "
       ---------------------------------------------------
       | Multiplayer: #{game.multiplayer}
       | Published date: #{game.published_date}
       | Last Play at: #{game.last_play_at}
       ---------------------------------------------------"
      end
    end
    puts "\n"
  end

  def add_game
    # GAME
    puts "\n"
    puts 'Please provide the information about the game :'
    print 'Multilayer (Yes or No): '
    multi_player = gets.chomp
    print 'Publish Date (Ex: 2023-04-13) : '
    published_date = gets.chomp
    print 'Last Play Date (Ex: 2023-04-13): '
    last_play_date = gets.chomp
    new_game = Game.new(multi_player, last_play_date, published_date)
    @games << new_game

    # AUTHOR
    puts "\n"
    puts 'Please provide these information about the author:'
    print 'First name : '
    first_name = gets.chomp
    print 'Last name : '
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    @authors << new_author
    preserve_game
    puts "\nGame created successfully"
  end

  def preserve_game
    # GAMES
    game_objects = []
    @games.each do |game|
      game_objects << { id: game.id, multi_player: game.multiplayer, last_play_date: game.last_play_at,
                        published_date: game.published_date }
    end
    File.write(DB_GAMES, game_objects.to_json)
    # AUTHOR
    author_objects = []
    @authors.each do |author|
      author_objects << { id: author.id, first_name: author.first_name, last_name: author.last_name }
    end
    File.write(DB_AUTHORS, author_objects.to_json)
  end

  def load_games
    games = []
    if File.exist?(DB_GAMES) && !File.empty?(DB_GAMES)
      data = JSON.parse(File.read(DB_GAMES))
      data.each do |game|
        new_game = Game.new(game['multi_player'], game['last_play_date'], game['published_date'])
        new_game.id = game['id']
        games << new_game
      end
    end
    games
  end
end
