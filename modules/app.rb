require_relative './book_module'

class App
    include BookListing
    def initialize()
        @books = []
    end
end