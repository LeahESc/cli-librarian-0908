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
        input = gets.strip.downcase.split(" ")
        while input[0] != "exit"
            @f_name = input[0]
            @l_name = input[1]
            API.get_books(@f_name, @l_name) 
                if input[0].to_i > 0 && input[0].to_i <= Book.find_by_author(@f_name, @l_name).count
                    book = Book.find_by_author(@f_name, @l_name)[input[0].to_i - 1]
                    print_book_details(book)
                    puts "Can I help you find anything else?"
                    author_prompt
                elsif Book.find_by_author(@f_name, @l_name).count > 0
                    # input[0] == f_name && input[1] == l_name
                    print_titles_by_author(@f_name, @l_name)
                    puts ""
                elsif Book.find_by_author(@f_name, @l_name).count == 0
                    puts "I'm sorry, I couldn't understand that. Would you like to try again?"
                    author_prompt
                else
                    puts "I'm sorry, I couldn't understand that. Would you like to try again?" 
                    puts ""
                end
                book_prompt
                author_prompt
                input = gets.strip.downcase.split(" ")
                @f_name = input[0]
                @l_name = input[1]
                API.get_books(@f_name, @l_name) 
                end
        # end  
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
        puts "To exit, type 'Goodbye Marian'"  
        puts ""
    end

    def print_book_details(book)
        puts "Title: #{book.title}"
        puts "First year published: #{book.publish_date}"
        puts "First sentence: #{book.first_sentence.join(" ")}" if != nil
        puts "Subject(s): #{book.subject.join("\n")}"
    end

    def exit
        puts "Goodbye! Thanks for stopping by!"
    end

    # def valid? 
    #     valid_books = Book.find_by_author(@f_name, @l_name) 
    #     # binding.pry
    #     if valid_books.count == 0
    #         puts "I'm sorry, I don't recognize that name. Would you like to try again?"
    #     end
    # end
end 