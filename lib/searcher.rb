
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

    def search_organisations_by_id(query)

        org_result = search_general(query, @organisation_data)

        if org_result.count > 0

            query = {
                field: 'organization_id',
                value: query[:value]
            }
            
            ticket_results = search_tickets(query)
            user_results = search_users(query)

            ticket_ids = []
            ticket_results.each do |ticket|
                ticket_ids << ticket["_id"]
            end

            user_ids = []
            user_results.each do |user|
                user_ids << user["_id"]
            end

            return {
                organisation: org_result,
                ticket_ids: ticket_ids,
                user_ids: user_ids
            }

        else 
            return nil
        end
    end

    def search_users(query)
        search_general(query, @user_data)
    end

    private

    def search_general(query, data_type)
        search_field = query[:field]
        search_value = query[:value]

        result_array = []

        nested_values = ['domain_names', 'tags']

        data_type.each do |data_element|
            if data_element[search_field] != nil
                if nested_values.include? search_field
                    data_element[search_field].each do |element|
                        if element == search_value
                            result_array << data_element
                        end
                    end
                else 
                    if data_element[search_field].to_s == search_value
                        result_array << data_element
                    end
                end
            end
        end

        result_array
    end

end
