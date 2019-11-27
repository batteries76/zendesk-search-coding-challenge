
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

    def search_organisations_with_related(query)

        org_results = search_organisations(query)

        array_of_orgs_and_related = []

        org_results.each do |org|

            org_and_related_hash = {
                organisation: org,
                related_ticket_ids: [],
                related_user_ids: []
            }

            query = {
                field: 'organization_id',
                value: org["_id"].to_s
            }

            ticket_results = search_tickets(query)
            user_results = search_users(query)

            ticket_ids = ticket_results.map do |ticket|
                ticket["_id"]
            end

            user_ids = user_results.map do |user|
                user["_id"]
            end

            org_and_related_hash[:related_ticket_ids] = ticket_ids
            org_and_related_hash[:related_user_ids] = user_ids

            array_of_orgs_and_related << org_and_related_hash

        end

        return array_of_orgs_and_related

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
