class Display

    def self.print_welcome
        puts
        puts "=================="
        puts
        puts "Hi, welcome to Zendesk Search!"
        puts 
    end

    def self.print_options
        puts
        puts "=================="
        puts
        puts "Here are your searching options:"
        puts "Enter '1' to search tickets."
        puts "Enter '2' to search organisations."
        puts "Enter '3' to search users."
        puts "Enter 'q' to quit the Zendesk search program."
    end

    def self.get_user_selection
        print "=> "
        input = gets.chomp
    end

    def self.print_results(results)
        if results
            puts
            puts "*** Here are your results: ***"
            puts
            puts '{'
            results.each do |key, value|
                puts "    #{key}: #{value}"
            end
            puts '}'
            puts
        else 
            puts
            puts "*** Sorry, your search did not return any results. ***"
            puts
        end
    end

    def self.print_invalid_menu_selection
        puts
        puts "Sorry, that is not a valid menu option."
        puts
    end

end