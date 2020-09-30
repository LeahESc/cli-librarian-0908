class CLI 

    def run
        puts ""
        puts "Hello, I'm Marian the Librarian! Welcome to my library!"
        puts ""
        puts "----------------------------------" 
        menu_loop
        goodbye
    end

    def menu_loop
        author_prompt
        input = gets.strip.downcase.split(" ")
        @f_name = input[0]
        @l_name = input[1]
        API.get_books(@f_name, @l_name)
        while @f_name != "exit"
            if @l_name == nil
                invalid
            elsif Book.find_by_author(@f_name, @l_name).count > 0
                print_titles_by_author(@f_name, @l_name)
                puts ""
                book_prompt
                @book_input = gets.strip.downcase
                book_selection
            else
                invalid
            end
            menu_loop
        end
    end

    def book_prompt
        puts "To learn more about a book, type the number listed next to a title"
        puts ""
    end

    def author_prompt
        puts ""
        puts "To search by author, type an author's first and last name. To exit the library, type 'exit'" 
        puts ""
    end

    def print_titles_by_author(f_name, l_name)
        titles = Book.find_by_author(@f_name, @l_name)
        titles.each.with_index(1) do |t,i|
            puts "#{i}. #{t.title.gsub(/\w+/){|word| word.capitalize}}"
        end
    end

    def book_selection
        if  @book_input.to_i > 0 && @book_input.to_i <= Book.find_by_author(@f_name, @l_name).count
            book = Book.find_by_author(@f_name, @l_name)[@book_input.to_i - 1]
            # binding.pry 
            print_book_details(book)
            puts ""
        else
            puts "I'm sorry, I couldn't understand that. To see the list of book titles again type 'list'. To go back to the main menu, type 'menu'."
            list   
        end  
    end 

    def list 
        input = gets.strip.downcase
        if input == "list"
            print_titles_by_author(@f_name, @l_name)
            puts ""
            book_prompt
            puts "If you'd like to go back to the main menu, type 'menu'"  
        end
        @book_input = gets.strip.downcase
        while @book_input != "menu"
            book_selection
        end
    end

    def print_book_details(book)
        puts "Title: #{book.title}"
        puts "First year published: #{book.publish_date}"
        puts "First sentence: #{book.first_sentence.join(" ")}" if book.first_sentence != nil
        puts "Subject(s): #{book.subject.join("\n")}" if book.subject != nil
    end

    def invalid
        puts "I'm sorry, I couldn't understand that. Would you like to try again?" 
        puts ""
    end

    def goodbye
        puts "Goodbye! Thanks for stopping by!"
    end
end 