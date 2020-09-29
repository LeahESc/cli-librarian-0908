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
        print_books_by_author(@f_name, @l_name)
    
        puts ""
        prompt
        input = gets.strip 
        if input.to_i > 0 && input.to_i <= Book.find_by_author.count
                book = Book.find_by_author(@f_name, @l_name)[input.to_i - 1]
                API.get_book(book)
                print_book_details(book)
        binding.pry
        while input != "exit"
            if input == @f_name || @l_name

            elsif input.to_i > 0 && input.to_i <= Book.find_by_author.count
                book = Book.find_by_author(@f_name, @l_name)[input.to_i - 1]
                API.get_book(book)
                print_book_details(book)
            else
                puts "I'm sorry, I couldn't understand that. Would you like to try again? Try typing the number of one of the books listed to see more information."
                puts "Or, if you'd like to exit, type 'Goodbye Marian'"
            end
         end  
    end

    def print_books_by_author(f_name, l_name)
        @titles = Book.find_by_author(@f_name, @l_name)
        #  binding.pry 
            @titles.each.with_index(1) do |t,i|
                puts "#{i}. #{t.gsub(/\w+/){|word| word.capitalize}}"
            end
        end

    def prompt 
        puts "To learn more about a particular book, please type the number listed next to the title." 
        puts "If you'd like to search for books by a different author, please type the author's first and last name."
        puts "To exit, type 'Goodbye Marian'"  
        puts ""
    end

    def print_book_details(book)
        puts "#{book.title}"
        puts "#{book.first_year_published}"
        puts "#{book.first_sentence}"
        puts "#{book.subject}"
    end

end 