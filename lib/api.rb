require 'pry'

class API 

    def self.get_books(f_name,l_name)
        url = "http://openlibrary.org/search.json?author=#{f_name}+#{l_name}"
        uri =URI(url)
        response =Net::HTTP.get(uri)
        books = JSON.parse(response)["docs"]
        books.each do |b|
            if !Book.all.find{|book| book.title.downcase == b["title"].downcase}
             Book.new(title: b["title"], f_name: f_name, l_name: l_name, publish_date: b["first_publish_year"], first_sentence: b["first_sentence"], subject: b["subject"]) 
            end
        end
    end

    # def self.get_book(book) 
    #     # binding.pry
    #     url = "http://openlibrary.org/search.json?title=#{book}"
    #     uri =URI(url)
    #     response =Net::HTTP.get(uri)
    #     book_info = JSON.parse(response)["docs"][0]
    #     # binding.pry
    #     title = book_info["title"]
    #     publish_date = book_info["first_publish_year"]
    #     first_sentence = book_info["first_sentence"]
    #     subject = book_info["subject"]
    # end 
        
end 
