require 'pry'
class Book
    attr_accessor :title, :l_name, :f_name, :first_sentence, :publish_date, :subject
    @@all = [] 

    def initialize(attrs) 
        # binding.pry
        attrs.each {|k, v| self.send(("#{k}="), v)}
        @@all << self
    end 
    
    def save 
        @@all << self 
    end 
    def self.all
        @@all
    end 

    def self.find_by_author(f_name, l_name)
        # binding.pry
       self.all.select{|b| b.f_name == f_name && b.l_name == l_name}
    end

end 
