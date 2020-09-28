require 'pry'

class CLI 

    def run
        puts ""
        puts "Hello, I'm Marian the Librarian! Welcome to my library!"
        puts ""
        puts "----------------------------------"
        # book illustration 
        puts "To search for a list of books from an author, type the author's first and last name.To exit, type 'Goobye Marian'." 
        puts ""
        input_arr = gets.strip.downcase.split(" ")
        # while input_arr[0] != "exit"
        @f_name = input_arr[0]
        @l_name = input_arr[1]
        API.get_books(@f_name, @l_name)
        puts ""
        Book.find_by_author(@f_name, @l_name)
        # end
    end
end 