require 'pry'

class CLI 

    def menu
        puts ""
        puts "Hello, I'm Marian the Librarian! Welcome to my library!"
        puts ""
        puts "----------------------------------"
        # book illustration 
        puts "To search for a list of books from an author, type the author's first and last name.To exit, type 'Goobye Marian'." 
        puts ""
        @f_name = gets.strip.downcase
        @l_name = gets.strip.downcase
        API.get_books(@f_name, @l_name)
    end
end 