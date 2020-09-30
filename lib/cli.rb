class CLI 

    def run
        hello
        menu
        goodbye
    end

    def menu
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
            menu
        end
    end

    def book_prompt
        puts "To learn more about a book, type the number listed next to a title".green.bold
        puts ""
    end

    def author_prompt
        puts ""
        puts "To search by author, type an author's first and last name. To exit the library, type 'exit'".green.bold 
        puts ""
    end

    def author_2_prompt
        puts "Would you like to search for another author?".green.bold
    end

    def menu_prompt
        puts "If you'd like to go back to the main menu, type 'menu'".green.bold 
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
            puts "I'm sorry, I couldn't understand that. To see the list of book titles again type 'list'. To go back to the main menu, type 'menu'.".green.bold
            list   
        end  
    end 

    def book_input
        @book_input = gets.strip.downcase
    end

    def list 
        input = gets.strip.downcase
        if input == "list"
            print_titles_by_author(@f_name, @l_name)
            book_prompt
            menu_prompt 
        end
        book_input
        while @book_input != "menu"
            if @book_input.to_i > 0 
                book_selection
                book_prompt
                menu_prompt
                book_input
            else 
                puts "Hm, I didn't understand that. Let's go back to the main menu".green.bold
            end
        end
    end

    def print_book_details(book)
        puts ""
        puts "Title:".green.bold +  " #{book.title}"
        puts "First year published:".green.bold + " #{book.publish_date}"
        puts "First sentence:".green.bold + " #{book.first_sentence.join(" ")}" if book.first_sentence != nil
        puts "Subject(s):".green.bold + " #{book.subject.join("\n")}" if book.subject != nil
    end

    def invalid
        puts "I'm sorry, I couldn't understand that. Would you like to try again?".green.bold
        puts ""
    end

    def goodbye
        puts "Goodbye! Thanks for stopping by!".green.bold
        puts ""
    end

    def hello
        puts "" 
        puts "               Hello, I'm Marian the Librarian! Welcome to my library!".green.bold 
        puts "" 
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