require 'pry'

class API 

    def self.get_books(l_name)
        url = http://openlibrary.org/search.json?author=(l_name)
        uri =URI(url)
        response =Net::HTTP.get(uri)
        books =JSON.parse(response)
        binding.pry
end 
