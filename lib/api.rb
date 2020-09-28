require 'pry'

class API 

    def self.get_books(f_name,l_name)
        url = "http://openlibrary.org/search.json?author=#{f_name}+#{l_name}"
        uri =URI(url)
        response =Net::HTTP.get(uri)
        books = JSON.parse(response)["docs"].each do |b|
        Book.new(title: b["title"].downcase, f_name: f_name, l_name: l_name, first_sentence: b["first_sentence"], publish_date: b["first_publish_year"]) 
        # if !new_book.title 
        # new_book.save
        # binding.pry
        # end 
        end
    end
end 
