class Api
    
    def self.base_url
        "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/"
    end 
    
    def self.load_data(url_specified)
        response = Unirest.get (base_url + url_specified),
        headers:{
        "X-RapidAPI-Host" => "matchilling-chuck-norris-jokes-v1.p.rapidapi.com",
        "X-RapidAPI-Key" => "690e0f4b6amshf2cafe345274319p16f1a9jsn419b717e2d67",
        "accept" => "application/json"
        }
        instances = response.body
        creating_instances(url_specified, instances)
    end 
    
    def self.creating_instances(selection, data)
        if selection == "random"
            counter = 1
            data.each do |key, value| 
               Jokes.new("random", "#{value}", counter) if key == "value" 
               counter += 1
            end 
           counter += 1
        elsif selection == "categories"
            counter = 1
           data.each do |element| 
               Categories.new(element, counter)
               counter += 1
            end
        elsif selection.include?("search?query=") ? true : false
            counter = 1
            data.each do |key, value|
                if key == "result"
                    value.each do |hashes|
                        hashes.each do |k, v|
                        if k == "value"
                            Jokes.new(selection, v, counter)
                            counter +=1
                        end 
                      end 
                    end 
                    
                end 
            end 
        end 
    end 
    
end 
