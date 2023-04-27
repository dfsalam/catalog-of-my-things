require_relative './modules/app'
def display_menu
  puts "  \nSelect an option: "
  puts "
    1- List all books
    2- List all music albums
    3- List of games
    4- List all genres
    5- List all labels
    6- List all authors
    7- Add a book
    8- Add a music album
    9- Add a game
    10- Exit
    \n"
end
ACTIONS = {
  1 => :list_all_books,
  2 => :list_all_music,
  3 => :list_all_games,
  4 => :list_all_genres,
  5 => :list_all_labels,
  6 => :list_all_authors,
  7 => :add_book,
  8 => :add_music,
  9 => :add_game
}.freeze

def main
  puts "\n=========================================================
    =======Welcome to Catalog of my things======
========================================================="
  app = App.new
  choice = 0
  while choice != 10
    display_menu
    choice = gets.chomp.to_i
    if choice == 10
      puts 'Thank you for using this app!'
      exit
    end
    method_name = ACTIONS[choice]
    if method_name.nil?
      puts "\nYour choice is incorrect. Must between 1-10. Please try again...\n\n"
    else
      method_tocall = app.method(method_name)
      method_tocall.call
    end
  end
end
main
