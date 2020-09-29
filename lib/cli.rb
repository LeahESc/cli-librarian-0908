class CLI 

    def run
        # binding.pry
        # binding.pry
        puts ""
        puts "Hello, I'm Marian the Librarian! Welcome to my library!"
        puts ""
        puts "----------------------------------" 
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
        author_prompt
        input = gets.strip.downcase.split(" ")
        @f_name = input[0]
        @l_name = input[1]
        API.get_books(@f_name, @l_name)
        while input[0] != "exit"
            if Book.find_by_author(@f_name, @l_name).count > 0
                print_titles_by_author(@f_name, @l_name)
                puts ""
                book_prompt
                book_selection
            else
                puts "I'm sorry, I couldn't understand that. Would you like to try again?" 
                puts ""
            end
            puts "Would you like to search for books by a different author?"
            menu_loop 
        end
        goodbye
    end

    def book_prompt
        puts "To learn more about a book, type the number listed next to a title"
        puts ""
    end

    def author_prompt
        puts ""
        puts "To search by author, type an author's first and last name. To exit, type 'exit'" 
        puts ""
    end

    def print_titles_by_author(f_name, l_name)
        titles = Book.find_by_author(@f_name, @l_name)
        titles.each.with_index(1) do |t,i|
            puts "#{i}. #{t.title.gsub(/\w+/){|word| word.capitalize}}"
        end
    end

    def book_selection
        input = gets.strip.downcase
        if input.to_i > 0 && input.to_i <= Book.find_by_author(@f_name, @l_name).count
            book = Book.find_by_author(@f_name, @l_name)[input[0].to_i - 1]
            print_book_details(book)
            puts ""
        else
            puts "I'm sorry, I couldn't understand that. To see the list of book titles again type 'list'. To go back to the main menu, type 'menu'."
            list
        end
    end 

    def list 
        input = gets.strip.downcase.split(" ")
        while input[0] != "menu"
            if @input[0] == "list"
            print_titles_by_author(@f_name, @l_name)
            else
            puts "I'm sorry, I couldn't understand that. Would you like to try again?"
            end
        end
        menu_loop
    end

    def print_book_details(book)
        puts "Title: #{book.title}"
        puts "First year published: #{book.publish_date}"
        puts "First sentence: #{book.first_sentence.join(" ")}" if book.first_sentence != nil
        puts "Subject(s): #{book.subject.join("\n")}" if book.subject != nil
    end

    def goodbye
        puts "Goodbye! Thanks for stopping by!"
    end
end 