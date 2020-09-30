class Book
    attr_accessor :title, :l_name, :f_name, :first_sentence, :publish_date, :subject
    @@all = [] 

    def initialize(attrs)
        attrs.each {|k, v| self.send(("#{k}="), v)}
        @@all << self
    end 
   
    def self.all
        @@all
    end 

    def self.find_by_author(f_name, l_name)
       self.all.select{|b| b.f_name == f_name && b.l_name == l_name}
    end

end 
