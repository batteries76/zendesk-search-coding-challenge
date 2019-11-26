require_relative '../lib/searcher'

RSpec.describe Searcher do

    tickets = Loader.load_tickets
    organisations = Loader.load_organisations
    users = Loader.load_users

    data = {
        tickets: tickets,
        organisations: organisations,
        users: users
    }

    search_instance = Searcher.new data 

    describe '#search_tickets' do
        it 'returns one result for an id search' do
          query = {
              field: "_id",
              value: "436bf9b0-1147-4c0a-8439-6f79833bff5b"
          }
          expect(search_instance.search_tickets(query).count).to eq(1)
        end
      end

      describe '#search_tickets' do
        it 'returns four results for a submitter_id field search of value 38' do
          query = {
              field: "submitter_id",
              value: "38"
          }
          expect(search_instance.search_tickets(query).count).to eq(3)
        end
      end

      describe '#search_tickets' do
        it 'returns one result for a assignee_id field search of value 38' do
          query = {
              field: "assignee_id",
              value: "38"
          }
          expect(search_instance.search_tickets(query).count).to eq(1)
        end
      end

      describe '#search_tickets' do
        it 'returns 14 results for an field search of tags and value Pennsylvania' do
          query = {
              field: "tags",
              value: "Pennsylvania"
          }
          expect(search_instance.search_tickets(query).count).to eq(14)
        end
      end

      describe '#search_tickets' do
        it 'returns 101 result for a has_incidents field search of value false' do
          query = {
              field: "has_incidents",
              value: "false"
          }
          expect(search_instance.search_tickets(query).count).to eq(101)
        end
      end

      describe '#search_tickets' do
        it 'returns 67 results for an field search of via and value voice' do
          query = {
              field: "via",
              value: "voice"
          }
          expect(search_instance.search_tickets(query).count).to eq(67)
        end
      end

      describe '#search_tickets' do
        it 'returns one result for an field search of subject and value A Problem in South Africa' do
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
      end

      describe '#search_organisations' do
        it 'returns one result for an name field search of value coffee' do
            query = {
                field: "name",
                value: "Koffee"
            }
            expect(search_instance.search_organisations(query).count).to eq(1)
          end
      end

      describe '#search_organisations' do
        it 'returns one result for an tags field search of value Jordan' do
            query = {
                field: "tags",
                value: "Jordan"
            }
            expect(search_instance.search_organisations(query).count).to eq(1)
          end
      end

      describe '#search_organisations' do
        it 'returns one result for an domain_names search value myopium.com' do
            query = {
                field: "domain_names",
                value: "myopium.com"
            }
            expect(search_instance.search_organisations(query).count).to eq(1)
          end
      end

      describe '#search_organisations' do
        it 'returns 15 results for a shared_tickets search of value false' do
            query = {
                field: "shared_tickets",
                value: "false"
            }
            expect(search_instance.search_organisations(query).count).to eq(15)
          end
      end

      describe '#search_organisations' do
        it 'returns one result for a name search of Möreganic' do
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
    
      describe '#search_users' do
        it 'returns one result for an id search' do
            query = {
                field: "_id",
                value: "6"
            }
            expect(search_instance.search_users(query).count).to eq(1)
          end
      end

      describe '#search_users' do
        it 'returns one result for an tags field search of Frizzleburg' do
            query = {
                field: "tags",
                value: "Frizzleburg"
            }
            expect(search_instance.search_users(query).count).to eq(1)
          end
      end

      describe '#search_users' do
        it 'returns 47 result for an verified field search of false' do
            query = {
                field: "verified",
                value: "false"
            }
            expect(search_instance.search_users(query).count).to eq(47)
          end
      end

      describe '#search_users' do
        it 'returns 27 result for an locale field search of zh-CN' do
            query = {
                field: "locale",
                value: "zh-CN"
            }
            expect(search_instance.search_users(query).count).to eq(27)
          end
      end

end
