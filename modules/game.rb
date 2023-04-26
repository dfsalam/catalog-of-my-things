require_relative '../classes/game'
require_relative '../classes/author'
require 'json'
module GameModule
    DB = './db/games.json'

    def list_all_games
        puts "\n"
        if @games.empty?
          puts 'Game list is empty...'
        else
          puts "============ GAME LIST =============\n"
          @games.each_with_index do |game, index|
            puts "#{index})   Multiplayer: #{game.multiplayer}, Publish Date : #{game.published_date}, Last Play at : #{game.last_play_at}"
          end
        end
        puts "\n"
    end
    
    def initialize(multiplayer, last_play_at, published_date, archived: false)
        super(published_date, archived: archived)
        @multiplayer = multiplayer
        @last_play_at = last_play_at
      end
    def add_game
        # GAME
        puts "\n"
        puts 'Please provide the information about the game :'
        print 'Multilayer : '
        multi_player = gets.chomp
        print 'Publish Date (Ex: 2023-04-13) : '
        published_date = gets.chomp
        print 'Last Play Date (Ex: 2023-04-13): '
        last_play_date = gets.chomp
        new_game = Game.new(multi_player,last_play_date,published_date)
        @games << new_game

        # AUTHOR
        puts "\n"
        puts 'Please provide these information :'
        print 'First name : '
        first_name = gets.chomp
        print 'Last name : '
        last_name = gets.chomp
        new_author = Author.new(first_name,last_name)
        @authors << new_author
        puts 'Game created successfully'
        # preseve_game
        puts "\n"
    end

    def preseve_game
        game_objects = []
        @games.each { |game| game_objects << { id: game.id,first_name: game.first_name, last_name: game.last_name } }
        File.write(DB, game_objects.to_json)
    end

    def load_games
        games = []
        if File.exist?(DB) && !File.empty?(DB)
          data = JSON.parse(File.read(DB))
          data.each do |game| 
            new_game = game.new(game['first_name'], game['last_name'])
            new_game.id = game['id']
            games <<  new_game
          end
        end
        games
      end
  end