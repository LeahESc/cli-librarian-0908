require 'pry'

class API 

    def self.get_books(f_name,l_name)
        url = "http://openlibrary.org/search.json?author=#{f_name}+#{l_name}"
        uri =URI(url)
        response =Net::HTTP.get(uri)
        books = JSON.parse(response)["docs"].each do |b|
        Book.new(title: b["title"], f_name: f_name, l_name: l_name) 
        end
    end

    def self.get_book(book) 
        # binding.pry
        url = "http://openlibrary.org/search.json?title=#{book}"
        uri =URI(url)
        response =Net::HTTP.get(uri)
        book_info = JSON.parse(response)["docs"][0]
        # binding.pry
        title = book_info["title"]
        publish_date = book_info["first_publish_year"]
        first_sentence = book_info["first_sentence"]
        subject = book_info["subject"]
    end 
        
end 
