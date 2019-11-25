require_relative 'loader'
require_relative 'searcher'
require_relative 'display'

# class Main

def main

    tickets = Loader.load_tickets
    organisations = Loader.load_organisations
    users = Loader.load_users

    # tickets.each do |ticket|
    #     print ticket
    #     puts
    # end

    data = {
        tickets: tickets,
        organisations: organisations,
        users: users
    }

    puts
    puts "=================="

    Display.print_welcome
    Display.print_options
    menu_selection = Display.get_user_selection

    while menu_selection != 'q'

        puts "Which field would you like to search within?"
        field_selection = Display.get_user_selection

        puts "Which value would you like to search for within that field?"
        value_selection = Display.get_user_selection

        query = {
            field: field_selection,
            value: value_selection
        }

        search_instance = Searcher.new(data)

        if menu_selection == '1'
            results = search_instance.search_tickets(query)
        elsif menu_selection == '2'
            results = search_instance.search_organisations(query)
        elsif menu_selection == '3'
            results = search_instance.search_users(query)
        else 
            puts "Sorry, I did not understand that response."
        end

        Display.print_results(results)

        puts "=================="
        puts
        Display.print_options
        menu_selection = Display.get_user_selection

    end

    puts "Thanks for using Zendesk Searcher!"

end

# end

main

