class Display

    def self.print_welcome
        puts
        puts '=================='
        puts
        puts 'Hi! Welcome to Zendesk Search!'
        puts 
    end

    def self.print_main_options
        puts
        puts '=================='
        puts
        puts 'Here are your MAIN options:'
        puts
        puts "  Enter '1' to SEARCH Zendesk."
        puts "  Enter '2' to see a LIST of FIELD OPTIONS."
        puts "  Enter 'q' to QUIT the Zendesk search program."
    end

    def self.print_sub_menu_options
        puts
        puts '=================='
        puts
        puts 'Here are your SEARCHING options:'
        puts
        puts "  Enter '1' to search TICKETS."
        puts "  Enter '2' to search ORGANISATIONS."
        puts "  Enter '3' to search USERS."
        puts "  Enter 'm' to return to the MAIN MENU"
        puts "  Enter 'q' to QUIT the Zendesk search program."
    end

    def self.get_user_selection
        puts
        print '  => '
        input = gets.strip
    end

    def self.print_one_result(result)

        result.each do |key, value|
            if value.class == String
                puts "  #{key}: \"#{value}\""
            else
                puts "  #{key}: #{value}"
            end
        end

    end

    def self.print_results(results)
        if results.length > 0
            puts
            puts '******** Here are your results: ********'
            puts
            if results.length == 1 
                puts "We found #{results.length} record matching your search field and value:"
            else
                puts "We found #{results.length} records matching your search field and value:"
                puts 
                puts '***************************************'
                puts
            end
        else 
            puts
            puts '***** SORRY, your search did NOT return ANY RESULTS. *****'
            puts
        end

        results.each_with_index do |result, index|

            puts
            puts '***************************************'
            puts

            puts index + 1
            print_one_result(result)

        end
    end

    def self.print_org_and_related(results)

        if results.length > 0
            puts
            puts '******** Here are your results: ********'
            puts
            if results.length == 1 
                puts "We found #{results.length} record matching your search field and value:"
            else
                puts "We found #{results.length} records matching your search field and value:"
                puts 
                puts '***************************************'
                puts
            end
        else 
            puts
            puts '***** SORRY, your search did NOT return ANY RESULTS. *****'
            puts
        end

        results.each_with_index do |result, index|

            puts
            puts '***************************************'
            puts

            puts index + 1
            print_one_result(result[:organisation])

            puts
            puts "  NOTE: This ORGANISATION has the following related TICKETS and USERS"
            puts "    -------------------------------------------------------------"
            puts "    Related TICKET ids: #{result[:related_ticket_ids]}"
            puts "    Related USER ids: #{result[:related_user_ids]}"
            puts

        end
    end

    def self.print_invalid_menu_selection
        puts
        puts '***** SORRY, that is NOT a VALID MENU OPTION. *****'
        puts
    end

    def self.print_sign_out
        puts
        puts 'Thanks for using Zendesk Searcher!'
        puts
    end

    def self.print_field_message
        puts
        puts 'Which field would you like to search within?'
    end

    def self.print_value_message
        puts
        puts 'Which value would you like to search for within that field?'
    end

    def self.print_all_fields(data)
        puts
        puts 'Here are all possible field options for your search:'
        puts
        puts 'These are the TICKET fields:'
        data[:tickets].first.each do |key, _value|
            puts "  #{key}"
        end
        puts '----------------------------------'
        puts
        puts 'These are the ORGANISATION fields:'
        data[:organisations].first.each do |key, _value|
            puts "  #{key}"
        end
        puts '----------------------------------'
        puts
        puts 'These are the USER fields:'
        data[:users].first.each do |key, _value|
            puts "  #{key}"
        end
        puts '----------------------------------'
        puts
    end

end
