require 'json'

class Loader

    def self.load_tickets
        load_json_file('tickets')
    end

    def self.load_organisations
        load_json_file('organisations')
    end

    def self.load_users
        load_json_file('users')
    end
    
    private
    
    def self.load_json_file(name)
        data = File.read(File.expand_path("../data/#{name}.json", __dir__))
        JSON.parse(data)
    end

end