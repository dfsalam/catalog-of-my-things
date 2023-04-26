require_relative '../classes/author'
require 'json'
module AuthorModule
    DB = './db/authors.json'

    def list_all_authors
        puts "\n"
        if @authors.empty?
          puts 'Author list is empty.'
        else
          @authors.each_with_index do |author, index|
            puts "#{index})  ID: #{author.id}, First name: #{author.first_name}, Last name: #{author.last_name}"
          end
        end
        puts "\n"
    end
    
    def add_author
        puts "\n"
        puts 'Please provide these information :'
        print 'First name : '
        first_name = gets.chomp
        print 'Last name : '
        last_name = gets.chomp
        new_author = Author.new(first_name,last_name)
        @authors << new_author
        puts 'Author created successfully'
        preseve_author
        puts "\n"
    end

    def preseve_author
        author_objects = []
        @authors.each { |author| author_objects << { id: author.id,first_name: author.first_name, last_name: author.last_name } }
        File.write(DB, author_objects.to_json)
    end

    def load_authors
        authors = []
        if File.exist?(DB) && !File.empty?(DB)
          data = JSON.parse(File.read(DB))
          data.each do |author| 
            new_author = Author.new(author['first_name'], author['last_name'])
            new_author.id = author['id']
            authors <<  new_author
          end
        end
        authors
      end
  end