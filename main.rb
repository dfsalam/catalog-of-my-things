require_relative './modules/app'
def display_menu
    puts "  \nSelect an option: "
    puts "
    1- List all books
    2- List all music albums
    3- List all movies
    4- List of games
    5- List all genres 
    6- List all labels
    7- List all authors 
    8- List all sources 
    9- Add a book
    10- Add a music album
    11- Add a movie
    12- Add a game
    13- Exit
    \n"
end
ACTIONS = {
  1 => :list_all_books,
  2 => :list_all_music,
  3 => :list_all_movies,
  4 => :list_all_games,
  5 => :list_all_genres,
  6 => :list_all_labels,
  7 => :list_all_authors,
  8 => :list_all_sources,
  9 => :add_book,
  10 => :add_music,
  11 => :add_movie,
  12 => :add_game,
  13 => :Exit,
}.freeze

def main
    puts "\n=========================================================
    =======Welcome to Catalog of my things====== 
========================================================="
  app = App.new
  choice = 0
  while choice != 13
    display_menu
    choice = gets.chomp.to_i
    if choice == 13
      # Preserve the data
    #   app.preseve_data
      puts 'Thank you for using this app!'
      exit
    end
    method_name = ACTIONS[choice]
    if method_name.nil?
      puts "\nYour choice is incorrect. Must between 1-13. Please try again...\n\n"
    else
      method_tocall = app.method(method_name)
      method_tocall.call
    end
  end
end
main




