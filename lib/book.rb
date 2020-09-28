require 'pry'
class Book
    attr_accessor :title, :l_name, :f_name, :first_sentence, :publish_date
    @@all = [] 

    def initialize(attrs) 
        # binding.pry
        attrs.each {|k, v| self.send(("#{k}="), v)}
        # @title = title
        # @f_name = f_name
        # @l_name = l_name
        # @first_sentence = first_sentence
        # @publish_date = publish_date
    end 
    
    def save 
        @@all << self 
    end 
    def self.all
        @@all
    end 

    def self.find_by_author(f_name, l_name)
       list = self.all.select{|b| b.f_name == f_name && b.l_name == l_name}
        list.each.with_index(1) do |b, i|
        puts "#{i}. #{b.title}"
        end
    end

    # def self.find_by_title(title)
    #     title_list = self.all.select{|b| b.title == title}
        

    # def self.find_or_create_by(title)
    #     n = self.title = title
    #     if !n 
    #         self.new

    
end 
