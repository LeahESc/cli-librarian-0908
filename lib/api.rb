require 'pry'

class API 

    def self.get_books(f_name,l_name)
        url = "http://openlibrary.org/search.json?author=#{f_name}+#{l_name}"
        uri =URI(url)
        response =Net::HTTP.get(uri)
        books = JSON.parse(response)["docs"].each do |b|
        Book.new(title: b["title"], f_name: f_name, l_name: l_name) 
        # if !new_book.title 
        # new_book.save
        # binding.pry
        # end 
        end
    end

    def self.get_book(book) 
        # url = "http://openlibrary.org/search.json?title=#{book.title.gsub(/\w+/){|word| word.capitalize}"
        # uri =URI(url)
        # response =Net::HTTP.get(uri)
        # book_info = JSON.parse(response)["docs"][0]
        # publish_date = book_info["first_publish_year"]
        # first_sentence = book_info["first_sentence"]
        # subject = book_info["subject"]
    end 
        
end 
