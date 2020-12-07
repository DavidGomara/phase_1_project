class Categories
    
    attr_accessor :name, :index
    
    @@all = []
    
    def initialize(name, index)
        @name = name
        @index = index
        @@all << self
    end 
    
    def self.all
        @@all
    end 
    
end 