require_relative '../classes/author'
require 'json'
module AuthorModule
  DB = './db/authors.json'.freeze

  def list_all_authors
    puts "\n============ AUTHORS LIST =============\n\n"
    if @authors.empty?
      puts 'Author list is empty...'
    else
      @authors.each_with_index do |author, index|
        puts "#{index})  ID: #{author.id}, First name: #{author.first_name}, Last name: #{author.last_name}"
      end
    end
    puts "\n"
  end

  def load_authors
    authors = []
    if File.exist?(DB) && !File.empty?(DB)
      data = JSON.parse(File.read(DB))
      data.each do |author|
        new_author = Author.new(author['first_name'], author['last_name'])
        new_author.id = author['id']
        authors << new_author
      end
    end
    authors
  end
end
