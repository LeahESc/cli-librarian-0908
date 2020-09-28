require 'pry'

class API 

    def self.get_books(f_name, l_name)
        url = "http://openlibrary.org/search.json?author=#{f_name}+#{(l_name)}"
        uri =URI(url)
        response =Net::HTTP.get(uri)
        books =JSON.parse(response)["docs"]
        binding.pry
    end
end 
