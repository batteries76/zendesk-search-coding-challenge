require_relative '../lib/searcher'
require 'json'

RSpec.describe Searcher do

    tickets = Loader.load_tickets
    organisations = Loader.load_organisations
    users = Loader.load_users

    data = {
        tickets: tickets,
        organisations: organisations,
        users: users
    }

    tickets_stub_raw = File.read(File.expand_path("test_data/data_stub.json", __dir__))
    tickets_stub_parsed = JSON.parse(tickets_stub_raw)

    data_stub = {
        tickets: tickets_stub_parsed
    }

    search_instance = Searcher.new data 
    search_instance_for_stub = Searcher.new data_stub

    describe '#search_tickets' do

        it 'returns the first element for a name/max search' do
            query = {
                field: "name",
                value: "max"
            }
            expect(search_instance_for_stub.search_general(query, data_stub[:tickets])).to eq([data_stub[:tickets].first])
        end

        it 'returns the third element for a tags/g search' do
            query = {
                field: "tags",
                value: "e"
            }
            expect(search_instance_for_stub.search_general(query, data_stub[:tickets])).to eq([data_stub[:tickets][2]])
        end

        it 'returns the second element for a domain_names/a search' do
            query = {
                field: "domain_names",
                value: "a"
            }
            expect(search_instance_for_stub.search_general(query, data_stub[:tickets])).to eq([data_stub[:tickets][1]])
        end

        it 'returns the third element for a married/true search' do
            query = {
                field: "married",
                value: "true"
            }
            expect(search_instance_for_stub.search_general(query, data_stub[:tickets])).to eq([data_stub[:tickets][2]])
        end

        it 'returns the first, third, and fourth element for a tags/a search' do
            query = {
                field: "tags",
                value: "a"
            }
            expect(search_instance_for_stub.search_general(query, data_stub[:tickets])).to eq([data_stub[:tickets].first, data_stub[:tickets][2], data_stub[:tickets][3]])
        end

        # ************************************
        # ************************************
        # ************************************

        it 'returns one result for an id search' do
          query = {
              field: "_id",
              value: "436bf9b0-1147-4c0a-8439-6f79833bff5b"
          }
          expect(search_instance.search_tickets(query).count).to eq(1)
        end

        it 'returns four results for a submitter_id field search of value 38, testing integer matching' do
          query = {
              field: "submitter_id",
              value: "38"
          }
          expect(search_instance.search_tickets(query).count).to eq(3)
        end

        it 'returns one result for a assignee_id field search of value 38, double checking integer matching on a similar field' do
          query = {
              field: "assignee_id",
              value: "38"
          }
          expect(search_instance.search_tickets(query).count).to eq(1)
        end

        it 'returns 14 results for an field search of tags and value Pennsylvania, checking the internal tags loop' do
          query = {
              field: "tags",
              value: "Pennsylvania"
          }
          expect(search_instance.search_tickets(query).count).to eq(14)
        end

        it 'returns 101 result for a has_incidents field search of value false, checking boolean value' do
          query = {
              field: "has_incidents",
              value: "false"
          }
          expect(search_instance.search_tickets(query).count).to eq(101)
        end

        it 'returns 67 results for an field search of via and value voice, checking another large value' do
          query = {
              field: "via",
              value: "voice"
          }
          expect(search_instance.search_tickets(query).count).to eq(67)
        end

        it 'returns one result for an field search of subject and value A Problem in South Africa, checking a longer string' do
          query = {
              field: "subject",
              value: "A Problem in South Africa"
          }
          expect(search_instance.search_tickets(query).count).to eq(1)
        end
      end

      # ************************************
      # ************************************
      # ************************************
    
      describe '#search_organisations' do
        it 'returns one result for an id search' do
            query = {
                field: "_id",
                value: "105"
            }
            expect(search_instance.search_organisations(query).count).to eq(1)
        end

        it 'returns one result for an name field search of value Koffee, checking string matching' do
            query = {
                field: "name",
                value: "Koffee"
            }
            expect(search_instance.search_organisations(query).count).to eq(1)
        end

        it 'returns one result for an tags field search of value Jordan, checking this internal tags structure' do
            query = {
                field: "tags",
                value: "Jordan"
            }
            expect(search_instance.search_organisations(query).count).to eq(1)
        end

        it 'returns one result for an domain_names search value myopium.com, checking another internal structure' do
            query = {
                field: "domain_names",
                value: "myopium.com"
            }
            expect(search_instance.search_organisations(query).count).to eq(1)
        end

        it 'returns 15 results for a shared_tickets search of value false, checking booleans again' do
            query = {
                field: "shared_tickets",
                value: "false"
            }
            expect(search_instance.search_organisations(query).count).to eq(15)
        end

        it 'returns one result for a name search of Möreganic, checking the odd character here' do
            query = {
                field: "name",
                value: "Möreganic"
            }
            expect(search_instance.search_organisations(query).count).to eq(1)
        end
      end

      # ************************************
      # ************************************
      # ************************************
    
      describe 'search_organisations_with_related' do
        it 'returns one result for an id search' do
            query = {
                field: "_id",
                value: "6"
            }
            expect(search_instance.search_users(query).count).to eq(1)
        end

        it 'returns one result for an tags field search of Frizzleburg, again checking the internal loop' do
            query = {
                field: "tags",
                value: "Frizzleburg"
            }
            expect(search_instance.search_users(query).count).to eq(1)
        end

        it 'returns 47 result for an verified field search of false, chekcing the boolean matching' do
            query = {
                field: "verified",
                value: "false"
            }
            expect(search_instance.search_users(query).count).to eq(47)
        end

        it 'returns 27 result for an locale field search of zh-CN, checking the larger data' do
            query = {
                field: "locale",
                value: "zh-CN"
            }
            expect(search_instance.search_users(query).count).to eq(27)
          end
      end

      # ************************************
      # ************************************
      # ************************************

      describe '#search_organisations_with_related' do
        it 'returns one result for an id search' do
            query = {
                field: "_id",
                value: "101"
            }
            expect(search_instance.search_organisations_with_related(query).first[:related_ticket_ids].count).to eq(4)
        end

        it 'returns seven results for an tags field search of Frizzleburg, checking the related ticket numbers' do
            query = {
              field: "_id",
              value: "104"
            }
            expect(search_instance.search_organisations_with_related(query).first[:related_ticket_ids].count).to eq(7)
        end

        it 'returns eight results for an verified field search of false, checking a large related ticket return' do
            query = {
                field: "details",
                value: "Non profit"
            }
            expect(search_instance.search_organisations_with_related(query).first[:related_ticket_ids].count).to eq(8)
        end

        it 'returns four results for an locale field search of zh-CN, checking the right number of related users' do
            query = {
              field: "_id",
              value: "101"
            } 
            expect(search_instance.search_organisations_with_related(query).first[:related_user_ids].count).to eq(4)
          end
      end

end
