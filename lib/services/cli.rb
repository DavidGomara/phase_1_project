class Cli
    def start
        main_menu
        main_menu_input
        more_jokes
    end
    
    def main_menu
        puts '--------------------'
        puts 'Welcome to the Chuck Norris Joke Generator'
        sleep (1)
        puts '--------------------'
        puts 'For a random joke'
        puts 'Enter: 1'
        sleep (1)
        puts '--------------------'
        puts 'For Chuck Norris joke categories'
        puts 'Enter: 2'
    end 
    
    def main_menu_input
        input = gets.chomp
        if input.to_i == 1
            Api.load_data("random")
            puts Jokes.all.select{ |instance| instance.category == "random" } .sort_by!{ |instance| instance.value }.last.joke
        elsif input.to_i == 2
            if Categories.all.count > 2
                categories_menu
                category_input
            else 
            Api.load_data("categories")
            categories_menu
            category_input
            end
        elsif input == "exit"
            exit
        else
            puts 'Please make sure you enter the number alone. Thank You.'
            main_menu_input
        end 
    end 
    
    def categories_menu
        puts '--------------------'
            Categories.all.each do |category| 
                sleep(1)
                puts "#{category.index}. #{category.name}"
                puts '--------------------'
            end 
            puts "Enter the number of the category you want to hear a joke about."
    end
    
    def category_input
        input = gets.chomp
        if input == "exit"
            exit
        elsif input.to_i < 1
            puts "Make sure that the number you entered is associated with a category."
            category_input
        elsif input.to_i == 5
            puts "TTTHHHIIISSS,, IISSSS A SSCCHHHOOLLL!!!"
            puts "Please refrain from selecting explicit."
        elsif input.to_i < Categories.all.count + 1
        value = Categories.all.find{ |instance| instance.index == input.to_i }.name
        Api.load_data("search?query=#{value}")
        puts Jokes.all.select{ |instance| instance.category.include?(value)  } .sample.joke
        elsif input.to_i > Categories.all.count
            puts "Make sure that the number you entered is associated with a category."
            category_input
        end 
    end 
    
    def more_jokes
        puts '--------------------'
        puts "Would you like to read another joke. Enter y for yes, n for no."
        input = gets.chomp
        if input.downcase == "y"
            start
        elsif input.downcase == "n"
            exit
        elsif input == "exit"
            exit
        else 
            puts "Make sure to select one of the options."
            more_jokes
        end 
    end 
end 
