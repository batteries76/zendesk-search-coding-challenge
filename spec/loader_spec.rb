require_relative '../lib/loader'

RSpec.describe Loader do

  describe '#load_tickets' do
    it 'returns more than 0 tickets' do
      loader = Loader.new
      tickets = loader.load_tickets
      expect(tickets.length).to be > 0
    end
  end

  describe '#load_organisations' do
    it 'returns more than 0 organisations' do
      loader = Loader.new
      organisations = loader.load_organisations
      expect(organisations.length).to be > 0
    end
  end

  describe '#load_users' do
    it 'returns more than 0 users' do
      loader = Loader.new
      users = loader.load_users
      expect(users.length).to be > 0
    end
  end
  
end