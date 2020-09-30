class CLI 

    def run
        hello_library
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
            if !@l_name 
                invalid
            elsif Book.find_by_author(@f_name, @l_name).count > 0
                print_titles_by_author(@f_name, @l_name)
                book_prompt
                @book_input = gets.strip.downcase
                book_selection
                author_2_prompt
            else
                invalid
            end
            menu_loop
        end
    end

    def book_prompt
        puts "To learn more about a book, type the number listed next to a title".green
        puts ""
    end

    def author_prompt
        puts ""
        puts "To search by author, type an author's first and last name. To exit the library, type 'exit'".green.bold 
        puts ""
    end

    def author_2_prompt
        puts "Would you like to search for another author?".green
    end

    def print_titles_by_author(f_name, l_name)
        titles = Book.find_by_author(@f_name, @l_name)
        titles.each.with_index(1) do |t,i|
            puts "#{i}. #{t.title.gsub(/\w+/){|word| word.capitalize}}
                                                                    "
        end
    end

    def book_selection
        if  @book_input.to_i > 0 && @book_input.to_i <= Book.find_by_author(@f_name, @l_name).count
            book = Book.find_by_author(@f_name, @l_name)[@book_input.to_i - 1]
            print_book_details(book)
            puts ""
        else
            puts "I'm sorry, I couldn't understand that. To see the list of book titles again type 'list'. To go back to the main menu, type 'menu'.".green
            list   
        end  
    end 

    def list 
        input = gets.strip.downcase
        if input == "list"
            print_titles_by_author(@f_name, @l_name)
            puts ""
            book_prompt
            puts "If you'd like to go back to the main menu, type 'menu'".green  
        end
        more_books
    end
       
    def more_books
    @book_input = gets.strip.downcase
        while @book_input != "menu"
            if @book_input.to_i > 0 
                book_selection
                book_prompt
                puts "If you'd like to go back to the main menu, type 'menu'".green
                @book_input = gets.strip.downcase 
            else 
                puts "Hm, I didn't understand that. Let's go back to the main menu".green
            end
        end
    end

    def print_book_details(book)
        puts "Title:".green.bold +  " #{book.title}"
        puts ""
        puts "First year published:".green.bold + " #{book.publish_date}"
        puts ""
        puts "First sentence:".green.bold + " #{book.first_sentence.join(" ")}" if book.first_sentence != nil
        puts ""
        puts "Subject(s):".green.bold + " #{book.subject.join("\n")}" if book.subject != nil
    end

    def invalid
        puts "I'm sorry, I couldn't understand that. Would you like to try again?".green
        puts ""
    end

    def goodbye
        puts "Goodbye! Thanks for stopping by!".green
    end

    def hello_library
        puts "" 
        puts "               Hello, I'm Marian the Librarian! Welcome to my library!".green.bold  
        puts "    (,         ,(,   .  .*(/*. .. .. ,(,         ,(,   ..  .*/(*                    
        *****/ .                         .##( .                      .   (*****    
        ///*/(                             (.                            /((//(    
        ///((/.                            (                             ,((//(    
        ///((*        Welcome              (                            .,/(//(    
        ///(/,         to my               (                            .,*///(    
        ///(/,.       library!             (                             ,*///(    
        ////*,                             (                            .,,///(    
        ////*,      Let's find a           (                             ,,///(    
        ////*,         book!               (                             ,,///(    
        ////*,.                            (                             ,,///(    
        ////*,.                            (                             ,,///(    
        ////*,.                            (                             ,,///(    
        ////*,                             (                             ,,///(    
        /////,.                            (                             ,*///(    
        /////*                             (                             ,*///(    
        ///((/.                         .  (                             ,////(    
        ///(((                             ( .                           *((//(    
        ///(/(      .../(*,,((/,**/((//((  (  ((/(((/*,*/(/,,/(*. .      (((//(    
        ////,,,/(/*,((//(#(/(##/////////#/#(((//////////##(/(#(*/(/,*((*,,/(//(    
        ////////////////////////////////#(((((////////////////////////////////("
    end
end 