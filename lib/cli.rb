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
        # input = gets.strip.downcase.split(" ")
        # binding.pry
        # if input[0] == "exit"
        #     exit
        # else 
            # @f_name = input[0]
            # @l_name = input[1]
            # API.get_books(@f_name, @l_name)
            # puts ""
            # binding.pry
            # while Book.find_by_author(@f_name, @l_name).count == 0
            # if Book.find_by_author(@f_name,@l_name).count == 0
            #     prompt_one
            # else
            #     print_titles_by_author(@f_name, @l_name)
            
            #     puts ""
            #     prompt_two
                input = gets.strip.downcase.split(" ")
                @f_name = input[0]
                @l_name = input[1]
                API.get_books(@f_name, @l_name) if Book.find_by_author(@f_name, @l_name).count == 0
                # binding.pry
                while input != "exit"
                    if input[0].to_i > 0 && input.to_i <= Book.find_by_author(@f_name, @l_name).count
                        book = Book.find_by_author(@f_name, @l_name)[input[0].to_i - 1]
                        # API.get_book(book)
                        print_book_details(book)
                        prompt_two
                    elsif Book.find_by_author(@f_name, @l_name).count > 0
                        # input[0] == f_name && input[1] == l_name
                        print_titles_by_author(@f_name, @l_name)
                    else
                        puts "I'm sorry, I couldn't understand that. Would you like to try again? Try typing the number of one of the books listed to see more information."
                        puts ""
                    end
                    prompt_two
                    input = gets.strip.downcase.split(" ")
                    @f_name = input[0]
                    @l_name = input[1]
                    API.get_books(@f_name, @l_name) if Book.find_by_author(@f_name, @l_name).count == 0
                end
        #     end
        # end  
    end

    def print_titles_by_author(f_name, l_name)
        titles = Book.find_by_author(@f_name, @l_name)
         titles.each.with_index(1) do |t,i|
                puts "#{i}. #{t.title.gsub(/\w+/){|word| word.capitalize}}"
            end
    end

    def prompt_one
        puts "If you'd like to search for books by a different author, please type the author's first and last name."
    end

    def prompt_two 
        puts "To learn more about a particular book, please type the number listed next to the title." 
        puts "If you'd like to search for books by an author, please type the author's first and last name."
        puts "To exit, type 'Goodbye Marian'"  
        puts ""
    end

    def print_book_details(book)
        puts "Title: #{book.title}"
        puts "First year published: #{book.publish_date}"
        puts "First sentence: #{book.first_sentence.join(" ")}"
        puts "Subject(s): #{book.subject.join("\n")}"
    end

    def exit
        puts "Goodbye! Thanks for stopping by!"
    end

    def valid? 
        valid_books = Book.find_by_author(@f_name, @l_name) 
        # binding.pry
        if valid_books.count == 0
            puts "I'm sorry, I don't recognize that name. Would you like to try again?"
        end
    end
end 