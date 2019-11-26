
class Searcher

    def initialize(data)
        @ticket_data = data[:tickets]
        @organisation_data = data[:organisations]
        @user_data = data[:users]
    end

    def search_tickets(query)
        search_general(query, @ticket_data)
    end

    def search_organisations(query)
        search_general(query, @organisation_data)
    end

    def search_users(query)
        search_general(query, @user_data)
    end

    private

    def search_general(query, data_type)
        search_field = query[:field]
        search_value = query[:value]

        result_array = []

        data_type.each do |data_element|
            if search_field == "domain_names"
                if data_element["domain_names"]
                    data_element["domain_names"].each do |domain|
                        if domain == search_value
                            result_array << data_element
                        end
                    end
                end
            elsif search_field == "tags"
                if data_element["tags"]
                    data_element["tags"].each do |tag|
                        if tag == search_value
                            result_array << data_element
                        end
                    end
                end
            elsif data_element[search_field] == search_value
                result_array << data_element
            end
        end

        return result_array
    end 

end