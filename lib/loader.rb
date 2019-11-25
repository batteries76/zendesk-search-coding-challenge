require 'json'

class Loader
    def load_tickets
        file_data = File.read(File.expand_path('../data/tickets.json', __dir__))
        data_hash = JSON.parse(file_data)
    end
end