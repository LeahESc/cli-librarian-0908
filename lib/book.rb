require 'pry'
class Book
    attr_accessor :title, :l_name, :f_name, :isbn, :first_sentence, :publish_date
    @@all = [] 

    def iniitialize(title: nil, l_name: nil, f_name: nil, first_sentence: nil, publish_date: nil ) 
        @title = title
        @f_name = f_name
        @l_name = l_name
        @first_sentence = first_sentence
        @publish_date = publish_date
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def self.find_by_author(f_name, l_name)
        self.all.select{|b| b.f_name == f_name && b.l_name == l_name}
        
    end
    
end 
