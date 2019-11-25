class Display

    def self.print_welcome
        puts "Hi, welcome to Zendesk Search!"
        puts "At any time you can press 'q' to quit. Hit 'Enter/return' to continue"
    end

    def self.print_options
        puts "Here are your searching options:"
        puts "Enter '1' to search tickets."
        puts "Enter '2' to search organisations."
        puts "Enter '3' to search users."
        puts "Enter 'q' to quit the Zendesk search program."
    end

    def self.get_user_selection
        input = gets.chomp
    end

    def self.print_results(results)
        if results
            puts
            puts "Here are your results:"
            print results
            puts
            puts
        else 
            puts
            puts "Sorry, your search did not return any results."
            puts
        end
    end

end