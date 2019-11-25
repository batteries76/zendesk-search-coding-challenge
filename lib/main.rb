require_relative 'loader'
require_relative 'searcher'
require_relative 'display'

# class Main

def main

    tickets = Loader.load_tickets
    organisations = Loader.load_organisations
    users = Loader.load_users

    data = {
        tickets: tickets,
        organisations: organisations,
        users: users
    }

    Display.print_welcome
    Display.print_options
    menu_selection = Display.get_user_selection

    while menu_selection != 'q'

        search_instance = Searcher.new(data)
        valid_path_array = ['1', '2', '3', 'q']

        if valid_path_array.include?(menu_selection)

            puts
            puts "Which field would you like to search within?"
            field_selection = Display.get_user_selection

            puts
            puts "Which value would you like to search for within that field?"
            value_selection = Display.get_user_selection

            query = {
                field: field_selection,
                value: value_selection
            }

            if menu_selection == '1'
                results = search_instance.search_tickets(query)
            elsif menu_selection == '2'
                results = search_instance.search_organisations(query)
            elsif menu_selection == '3'
                results = search_instance.search_users(query)
            else 
                break
            end

            Display.print_results(results)

        else
            Display.print_invalid_menu_selection
        end

        Display.print_options
        menu_selection = Display.get_user_selection

    end

    Display.print_sign_out

end

# end

main

