class Jokes
    
    attr_accessor :joke, :category, :value
    
    @@all = []
    
    def initialize(category, joke, value = 0)
        @value = value
        @joke = joke
        @category = category
        @@all << self
    end 
    
    def self.all
        @@all
    end 
    
end 