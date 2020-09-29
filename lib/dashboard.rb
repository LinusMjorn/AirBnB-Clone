require './database_connection_setup'
require_relative 'database_connection'

class Dashboard 

    def initialize()


    end

    def self.all
        result = DatabaseConnection.query("SELECT spaces.id, description, price, username FROM spaces JOIN users ON userid = users.id ORDER BY spaces.id DESC;") #join onto users table from username JOIN ON userid = users.id
        result.map { |dashboard|
        Dashboard.new(dashboard['spaces.id'], dashboard['username'], dashboard['description'], dashboard['price']) }
    end

end
