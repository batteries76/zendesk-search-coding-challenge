require_relative 'loader'
require_relative 'searcher'
require_relative 'display'


class Main

    def initialize 

        tickets = Loader.load_tickets
        organisations = Loader.load_organisations
        users = Loader.load_users
        @data = {
            tickets: tickets,
            organisations: organisations,
            users: users
        }
        @search_instance = Searcher.new data 

    end

    def main_run

        Display.print_welcome

        Display.print_main_options
        menu_selection = Display.get_user_selection

        while menu_selection != 'q'
\
            valid_path_array = ['1', '2']

            if valid_path_array.include? menu_selection

                if menu_selection == '1'

                    Display.print_sub_menu_options
                    menu_selection = Display.get_user_selection

                    while true

                        valid_sub_path_array = ['1', '2', '3', 'm', 'q']

                        if valid_sub_path_array.include? menu_selection 
                            # BREAK BACK DOWN TO MAIN MENU LOOP
                            if menu_selection == 'm'
                                
                                break
                            # EXIT THE WHOLE PROGRAM
                            elsif menu_selection == 'q'

                                Display.print_sign_out
                                exit

                            else

                                handle_search_path menu_selection                      

                            end
                        else

                            Display.print_invalid_menu_selection
                            
                        end

                        Display.print_sub_menu_options
                        menu_selection = Display.get_user_selection

                    end

                else

                    Display.print_all_fields(data)

                end

                Display.print_main_options
                menu_selection = Display.get_user_selection 

            else

                Display.print_invalid_menu_selection
                Display.print_main_options
                menu_selection = Display.get_user_selection

            end   
            
        end

        Display.print_sign_out

    end

    private 

    def handle_search_path menu_selection

        Display.print_field_message
        field_selection = Display.get_user_selection

        Display.print_value_message
        value_selection = Display.get_user_selection

        query = {
            field: field_selection,
            value: value_selection
        }

        if menu_selection == '1'

            results = @search_instance.search_tickets(query)

        elsif menu_selection == '2'

            results = @search_instance.search_organisations(query)

        else 

            results = @search_instance.search_users(query)

        end

        Display.print_results(results)
    end

end

main = Main.new 
main.main_run

