class CLI 

    def run
        # binding.pry
        # binding.pry
        puts ""
        puts "Hello, I'm Marian the Librarian! Welcome to my library!"
        puts ""
        puts "----------------------------------"
        # binding.pry 
        menu_loop
        # book illustration
        # puts "To search for a list of books from an author, type the author's first and last name.To exit, type 'exit'." 
        # puts ""
        # get_input
        # while @input[0] != "exit"
            # set_input_to_name
            # if Book.find_by_author(@f_name, @l_name).count > 0
            #     print_titles_by_author(@f_name, @l_name)
            #     puts ""
            #     book_prompt
            #     book_selection
                
            # elsif Book.find_by_author(@f_name, @l_name).count == 0
            #     puts "I'm sorry, I couldn't understand that. Would you like to try again?"
            #     author_prompt
            # else
            #     puts "I'm sorry, I couldn't understand that. Would you like to try again?" 
            #     puts ""
            # end
            # author_prompt
            # input = gets.strip.downcase.split(" ")
            # API.get_books(@f_name, @l_name)     
        # end 
    end

    def menu_loop
        puts "To search for a list of books from an author, type the author's first and last name.To exit, type 'exit'." 
        puts ""
        binding.pry
        get_input
        while @input[0] != "exit"
            set_input_to_name
            if Book.find_by_author(@f_name, @l_name).count > 0
                print_titles_by_author(@f_name, @l_name)
                puts ""
                book_prompt
                book_selection
                
            elsif Book.find_by_author(@f_name, @l_name).count == 0
                puts "I'm sorry, I couldn't understand that. Would you like to try again?"
                author_prompt
            else
                puts "I'm sorry, I couldn't understand that. Would you like to try again?" 
                puts ""
            end
            author_prompt
            input = gets.strip.downcase.split(" ")
            API.get_books(@f_name, @l_name)  
        end
        goodbye
    end


    def print_titles_by_author(f_name, l_name)
        titles = Book.find_by_author(@f_name, @l_name)
        titles.each.with_index(1) do |t,i|
            puts "#{i}. #{t.title.gsub(/\w+/){|word| word.capitalize}}"
        end
    end

    def book_prompt
        puts "To learn more about a book, type the number listed next to a title"
        puts ""
    end

    def author_prompt
        puts "To search by author, type an author's first and last name."
        puts "To exit, type 'exit'"  
        puts ""
    end

    def book_selection
        input = gets.strip.downcase
        while input != "menu"
            if input[0].to_i > 0 && input[0].to_i <= Book.find_by_author(@f_name, @l_name).count
                book = Book.find_by_author(@f_name, @l_name)[input[0].to_i - 1]
                print_book_details(book)
                puts ""
                puts "Can I help you find anything else?"
                puts "To got back to the main menu, type 'menu'"
            elsif 
                puts "I'm sorry, I couldn't understand that. To see the list of book titles again type 'list'." 
                print_titles_by_author(@f_name, @l_name)
            end
        end
        menu_loop 
    end 

    def list 
        get_input
        while @input != menu
            if @input == "list"
            print_titles_by_author(@f_name, @l_name)
            else
            puts "I'm sorry, I couldn't understand that. To go back to the main menu, type 'menu'."
            end
            menu_loop
        end
    end

    def get_input 
        @input = gets.strip.downcase.split(" ")
    end

    def set_input_to_name
        @input[0] = @f_name 
        @input[1] = @l_name
    end

    def print_book_details(book)
        puts "Title: #{book.title}"
        puts "First year published: #{book.publish_date}"
        puts "First sentence: #{book.first_sentence.join(" ")}" 
        puts "Subject(s): #{book.subject.join("\n")}"
    end

    def goodbye
        puts "Goodbye! Thanks for stopping by!"
    end
end 