require 'pry'
class Book
    attr_accessor :title, :l_name, :f_name, :isbn, :genre
    @@all = [] 

    def iniitialize 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    
end 
