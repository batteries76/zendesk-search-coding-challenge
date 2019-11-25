require_relative '../lib/loader'

RSpec.describe Loader do
  describe '#load_tickets' do
    it 'returns more than 0 items' do
      loader = Loader.new
      tickets = loader.load_tickets
      expect(tickets.length).to be > 0
    end
  end
end