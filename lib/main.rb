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

        @search_instance = Searcher.new @data 

    end

    def main_run

        Display.print_welcome

        Display.print_main_options
        menu_selection = Display.get_user_selection

        # THIS LOOP CONTROLS THE MAIN MENU
        main_menu_loop menu_selection

        Display.print_sign_out

    end

    private 

    def main_menu_loop menu_selection
        while menu_selection != 'q'

            # CHECK THE INPUT IS VALID
            if main_menu_valid_input? menu_selection

                # VALID INPUT, AND '1' CHOSEN, SO INTO THE SEARCH
                if menu_selection == '1'

                    Display.print_sub_menu_options
                    menu_selection = Display.get_user_selection

                    # SEARCH LOOP INITIATED
                    sub_menu_loop menu_selection

                # THE REMAINING OPTION OF THE MAIN MENU, '2'
                else

                    Display.print_all_fields(@data)

                end
                # PRESENT THE MAIN MENU OPTIONS AGAIN
                Display.print_main_options
                menu_selection = Display.get_user_selection 

            # THIS IS CATCHING THE MAIN MENU BAD INPUT
            else

                Display.print_invalid_menu_selection
                Display.print_main_options
                menu_selection = Display.get_user_selection

            end 
        end  
    end

    def sub_menu_loop menu_selection
        while true

            # VALID INPUT CHECK FOR THIS SUB MENU
            if sub_menu_valid_input? menu_selection

                # BREAK OUT TO OUTER LOOP IF WANTING THE MAIN MENU
                if menu_selection == 'm'
                    
                    break

                # EXIT THE WHOLE PROGRAM IF THEY WANT TO QUIT FROM THE SUB MENU
                elsif menu_selection == 'q'

                    Display.print_sign_out
                    exit
                
                # OTHERWISE PERFORM THE SEARCH
                else

                    handle_search_path menu_selection                      

                end
            # CATCH THE INVALID INPUT FOR SUB MENU
            else
                
                Display.print_invalid_menu_selection

            end
            # PRESENT THE SUB MENU OPTIONS AGAIN
            Display.print_sub_menu_options
            menu_selection = Display.get_user_selection

        end
    end

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

            if query[:field] == '_id'
                id_results = @search_instance.search_organisations_by_id(query)
                print "ID_RESULTS"
                print id_results
                Display.print_org_id_results(id_results)
                return
            else
                results = @search_instance.search_organisations(query)
            end

        else 

            results = @search_instance.search_users(query)

        end

        Display.print_results(results)
    end

    def main_menu_valid_input? menu_selection

        valid_path_array = ['1', '2']
        valid_path_array.include? menu_selection

    end

    def sub_menu_valid_input? menu_selection

        valid_sub_path_array = ['1', '2', '3', 'm', 'q']
        valid_sub_path_array.include? menu_selection 

    end

end
