require 'pry'

class CLI 

    def menu
        puts "Hello, I'm Marian, the Librarian."
        puts ""
        puts "----------------------------------"
        # book illustration 
        puts "What type of book are you looking for? Type the name of the author to see a list of their books. To exit, type 'Goobye Marian'." 
        puts ""
        @genre = gets.strip.downcase

    end

    def list_books_by_genre(genre)
end 