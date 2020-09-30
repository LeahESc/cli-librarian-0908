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
end 
