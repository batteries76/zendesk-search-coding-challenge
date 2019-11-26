require_relative '../lib/searcher'

RSpec.describe Searcher do

    describe '#load_tickets' do
        it 'returns more than 0 tickets' do
          expect(Loader.load_tickets.length).to be > 0
        end
      end
    
      describe '#load_organisations' do
        it 'returns more than 0 organisations' do
          expect(Loader.load_organisations.length).to be > 0
        end
      end
    
      describe '#load_users' do
        it 'returns more than 0 users' do
          expect(Loader.load_users.length).to be > 0
        end
      end
      
end
